@isTest
private class AccountManagerTest {
    @isTest static void testAccountGetById() {
        Id recordId = createTestRecord();
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://trailhead-16c-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account thisAccount = AccountManager.getAccount();
        
        System.assert(thisAccount != null);
        System.assertEquals('Conta Teste 05', thisAccount.Name);
    }
    
     static Id createTestRecord() {
        Account accountTest = new Account(
            Name = 'Conta Teste 05'
        );
        
        insert accountTest;
         
        Contact contactTest = new Contact(
            LastName = 'Contato Teste 05',
            AccountId = accountTest.Id
        ); 
         
        insert contactTest;
        
        return accountTest.Id;
    } 
}