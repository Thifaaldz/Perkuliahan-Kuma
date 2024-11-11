class Mobil {
    String aktifitas;
    String warna;
    int kecepatan;
   
    //konstruktor mobil
    public Mobil (){
    this.aktifitas = "Berjalan";
    this.warna = "tidak diketahui";
    this.kecepatan = 0;
    }
    //konstruktor mobil
    public Mobil (String a,String w, int k) {
        this.aktifitas = a;
        this.warna = w;
        this.kecepatan = k;
    }
    //method untuk cek kecepatan
    void cekKecepatan () {
        if (kecepatan ==0) {
            aktifitas="parkir";
        }
    }
    //method untuk pencetakan atribut
    void cetakAtribut (){
        System.out.println("aktivitas =" +aktifitas);
        System.out.println("warna = " +warna);
        System.out.println("Kecepatan" +kecepatan);
    }
}
//deklarasi public class
public class ClassMobil {
    public static void main(String[] args) {
        //inisiasi atau pembuatan objek dari class mobil
        Mobil mobilthifaal = new Mobil();
        //input nilai dari atribut
        mobilthifaal.kecepatan= 100;
        mobilthifaal.warna="Biru";
        //pemanggilan fungsi class ke dalam main untuk di jalankan
        mobilthifaal.cekKecepatan();
        mobilthifaal.cetakAtribut();
    }

}

