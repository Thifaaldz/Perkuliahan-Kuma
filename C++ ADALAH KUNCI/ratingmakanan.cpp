#include <iostream>
#include <string>
using namespace std;

int main ()
{
    string res;
    struct restaurant
    {
        float pelayanan,ketepatanwaktu,kebersihan,citrarasa,skor=0,keseluruhan;
        char rating;
    };
    restaurant a[10];
    cout<<"Masukan tempat anda makan =";cin>>res;
    for (int i = 0; i < 10; i++)
    {
    cout<<"Masukan nilai untuk pelayanan 1/5 =";cin>>a[i].pelayanan;
    cout<<"Masukan nilai untuk ketepatan waktu 1/5 =";cin>>a[i].ketepatanwaktu;
    cout<<"Masukan nilai untuk kebersihan restaurant 1/5 =";cin>>a[i].kebersihan;
    cout<<"Masukan nilai untuk citra rasa makanan 1/5 =";cin>>a[i].citrarasa;
    a[i].skor=(a[i].pelayanan+a[i].ketepatanwaktu+a[i].kebersihan+a[i].citrarasa)/4;
    cout<<"Nama restaurant"<<res<<endl;
    cout<<"rating ="<<a[i].skor<<endl;
}
}