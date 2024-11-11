//deklarasi class mahasiswa
class Mahasiswa {
    //deklarasi atribut mahasiswa 
    private String nama;
    private int umur;
    private String jurusan;
    //konstruktor
    public Mahasiswa (String n,int u,String j){
        this.nama = n ;
        this.umur = u ;
        this.jurusan = j;
    }
    //method menampilkan data atribut
    public void tampilkanInfo() {
        System.out.println("Nama anda: "+this.nama);
        System.out.println("Umur anda"+this.umur);
        System.out.println("Jurusan :" +this.jurusan);
    }
    //method memanggil atribut nama
    public String getNama() {
        return nama;
    }
    //method mengubah atribut nama menjadi n
    public void setNama (String n){
        this.nama = n;
    }
    //method memanggil atribut umur
    public int getUmur() {
        return umur;
    }
    //method mengubah atribut umur menjadi u
    public void setUmur (int u){
     this.umur = u;
    }
    //method memanggil atribut jurusan
    public String getJurusan () {
        return jurusan;
    }
    //method mengubah atribut jurusan menjadi j
    public void setJurusan (String j){
        this.jurusan = j;
    }
    
}
//deklarasi public classmahasiswa
public class ClassMahasiswa {
    public static void main(String[] args) {
        //inisiasi atau membuat objek dari mahasiswa dan mengisi data dari atribut
        Mahasiswa mhsthifaal = new Mahasiswa("Thifaal", 21, "Sistem Informasi");
        //memanggil atribut tampilakn info untuk menampilkan data atribut
        mhsthifaal.tampilkanInfo();
        //mengubah isi atribut nama dan umur
        mhsthifaal.setNama("kuma");
        mhsthifaal.setUmur(22);
        //menampilkan atribut setelah di rubah 
        System.out.println("\nSetelah Diubah :");
        mhsthifaal.tampilkanInfo();
    }
    
}
