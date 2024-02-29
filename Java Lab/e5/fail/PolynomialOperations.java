public class PolynomialOperations {
    public static void add(int[] eq1, int[] eq2, int max_len) {
        for(int i=0; i<max_len; i++) {
            int coeff1 = (i < eq1.length) ? eq1[i] : 0;
            int coeff2 = (i < eq2.length) ? eq2[i] : 0;
            int resCoeff = coeff1 + coeff2;

            if(resCoeff != 0) {
                if(i != max_len-1)
                    System.out.print(resCoeff + "x^" + (max_len - i - 1) + " + ");
                else
                    System.out.print(resCoeff);
            }
        }
        System.out.println();
    }

    public static void subtract(int[] eq1, int[] eq2, int max_len) {
        for(int i=0; i<max_len; i++) {
            int coeff1 = (i < eq1.length) ? eq1[i] : 0;
            int coeff2 = (i < eq2.length) ? eq2[i] : 0;
            int resCoeff = coeff1 - coeff2;

            if(resCoeff != 0) {
                if(i != max_len-1)
                    System.out.print(resCoeff + "x^" + (max_len - i - 1) + " + ");
                else
                    System.out.print(resCoeff);
            }
        }
        System.out.println();
    }

    public static void multiply(int[] eq1, int[] eq2) {
        int size = eq1.length + eq2.length;
        int[] ans = new int[size-1]; // added -1 in this snippet 'cause degree will be 1 less than the final array size; 
        for(int i=0; i < eq1.length; i++) {
            for(int j = 0 ; j < eq2.length; j++) {
                ans[i+j] += eq1[i] * eq2[j];
            }
        } 

        for(int i = 0; i < ans.length; i++) {
            if(ans[i] != 0) {
                if(i != ans.length - 1)
                    System.out.print(ans[i] + "x^" + (ans.length -i -1) + " + ");
                else
                    System.out.print(ans[i]);
            }
        }
    }

    public static void operatePolynomial(int[] eq1, int[] eq2, String operation) {
        int max_len = Math.max(eq1.length, eq2.length);

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
            default:
                System.out.println("Unknown Operation: " + operation);
                System.exit(1);
        }
    }

    public static void main(String[] args) {
        // Decreasing order coeffs 
        
        int[] eq1 = {2, 1, 4};
        int[] eq2 = {4, 0, 2, 6};

        operatePolynomial(eq1, eq2, "add");
        operatePolynomial(eq1, eq2, "sub");
        operatePolynomial(eq1, eq2, "multiply");
    }
}
