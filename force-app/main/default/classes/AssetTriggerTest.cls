@isTest
public with sharing class AssetTriggerTest {
    @isTest
    private static void TestAssetTrig1() {
        account acc = new account(name='test acc');
        insert acc;
        list<asset> listAsset = new list<asset>();
        for (Integer i = 0; i < 1100; i++) {
            asset a = new asset();
            a.name = 'test asset';
            a.AccountId = acc.id;
            listAsset.add(a);            
        }
        insert listAsset;
    }
}
