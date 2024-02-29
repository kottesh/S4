/*
 * DISTANCE CONVERSION 
 */

public class DistanceConvert {

    public static void toMM(double value, String current) {
        convert(value, current, "mm");
    }

    public static void toCM(double value, String current) {
        convert(value, current, "cm");
    }

    public static void toDM(double value, String current) {
        convert(value, current, "dm");
    }

    public static void toM(double value, String current) {
        convert(value, current, "m");
    }

    public static void toDAM(double value, String current) {
        convert(value, current, "dam");
    }

    public static void toHM(double value, String current) {
        convert(value, current, "hm");
    }

    public static void toKM(double value, String current) {
        convert(value, current, "km");
    }
    public static void toINCH(double value, String current) {
        convert(value, current, "inch");
    }
    public static void toMILE(double value, String current) {
        convert(value, current, "mile");
    }
    public static void toFOOT(double value, String current) {
        convert(value, current, "foot");
    }

    private static void convert(double value, String current, String target) {
        if (value < 0) {
            System.out.println("Input can't be Negative: " + value);
            return;
        }

        current = current.toLowerCase();
        target = target.toLowerCase();

        if (current.equals(target)) {
            System.out.println("cannot convert to same scale");
            return;
        }

        double result = 0;
        switch (target) {
            case "mm":
                result = value * getMultiplier(current) * 1000;
                break;
            case "cm":
                result = value * getMultiplier(current) * 100;
                break;
            case "dm":
                result = value * getMultiplier(current) * 10;
                break;
            case "m":
                result = value * getMultiplier(current);
                break;
            case "dam":
                result = value * getMultiplier(current) / 10;
                break;
            case "hm":
                result = value * getMultiplier(current) / 100;
                break;
            case "km":
                result = value * getMultiplier(current) / 1000;
                break;
            case "inch":
                result = value * getMultiplier(current) / 0.0254;
                break;
            case "mile":
                result = value * getMultiplier(current) / 1609.34;
                break;
            case "foot":
                result = value * getMultiplier(current) / 0.3048;
                break;
            default:
                System.out.println(current + " Scale not Known");
                return;
        }
        System.out.printf("%f %s --> %f %s%n", value, current, result, target);
    }

    private static double getMultiplier(String scale) {
        switch (scale) {
            case "mm":
                return 0.001;
            case "cm":
                return 0.01;
            case "dm":
                return 0.1;
            case "m":
                return 1;
            case "dam":
                return 10;
            case "hm":
                return 100;
            case "km":
                return 1000;
            case "inch":
                return 0.0254;
            case "mile":
                return 1609.34;
            case "foot":
                return 0.3048;
            default:
                System.out.println(scale + " Scale not Known");
                return 1;
        }
    }

    public static void main(String args[]) {
        //{input, fromScale, toScale, expected value};
        
        toMM(0.8, "cm");
        toCM(8, "dm");
        toDAM(2.6, "cm");
        toFOOT(4, "inch");
        toMILE(4.9, "m");
        toINCH(5, "dam");





        /*
        String values[][] = {
                {"0.8", "cm", "mm", "8"},
                {"8", "dm", "cm", "80"},
                {"21", "hm", "km", "2.1"},
                {"2.6", "cm", "dam", "0.0026"},
                {"89", "km", "dm", "890000"},
                {"5.6", "m", "mm", "5600"},
                {"-5.6", "mm", "cm", "-0.56"},
                {"3.2", "cm", "inch", "0.393"},
                {"3.2", "inch", "foot", "0.2667"},
                {"0.5", "cm", "mile", "0.00000310"},
                {"0.5", "mile", "cm", "80467.2"},
        };

        for (int i = 0; i < values.length; i++) {
            double fromVal = Double.parseDouble(values[i][0]);
            System.out.println("Converting from " + values[i][1] + " to " + values[i][2]);
            switch (values[i][2]) {
                case "mm":
                    toMM(fromVal, values[i][1]);
                    break;
                case "cm":
                    toCM(fromVal, values[i][1]);
                    break;
                case "dm":
                    toDM(fromVal, values[i][1]);
                    break;
                case "m":
                    toM(fromVal, values[i][1]);
                    break;
                case "dam":
                    toDAM(fromVal, values[i][1]);
                    break;
                case "hm":
                    toHM(fromVal, values[i][1]);
                    break;
                case "km":
                    toKM(fromVal, values[i][1]);
                    break;
                case "inch":
                    toINCH(fromVal, values[i][1]);
                    break;
                case "mile":
                    toMILE(fromVal, values[i][1]);
                    break;
                case "foot":
                    toFOOT(fromVal, values[i][1]);
                    break;
                default:
                    System.out.println("SCALE NOT FOUND!");
                    break;
            }
            System.out.println("Expected Value: " + Double.parseDouble(values[i][3]) + " " + values[i][2] + "\n");
        }*/

        /*to__(1, "mm");
        to__(1, "cm");
        to__(1, "dm");
        to__(1, "m");
        to__(1, "dam");
        to__(1, "hm");
        to__(1, "km");
        to__(1, "t");*/
    }
}

