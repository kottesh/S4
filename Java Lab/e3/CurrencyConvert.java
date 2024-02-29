public class CurrencyConvert {
    public static void toINR(double amount, String current) {
        if(current == "CHF")
            System.out.println(amount + " " + current + " --> " + (amount * 94.08) + " INR");
        else if (current == "KWD")
            System.out.println(amount + " " + current + " --> " + (amount * 269.29) + " INR");
        else if (current == "RUB")
            System.out.println(amount + " " + current + " --> " + (amount * 0.90) + " INR");
        else if (current == "EUR")
            System.out.println(amount + " " + current + " --> " + (amount * 89.61) + " INR");
        else if (current == "USD")
            System.out.println(amount + " " + current + " --> " + (amount * 82.88) + " INR");
        else
            System.out.println("CAN'T FIND THE CURRENCY: " + current);
    }

    public static void toUSD(double amount, String current) {
        if(current == "CHF")
            System.out.println(amount + " " + current + " --> " + (amount * 1.13) + " USD");
        else if (current == "KWD")
            System.out.println(amount + " " + current + " --> " + (amount * 3.25) + " USD");
        else if (current == "RUB")
            System.out.println(amount + " " + current + " --> " + (amount * 0.011) + " USD");
        else if (current == "EUR")
            System.out.println(amount + " " + current + " --> " + (amount * 1.08) + " USD");
        else if (current == "INR")
            System.out.println(amount + " " + current + " --> " + (amount * 0.012) + " USD");
        else
            System.out.println("CAN'T FIND THE CURRENCY: " + current);
    }

    public static void toCHF(double amount, String current) {
        if(current == "USD")
            System.out.println(amount + " " + current + " --> " + (amount * 0.88) + " CHF");
        else if (current == "KWD")
            System.out.println(amount + " " + current + " --> " + (amount * 2.86) + " CHF");
        else if (current == "RUB")
            System.out.println(amount + " " + current + " --> " + (amount * 0.0095) + " CHF");
        else if (current == "EUR")
            System.out.println(amount + " " + current + " --> " + (amount * 0.95) + " CHF");
        else if (current == "INR")
            System.out.println(amount + " " + current + " --> " + (amount * 0.011) + " CHF");
        else
            System.out.println("CAN'T FIND THE CURRENCY: " + current);
    }

    public static void toKWD(double amount, String current) {
        if(current == "USD")
            System.out.println(amount + " " + current + " --> " + (amount * 0.31) + " KWD");
        else if (current == "CHF")
            System.out.println(amount + " " + current + " --> " + (amount * 0.35) + " KWD");
        else if (current == "RUB")
            System.out.println(amount + " " + current + " --> " + (amount * 0.0033) + " KWD");
        else if (current == "EUR")
            System.out.println(amount + " " + current + " --> " + (amount * 0.33) + " KWD");
        else if (current == "INR")
            System.out.println(amount + " " + current + " --> " + (amount * 0.0037) + " KWD");
        else
            System.out.println("CAN'T FIND THE CURRENCY: " + current);
    }

    public static void toEUR(double amount, String current) {
        if(current == "USD")
            System.out.println(amount + " " + current + " --> " + (amount * 0.92) + " EUR");
        else if (current == "CHF")
            System.out.println(amount + " " + current + " --> " + (amount * 1.05) + " EUR");
        else if (current == "RUB")
            System.out.println(amount + " " + current + " --> " + (amount * 0.010) + " EUR");
        else if (current == "KWD")
            System.out.println(amount + " " + current + " --> " + (amount * 3.01) + " EUR");
        else if (current == "INR")
            System.out.println(amount + " " + current + " --> " + (amount * 0.011) + " EUR");
        else
            System.out.println("CAN'T FIND THE CURRENCY: " + current);
    }

    public static void toRUB(double amount, String current) {
        if(current == "USD")
            System.out.println(amount + " " + current + " --> " + (amount * 92.50) + " RUB");
        else if (current == "CHF")
            System.out.println(amount + " " + current + " --> " + (amount * 104.95) + " RUB");
        else if (current == "EUR")
            System.out.println(amount + " " + current + " --> " + (amount * 99.83) + " RUB");
        else if (current == "KWD")
            System.out.println(amount + " " + current + " --> " + (amount * 300.59) + " RUB");
        else if (current == "INR")
            System.out.println(amount + " " + current + " --> " + (amount * 1.12) + " RUB");
        else
            System.out.println("CAN'T FIND THE CURRENCY: " + current);
    }

    public static void main(String[] args) {
        System.out.println("Currency rates as of 20-02-2024\n");
        
        /* test cases */
        toRUB(2600, "EUR"); 
        toINR(1006.9, "USD"); 
        toCHF(85, "KWD"); 
        toEUR(25156, "INR"); 
        toUSD(400, "CHF"); 
        toKWD(50000, "INR"); 
    } 
}
