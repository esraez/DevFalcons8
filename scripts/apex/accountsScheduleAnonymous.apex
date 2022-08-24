AccountsSchedulable accSchedule = new AccountsSchedulable();
string cron = '0 0 13 * * ?';
Id jobId = system.schedule('Acc Batch everyday', cron, accSchedule);