class RandomNum {
    private long multiplier = 25214903917L;
    private long increment = 11;
    private long modulus = (long) pow(2, 48);

    private double pow(float base, float expo) {
        if(expo == 0)
            return 1;
        return base * pow(base, expo - 1); 
    }

    public void generateNum(int length) {
        if(length < 0) {
            System.out.println("ERROR: " + length + " --> provide number of digits greater than 0");
            return;
        }
        if((length & (length - 1)) != 0) { // bitwise operation to check if the digit length is power of 2 
            System.out.println("ERROR: " + length + " --> provide number of digits as powers of 2");
            return;
        }

        //used linear congruential algorithm(LCG)
        long seed = System.nanoTime() + length; // using nanotime(JVM starting arbitrary point of time) as seed

        StringBuilder res = new StringBuilder();

        for (int i = 0; i < length; i++) {
            seed = (multiplier * seed + increment) % modulus; 
            if(seed < 0) 
                seed *= -1;
            res.append(seed % 10); // append only a single digit(go digit-by-digit)
        }

        System.out.println("Random Number (" + length + " digit)" + ": " + res);
    }
}

public class Main {
    public static void main(String[] args) {
        RandomNum rand = new RandomNum();

        //eg: rand.generateRandNum(digit_length);
        
        rand.generateNum(1);
        rand.generateNum(2);
        rand.generateNum(48);
        rand.generateNum(-256);
        rand.generateNum(16);
        rand.generateNum(32);

        //rand.generateNum(536870912); /* really long */
    }
} 

