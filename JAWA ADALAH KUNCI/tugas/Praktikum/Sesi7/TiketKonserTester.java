package Praktikum.Sesi7;


class TiketKonser {
    // Atribut dengan berbagai access modifiers
    public String namaKonser;  // Public: bisa diakses dari mana saja
    private double hargaTiket; // Private: hanya bisa diakses dalam kelas ini
    protected int jumlahTiket; // Protected: bisa diakses dalam package yang sama dan subclass

    // Constructor
    public TiketKonser(String namaKonser, double hargaTiket, int jumlahTiket) {
        this.namaKonser = namaKonser;
        setHargaTiket(hargaTiket); // Menggunakan setter untuk validasi harga
        this.jumlahTiket = jumlahTiket;
    }

    // Getter untuk harga tiket
    public double getHargaTiket() {
        return hargaTiket;
    }

    // Setter untuk harga tiket dengan validasi
    public void setHargaTiket(double hargaTiket) {
        if (hargaTiket > 0) { // Harga tiket harus lebih besar dari 0
            this.hargaTiket = hargaTiket;
        } else {
            System.out.println("Harga tiket harus lebih besar dari 0.");
        }
    }

    // Getter untuk jumlah tiket
    public int getJumlahTiket() {
        return jumlahTiket;
    }

    // Setter untuk jumlah tiket dengan validasi
    public void setJumlahTiket(int jumlahTiket) {
        if (jumlahTiket >= 0) { // Jumlah tiket tidak boleh negatif
            this.jumlahTiket = jumlahTiket;
        } else {
            System.out.println("Jumlah tiket tidak boleh negatif.");
        }
    }

    // Method untuk menampilkan informasi tiket konser
    public void tampilkanInfoTiket() {
        System.out.println("Nama Konser: " + namaKonser);
        System.out.println("Harga Tiket: Rp" + hargaTiket);
        System.out.println("Jumlah Tiket Tersedia: " + jumlahTiket);
    }

    // Method untuk membeli tiket
    public void beliTiket(int jumlahBeli) {
        if (jumlahBeli > 0 && jumlahBeli <= jumlahTiket) {
            jumlahTiket -= jumlahBeli;
            System.out.println(jumlahBeli + " tiket berhasil dibeli. Tiket tersisa: " + jumlahTiket);
        } else if (jumlahBeli > jumlahTiket) {
            System.out.println("Jumlah tiket yang diminta melebihi tiket yang tersedia.");
        } else {
            System.out.println("Jumlah pembelian tiket harus lebih dari 0.");
        }
    }
}

// Kelas utama untuk menjalankan program
public class TiketKonserTester {
    public static void main(String[] args) {
        // Membuat objek TiketKonser
        TiketKonser tiket1 = new TiketKonser("Konser Thifaal", 500000, 100);

        // Menampilkan informasi awal tiket
            tiket1.tampilkanInfoTiket();

        // Mengubah harga tiket dan jumlah tiket menggunakan setter
        tiket1.setHargaTiket(550000);  // Mengubah harga tiket
        tiket1.setJumlahTiket(150);     // Menambah jumlah tiket

        System.out.println("\nSetelah perubahan harga dan jumlah tiket:");
        tiket1.tampilkanInfoTiket();

        // Membeli tiket
        tiket1.beliTiket(10); // Beli 10 tiket

        // Mencoba membeli tiket melebihi jumlah yang tersedia
        tiket1.beliTiket(200); // Error, melebihi tiket yang tersedia

        // Mencoba memasukkan nilai negatif pada jumlah tiket
        tiket1.setJumlahTiket(-50); // Error, jumlah tiket tidak boleh negatif
    }
}


