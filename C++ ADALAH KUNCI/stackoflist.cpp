#include <iostream>
#include <list>

using namespace std;

struct Computer {
  string processor, windows;
  double harga;
};

class StackComputer {
private:
  list<Computer> computers;

public:
  void push(const Computer& c) { computers.push_front(c); }
  Computer pop() {
    if (computers.empty()) return Computer{"", "", 0};
    Computer c = computers.front();
    computers.pop_front();
    return c;
  }
  Computer peek() { if (computers.empty()) return Computer{"", "", 0}; return computers.front(); }
  bool empty() { return computers.empty();}

  void display() {
    for (const Computer& c : computers) cout << c.processor << '\n' << c.windows << '\n' << c.harga << " juta\n\n";
  }
};

int main() {
  StackComputer stack;
  stack.push({"Intel Pentium Gold", "WinXP", 7.5});
  stack.push({"AMD Ryzen 3", "WinVista", 9});
  stack.push({"Apple M1", "macOS", 12});
  stack.display();
  return 0;
}