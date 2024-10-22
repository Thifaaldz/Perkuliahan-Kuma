#include <iostream>
#include <string>
using namespace std;

struct Kubus {
  int sisi;
  int volume;

  int input() {
    cout << "Masukkan sisi kubus: ";
    cin >> sisi;
    return sisi;
  }

  int proses() {
    return sisi * sisi * sisi;
  }

  void output() {
    cout << "Volume kubus: " << volume << endl;
  }
};

int main() {
  Kubus kubus; 
  kubus.input();
  kubus.volume = kubus.proses();
  kubus.output();
  return 0;
}