import java.util.Scanner;

public class ratingmakanan {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        String res, rating;
        float pelayanan, ketepatanwaktu, kebersihan, citrarasa, skor;

        for (int i = 0; i < 3; i++) {

            System.out.print("Masukkan nama tempat anda makan: ");
            res = input.nextLine();

            System.out.print("Masukkan nilai untuk pelayanan (1-5): ");
            pelayanan = input.nextFloat();

            System.out.print("Masukkan nilai untuk ketepatan waktu (1-5): ");
            ketepatanwaktu = input.nextFloat();

            System.out.print("Masukkan nilai untuk kebersihan restoran (1-5): ");
            kebersihan = input.nextFloat();

            System.out.print("Masukkan nilai untuk citra rasa makanan (1-5): ");
            citrarasa = input.nextFloat();

            input.nextLine(); 

            skor = (pelayanan + ketepatanwaktu + kebersihan + citrarasa) / 4;

            if (skor >= 4.5) {
                rating = "A";
            } else if (skor >= 3.5) {
                rating = "B";
            } else if (skor >= 2.5) {
                rating = "C";
            } else {
                rating = "D";
            }

            
            System.out.println("\nPenilaian Thifaal Dzaki");
            System.out.println("Nama restaurant: " + res);
            System.out.println("Skor rata-rata: " + skor);
            System.out.println("Rating: " + rating);
            System.out.println("------------------------");
        }

        input.close();
    }
}

