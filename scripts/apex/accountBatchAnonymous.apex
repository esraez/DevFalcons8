AccountsBatch ab = new AccountsBatch();
integer numberOfRecords= 20;
ID batcId = Database.executeBatch(ab,numberOfRecords);//process 20 records at a time

/*Database.executeBatch(new AccountsBatch(),20);*/


