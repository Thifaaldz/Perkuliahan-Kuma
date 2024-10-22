#include <iostream>
#include <string>

using namespace std;

struct tokolaptop {
  string jenislaptop;
  double hargalaptop;
};

int main() {
 
  tokolaptop* laptop[10];

  
  for (int i = 0; i < 10; i++) {
    laptop[i] = new tokolaptop;
    laptop[i]->jenislaptop = "Laptop " + to_string(i + 1);
    laptop[i]->hargalaptop = (10 + i ) ;
  }

  
  cout << "Daftar Laptop di Thifaaldzaki adalah:\n";
  for (int i = 0; i < 10; i++) {
    cout << i + 1 << ". " << laptop[i]->jenislaptop << " (Harga: Rp." << laptop[i]->hargalaptop  << " Juta)" << endl;
  }

  
  for (int i = 0; i < 10; i++) {
    delete laptop[i];
  }

  return 0;
}