public class PolynomialOperations {
    public static void add(int[] eq1, int[] eq2, int max_len) {
        System.out.print("ADD: ");
        for (int i = 0; i < max_len; i++) {
            int coeff1 = (i >= max_len - eq1.length) ? eq1[i - (max_len - eq1.length)] : 0;
            int coeff2 = (i >= max_len - eq2.length) ? eq2[i - (max_len - eq2.length)] : 0;
            //int coeff1 = (i < eq1.length) ? eq1[i] : 0;
            //int coeff2 = (i < eq2.length) ? eq2[i] : 0;

            int resCoeff = coeff1 + coeff2;

            if (resCoeff != 0) {
                if (i != max_len - 1)
                    System.out.print(resCoeff + "x^" + (max_len - i - 1) + " + ");
                else
                    System.out.print(resCoeff);
            }
        }
        System.out.println("\n");
    }


    public static void subtract(int[] eq1, int[] eq2, int max_len) {
        System.out.print("SUBTRACT: ");
        for(int i=0; i<max_len; i++) {
            //int coeff1 = (i < eq1.length) ? eq1[i] : 0;
            //int coeff2 = (i < eq2.length) ? eq2[i] : 0;
            int coeff1 = (i >= max_len - eq1.length) ? eq1[i - (max_len - eq1.length)] : 0;
            int coeff2 = (i >= max_len - eq2.length) ? eq2[i - (max_len - eq2.length)] : 0;
            int resCoeff = coeff1 - coeff2;

            if(resCoeff != 0) {
                if(i != max_len-1)
                    System.out.print(resCoeff + "x^" + (max_len - i - 1) + " + ");
                else
                    System.out.print(resCoeff);
            }
        }
        System.out.println("\n");
    }

    public static void multiply(int[] eq1, int[] eq2) {
        int size = eq1.length + eq2.length;
        int[] ans = new int[size-1]; // added -1 in this snippet 'cause degree will be 1 less than the final array size; 
        for(int i=0; i < eq1.length; i++) {
            for(int j = 0 ; j < eq2.length; j++) {
                ans[i+j] += eq1[i] * eq2[j];
            }
        } 
       
        System.out.print("MULTIPLY: ");
        for(int i = 0; i < ans.length; i++) {
            if(ans[i] != 0) {
                if(i != ans.length - 1)
                    System.out.print(ans[i] + "x^" + (ans.length -i -1) + " + ");
                else
                    System.out.print(ans[i]);
            }
        }
        System.out.println("\n");
    }

    public static void divide(int[] num, int[] deno) {
        if(num.length < deno.length) {
             System.out.println("can't divide a lower degree polynomial(numerator) by higher degree polynomial(denominator)\n");
             return;
        }

        System.out.print("NUMERATOR: ");
        printNumRem(num);
        System.out.print("DENOMINATOR: ");
        printNumRem(deno);
        
        int num_deg = num.length - 1;
        int deno_deg = deno.length - 1;
        int size = num_deg - deno_deg + 1;
        int[] quo = new int[size]; //quo -> quotient

        int pt = 0, itr = 0;
        while(num_deg >= deno_deg) {
            quo[pt] = num[num.length - num_deg -1] / deno[0];
            for(int j = 0; j < deno.length; j++) {
                num[itr] -= (quo[pt] * deno[j]);
                itr++;
            }
            num_deg--;
            pt++;
            itr = num.length - num_deg - 1;
        }
        
        System.out.print("QUOTIENT: ");
        printNumRem(quo);
        System.out.print("REMAINDER: ");
        printNumRem(num);
    }

    public static void printNumRem(int[] array) {
        for(int i = 0; i < array.length; i++) {
            if(array[i] != 0) {
                System.out.print(array[i]);
                if(i != array.length - 1)
                    System.out.print("x^" + (array.length -i -1) + " + ");
            }
        }
        System.out.println();
    } 

    public static void operatePolynomial(int[] eq1, int[] eq2, String operation) {
        int max_len = Math.max(eq1.length, eq2.length);
        System.out.print("Poly 1: ");
        printNumRem(eq1);
        System.out.print("Poly 2: ");
        printNumRem(eq2);

        switch(operation) {
            case "add":
                add(eq1, eq2, max_len);
                break;
            case "sub":
                subtract(eq1, eq2, max_len);
                break;
            case "multiply":
                multiply(eq1, eq2);
                break;
            case "divide":
                divide(eq1, eq2);
                break;
            default:
                System.out.println("Unknown Operation: " + operation);
                System.exit(1);
        }
    }

    public static void main(String[] args) {
        // Decreasing order exponents {3, 2, 1} <- like this.

        int[] eq1 = {2, 1};
        int[] eq2 = {4, 0, 5, 6};

        operatePolynomial(eq1, eq2, "add");
        operatePolynomial(eq1, eq2, "sub");
        operatePolynomial(eq1, eq2, "multiply");
        operatePolynomial(eq2, eq1, "divide");
        
        eq1 = new int[] {2, 1, -1, 10};
        eq2 = new int[] {1, -1};
        
        operatePolynomial(eq1, eq2, "add");
        operatePolynomial(eq1, eq2, "sub");
        operatePolynomial(eq2, eq1, "multiply");
        operatePolynomial(eq2, eq1, "divide");

        eq1 = new int[] {5, 2, 6};
        eq2 = new int[] {1, 2, 3};
        
        operatePolynomial(eq1, eq2, "add");
        operatePolynomial(eq1, eq2, "sub");
        operatePolynomial(eq1, eq2, "multiply");
        operatePolynomial(eq1, eq2, "divide");
    }
}
