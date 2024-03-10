class RandomNum {
    private int primeNums[][];
    private int inDigit;

    private int pow(int base, int expo) {
        if(expo == 0)
            return 1;    
        return base * pow(base, expo - 1);
    }
    
    private boolean isPrime(int num) {
        if(num <= 1)
            return false;

        for(int i = 2; i < num; i++) {
            if(num % i == 0)
                return false;
        }
       return true; 
    } 

    private void populatePrimes() {
        int range = pow(10, this.inDigit);
        int count = 0;

        for(int i = 0; i < range; i++) {
            if(isPrime(i))
                count++;
        }

        int indx = 0;
        primeNums = new int[count][count];

        for(int i = 0; i < range; i++) {
            if(isPrime(i)) {
                primeNums[indx][1] = 0;
                primeNums[indx][0] = i;
                indx++;
            }
        }
    }

    private int getRandPrime() {
        int indx = (int)(System.nanoTime() % primeNums.length);

        int count = 0;
        while(true) {
            if(primeNums[indx][1] == 0) {
                primeNums[indx][1] = 1; 
                break;
            }
            count++;
            if(count/2 > primeNums.length) {
                for(int i = 0; i < primeNums.length; i++) {
                    primeNums[i][1] = 0;
                }
            }
            indx = (int)(System.nanoTime() % primeNums.length);
        }

        return primeNums[indx][0];
    }

    public void showPrimes() {
        for(int i=0; i<primeNums.length; i++) {
            System.out.print(primeNums[i][0] + ":" + primeNums[i][1] + " ");
        }
        System.out.println();
    }

    public String generate(int inDigit) {
        int outDigit = pow(2, inDigit);

        if(inDigit == 0) {
            inDigit = 1;
        } else if(inDigit >= 6) {
            inDigit = 5; // assign default value to this.inDigit if it exceeds 6 (why? will take longer time')
        }

        if(this.inDigit != inDigit) {
            this.inDigit = inDigit;
            populatePrimes();
        }

        StringBuilder res = new StringBuilder();

        long multiplier = this.hashCode() & getRandPrime();
        for(int i = 0; i < outDigit; i++) {
            int randPrime = getRandPrime();
            int value = (int)(((randPrime * multiplier) ^ pow(2, inDigit)) % 10);
            value = (value < 0) ? -value : value;
            res.append(value);
            multiplier = (randPrime & multiplier) ^ System.nanoTime(); 
        }
        return res.toString();
    } 

    public static void main(String[] args) {
        RandomNum rand = new RandomNum(); 

        System.out.println(rand.generate(0));
        System.out.println(rand.generate(2)); // in <-- 2 , out --> 2^2 = 4
        System.out.println(rand.generate(2));
        System.out.println(rand.generate(1));
        System.out.println(rand.generate(3));
        System.out.println(rand.generate(2));
        System.out.println(rand.generate(3));
        System.out.println(rand.generate(8));
    } 
}
