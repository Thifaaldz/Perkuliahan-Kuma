import java.util.Scanner;
public class faktorial {
    public static void main(String[] args) {
        Scanner inputan = new Scanner(System.in);

        System.out.println("Masukan Sebuah Angka");

        int angka = inputan.nextInt();

        int faktorial = 1;
        
        int i = angka;

        while (i>0) {
            faktorial *= i;
            i--;
            
        }

        System.out.println("faktorial dari  " + angka + "adalah" + faktorial);
    }
}
