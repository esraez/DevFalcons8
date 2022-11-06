//Test animals callout//
HttpResponse resp = RestCallouts.getAnimals();
system.debug(resp);
//Test users callout//
HttpResponse resp2 = RestCallouts.getusers();
system.debug(resp2);
//Test recipes callout//
HttpResponse resp3 = RestCallouts.getrecipes();
system.debug(resp3);
//Test products callout//
HttpResponse resp4 = RestCallouts.getProduct();
system.debug(resp4);
//Test blogs callout//
HttpResponse resp5 = RestCallouts.getBlog();
system.debug(resp5);
//test post callout
HttpResponse resp6 = RestCallouts.postCallout();
system.debug(resp6);
//test postcontacts
HttpResponse resp7 = RestCallouts.postContacts();
system.debug(resp7);
//Test Parks Callout//
String[] parks = SoapCallouts.getParksByCountry('Switzerland');
system.debug(parks);
//Test Calculator Callout//
Double sum = SoapCallouts.getSum(55, 15);
system.debug(sum);
//Test Calculator Callout//
Double product = SoapCallouts.getMultiply(30, 15);
system.debug(product);
Double product2 = SoapCallouts.getSubtract(60, 15);
system.debug(product2);
Double product3 = SoapCallouts.getDivide(45, 15);
system.debug(product3);