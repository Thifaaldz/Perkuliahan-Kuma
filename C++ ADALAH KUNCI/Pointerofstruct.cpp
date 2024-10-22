
#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct Mobil {
  string merek;
  int harga;
  float pajak;
};

void penghitunganakhirmobil(Mobil *mobil, float *hargamobil) {
  int pajakmobil = mobil->harga * mobil->pajak /100;
  *hargamobil = mobil->harga + pajakmobil ;
}

int main() {
  Mobil mobil;

  cout << "Masukkan merek mobil: ";
  getline(cin, mobil.merek);

  cout << "Masukkan harga dasar mobil : ";
  cin >> mobil.harga;

  cout << "Masukkan persentase pajak mobil : ";
  cin >> mobil.pajak;


  float hargamobil;
  penghitunganakhirmobil(&mobil, &hargamobil);


  cout << "\nDetail Pembelian Mobil:\n";
  cout << "Merek: " << mobil.merek << endl;
  cout << "Harga Dasar : " << mobil.harga<< endl;
  cout << "Pajak : " << mobil.pajak << "%" << endl;
  cout << "Total yang di bayarkan : " << hargamobil << endl;

  return 0;
}