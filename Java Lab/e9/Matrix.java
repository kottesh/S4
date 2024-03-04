/* 
 * @ Author: Shree Kottes 
 * @ Date: 03-03-2024
*/

public class Matrix{
    private float[][] data; 
    private int row;
    private int col;

    public Matrix() {/* default constructor */}

    public Matrix(int row, int col, float[][] matrix) {
        this.row = row;
        this.col = col;
        this.data = copyMatrix(matrix); 
    }

    public Matrix(int row, int col) {
        this.row = row;
        this.col = col;
        this.data = new float[row][col];
    }

    private float[][] copyMatrix(float[][] source) {
        float[][] result = new float[row][col]; // how it access the row, col -> the func copyMatrix have the access through object that is called on. 

        for(int i = 0; i < row; i++) {
            for(int j = 0; j < col; j++) {
                result[i][j] = source[i][j];
            }
        }
        return result;
    }

    private void set(int x, int y, float value) {
        this.data[x][y] += value;
    }

    private float get(int x, int y) {
        return this.data[x][y];
    }

    private void display() {
        for(int i = 0; i < this.row ; i++) {
            for(int j = 0; j < this.col ; j++) {
                System.out.print(get(i, j) + " ");
            }
            System.out.println();
        }
        System.out.println();
    }

    public static void matrixInfo(Matrix mat_A, Matrix mat_B) {
        System.out.println("Matrix 1");
        System.out.println("ORDER: " + mat_A.row + "x" + mat_A.col);
        mat_A.display();

        System.out.println("Matrix 2");
        System.out.println("ORDER: " + mat_B.row + "x" + mat_B.col);
        mat_B.display();
    }

    private Matrix add(Matrix other) {
        System.out.println("ADD:");
        if(this.row != other.row || this.col != other.col) {
            System.out.println("Order Should be Same...");
            return new Matrix();
        }

        Matrix ans = new Matrix(this.row, this.col);

        for(int i = 0; i < ans.row; i++) {
            for(int j = 0; j < ans.col; j++) {
                ans.set(i, j, this.get(i, j) + other.get(i, j));
            }
        }
        return ans;
    } 

    private Matrix subtract(Matrix other) {
        System.out.println("SUBTRACT:");
        if(this.row != other.row || this.col != other.col) {
            System.out.println("Order Should be Same...");
            return new Matrix();
        }

        Matrix ans = new Matrix(this.row, this.col);

        for(int i = 0; i < ans.row; i++) {
            for(int j = 0; j < ans.col; j++) {
                ans.set(i, j, this.get(i, j) - other.get(i, j));
            }
        }
        
        return ans;

    } 

    private Matrix multiply(Matrix other) {
        System.out.println("MULTIPLY:");
        if(this.col != other.row) {
            System.out.println("column in matrix 1 is NOT EQUAL to row in matrix 2");
            return new Matrix(); //dummy
        }

        Matrix ans = new Matrix(this.row, other.col);
        
        for(int k = 0; k < this.row; k++) { // for to be in the same row in mat 1
            for(int i = 0; i < other.col; i++) { // iterate over no of cols in mat 2
                for(int j = 0; j <  this.col; j++) { // iterate over no of elements in the matrix(each row in mat 1 and column in mat 2)
                    ans.set(k, i, this.get(k, j) * other.get(j, i));
                }
            }
        }

        return ans;
    }

    public static void main(String[] args) {
        Matrix mat_A = new Matrix(
            2, 2,
            new float[][] {
                {4, 2},
                {2, 5},
            }
        );

        Matrix mat_B = new Matrix(
            2, 2,
            new float[][] {
                {1, 0},
                {0, 1},
            }
        );

        matrixInfo(mat_A, mat_B);
        
        mat_A.add(mat_B).display();
        mat_A.subtract(mat_B).display();
        mat_A.multiply(mat_B).display();

        mat_A = new Matrix(
            3, 3, 
            new float[][] {
                {4, 2, 1},
                {2, 3.3f, 0},
                {6, 6, 8}
            }
        );

        mat_B = new Matrix(
            3, 3,
            new float[][] {
                {2, 2, 0},
                {1, 2, 8},
                {9, 0, 1}
            }
        );

        matrixInfo(mat_A, mat_B);

        mat_A.add(mat_B).display();
        mat_A.subtract(mat_B).display();
        mat_A.multiply(mat_B).display();

        mat_A = new Matrix(
            3, 2, 
            new float[][] {
                {4, 2},
                {2, 0},
                {6, 6}
            }
        );

        mat_B = new Matrix(
            3, 2,
            new float[][] {
                {2, 0},
                {1, 2},
                {9, 0}
            }
        );

        matrixInfo(mat_A, mat_B);

        mat_A.add(mat_B).display();
        mat_A.subtract(mat_B).display();
        mat_A.multiply(mat_B).display();

        mat_A = new Matrix(
            3, 3, 
            new float[][] {
                {4, 2},
                {2, 0},
                {6, 6}
            }
        );

        mat_B = new Matrix(
            3, 3,
            new float[][] {
                {2, 0},
                {1, 2},
                {9, 0}
            }
        );

        matrixInfo(mat_A, mat_B);

        mat_A.add(mat_B).display();
        mat_A.subtract(mat_B).display();
        mat_A.multiply(mat_B).display();
    }
}
