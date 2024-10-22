#include <iostream>
#include <string>

class Node {
public:
    std::string namaBarang;
    double harga;
    Node* berikutnya;
    Node* sebelumnya;

    Node(const std::string& nama, double hargaBarang) 
        : namaBarang(nama), harga(hargaBarang), berikutnya(nullptr), sebelumnya(nullptr) {}
};

class DaftarTautanGanda {
private:
    Node* kepala;
    Node* ekor;

public:
    DaftarTautanGanda() : kepala(nullptr), ekor(nullptr) {}

    // Fungsi untuk menambahkan barang di akhir
    void tambahkanDiAkhir(const std::string& nama, double harga) {
        Node* nodeBaru = new Node(nama, harga);
        if (ekor == nullptr) {
            kepala = ekor = nodeBaru;
        } else {
            ekor->berikutnya = nodeBaru;
            nodeBaru->sebelumnya = ekor;
            ekor = nodeBaru;
        }
    }

    // Fungsi untuk menambahkan barang di awal
    void tambahkanDiAwal(const std::string& nama, double harga) {
        Node* nodeBaru = new Node(nama, harga);
        if (kepala == nullptr) {
            kepala = ekor = nodeBaru;
        } else {
            kepala->sebelumnya = nodeBaru;
            nodeBaru->berikutnya = kepala;
            kepala = nodeBaru;
        }
    }

    // Fungsi untuk menampilkan daftar barang dari awal
    void tampilkanMaju() {
        Node* sementara = kepala;
        while (sementara != nullptr) {
            std::cout << "Nama Barang: " << sementara->namaBarang << ", Harga: " << sementara->harga << std::endl;
            sementara = sementara->berikutnya;
        }
    }
    
    // Fungsi untuk mencari barang berdasarkan nama
    Node* cariBarang(const std::string& nama) {
        Node* sementara = kepala;
        while (sementara != nullptr) {
            if (sementara->namaBarang == nama) {
                return sementara;
            }
            sementara = sementara->berikutnya;
        }
        return nullptr;
    }

    // Fungsi untuk menghapus barang berdasarkan nama
    void hapusBarang(const std::string& nama) {
        Node* nodeDihapus = cariBarang(nama);
        if (nodeDihapus == nullptr) {
            std::cout << "Barang dengan nama " << nama << " tidak ditemukan." << std::endl;
            return;
        }

        if (nodeDihapus->sebelumnya != nullptr) {
            nodeDihapus->sebelumnya->berikutnya = nodeDihapus->berikutnya;
        } else {
            kepala = nodeDihapus->berikutnya;
        }

        if (nodeDihapus->berikutnya != nullptr) {
            nodeDihapus->berikutnya->sebelumnya = nodeDihapus->sebelumnya;
        } else {
            ekor = nodeDihapus->sebelumnya;
        }

        delete nodeDihapus;
        std::cout << "Barang dengan nama " << nama << " berhasil dihapus." << std::endl;
    }

    ~DaftarTautanGanda() {
        Node* sementara;
        while (kepala != nullptr) {
            sementara = kepala;
            kepala = kepala->berikutnya;
            delete sementara;
        }
    }
};

int main() {
    DaftarTautanGanda toko;
    std::cout << "Buana Pluto World Tour" << std::endl;

    // Menu untuk mengelola daftar barang
    int pilihan;
    std::string namaBarang;
    double hargaBarang;

    do {
        std::cout << "\nMenu:\n";
        std::cout << "1. Tambah Barang di Awal\n";
        std::cout << "2. Tambah Barang di Akhir\n";
        std::cout << "3. Tampilkan Semua Barang\n";
        std::cout << "4. Cari Barang\n";
        std::cout << "5. Hapus Barang\n";
        std::cout << "6. Keluar\n";
        std::cout << "Pilih menu: ";
        std::cin >> pilihan;

        switch (pilihan) {
            case 1:
                std::cout << "Masukkan Nama Barang: ";
                std::cin >> namaBarang;
                std::cout << "Masukkan Harga Barang: ";
                std::cin >> hargaBarang;
                toko.tambahkanDiAwal(namaBarang, hargaBarang);
                break;
            case 2:
                std::cout << "Masukkan Nama Barang: ";
                std::cin >> namaBarang;
                std::cout << "Masukkan Harga Barang: ";
                std::cin >> hargaBarang;
                toko.tambahkanDiAkhir(namaBarang, hargaBarang);
                break;
            case 3:
                std::cout << "Daftar Barang di Toko:" << std::endl;
                toko.tampilkanMaju();
                break;
            case 4:
                std::cout << "Masukkan Nama Barang yang ingin dicari: ";
                std::cin >> namaBarang;
                if (Node* hasil = toko.cariBarang(namaBarang); hasil != nullptr) {
                    std::cout << "Barang ditemukan: " << hasil->namaBarang << ", Harga: " << hasil->harga << std::endl;
                } else {
                    std::cout << "Barang dengan nama " << namaBarang << " tidak ditemukan." << std::endl;
                }
                break;
            case 5:
                std::cout << "Masukkan Nama Barang yang ingin dihapus: ";
                std::cin >> namaBarang;
                toko.hapusBarang(namaBarang);
                break;
            case 6:
                std::cout << "Keluar dari program.\n";
                break;
            default:
                std::cout << "Pilihan tidak valid. Coba lagi.\n";
                break;
        }
    } while (pilihan != 6);

    return 0;
}
