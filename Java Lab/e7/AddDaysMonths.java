/*
 * Find the Date after adding months and days 
 *
 * @Author: Shree Kottes
 * @Date: 24/02/2024
 */

public class AddDaysMonths {
    public static void addDaysMonths(int dd, int mm, int yy, int days, int months) {
        if(dd <= 0 || mm <= 0 || yy <= 0 || dd > 31 || mm > 12) {
            System.out.println("ERROR: Wrong input date");
            return;
        } 

        System.out.printf("Adding %d Months, %d Days\n", months, days);
        System.out.printf("%d-%d-%d --> ", dd, mm, yy);

        days = (months * 30) + days;

        yy += days/360;
        days %= 360;

        int currentDays; 
        while(days > 0) {
            currentDays = Math.min(30, days);
            if(dd + currentDays > 30) {
                mm++;
                if(mm > 12) {
                    mm = 1;
                    yy++;
                }
                dd = (dd + currentDays) % 30;
            } 
            else
                dd += days;
            days -= 30;
        }
        System.out.printf("%d-%d-%d\n", dd, mm, yy);
    }

    public static void main(String[] args) {
        //addDaysMonths(dd, mm, yyyy, days, months);

        addDaysMonths(16, 1, 2024, 361, 1);
        addDaysMonths(15, 1, 2024, 30, 1);
        addDaysMonths(32, 1, 2023, 30, 1);
        addDaysMonths(1, 13, 0, 30, 1);
        addDaysMonths(30, 12, 2024, 2, 0);
    }
}
