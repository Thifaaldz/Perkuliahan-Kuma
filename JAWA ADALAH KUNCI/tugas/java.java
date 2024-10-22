import java.util.Scanner;

public class java {
    public static void main(String[] args) {
       
        Scanner scanner = new Scanner(System.in);

        System.out.print("Masukkan bilangan pertama: ");
        double bilangan1 = scanner.nextDouble();

        System.out.print("Masukkan bilangan kedua: ");
        double bilangan2 = scanner.nextDouble();

        double penjumlahan = bilangan1 + bilangan2;
        double pengurangan = bilangan1 - bilangan2;
        double perkalian = bilangan1 * bilangan2;
        double pembagian = bilangan1 / bilangan2;

        System.out.println("Hasil penjumlahan: " + penjumlahan);
        System.out.println("Hasil pengurangan: " + pengurangan);
        System.out.println("Hasil perkalian: " + perkalian);
        System.out.println("Hasil pembagian: " + pembagian);


        scanner.close();
    }
}
