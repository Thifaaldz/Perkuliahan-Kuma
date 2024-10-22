
import java.util.Scanner;
import javax.print.DocFlavor.STRING;


public class LampuLaluLintas {
    public static void main(String[] args) {
      
        String lampu;
        Scanner scan = new Scanner(System.in);
        

        System.out.print("Inputkan Nama Warna: ");
        lampu = scan.nextLine();
        
        switch (lampu) {
            case "merah":
                System.out.println("Lampu merah, berhenti!");
                break;
            case "kuning":
                System.out.println("Lampu kuning, harap hati-hati!");
                break;
            case "hijau":
                System.out.println("Lampu hijau, Silakan Jalan!");
                break;
            default:
                System.out.println("Warna Lampu Salah");
        }
    }
}
