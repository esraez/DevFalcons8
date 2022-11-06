public with sharing class SoapCallouts {
    public static String[] getParksByCountry(String Country){
        ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
        String[] parks = parkService.byCountry(country);
        system.debug(parks);
        return parks;
    }
    public static Double getSum(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort calcService = new  CalculatorServices.CalculatorImplPort();
        Double output = calcService.doAdd(num1,num2);
        return output;
    }
    public static Double getMultiply(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doMultiply(num1,num2);
        return output;
    }
    public static Double getSubtract(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doSubtract(num1,num2);
        return output;
    }
    public static Double getDivide(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double output = calcService.doDivide(num1,num2);
        return output;
    }
    }

