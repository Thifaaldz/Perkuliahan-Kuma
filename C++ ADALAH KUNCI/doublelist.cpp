#include <iostream>

class Node {
public:
    int data;
    Node* berikutnya;
    Node* sebelumnya;

    Node(int nilai) : data(nilai), berikutnya(nullptr), sebelumnya(nullptr) {}
};

class DaftarTautanGanda {
private:
    Node* kepala;
    Node* ekor;

public:
    DaftarTautanGanda() : kepala(nullptr), ekor(nullptr) {}

   
    void tambahkanDiAkhir(int data) {
        Node* nodeBaru = new Node(data);
        if (ekor == nullptr) {
            kepala = ekor = nodeBaru;
        } else {
            ekor->berikutnya = nodeBaru;
            nodeBaru->sebelumnya = ekor;
            ekor = nodeBaru;
        }
    }

    void tambahkanDiAwal(int data) {
        Node* nodeBaru = new Node(data);
        if (kepala == nullptr) {
            kepala = ekor = nodeBaru;
        } else {
            kepala->sebelumnya = nodeBaru;
            nodeBaru->berikutnya = kepala;
            kepala = nodeBaru;
        }
    }

  
    void tampilkanMaju() {
        Node* sementara = kepala;
        while (sementara != nullptr) {
            std::cout << sementara->data << " ";
            sementara = sementara->berikutnya;
        }
        std::cout << std::endl;
    }
    
    void tampilkanMundur() {
        Node* sementara = ekor;
        while (sementara != nullptr) {
            std::cout << sementara->data << " ";
            sementara = sementara->sebelumnya;
        }
        std::cout << std::endl;
    }

    void hapusNode(int kunci) {
        Node* sementara = kepala;

        while (sementara != nullptr && sementara->data != kunci) {
            sementara = sementara->berikutnya;
        }

        if (sementara == nullptr) {
            std::cout << "Node tidak ditemukan" << std::endl;
            return;
        }

        if (sementara->sebelumnya != nullptr) {
            sementara->sebelumnya->berikutnya = sementara->berikutnya;
        } else {
            kepala = sementara->berikutnya;
        }

        if (sementara->berikutnya != nullptr) {
            sementara->berikutnya->sebelumnya = sementara->sebelumnya;
        } else {
            ekor = sementara->sebelumnya;
        }

        delete sementara;
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
    DaftarTautanGanda dtg;
    dtg.tambahkanDiAkhir(10);
    dtg.tambahkanDiAkhir(20);
    dtg.tambahkanDiAkhir(30);
    dtg.tambahkanDiAwal(5);

    std::cout << "Daftar ditampilkan maju: ";
    dtg.tampilkanMaju(); 

    std::cout << "Daftar ditampilkan mundur: ";
    dtg.tampilkanMundur(); 

    dtg.hapusNode(10);
    std::cout << "Daftar setelah menghapus 20: ";
    dtg.tampilkanMaju(); 

    return 0;
}