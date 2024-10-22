#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main ()
{
    int jumlahcs;
    struct mobil
    {
        string cs;
        float harga;
        char pilihanmobil;
    };
 mobil a[5];
 cout<<"Masukan Jumlah Input customer =";cin>>jumlahcs;
    for(int i=0;i<jumlahcs;i++)
    {
        cout<<"Masukan Nama Anda =";cin>>a[i].cs;
        cout<<"Masukan Pilihan =";cin>>a[i].pilihanmobil;
    if(a[i].pilihanmobil == '1')
    {
        cout<<"Anda menyewa mobil GTR skyline"<<endl;
        a[i].harga =10000;
        cout<<"Dengan Harga ="<<a[i].harga<<endl;}
    else if (a[i].pilihanmobil == '2')
    {
        cout<<"Anda menyewa mobil Mazda MX5"<<endl;
        a[i].harga =20000;
        cout<<"dengan harga ="<<a[i].harga<<endl;}
    else if (a[i].pilihanmobil == '3')
    {
        cout<<"Anda menyewa mobil Pagani"<<endl;
        a[i].harga =40000;
        cout<<"dengan harga ="<<a[i].harga<<endl;}
        
    else if (a[i].pilihanmobil == '4')
    {
        cout<<"Anda menyewa mobil Supra MK4"<<endl;
        a[i].harga =50000;
        cout<<"dengan harga ="<<a[i].harga<<endl;}
    else {
        cout<<"Mobil yang adan cari tidak tersedia"<<endl;
    }
    }
}
