/****************************************************************************************************
** Class Name   : SGA_AP_GenericUtilsVlocity
** Date Created : 03-October-2019 
** Created By   : Muthu Rajagopalan
** Description  : Generic Utils Class implementing VlocityOpenInterface2
****************************************************************************************************/ 
global without sharing class SGA_AP_GenericUtilsVlocity implements vlocity_ins.VlocityOpenInterface2 {
    private static string VALIDCARATINGAREA1OR9 = 'validCARatingArea1or9'; // Expected method name from OmniScript for validating Rating Area //SMGR-30920
    
    /****************************************************************************************************
    * Method Name : invokeMethod
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This is the interface method to invoke the method based on the provided remote method
    * ***************************************************************************************************/        
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        if (VALIDCARATINGAREA1OR9.equalsIgnoreCase(methodName)) {
            validCARatingArea1or9(inputMap, outMap, options);
        }
        return true;
        
    }

    /****************************************************************************************************
    * Method Name : invokeMethod
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This is the interface method to invoke the method based on the provided remote method
    * ***************************************************************************************************/        
    void validCARatingArea1or9(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String strZipCode = (String) options.get('ZipCode'); 
        String strCountyName = (String) options.get('CountyName'); 
        
        outMap.put('ValidCARatingArea1or9', checkZipCounty(strZipCode+'-'+strCountyName));
/*
        if (strZipCode == '90001') {
            outMap.put('ValidCARatingArea1or9', 'true');
        } else {
            outMap.put('ValidCARatingArea1or9', 'false');
        }
*/
        return;
    }
    
    /****************************************************************************************************
    * Method Name : checkZipCounty
    * Params      : String strZipCounty
    * Return type : Boolean
    * Description : This is the method to verify given string is part of the valid Zip - County for Rating Areas 1 or 9
    * ***************************************************************************************************/        
    private Boolean checkZipCounty(String strZipCounty) {
        strZipCounty = strZipCounty.toUpperCase();
        Boolean bolOut = false;
        Set<String> setValidZipCounty1and9 = new Set<String> {'95223-ALPINE', '95646-ALPINE', '96120-ALPINE', '95601-AMADOR', '95629-AMADOR', '95640-AMADOR', '95642-AMADOR',
            '95644-AMADOR', '95646-AMADOR', '95654-AMADOR', '95665-AMADOR', '95666-AMADOR', '95669-AMADOR', '95675-AMADOR', '95685-AMADOR', '95689-AMADOR', '95699-AMADOR', 
            '95901-BUTTE', '95914-BUTTE', '95916-BUTTE', '95917-BUTTE', '95925-BUTTE', '95926-BUTTE', '95927-BUTTE', '95928-BUTTE', '95929-BUTTE', '95930-BUTTE', 
            '95938-BUTTE', '95940-BUTTE', '95941-BUTTE', '95942-BUTTE', '95948-BUTTE', '95954-BUTTE', '95958-BUTTE', '95965-BUTTE', '95966-BUTTE', '95967-BUTTE', 
            '95968-BUTTE', '95969-BUTTE', '95973-BUTTE', '95974-BUTTE', '95976-BUTTE', '95978-BUTTE', '95221-CALAVERAS', '95222-CALAVERAS', '95223-CALAVERAS', 
            '95224-CALAVERAS', '95225-CALAVERAS', '95226-CALAVERAS', '95228-CALAVERAS', '95229-CALAVERAS', '95230-CALAVERAS', '95232-CALAVERAS', '95233-CALAVERAS', 
            '95236-CALAVERAS', '95245-CALAVERAS', '95246-CALAVERAS', '95247-CALAVERAS', '95248-CALAVERAS', '95249-CALAVERAS', '95250-CALAVERAS', '95251-CALAVERAS', 
            '95252-CALAVERAS', '95254-CALAVERAS', '95255-CALAVERAS', '95257-CALAVERAS', '95645-COLUSA', '95912-COLUSA', '95932-COLUSA', '95939-COLUSA', '95950-COLUSA', 
            '95955-COLUSA', '95957-COLUSA', '95970-COLUSA', '95979-COLUSA', '95987-COLUSA', '95988-COLUSA', '95531-DEL NORTE', '95532-DEL NORTE', '95538-DEL NORTE', 
            '95543-DEL NORTE', '95548-DEL NORTE', '95567-DEL NORTE', '95913-GLENN', '95920-GLENN', '95939-GLENN', '95943-GLENN', '95951-GLENN', '95963-GLENN', '95970-GLENN',
            '95988-GLENN', '95501-HUMBOLDT', '95502-HUMBOLDT', '95503-HUMBOLDT', '95511-HUMBOLDT', '95514-HUMBOLDT', '95518-HUMBOLDT', '95519-HUMBOLDT', '95521-HUMBOLDT', 
            '95524-HUMBOLDT', '95525-HUMBOLDT', '95526-HUMBOLDT', '95528-HUMBOLDT', '95534-HUMBOLDT', '95536-HUMBOLDT', '95537-HUMBOLDT', '95540-HUMBOLDT', '95542-HUMBOLDT', 
            '95545-HUMBOLDT', '95546-HUMBOLDT', '95547-HUMBOLDT', '95549-HUMBOLDT', '95550-HUMBOLDT', '95551-HUMBOLDT', '95552-HUMBOLDT', '95553-HUMBOLDT', '95554-HUMBOLDT', 
            '95555-HUMBOLDT', '95556-HUMBOLDT', '95558-HUMBOLDT', '95559-HUMBOLDT', '95560-HUMBOLDT', '95562-HUMBOLDT', '95563-HUMBOLDT', '95564-HUMBOLDT', '95565-HUMBOLDT', 
            '95569-HUMBOLDT', '95570-HUMBOLDT', '95571-HUMBOLDT', '95573-HUMBOLDT', '95587-HUMBOLDT', '95589-HUMBOLDT', '95422-LAKE', '95423-LAKE', '95424-LAKE', 
            '95426-LAKE', '95435-LAKE', '95443-LAKE', '95451-LAKE', '95453-LAKE', '95457-LAKE', '95458-LAKE', '95461-LAKE', '95464-LAKE', '95467-LAKE', '95469-LAKE', 
            '95485-LAKE', '95493-LAKE', '96006-LASSEN', '96009-LASSEN', '96056-LASSEN', '96068-LASSEN', '96109-LASSEN', '96113-LASSEN', '96114-LASSEN', '96117-LASSEN', 
            '96119-LASSEN', '96121-LASSEN', '96123-LASSEN', '96127-LASSEN', '96128-LASSEN', '96130-LASSEN', '96132-LASSEN', '96136-LASSEN', '96137-LASSEN', '95410-MENDOCINO', 
            '95415-MENDOCINO', '95417-MENDOCINO', '95418-MENDOCINO', '95420-MENDOCINO', '95425-MENDOCINO', '95427-MENDOCINO', '95428-MENDOCINO', '95429-MENDOCINO', 
            '95432-MENDOCINO', '95437-MENDOCINO', '95445-MENDOCINO', '95449-MENDOCINO', '95454-MENDOCINO', '95456-MENDOCINO', '95459-MENDOCINO', '95460-MENDOCINO', 
            '95463-MENDOCINO', '95466-MENDOCINO', '95468-MENDOCINO', '95469-MENDOCINO', '95470-MENDOCINO', '95481-MENDOCINO', '95482-MENDOCINO', '95488-MENDOCINO', 
            '95490-MENDOCINO', '95494-MENDOCINO', '95542-MENDOCINO', '95585-MENDOCINO', '95587-MENDOCINO', '95589-MENDOCINO', '96006-MODOC', '96015-MODOC', '96054-MODOC', 
            '96056-MODOC', '96101-MODOC', '96104-MODOC', '96108-MODOC', '96110-MODOC', '96112-MODOC', '96115-MODOC', '96116-MODOC', '96134-MODOC', '95602-NEVADA', 
            '95712-NEVADA', '95724-NEVADA', '95728-NEVADA', '95924-NEVADA', '95945-NEVADA', '95946-NEVADA', '95949-NEVADA', '95959-NEVADA', '95960-NEVADA', '95975-NEVADA', 
            '95977-NEVADA', '95986-NEVADA', '96111-NEVADA', '96160-NEVADA', '96161-NEVADA', '96162-NEVADA', '95915-PLUMAS', '95923-PLUMAS', '95934-PLUMAS', '95947-PLUMAS', 
            '95956-PLUMAS', '95971-PLUMAS', '95980-PLUMAS', '95981-PLUMAS', '95983-PLUMAS', '95984-PLUMAS', '96020-PLUMAS', '96063-PLUMAS', '96103-PLUMAS', '96105-PLUMAS', 
            '96106-PLUMAS', '96122-PLUMAS', '96129-PLUMAS', '96135-PLUMAS', '96137-PLUMAS', '96001-SHASTA', '96002-SHASTA', '96003-SHASTA', '96007-SHASTA', '96008-SHASTA', 
            '96011-SHASTA', '96013-SHASTA', '96016-SHASTA', '96017-SHASTA', '96019-SHASTA', '96022-SHASTA', '96025-SHASTA', '96028-SHASTA', '96033-SHASTA', '96040-SHASTA', 
            '96047-SHASTA', '96049-SHASTA', '96051-SHASTA', '96056-SHASTA', '96059-SHASTA', '96062-SHASTA', '96065-SHASTA', '96069-SHASTA', '96070-SHASTA', '96071-SHASTA', 
            '96073-SHASTA', '96076-SHASTA', '96079-SHASTA', '96084-SHASTA', '96087-SHASTA', '96088-SHASTA', '96089-SHASTA', '96095-SHASTA', '96096-SHASTA', '96099-SHASTA', 
            '95910-SIERRA', '95922-SIERRA', '95936-SIERRA', '95944-SIERRA', '95960-SIERRA', '96105-SIERRA', '96118-SIERRA', '96124-SIERRA', '96125-SIERRA', '96126-SIERRA', 
            '95568-SISKIYOU', '96014-SISKIYOU', '96023-SISKIYOU', '96025-SISKIYOU', '96027-SISKIYOU', '96031-SISKIYOU', '96032-SISKIYOU', '96034-SISKIYOU', '96037-SISKIYOU', 
            '96038-SISKIYOU', '96039-SISKIYOU', '96044-SISKIYOU', '96050-SISKIYOU', '96057-SISKIYOU', '96058-SISKIYOU', '96064-SISKIYOU', '96067-SISKIYOU', '96085-SISKIYOU', 
            '96086-SISKIYOU', '96091-SISKIYOU', '96094-SISKIYOU', '96097-SISKIYOU', '96134-SISKIYOU', '95626-SUTTER', '95645-SUTTER', '95648-SUTTER', '95659-SUTTER', 
            '95668-SUTTER', '95674-SUTTER', '95676-SUTTER', '95692-SUTTER', '95836-SUTTER', '95837-SUTTER', '95948-SUTTER', '95953-SUTTER', '95957-SUTTER', '95982-SUTTER', 
            '95991-SUTTER', '95992-SUTTER', '95993-SUTTER', '95963-TEHAMA', '95973-TEHAMA', '96007-TEHAMA', '96021-TEHAMA', '96022-TEHAMA', '96029-TEHAMA', '96035-TEHAMA', 
            '96055-TEHAMA', '96059-TEHAMA', '96061-TEHAMA', '96063-TEHAMA', '96074-TEHAMA', '96075-TEHAMA', '96076-TEHAMA', '96078-TEHAMA', '96080-TEHAMA', '96090-TEHAMA', 
            '96092-TEHAMA', '95526-TRINITY', '95527-TRINITY', '95543-TRINITY', '95552-TRINITY', '95563-TRINITY', '95595-TRINITY', '96010-TRINITY', '96024-TRINITY', 
            '96041-TRINITY', '96046-TRINITY', '96048-TRINITY', '96052-TRINITY', '96076-TRINITY', '96091-TRINITY', '96093-TRINITY', '95230-TUOLUMNE', '95305-TUOLUMNE', 
            '95309-TUOLUMNE', '95310-TUOLUMNE', '95311-TUOLUMNE', '95314-TUOLUMNE', '95321-TUOLUMNE', '95327-TUOLUMNE', '95329-TUOLUMNE', '95335-TUOLUMNE', '95346-TUOLUMNE', 
            '95347-TUOLUMNE', '95364-TUOLUMNE', '95370-TUOLUMNE', '95372-TUOLUMNE', '95373-TUOLUMNE', '95375-TUOLUMNE', '95379-TUOLUMNE', '95383-TUOLUMNE', '95692-YUBA', 
            '95901-YUBA', '95903-YUBA', '95914-YUBA', '95918-YUBA', '95919-YUBA', '95922-YUBA', '95925-YUBA', '95935-YUBA', '95941-YUBA', '95960-YUBA', '95961-YUBA', '95962-YUBA', 
            '95966-YUBA', '95972-YUBA', '95977-YUBA', '95981-YUBA', '93426-MONTEREY', '93450-MONTEREY', '93451-MONTEREY', '93901-MONTEREY', '93902-MONTEREY', '93905-MONTEREY', 
            '93906-MONTEREY', '93907-MONTEREY', '93908-MONTEREY', '93912-MONTEREY', '93915-MONTEREY', '93920-MONTEREY', '93921-MONTEREY', '93922-MONTEREY', '93923-MONTEREY', 
            '93924-MONTEREY', '93925-MONTEREY', '93926-MONTEREY', '93927-MONTEREY', '93928-MONTEREY', '93930-MONTEREY', '93932-MONTEREY', '93933-MONTEREY', '93940-MONTEREY', 
            '93942-MONTEREY', '93943-MONTEREY', '93944-MONTEREY', '93950-MONTEREY', '93953-MONTEREY', '93954-MONTEREY', '93955-MONTEREY', '93960-MONTEREY', '93962-MONTEREY', 
            '95004-MONTEREY', '95012-MONTEREY', '95039-MONTEREY', '95076-MONTEREY', '93210-SAN BENITO', '93925-SAN BENITO', '93930-SAN BENITO', '95004-SAN BENITO', 
            '95020-SAN BENITO', '95023-SAN BENITO', '95024-SAN BENITO', '95043-SAN BENITO', '95045-SAN BENITO', '95075-SAN BENITO', '94060-SANTA CRUZ', '95001-SANTA CRUZ', 
            '95003-SANTA CRUZ', '95005-SANTA CRUZ', '95006-SANTA CRUZ', '95007-SANTA CRUZ', '95010-SANTA CRUZ', '95017-SANTA CRUZ', '95018-SANTA CRUZ', '95019-SANTA CRUZ', 
            '95033-SANTA CRUZ', '95041-SANTA CRUZ', '95060-SANTA CRUZ', '95061-SANTA CRUZ', '95062-SANTA CRUZ', '95063-SANTA CRUZ', '95064-SANTA CRUZ', '95065-SANTA CRUZ', 
            '95066-SANTA CRUZ', '95067-SANTA CRUZ', '95073-SANTA CRUZ', '95076-SANTA CRUZ', '95077-SANTA CRUZ'};
        
        bolOut = setValidZipCounty1and9.contains(strZipCounty);
        setValidZipCounty1and9 = null;
        return bolOut; 
    }
}