import java.util.Scanner;

public class quiz9 {
    public static void main(String[] args) {
        Scanner inputan = new Scanner(System.in);
        int Ganjil = 0; 
        int Genap = 0;   


        while (true) {
            System.out.print("Masukkan angka (masukkan angka negatif untuk berhenti): ");
            int angka = inputan.nextInt();

            if (angka < 0) {
                System.out.println("Program Selesai");
                break;
            }

            if (angka % 2 == 0) {
                Genap ++;  
            } else {
                Ganjil++; 
            }
        }

        System.out.println("Jumlah angka dalam program genap: " + Genap);
        System.out.println("Jumlah angka dalam program ganjil: " + Ganjil);

        inputan.close();
    }
}
