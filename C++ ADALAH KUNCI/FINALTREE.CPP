#include <iostream>
#include <string>
using namespace std;

class Node {
public:
    string kodetiket;
    int hargatiket;
    Node* kiri;
    Node* kanan;

    Node(const string& nama, double hargatiket) 
        : kodetiket(nama), hargatiket(hargatiket), kiri(nullptr), kanan(nullptr) {}
};

class BinaryTree {
private:
    Node* root;

    void tambah(Node*& node, const string& nama, double harga) {
        if (node == nullptr) {
            node = new Node(nama, harga);
        } else if (nama < node->kodetiket) {
            tambah(node->kiri, nama, harga);
        } else {
            tambah(node->kanan, nama, harga);
        }
    }

    void tampilkan(Node* node) {
        if (node != nullptr) {
            tampilkan(node->kiri);
            cout << "Nama Tiket: " << node->kodetiket << ", Harga: " << node->hargatiket << endl;
            tampilkan(node->kanan);
        }
    }
    Node* cari(Node* node, const string& nama) {
        if (node == nullptr || node->kodetiket == nama) {
            return node;
        } else if (nama < node->kodetiket) {
            return cari(node->kiri, nama);
        } else {
            return cari(node->kanan, nama);
        }
    }

    Node* hapus(Node* node, const string& nama) {
        if (node == nullptr) return node;

        if (nama < node->kodetiket) {
            node->kiri = hapus(node->kiri, nama);
        } else if (nama > node->kodetiket) {
            node->kanan = hapus(node->kanan, nama);
        } else {
            if (node->kiri == nullptr) {
                Node* temp = node->kanan;
                delete node;
                return temp;
            } else if (node->kanan == nullptr) {
                Node* temp = node->kiri;
                delete node;
                return temp;
            }

            Node* temp = cariMinimum(node->kanan);
            node->kodetiket = temp->kodetiket;
            node->hargatiket = temp->hargatiket;
            node->kanan = hapus(node->kanan, temp->kodetiket);
        }
        return node;
    }
    Node* cariMinimum(Node* node) {
        Node* current = node;
        while (current && current->kiri != nullptr) {
            current = current->kiri;
        }
        return current;
    }

    void bersihkan(Node* node) {
        if (node != nullptr) {
            bersihkan(node->kiri);
            bersihkan(node->kanan);
            delete node;
        }
    }

public:
    BinaryTree() : root(nullptr) {}

    void tambahTiket(const string& nama, double harga) {
        tambah(root, nama, harga);
    }

    void tampilkanTiket() {
        tampilkan(root);
    }

    Node* cariTiket(const string& nama) {
        return cari(root, nama);
    }

    void hapusTiket(const string& nama) {
        root = hapus(root, nama);
    }

    ~BinaryTree() {
        bersihkan(root);
    }
};

int main() {
    BinaryTree toko;
    cout << "Buana Pluto World Tour To Jakarta!!!!!!" << endl;
    cout << "=======================================" << endl;

    toko.tambahTiket("VIP1", 10000000);
    toko.tambahTiket("VIP2", 10000000);
    toko.tambahTiket("VIP3", 10000000);
    toko.tambahTiket("REGULAR1", 500000);
    toko.tambahTiket("REGULAR2", 500000);
    toko.tambahTiket("REGULAR3", 500000);
    toko.tambahTiket("LESEHAN1", 300000);
    toko.tambahTiket("LESEHAN2", 300000);
    toko.tambahTiket("LESEHAN3", 300000);

    cout << "Daftar Tiket yang tersedia:" << endl;
    cout << "=======================================" << endl;
    toko.tampilkanTiket();  
    
    string cariNama;
    cout << "Masukan Kategori Tiket yang ingin anda beli: ";
    cin >> cariNama;
    
    Node* hasil = toko.cariTiket(cariNama);
    if (hasil != nullptr) {
        cout << "Tiket ditemukan: " << hasil->kodetiket << ", Harga: " << hasil->hargatiket << endl;
    } else {
        cout << "Tiket dengan nama " << cariNama << " tidak ditemukan." << endl;
    }

    cout << "=======================================" << endl;
    toko.hapusTiket(cariNama);
    cout << "Daftar Tiket Yang Tersisa:" << endl;
    cout << "=======================================" << endl;
    toko.tampilkanTiket();

    return 0;
}