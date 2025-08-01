vlocity.cardframework.registerModule.controller('TestCtrl',
   ['$scope', '$rootScope', '$sce',
      function ($scope, $rootScope, $sce) {
         $rootScope.convertToBlob = function (base64String) {
            if (base64String == null) { return ; }
            fetch(base64String).then(function (base64resp) {

               if (base64resp) {
                  return base64resp.blob();
               }
            }).then(function (blob) {
               if (blob) {
                  var objUrl = window.URL.createObjectURL(blob);
                  $rootScope.pdfDocObjectUrl = $sce.trustAsResourceUrl(objUrl);
                  $rootScope.$digest();
               }
            });
         }
      }]);