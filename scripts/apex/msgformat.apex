//JSON//
1. What is JSON format?
Account => {Name = 'Test Account', Type = 'Prospect', Industry = 'IT', AnnualRevenue = 1,000,000}
{
    "Name" : "Test Account",
    "Type" : "Prospect",
    "Industry" : "IT",
    "AnnualRevenue" = 1000000
}

2. How to convert our sObject record(s) into JSON format?
Class - JSON
Method - serialize(jsonString) => Helps us to convert every sobject record/records into json format

Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE AnnualRevenue != null
                AND Industry != null
                LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

List<Account> accounts = [SELECT Id, Name, Type, Industry, AnnualRevenue 
                FROM Account 
                WHERE AnnualRevenue != null
                AND Industry != null
                LIMIT 3];
String jsonString = JSON.serialize(accounts);
System.debug(jsonString);

3. How to convert JSON into sObject records?
Class - JSON
Method - deserialize(jsonString, ApexType)

String jsonString = '{"Name":"Test Account 10", "Type":"Prospect", "Industry":"Construction"}';
Account acc = (Account)JSON.deserialize(jsonString, Account.class);
insert acc;


'{"Name":"Test Account 10", "Type":"Prospect", "Industry":"Construction"}'
<Account>
    <Name>Test Account 10</Name>
    <Type>Prospect</Type>
    <Industry>Construction</Industry>
</Account>


//TEST REST CALLOUTS//
RestCallouts.getAnimals();
RestCallouts.getUsers();

//TEST SOAP CALLOUTS//
SoapServices.getParksByCountry('United States');
SoapServices.doAddNumbers(10,20);

    <?xml version="1.0" encoding="UTF-8"?>
    <env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <env:Header />
        <env:Body>
            <m:byCountry xmlns:m="http://parks.services/">
                <arg0>United States</arg0>
            </m:byCountry>
        </env:Body>
    </env:Envelope>

    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
            <ns2:byCountryResponse xmlns:ns2="http://parks.services/">
                <return>Yellowstone</return>
                <return>Mackinac National Park</return>
                <return>Yosemite</return>
            </ns2:byCountryResponse>
        </soap:Body>
    </soap:Envelope>