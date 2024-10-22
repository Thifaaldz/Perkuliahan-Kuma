#include <iostream>
#include <string>

using namespace std;

class Node {
public:
    string kodetiket;
    int hargatiket;
    Node* selanjutnya;

    Node(const string& nama, double hargatiket) 
        : kodetiket(nama), hargatiket(hargatiket), selanjutnya(nullptr) {}
};

class DaftarTikettersedia {
private:
    Node* kepala;

public:
    DaftarTikettersedia() : kepala(nullptr) {}

    void tambahkanTiketDiAkhir(const string& nama, double harga) {
        Node* nodeBaru = new Node(nama, harga);
        if (kepala == nullptr) {
            kepala = nodeBaru;
        } else {
            Node* current = kepala;
            while (current->selanjutnya != nullptr) {
                current = current->selanjutnya;
            }
            current->selanjutnya = nodeBaru;
        }
    }

    void tambahkanTiketDiAwal(const string& nama, double harga) {
        Node* nodeBaru = new Node(nama, harga);
        if (kepala == nullptr) {
            kepala = nodeBaru;
        } else {
            nodeBaru->selanjutnya = kepala;
            kepala = nodeBaru;
        }
    }

    void tampilkanMaju() {
        Node* sementara = kepala;
        while (sementara != nullptr) {
            std::cout << "Nama Tiket: " << sementara->kodetiket << ", Harga: " << sementara->hargatiket << endl;
            sementara = sementara->selanjutnya;
        }
    }
    
    Node* cariTiket(const string& nama) {
        Node* sementara = kepala;
        while (sementara != nullptr) {
            if (sementara->kodetiket == nama) {
                return sementara;
            }
            sementara = sementara->selanjutnya;
        }
        return nullptr;
    }

    void hapusTiket(const string& nama) {
        if (kepala == nullptr) {
            cout << "Daftar tiket kosong." << endl;
            return;
        }

        if (kepala->kodetiket == nama) {
            Node* temp = kepala;
            kepala = kepala->selanjutnya;
            delete temp;
            cout << "Tiket dengan Kode " << nama << " berhasil dibeli!" << endl;
            return;
        }

        Node* current = kepala;
        Node* prev = nullptr;
        while (current != nullptr && current->kodetiket != nama) {
            prev = current;
            current = current->selanjutnya;
        }

        if (current == nullptr) {
            cout << "Tiket dengan Kode " << nama << " tidak ditemukan." << endl;
            return;
        }

        prev->selanjutnya = current->selanjutnya;
        delete current;
        cout << "Tiket dengan Kode " << nama << " berhasil dibeli!" << endl;
    }

    ~DaftarTikettersedia() {
        Node* sementara;
        while (kepala != nullptr) {
            sementara = kepala;
            kepala = kepala->selanjutnya;
            delete sementara;
        }
    }
};

int main() {
    DaftarTikettersedia toko;
    cout << "Buana Pluto World Tour To Jakarta!!!!!!" << endl;
    cout << "=======================================" << endl;
    toko.tambahkanTiketDiAwal("VIPA232", 15000000);
    toko.tambahkanTiketDiAkhir("VIPB332", 13000000);
    toko.tambahkanTiketDiAkhir("VIPC887", 5000000);
    toko.tambahkanTiketDiAkhir("RegularA443", 3000000);
    toko.tambahkanTiketDiAkhir("RegularB774", 3000000);
    toko.tambahkanTiketDiAkhir("RegularC554", 3000000);
    toko.tambahkanTiketDiAkhir("LesehanZ445", 100000);
    toko.tambahkanTiketDiAkhir("LesehanQ113", 100000); 
    toko.tambahkanTiketDiAkhir("LesehanG330", 100000);
    cout << "Daftar Tiket yang tersedia:" << endl;
    cout << "=======================================" << endl;
    toko.tampilkanMaju();  
    string cariNama;
    cout << "Masukan Katagori Tiket yang ingin anda beli : " << endl;
    cin >> cariNama;
    Node* hasil = toko.cariTiket(cariNama);
    if (hasil != nullptr) {
        std::cout << "Tiket ditemukan : " << hasil->kodetiket << ", Harga: " << hasil->hargatiket << std::endl;
    } else {
        std::cout << "Tiket dengan nama " << cariNama << " tidak ditemukan." << endl;
    }
    cout << "=======================================" << endl;
    toko.hapusTiket(cariNama);
    cout << "Daftar Tiket Yang Tersisa :" << endl;
    cout << "=======================================" << endl;
    toko.tampilkanMaju();

    return 0;
}
