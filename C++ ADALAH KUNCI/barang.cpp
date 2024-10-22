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
    toko.tambahkanDiAkhir("Laptop", 15000000);
    toko.tambahkanDiAkhir("Ponsel", 7000000);
    toko.tambahkanDiAwal("Tablet", 5000000);

    std::cout << "Daftar Barang di Toko:" << std::endl;
    toko.tampilkanMaju();  // Output: Daftar barang


    std::string cariNama ;
    std::cout<<"Masukan nama barang";
    std::cin>>cariNama;
    Node* hasil = toko.cariBarang(cariNama);
    if (hasil != nullptr) {
        std::cout << "Barang ditemukan: " << hasil->namaBarang << ", Harga: " << hasil->harga << std::endl;
    } else {
        std::cout << "Barang dengan nama " << cariNama << " tidak ditemukan." << std::endl;
    }

    return 0;
}
