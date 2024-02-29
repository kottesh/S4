/*
 * Calculate the difference between the two dates.
 * @Author: Shree Kottes J
 * @Date: 23-02-2024
 */

public class diffDates {
    public static void calDiffDates(int d1, int m1, int y1, 
                                    int d2, int m2, int y2 ) {
        // handle errors;
        // date
        if (d1 <= 0 || d2 <= 0 || d1 > 31 || d2 > 31){
            System.out.println("Error in input date.");
            return;
        }
        // month
        if(m1 <= 0 || m2 <= 0 || m1 > 12 || m2 > 12) {
            System.out.println("Error in input month");
            return;
        }
        // year
        if(y1 < 0 || y2 < 0) {
            System.out.println("Error in input year");
            return;
        } 

        int diff = ((y2 - y1)*360) + ((m2-m1)*30) + (d2-d1);
        if(diff < 0)
            diff = diff * -1;

        System.out.printf("%d-%d-%d and %d-%d-%d --> %d days\n", d1, m1, y1, d2, m2, y2, diff);
    }

    public static void main(String[] args) {
        //calDiffDates(start{dd-mm-yy}, end{dd-mm-yy})

        calDiffDates(4, 9, 2004, 31, 1, 2024);
        calDiffDates(-5, 4, 2003, 8, 8, 2005);
        calDiffDates(32, 1, 2020, 2, 4, 2023);
        calDiffDates(1, 13, 2021, 2, 4, 2021);
        calDiffDates(2, 1, 2024, 2, 2, 2024);
    }
}
