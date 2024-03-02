public class Matrix{
    public static void display(float[][] matrix) {
        for(int i = 0; i < matrix.length; i++) {
            for(int j = 0; j < matrix[i].length; j++) {
                System.out.print(matrix[i][j] + " ");
            }
            System.out.println();
        }
        System.out.print("\n");
    }

    public static void add(float[][] mat_x, float[][] mat_y) {
        if(mat_x.length != mat_y.length || mat_x[mat_x.length-1].length != mat_y[mat_y.length-1].length) {
            System.out.println("Order Should be Same..");
            System.exit(1);
        }

        display(mat_x);
        display(mat_y);

        float[][] ans = new float[mat_x.length][mat_x[0].length];     

        for(int i = 0; i < mat_x.length; i++) {
            for(int j = 0; j < mat_x[i].length; j++) {
                ans[i][j] = mat_x[i][j] + mat_y[i][j];
            }
        }
        
        display(ans);
    } 

    public static void subtract(float[][] mat_x, float[][] mat_y) {
        if(mat_x.length != mat_y.length || mat_x[mat_x.length-1].length != mat_y[mat_y.length-1].length) {
            System.out.println("Order Should be Same..");
            return;
        }

        display(mat_x);
        display(mat_y);

        float[][] ans = new float[mat_x.length][mat_x[0].length];     

        for(int i = 0; i < mat_x.length; i++) {
            for(int j = 0; j < mat_x[i].length; j++) {
                ans[i][j] = mat_x[i][j] - mat_y[i][j];
            }
        }
        
        display(ans);
    } 

    public static void multiply(float[][] mat_x, float[][] mat_y) {
        if(mat_x[0].length != mat_y.length) {
            System.out.println("column in matrix 1 is NOT EQUAL to row in matrix 2");
            return;
        }

        float[][] ans = new float[mat_x.length][mat_y[0].length];
        
        for(int k = 0; k < mat_x.length; k++) { // for to be in the same row in mat 1
            for(int i = 0; i < mat_y[0].length; i++) { // iterate over no of cols in mat 2
                for(int j = 0; j <  mat_y.length; j++) { // iterate over no of elements in the matrix(each row in mat 1 and column in mat 2)
                    ans[k][i] += mat_x[k][j] * mat_y[j][i];
                }
            }
        }

        display(ans);
    }

    public static void operateMatrix(float[][] mat_x, float[][] mat_y, String operation) {
        System.out.println("Matrix A");
        display(mat_x);
        System.out.println("Matrix B");
        display(mat_y);

        switch (operation) {
            case "add":
                add(mat_x, mat_y);
                break;
            case "subtract":
                subtract(mat_x, mat_y);
                break;
            case "multiply":
                multiply(mat_x, mat_y);
                break;
            default:
                System.out.println("UNKNOWN OPERATION: " + operation);
        }
    }

    public static void main(String[] args) {
        //test cases

        float[][] mat_A = {
            {4, 2},
            {2, 5},
        };

        float[][] mat_B = {
            {1, 0},
            {0, 1},
        };

        mat_A = new float[][] {
            {4, 2, 1},
            {2, 3.3f, 0},
            {6, 6, 8}
        };

        mat_B = new float[][] {
            {2, 2, 0},
            {1, 2, 8},
            {9, 0, 1}
        };


        operateMatrix(mat_A, mat_B, "add");
        operateMatrix(mat_A, mat_B, "subtract");
        operateMatrix(mat_A, mat_B, "multiply");
    }
}
