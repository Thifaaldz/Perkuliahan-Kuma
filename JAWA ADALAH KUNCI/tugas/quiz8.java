public class quiz8 {
    public static void main(String[] args) {

        for (int i = 1; i <= 100; i++) {
 
            if (i % 3 == 0 && i % 5 == 0) {
                System.out.println(i +"Adalah fizzbuzz");
            }
 
            else if (i % 3 == 0) {
                System.out.println(i +" Adalah fizz");
            }

            else if (i % 5 == 0) {
                System.out.println(i + "Adalah buzz");
            }
            else {
                System.out.println(i);
            }
        }
    }
}
