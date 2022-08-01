public class DatetimeMethodsDemo2 {
    public void printSubscriptionEndDate() {
        Date SubscriptionStartDate=date.today();
        Date SubscriptionEndDate= SubscriptionStartDate.addDays(1000);
        Integer Endyear = SubscriptionEndDate.year();
        Integer Endmonth = SubscriptionEndDate.month();
        system.debug('Subscription End Year and month is '+ ',' + Endyear + ','+ Endmonth);
    }
    public void printOfferEndDateTime() {
        Datetime offerStartDt = datetime.now();
        Datetime offerEndDt = offerStartDt.addHours(51);
        system.debug('Offer end datetime is '+ offerEndDt);
        Date OfferEnddate=offerEndDt.date();
        system.debug('Offer end date is '+ OfferEnddate);
    }
}