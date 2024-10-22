import java.util.Scanner;

public class quiz6 {
    public static void main(String[] args) {
        Scanner inputan = new Scanner(System.in);
        int angkaterbesar = Integer.MIN_VALUE;

        for (int i=0;i<5;i++){
            System.out.print("Masukan Angka Perogram  "+i );
            System.out.print(" = " );
           int angka = inputan.nextInt();
        if ( angka > angkaterbesar ) 
        {   
            angkaterbesar = angka; 
        }   
        }
        System.out.println("Angka terbesar sampai terkecil adalah ="+ angkaterbesar ); 
        inputan.close();
    }
}
