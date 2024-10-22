#include <iostream>
#include <string>
using namespace std;
int main()
 {
     struct tokobuah{
     string nama;
     string jb;
    int jmlb;
    double hb,jmlk;
     };
  tokobuah t[5];
  for(int i=0;i<5;i++)
  {
  cout<<" masukan nama anda : ";cin>>t[i].nama;
  cout<<" masukan jenis buah : ";cin>>t[i].jb;
  cout<<" masukan jumlah buah : ";cin>>t[i].jmlb;
  cout<<" masukan harga buah : ";cin>>t[i].hb;
 t[i].jmlk = t[i].hb * t[i].jmlb;
  cout<<" cetak harga : "<<t[i].jmlk;
}

}