#include <iostream>
#include <vector>
#include <string>
using namespace std;

struct pengunjung {
  string nama;
  string tanggalMasuk;
  string tanggalKeluar;
  int jumlahOrang;
  char tipeKamar;
};

void inputPengunjung(pengunjung *a) {
  cout << "Masukan Nama Anda: ";
  cin >> a->nama;

  cout << "Masukan Tanggal Masuk: ";
  cin >> a->tanggalMasuk;

  cout << "Masukan Tanggal Keluar";
  cin >> a->tanggalKeluar;

  cout << "Pilih Tipe Kamar (1 : single 2 : Double 3 : Suite)";
  cin >> a->tipeKamar;
}

void cetakpengjunjung(pengunjung *a) {
  cout << "Nama: " << a->nama << endl;
  cout << "Tanggal Masuk: " << a->tanggalMasuk << endl;
  cout << "Tanggal Keluar : " << a->tanggalKeluar << endl;

  if ( a->tipeKamar =='1')
  {
    cout<<"Memilih Tipe Single Dengan Harga 5.000.000"<<endl;
  }
  else if (a->tipeKamar=='2')
  {
    cout<<"Memilih Tipe Double Dengan Harga 7.000.000"<<endl;
  }
  else if (a->tipeKamar=='3')
  {
    cout<<"Memilih Tipe Suite Dengan Harga 10.000.000"<<endl;
  }
  else 
  {
    cout<<"Pilihan Kamar Tidak Ada"<<endl;
  }

  cout << endl;
}

int main() {
  pengunjung a;

  inputPengunjung(&a);
  cetakpengjunjung(&a);

  return 0;
}