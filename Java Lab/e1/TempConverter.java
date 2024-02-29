/*
 * Convert Temperature from one scale to the other.
 * SCALES (Kelvin, Fahrenheit, Celsius)
 */

public class TempConverter {
    public static void toFahrenheit(double temp, char from) {
        if(from == 'K') {
            System.out.println(temp + " " + from + " --> " + ((temp - 273.15) * (9.0/5.0) + 32) + " F");
        } else if(from == 'C' ){
            System.out.println(temp + " " + from + " --> " + (temp * (9.0/5.0) + 32) + " F");
        } else if(from == 'F') {
            System.out.println("Can't convert to same scale");
        } else {
            System.out.println("Scale not known...");
        }
    }

    public static void toCelsius(double temp, char from) {
        if(from == 'K') {
            System.out.println(temp + " " + from + " --> " + (temp - 273.15) + " C");
        } else if(from == 'F' ){
            System.out.println(temp + " " + from + " --> " + ((temp - 32) * (5.0/9.0)) + " C");
        } else if(from == 'C') {
            System.out.println("Can't convert to same scale");
        } else {
            System.out.println("Scale not known...");
        }
    }
    
    public static void toKelvin(double temp, char from) {
        if(from == 'C') {
            System.out.println(temp + " " + from + " --> " + (temp + 273.15) + " K");
        } else if(from == 'F' ){
            System.out.println(temp + " " + from + " --> " + ((temp - 32) * (5.0/9.0) + 273.15) + " K");
        } else if(from == 'K') {
            System.out.println("Can't convert to same scale");
        } else {
            System.out.println("Scale not known...");
        }
    }

    public static void main(String[] args) {
        /* TEST CASES */

        System.out.println("Converting From Fahrenheit and Kelvin --> Celsius");
        toCelsius(788, 'F');
        toCelsius(693.15, 'K');
        toCelsius(-238,'F');
        toCelsius(123.1,'K');

        System.out.println("\nConverting From Celsius and Kelvin --> Fahrenheit");
        toFahrenheit(410, 'C');
        toFahrenheit(683.15, 'K');
        toFahrenheit(-90, 'C');
        toFahrenheit(183.15, 'K');

        System.out.println("\nConverting From Celsius and Fahrenheit --> Kelvin");
        toKelvin(460, 'C'); //733.15
        toKelvin(860, 'F'); //733.15
        toKelvin(-45.8, 'C'); // 227.35
        toKelvin(227.35, 'F'); // 381.6778


        /*char scales[] = {'C', 'F', 'K'};
        double data[][] = {
             {460.00, 860.00,  733.15},
             {-150.0, -238.00, 123.1},
             {-90.00, -130.00, 183.15},
             {-100.0, -148.00, 173.1},
             {-110.0, -166.00, 163.1},
             {-160.0, -256.00, 113.1},
             {-170.0, -274.00, 103.1},
             {-120.0, -184.00, 153.1},
             {-130.0, -202.00, 143.1},
             {410.00, 770.00, 683.15},
             {-140.0, -220.00, 133.1},
        };

        for(int i=0; i<scales.length; i++) {
            System.out.println("---------- TEST CASES FOR " + "\"" + scales[i] + "\" ----------\n");
            for(int j=0; j<data.length; j++) {
                switch(scales[i]) {
                    case 'C':
                        toCelsius(data[j][1], 'F');
                        toCelsius(data[j][2], 'K');
                        System.out.println("Expected Value: " + data[j][0] + " " + scales[i] + "\n");
                        break;
                    case 'F':
                        toFahrenheit(data[j][0], 'C');
                        toFahrenheit(data[j][2], 'K');
                        System.out.println("Expected Value: " + data[j][1] + " " + scales[i] + "\n");
                        break;
                    case 'K':
                        toKelvin(data[j][0], 'C');
                        toKelvin(data[j][1], 'F');
                        System.out.println("Expected Value: " + data[j][2] + " " + scales[i] + "\n");
                        break;
                }
            }
        }*/
    }
}
