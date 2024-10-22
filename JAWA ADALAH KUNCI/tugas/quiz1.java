import java.util.Scanner;

public class quiz1 {
    public static void main(String[] args) {
        Scanner inputan = new Scanner(System.in);

    System.out.print("Masukan angka yang ingin di input");
    int kategori = inputan.nextInt();

    if (kategori > 0 ){
        System.out.print("Kategori angka diatas adalah bilangan positif :"+kategori);}
    else if ( kategori < 0){
        System.out.print("Kategori angka diatas adalah bilangan netagif :" + kategori);}
    else if (kategori == 0){
        System.out.print("Kategori angka diatas adalah bilangan Nol :"+ kategori);
    }
    else {
        System.out.print("angka tidak diketahui");
    }
    inputan.close();
    }
    }

