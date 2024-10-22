import java.util.Scanner;

public class Kalkulatorsederhana {

    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Kalkulator Thifaal dzaki" );
        System.out.println("Pilih operasi: ");
        System.out.println("1. Penjumlahan (+)");
        System.out.println("2. Pengurangan (-)");
        System.out.println("3. Perkalian (*)");
        System.out.println("4. Pembagian (/)");
        
        System.out.print("Masukkan pilihan Kalkulator Diatas ");
        int pilihan = scanner.nextInt();
        
        System.out.print("Masukkan angka1: ");
        double angkapertama = scanner.nextDouble();
        
        System.out.print("Masukkan angka2: ");
        double angkakedua = scanner.nextDouble();
        
        double hasil = 0;
        
        switch (pilihan) {Z`
            case 1:
                hasil = angkapertama + angkakedua;
                System.out.println("Hasil: " + angkapertama + " + " + angkakedua + " = " + hasil);
                break;
            case 2:
                hasil = angkapertama - angkakedua;
                System.out.println("Hasil: " + angkapertama + " - " + angkakedua + " = " + hasil);
                break;
            case 3:
                hasil = angkapertama * angkakedua;
                System.out.println("Hasil: " + angkapertama + " * " + angkakedua + " = " + hasil);
                break;
            case 4:
                if (angkakedua != 0) {
                    hasil = angkapertama / angkapertama;
                    System.out.println("Hasil: " + angkapertama + " / " + angkakedua + " = " + hasil);
                } else {
                    System.out.println("Error: Pembagian dengan nol tidak diperbolehkan!");
                }
                break;
            default:
                System.out.println("Pilihan tidak valid.");
        }
        scanner.close();
    }
}
