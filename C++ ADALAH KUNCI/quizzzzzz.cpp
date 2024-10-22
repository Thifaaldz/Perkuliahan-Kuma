#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main ()
{
    int bahasaruby=0,bahasac=0,bahasajava=0,bahasamysql=0;
    struct kursus
    {
        string murid;
        float harga,pilihan1=0,pilihan2=0,pilihan3=0,pilihan4=0;
        char pilihankursus;
        char rating;
    };
    kursus a[10];
    for ( int i = 0; i < 10; i++)
    {
        cout<<"HALOOO!!! SELAMAT DATANG DI STUDY STATION!!!"<<endl;
        cout<<"Masukan nama anda =";cin>>a[i].murid;
        cout<<"PILIH BAHASA KURSUS YANG ANDA MAU"<<endl;
        cout<<"1.Bahasa Ruby"<<endl;
        cout<<"2.Bahasa c++"<<endl;
        cout<<"3.Bahasa Javascript"<<endl;
        cout<<"4.Bahasa Mysql"<<endl;
        cout<<"Masukan Pilihan anda =";cin>>a[i].pilihankursus;
    if (a[i].pilihankursus == '1')
    {
        cout<<"Anda Mengikuti Bahasa Pemrograman Ruby!"<<endl;
        a[i].harga = 100000;
        a[i].pilihan1 = + 1 ;
        cout<<"Dengan Harga ="<<a[i].harga<<endl;
    }
    else if (a[i].pilihankursus == '2')
    {
        cout<<"Anda Mengikuti Bahasa Pemrograman C++!"<<endl;
        a[i].harga = 500000;
        a[i].pilihan2 = + 1 ;
        cout<<"Dengan Harga ="<<a[i].harga<<endl;
    }
    else if (a[i].pilihankursus == '3')
    {
        cout<<"Anda Mengikuti Bahasa Pemrograman Java Script!"<<endl;
        a[i].harga = 600000;
        a[i].pilihan3 = + 1 ;
        cout<<"Dengan Harga ="<<a[i].harga<<endl;
    }
    else if (a[i].pilihankursus == '4')
    {
        cout<<"Anda Mengikuti Bahasa Pemrograman MySQL!"<<endl;
        a[i].harga = 900000;
        a[i].pilihan4 = + 1 ;
        cout<<"Dengan Harga ="<<a[i].harga<<endl;
    }
    else
    {
        cout<<"kursus tidak ditemukan"<<endl;
    }
    }
    for ( int i = 0; i < 10; i++)
    {
      bahasaruby += a[i].pilihan1;
      bahasac += a[i].pilihan2;
      bahasajava += a[i].pilihan3;
      bahasamysql += a[i].pilihan4;  
    }
    cout<<"Yang Mengikuti Bahasa Pemrograman Ruby adalah ="<<bahasaruby<<endl;
    cout<<"Yang Mengikuti Bahasa Pemrograman c++ adalah ="<<bahasac<<endl;
    cout<<"Yang Mengikuti Bahasa Pemrograman Java script adalah ="<<bahasajava<<endl;
    cout<<"Yang Mengikuti Bahasa Pemrograman Mysql adalah ="<<bahasamysql<<endl;
}