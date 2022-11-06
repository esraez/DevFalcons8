//invoke a flow
Account acc = [SELECT Id, Name, OwnerId, CreatedBy.Name FROM Account WHERE Id = '0018Z00002f8KBPQA2' LIMIT 1];
Map<String, Object> inputs = new Map<String, Object>();
inputs.put('AccountId', acc.Id);
inputs.put('AccountName', acc.Name);
inputs.put('AccountOwnerId', acc.OwnerId);
inputs.put('CreatedByName', acc.CreatedBy.Name);
Flow.Interview flow = new Flow.Interview.Account_Auto_Launched_Flow(inputs);
flow.start();
