public class ComplexNums {
    public static void add(int[] num1, int[] num2) {
        showNums(num1, num2);
        System.out.println("ADD: " + (num1[0]+num2[0]) + " + (" + (num1[1]+num2[1]) + ")i\n");
    }

    public static void subtract(int[] num1, int[] num2) {
        showNums(num1, num2);
        System.out.println("SUBTRACT: " + (num1[0] - num2[0]) + " + (" + (num1[1] - num2[1]) + ")i\n");
    }

    public static void multiply(int[] num1, int[] num2) {
        showNums(num1, num2);
        int real = num1[0]*num2[0] - num1[1]*num2[1] ;
        int img = num1[1]*num2[0] + num1[0]*num2[1] ;
        System.out.println("MULTIPLY: " + real + " + (" + img + ")i\n");
    } 

    public static void divide(int[] num1, int[] num2) {
        showNums(num1, num2);
        float real = (float)((num1[0]*num2[0] + num1[1]*num2[1])/(Math.pow(num2[0], 2) + Math.pow(num2[1], 2)));
        float img = (float)((-num1[0]*num2[1] + num1[1]*num2[0])/(Math.pow(num2[0], 2) + Math.pow(num2[1], 2)));

        System.out.println("DIVIDE: " + real + " + (" + img + ")i\n");
    }

    public static void showNums(int[] num1, int[] num2) {
        System.out.println("NUM 1: " + num1[0] + " + (" + num1[1] + ")i");
        System.out.println("NUM 2: " + num2[0] + " + (" + num2[1] + ")i");
    }

    public static void main(String[] args) {
        //array structure {real, img}
        int[] num1 = {3, 5};
        int[] num2 = {4, -6};

        add(num1, num2);
        subtract(num1, num2);
        multiply(num1, num2);
        divide(num1, num2);

        num1 = new int[] {-1, -3};
        num2 = new int[] {34, 21};

        add(num1, num2);
        subtract(num1, num2);
        multiply(num1, num2);
        divide(num1, num2);
    }
}
