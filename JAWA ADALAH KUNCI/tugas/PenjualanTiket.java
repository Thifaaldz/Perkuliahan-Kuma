// deklarasi tiket
class PembelianTiket {
    //deklarasi variabel atribut tiket 
    String nama;
    int jumlahTiket;
    String kategoriTiket;
    int hargaTiket; 

    //konstruktor tiket
    public PembelianTiket(String n, int j, String k, int h) {
        this.nama = n;
        this.jumlahTiket = j;
        this.kategoriTiket = k;
        this.hargaTiket = h;
    }
    //method mengambil atribut nama
    public String getNama() {
        return nama;
    }
    //method mengubah atribut nama menjadi n
    public void setNama(String n) {
        this.nama = n;
    }
    //method mengambil atribut jumlah tiket
    public int getJumlahTiket() {
        return jumlahTiket;
    }
    //method mmengubah jumlah tiket menjadi j
    public void setJumlahTiket(int j) {
        this.jumlahTiket = j;
    }
    //method mengambil atribut kategori tiket
    public String getKategoriTiket() {
        return kategoriTiket;
    }
    //method mengubah kategori tiket menjadi k
    public void setKategoriTiket(String k) {
        this.kategoriTiket = k;
    }
    //method mengambil atribut harga tiket
    public int getHargaTiket() {
        return hargaTiket;
    }
    //method mengubah atribut harga tiket menjadi h
    public void setHargaTiket(int h) {
        this.hargaTiket = h;
    }
    //method menghitung total harga tiket dari perkalian jumlah tiket dan harga tiket
    public int hitungTotalHarga() {
        return this.jumlahTiket * this.hargaTiket;
    }
}
//deklarasi public class penjualan tiket
public class PenjualanTiket {
    public static void main(String[] args) {
        // Inisiasi atau Membuat objek thifaaltiket
        PembelianTiket thifaaltiket = new PembelianTiket("Thifaal", 2, "VIP", 10000);
        //melakukan print atau menampilkan hasil atau data tiket
        System.out.println("Nama Pembeli: " + thifaaltiket.getNama());
        System.out.println("Jumlah Tiket: " + thifaaltiket.getJumlahTiket());
        System.out.println("Kategori Tiket: " + thifaaltiket.getKategoriTiket());
        System.out.println("Total Harga: Rp " + thifaaltiket.hitungTotalHarga());
    }
}
