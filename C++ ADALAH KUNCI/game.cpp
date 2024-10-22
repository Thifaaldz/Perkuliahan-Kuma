#include <iostream>
#include <vector>
#include <string>
using namespace std;

struct game {
  string nama;
  int harga;
  };
int hitungTotal(game game[], int a) {
  int total = 0;
  for (int i = 0; i < a; i++) {
    total += game[i].harga ;
  }
  return total;
  }
void tampilkandata(game game[], int a) {
  cout << "Harga Keseluruhan Game:" << endl;
  for (int i = 0; i < a; i++) {
    cout << game[i].nama  << " = " << game[i].harga  << endl;
  }
  cout << "Total: " << hitungTotal(game, a) << endl;
}
int main() {
  game game[30]; 
  int a = 0; 

  while (true) {
    cout << "Masukkan nama game: ";
    string nama;
    cin >> nama;
    if (nama == "selesai") {
      break;
    }
    cout << "Masukkan harga : ";
    int harga;
    cin >> harga;
    game[a] = {nama, harga};
    a++;
  }
  tampilkandata(game, a);
  return 0;
}