/*
 * Distance Conversion from one to other.
 * UNITS(mm  -> millimeter,
 *       dm  -> decimeter,
 *       cm  -> centimeter,
 *       m   -> meter,
 *       dam -> decameter, 
 *       hm  -> hectometer,
 *       km  -> kilometer
 * )
 */ 

public class DistanceConvert {
    public static void toMM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("cm")) {
                System.out.printf("%f cm --> %f mm%n", value, (value*10));         
            } else if(current.equals("dm")) {
                System.out.printf("%f dm --> %f mm%n", value, (value*100));
            } else if(current.equals("m")) {
                System.out.printf("%f m --> %f mm%n", value, (value * 1000));
            } else if(current.equals("dam")) {
                System.out.printf("%f dam --> %f mm%n", value, (value * 10000));
            } else if(current.equals("hm")) {
                System.out.printf("%f hm --> %f mm%n", value, (value * 100000));
            } else if(current.equals("km")) {
                System.out.printf("%f km --> %f mm%n", value, (value * 1000000));
            } else if (current.equals("mm")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void toDM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("mm")) {
                System.out.printf("%f mm --> %f dm%n", value, (value/100.0));         
            } else if(current.equals("cm")) {
                System.out.printf("%f cm --> %f dm%n", value, (value / 10.0));         
            } else if(current.equals("m")) {
                System.out.printf("%f m --> %f dm%n", value, (value * 10));
            } else if(current.equals("dam")) {
                System.out.printf("%f dam --> %f dm%n", value, (value * 100));
            } else if (current.equals("hm")) {
                System.out.printf("%f hm --> %f dm%n", value, (value * 1000));
            } else if(current.equals("km")) {
                System.out.printf("%f km --> %f dm%n", value, (value * 10000));
            } else if (current.equals("dm")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void toCM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("mm")) {
                System.out.printf("%f mm --> %f cm%n", value, (value/10.0));         
            } else if(current.equals("dm")) {
                System.out.printf("%f dm --> %f cm%n", value, (value * 10));         
            } else if(current.equals("m")) {
                System.out.printf("%f m --> %f cm%n", value, (value * 100));
            } else if(current.equals("dam")) {
                System.out.printf("%f dam --> %f cm%n", value, (value * 1000));
            } else if (current.equals("hm")) {
                System.out.printf("%f hm --> %f cm%n", value, (value * 10000));
            } else if(current.equals("km")) {
                System.out.printf("%f km --> %f cm%n", value, (value * 100000));
            } else if (current.equals("cm")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void toM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("mm")) {
                System.out.printf("%f mm --> %f m%n", value, (value / 1000.0));         
            } else if(current.equals("cm")) {
                System.out.printf("%f cm --> %f m%n", value, (value / 100.0));
            } else if(current.equals("dm")) {
                System.out.printf("%f dm --> %f m%n", value, (value / 10.0));         
            } else if(current.equals("dam")) {
                System.out.printf("%f dam --> %f m%n", value, (value * 10));
            } else if (current.equals("hm")) {
                System.out.printf("%f hm --> %f m%n", value, (value * 100));
            } else if(current.equals("km")) {
                System.out.printf("%f km --> %f m%n", value, (value * 1000));
            } else if (current.equals("m")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void toDAM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("mm")) {
                System.out.printf("%f mm --> %f dam%n", value, (value / 10000.0));         
            } else if(current.equals("cm")) {
                System.out.printf("%f cm --> %f dam%n", value, (value / 1000.0));
            } else if(current.equals("dm")) {
                System.out.printf("%f dm --> %f dam%n", value, (value / 100.0));         
            } else if(current.equals("m")) {
                System.out.printf("%f m --> %f dam%n", value, (value / 10.0));
            } else if (current.equals("hm")) {
                System.out.printf("%f hm --> %f dam%n", value, (value * 10));
            } else if(current.equals("km")) {
                System.out.printf("%f km --> %f dam%n", value, (value * 100));
            } else if (current.equals("dam")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void toHM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("mm")) {
                System.out.printf("%f mm --> %f hm%n", value, (value / 100000.0));         
            } else if(current.equals("cm")) {
                System.out.printf("%f cm --> %f hm%n", value, (value / 10000.0));
            } else if(current.equals("dm")) {
                System.out.printf("%f dm --> %f hm%n", value, (value / 1000.0));         
            } else if(current.equals("m")) {
                System.out.printf("%f m --> %f hm%n", value, (value / 100.0));
            } else if (current.equals("dam")) {
                System.out.printf("%f dam --> %f hm%n", value, (value / 10.0));
            } else if(current.equals("km")) {
                System.out.printf("%f km --> %f hm%n", value, (value * 10));
            } else if (current.equals("hm")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void toKM(double value, String current) {
        if(value < 0) {
            System.out.println("Input can't be Negative: " + value);
        } else {
            current = current.toLowerCase();
            if(current.equals("mm")) {
                System.out.printf("%f mm --> %f km%n", value, (value / 1000000.0));         
            } else if(current.equals("cm")) {
                System.out.printf("%f cm --> %f km%n", value, (value / 100000.0));
            } else if(current.equals("dm")) {
                System.out.printf("%f dm --> %f km%n", value, (value / 10000.0));
            } else if(current.equals("m")) {
                System.out.printf("%f m --> %f km%n", value, (value / 1000.0));
            } else if (current.equals("dam")) {
                System.out.printf("%f dam --> %f km%n", value, (value / 100.0));
            } else if (current.equals("hm")) {
                System.out.printf("%f hm --> %f km%n", value, (value / 10.0));
            } else if (current.equals("km")) {
                System.out.println("cannot convert to same scale");
            } else {
                System.out.printf("%s Scale not Known%n", current);
            }
        }
    }

    public static void main(String args[])  {
        //{input, fromScale, toScale, expected value};
        
        
        
        
        
        
        
        
        
        
        
        
        
        /*String values[][] = { 
            {"0.8", "cm", "mm", "8"},
            {"8", "dm", "cm", "80"},
            {"21", "hm", "km", "2.1"},
            {"2.6", "cm", "dam", "0.0026"},
            {"89", "km", "dm", "890000"},
            {"5.6", "m", "mm", "5600"},
            {"-5.6", "mm", "cm", "-0.56"},
        }; 

        for(int i = 0; i < values.length; i++) {
            double fromVal = Double.parseDouble(values[i][0]); 
            System.out.println("Converting from " + values[i][1] + " to " + values[i][2]);
            switch(values[i][2]) {
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
