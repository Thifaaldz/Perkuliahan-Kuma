#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main ()
{
    int a[10],b[10]={11,22,33,44,55,66,77,88,99,100},c[10];
    float jumlah=0;
    float average;
    float nilaiterbesar=0,nilaiterkecil=0;
    int mencarinilai;

        for (int i = 0; i < 10; i++)
        {
            cout<<"Masukan Nilai a"<<i<<" = ";cin>>a[i];
            c[i] = a[i] + b [i];
            jumlah += a [i];
            average =jumlah/10;
        }
        for (int i = 0; i < 10; i++)
        {
            if (c[i] >= nilaiterbesar)
            {
                {nilaiterbesar=c[i];}
            }
            if (b[i] <= nilaiterkecil)
            {
               {nilaiterkecil=b[i];}
            }
        }
    for (int i = 0; i < 10; i++)
    {
        cout<<"Hasil Dari c = "<<i<<"="<<c[i]<<endl;
    }
        cout<<"Average ="<<average;
        cout<<"hasil terkecil ="<<nilaiterkecil<<endl;
        cout<<"hasil terbesar ="<<nilaiterbesar<<endl;
    
    cout<<"Masukan nilai yang ingin anda cari =";cin>>mencarinilai;
    for(int i=0;i<10;i++)
    {
        if (mencarinilai==a[i])
        {
            cout<<"Nilai Ditemukan a ="<<i<<endl;
        }
        else 
        {
            cout<<"Nilai tidak ditemukan"<<endl;
        }
        
    }
}