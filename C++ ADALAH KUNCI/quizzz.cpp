#include <iostream>
#include <string>
using namespace std;

class Gerbong {
public:
    string kodetiket;
    int hargatiket;
    Gerbong* selanjutnya;

    Gerbong(const string& nama, int harga)
        : kodetiket(nama), hargatiket(harga), selanjutnya(nullptr) {}
};

class QueueTiket {
private:
    Gerbong* kepala;
    Gerbong* ekor;

public:
    QueueTiket() : kepala(nullptr), ekor(nullptr) {}

    void enqueue(const string& nama, int harga) {
        Gerbong* gerbongBaru = new Gerbong(nama, harga);
        if (ekor == nullptr) {
            kepala = ekor = gerbongBaru;
        } else {
            ekor->selanjutnya = gerbongBaru;
            ekor = gerbongBaru;
        }
        cout << "Tiket " << nama << " berhasil ditambahkan." << endl;
    }

    void dequeue() {
        if (kepala == nullptr) {
            cout << "Queue kosong! Tidak ada tiket untuk dihapus." << endl;
            return;
        }
        Gerbong* gerbongDihapus = kepala;
        kepala = kepala->selanjutnya;

        if (kepala == nullptr) {
            ekor = nullptr;
        }

        cout << "Tiket " << gerbongDihapus->kodetiket << " berhasil dihapus." << endl;
        delete gerbongDihapus;
    }

    void tampilkan() {
        Gerbong* sementara = kepala;
        if (sementara == nullptr) {
            cout << "Tidak ada tiket dalam antrian." << endl;
            return;
        }
        while (sementara != nullptr) {
            cout << "Nama Tiket: " << sementara->kodetiket << ", Harga: " << sementara->hargatiket << endl;
            sementara = sementara->selanjutnya;
        }
    }

    ~QueueTiket() {
        while (kepala != nullptr) {
            dequeue();
        }
    }
};

int main() {
    QueueTiket toko;
    string nama;
    int harga;
    int pilihan;

    cout << "Buana Pluto World Tour To Jakarta!!!!!!" << endl;
    cout << "=======================================" << endl;

    do {
        cout << "Menu:" << endl;
        cout << "1. Tambah Tiket" << endl;
        cout << "2. Hapus Tiket" << endl;
        cout << "3. Tampilkan Tiket" << endl;
        cout << "4. Keluar" << endl;
        cout << "Pilih opsi (1-4): ";
        cin >> pilihan;

        switch (pilihan) {
            case 1:
                cout << "Masukkan Kode Tiket: ";
                cin >> nama;
                cout << "Masukkan Harga Tiket: ";
                cin >> harga;
                toko.enqueue(nama, harga);
                break;

            case 2:
                toko.dequeue();
                break;

            case 3:
                cout << "Daftar Tiket yang tersedia:" << endl;
                cout << "=======================================" << endl;
                toko.tampilkan();
                break;

            case 4:
                cout << "Terima kasih! Program selesai." << endl;
                break;

            default:
                cout << "Pilihan tidak valid, silakan pilih lagi." << endl;
        }

        cout << "=======================================" << endl;

    } while (pilihan != 4);

    return 0;
}
