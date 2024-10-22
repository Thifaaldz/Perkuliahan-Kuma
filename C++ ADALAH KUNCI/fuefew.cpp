#include <iostream>
#include <string>
using namespace std;

class Node {
public:
    string kodetiket;
    int hargatiket;
    Node* selanjutnya;

    Node(const string& nama, int harga)
        : kodetiket(nama), hargatiket(harga), selanjutnya(nullptr) {}
};

class QueueTiket {
private:
    Node* kepala;
    Node* ekor;

public:
    QueueTiket() : kepala(nullptr), ekor(nullptr) {}

    // Menambahkan tiket ke antrian
    void enqueue(const string& nama, int harga) {
        Node* nodeBaru = new Node(nama, harga);
        if (ekor == nullptr) {
            kepala = ekor = nodeBaru;
        } else {
            ekor->selanjutnya = nodeBaru;
            ekor = nodeBaru;
        }
        cout << "Tiket " << nama << " berhasil ditambahkan." << endl;
    }

    // Menghapus tiket dari antrian
    void dequeue() {
        if (kepala == nullptr) {
            cout << "Queue kosong! Tidak ada tiket untuk dihapus." << endl;
            return;
        }
        Node* nodeDihapus = kepala;
        kepala = kepala->selanjutnya;

        if (kepala == nullptr) {
            ekor = nullptr;
        }

        cout << "Tiket " << nodeDihapus->kodetiket << " berhasil dihapus." << endl;
        delete nodeDihapus;
    }

    // Menampilkan semua tiket dalam antrian
    void tampilkan() {
        Node* sementara = kepala;
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
    char lanjut;

    cout << "Buana Pluto World Tour To Jakarta!!!!!!" << endl;
    cout << "=======================================" << endl;

    do {
        cout << "Masukkan Kode Tiket: ";
        cin >> nama;
        cout << "Masukkan Harga Tiket: ";
        cin >> harga;
        toko.enqueue(nama, harga);

        cout << "Apakah Anda ingin menambahkan tiket lagi? (y/n): ";
        cin >> lanjut;

        cout << "Daftar Tiket yang tersedia:" << endl;
        cout << "=======================================" << endl;
        toko.tampilkan();
        cout << "=======================================" << endl;

    } while (lanjut == 'y' || lanjut == 'Y');

    // Menghapus tiket sesuai FIFO
    cout << "Menghapus tiket sesuai urutan FIFO..." << endl;
    toko.dequeue(); // Menghapus tiket paling depan
    toko.dequeue(); // Menghapus tiket berikutnya

    cout << "Daftar Tiket Yang Tersisa :" << endl;
    cout << "=======================================" << endl;
    toko.tampilkan();

    return 0;
}
