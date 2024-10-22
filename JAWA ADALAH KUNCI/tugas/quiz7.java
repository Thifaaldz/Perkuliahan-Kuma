import java.util.Scanner;

public class quiz7 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Masukkan batas bawah: ");
        int batasBawah = input.nextInt();

        System.out.print("Masukkan batas atas: ");
        int batasAtas = input.nextInt();

        int jumlahPrima = 0;  
        int i = batasBawah;   


        while (i <= batasAtas) {
            if (isPrima(i)) {
                jumlahPrima++;  
            }
            i++;  
        }

        System.out.println("Jumlah bilangan prima antara " + batasBawah + " dan " + batasAtas + ": " + jumlahPrima);

        input.close();
    }

    public static boolean isPrima(int n) {
        if (n <= 1) {
            return false; 
        }

        int i = 2;
        while (i * i <= n) {
            if (n % i == 0) {
                return false; 
            }
            i++;
        }
        return true; 
    }
}
