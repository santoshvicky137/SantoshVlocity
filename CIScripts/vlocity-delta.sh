#!/bin/bash

set -e

# === CONFIG ===
BASE_DIR="vlocity"
JOB_FILE="job.yaml"
SUMMARY_FILE="delta-summary.md"
FALLBACK_DEPTH="${FALLBACK_DEPTH:-3}"
ENVIRONMENT="${ENVIRONMENT:-VL-QA}"

# === ENVIRONMENT BRANCH MAPPING ===
case "$ENVIRONMENT" in
  VL-QA) BASE_BRANCH="origin/VL-QA"; ENV_ICON="🔬" ;;
  VL-UAT) BASE_BRANCH="origin/VL-UAT"; ENV_ICON="🧪" ;;
  VL-Release) BASE_BRANCH="origin/VL-Release"; ENV_ICON="🚦" ;;
  *) BASE_BRANCH=""; ENV_ICON="🧩" ;; # Unknown or feature context
esac

echo "🌍 Environment: $ENVIRONMENT $ENV_ICON"
[[ -n "$BASE_BRANCH" ]] && echo "🔗 Base Branch: $BASE_BRANCH"

# === SAFETY CHECK ===
export GIT_DIR="$(pwd)/.git"
export GIT_WORK_TREE="$(pwd)"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "❌ Not inside a Git repository. Aborting."
  exit 1
fi

# === FETCH LAST DEPLOYED SHA FROM ORG ===
echo "🔍 Fetching last deployed SHA from Salesforce..."
last_sha=$(sfdx force:data:soql:query \
  --query "SELECT vlocitylastsha__c FROM VlocitySHA__c LIMIT 1" \
  --target-org "$ORG_ALIAS" \
  --json | jq -r '.result.records[0].vlocitylastsha__c')

if [[ -z "$last_sha" || "$last_sha" == "null" ]]; then
  echo "⚠️ Could not retrieve last deployed SHA. Falling back to base branch."
  git fetch origin "$(echo "$BASE_BRANCH" | sed 's|origin/||')"
  last_sha=$(git rev-parse "$BASE_BRANCH")
fi

current_sha=$(git rev-parse HEAD)
echo "🔄 Comparing last deployed SHA ($last_sha) with current HEAD ($current_sha)..."

# === GET CHANGED FILES ===
changed_files=$(git diff --name-only "$last_sha" "$current_sha" | grep -E "^$BASE_DIR/" || true)

if [[ -z "$changed_files" ]]; then
  echo "⚠️ No Vlocity components changed. Skipping deployment."
  echo "skip_deploy=true" >> "$GITHUB_ENV"
  exit 0
fi

echo "📁 Extracting changed components..."
components=()
for file in $changed_files; do
  if [[ $file == $BASE_DIR/*/*/* ]]; then
    type=$(echo "$file" | cut -d '/' -f2)
    name=$(echo "$file" | cut -d '/' -f3)
    components+=("$type/$name")
  fi
done

# === REMOVE DUPLICATES ===
unique_components=($(printf "%s\n" "${components[@]}" | sort -u))

# === GENERATE job.yaml USING manifest ===
echo "📝 Generating $JOB_FILE with manifest..."
echo "projectPath: ./vlocity" > "$JOB_FILE"
echo "" >> "$JOB_FILE"
echo "manifest:" >> "$JOB_FILE"
for comp in "${unique_components[@]}"; do
  echo "- $comp" >> "$JOB_FILE"
done

# === APPEND VLOCITY OPTIONS ===
echo "" >> "$JOB_FILE"
echo "options:" >> "$JOB_FILE"
echo "  maxDepth: 0" >> "$JOB_FILE"
echo "  autoUpdateSettings: true" >> "$JOB_FILE"
echo "  separateMatrixVersions: true" >> "$JOB_FILE"
echo "  separateCalculationProcedureVersions: false" >> "$JOB_FILE"
echo "  CompileOnBuild: false" >> "$JOB_FILE"

# === GENERATE SUMMARY ===
echo "### Changed Vlocity Components" > "$SUMMARY_FILE"
for comp in "${unique_components[@]}"; do
  echo "- $comp" >> "$SUMMARY_FILE"
done

# === SHOW FINAL job.yaml ===
echo "📄 Contents of $JOB_FILE:"
cat "$JOB_FILE"

echo "✅ Delta generation complete. Components ready for deployment."
