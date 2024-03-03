public class RandomNums {
    public RandomNums() {}

    public void generateRandNum(int length) {
        if((length & (length - 1)) != 0) { // bitwise operation to check if the digit length is power of 2 
            System.out.println("Input digit length in powers of 2!");
            return;
        }
        long seed = System.currentTimeMillis(); // Initialize seed using current time
        long multiplier = 25214903917L;
        long increment = 11;
        long modulus = (long) Math.pow(2, 48);

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            seed = (multiplier * seed + increment) % modulus & Long.MAX_VALUE;
            sb.append((int) (seed % 10)); // Generating a random digit between 0 and 9
        }
        System.out.println("Random Number of Length " + length + ": " + sb);
    }

    public static void main(String[] args) {
        RandomNums rand = new RandomNums();

        //rand.generateRandNum(digit_length);
        rand.generateRandNum(1);
        rand.generateRandNum(2);
        rand.generateRandNum(3);
        rand.generateRandNum(-256);
        rand.generateRandNum(48);
        rand.generateRandNum(128);
        rand.generateRandNum(536870912);
    }
}
