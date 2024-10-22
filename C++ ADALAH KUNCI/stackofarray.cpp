#include <iostream>
#include <stack>

using namespace std;

int main() {
  stack<string> laptop[3]; 
  laptop[0].push("Asus ROG Strix G");
  laptop[0].push("Acer Nitro V15");
  laptop[0].push("Victus");

  laptop[1].push("Intel i7,RAM 8,GeForce RTX 2070");
  laptop[1].push("Intel i5,RAM 8,GeForce RTX 2050");
  laptop[1].push("Intel i5,RAM 8,GeForce RTX 4060");

  laptop[2].push("12JT");
  laptop[2].push("14JT");
  laptop[2].push("17JT");
  
  cout << "Daftar Harga Laptop Thifaaldz:" << endl;
  while (!laptop[0].empty()) {
    cout << " - " << laptop[0].top() <<" Spesifikasi = "<< laptop[1].top() <<" dengan harga ="<< laptop[2].top()<< endl;
    laptop[0].pop();
    laptop[1].pop();
  }

  return 0;
}
