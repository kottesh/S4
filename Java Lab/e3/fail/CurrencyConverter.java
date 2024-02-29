/*
 * CURRENCY CONVERSION
 */

public class CurrencyConverter {
    static String currencies[][] = {
        {"1",     "USD"}, // US dollar
        {"0.93",  "EUR"}, // Euro
        {"0.31",  "KWD"}, // Kuwaiti Dinar
        {"83.04", "INR"}, // Indian Rupee
        {"0.79",  "GBP"}, // British Pound
        {"1.35",  "CAD"}, // Canadian Dollar
        {"1.53",  "AUD"}, // Australian Dollar
        {"0.88",  "CHF"}, // Swiss Franc
        {"150.16", "JPY"}, // Japanese Yen
        {"1.35",  "SGD"}, // Singapore Dollar
    };

    public static double convert(double amount, String fromCurr, String toCurr) {
        double fromRate = getRate(fromCurr);
        double toRate = getRate(toCurr);

        if( fromRate == -1 || toRate == -1 ) {
            System.out.println("Currency not found!");
            System.exit(0);
        }
        return ((amount/fromRate) * toRate);
    }
    
    public static double getRate(String currency) {
        for(int i =0 ; i < currencies.length; i++) {
            if(currencies[i][1] == currency) {
                return Double.parseDouble(currencies[i][0]);
            }
        }
        return -1;
    } 

    public static void main(String args[]) {
        /* TEST CASES */
        // {amount, fromCurrency, toCurrency}
        String rates[][] = {
            {"2500", "INR", "KWD"},
            {"895", "USD", "EUR"},
            {"236.88", "CAD", "GBP"},
            {"7875", "CHF", "JPY"},
            {"10000", "AUD", "CAD"},
            {"56455", "GBP", "CHF"},
            {"3435.6", "SGD", "INR"}
        };

        for(int i =0 ; i< rates.length; i++) {
            System.out.println("Converting from " + rates[i][1] + " to " + rates[i][2]);
            System.out.println(
                rates[i][0] + " " + rates[i][1] + " --> " +  
                convert(Double.parseDouble(rates[i][0]), rates[i][1], rates[i][2]) + " " + 
                rates[i][2] + "\n"
            );
        }
    }
}
