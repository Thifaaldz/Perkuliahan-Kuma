import java.util.Scanner;

public class quiz3 {
  public static void main(String[] args) {
    Scanner inputan = new Scanner(System.in);

    while (true) {

        System.out.print("Masukan angka program =");
        int angka =inputan.nextInt();

        if (angka ==0) {
            System.out.print("Program Selesai");
            break;
        }
    }
    inputan.close();;
  }  
}
