#include <iostream>
#include <iomanip>
using namespace std;

int main() {
  int jumlahk;
  int gajik;
struct karyawan {
 string namakaryawan;
 int nikkarywan,rateperjamkaryawan,jamkerjakaryawan,golongangajikaryawan,gajipernikahan=0;
 char pernikahankaryawan,golongankaryawan;
 int gajikeseluruhankaryawan=0;
  };
  karyawan a[10];
    cout<<"Jumlah Karyawan = ";cin>>jumlahk;
    
  for (int i = 0; i < jumlahk; i++) {
    cout << "Nama Karyawan = ";
    cin >> a[i].namakaryawan;
    cout<<"Nomor NIK =";
    cin>>a[i].nikkarywan;
    cout << "Masukan Rate Per-Jam = ";
    cin >> a[i].rateperjamkaryawan;
    cout<<"Masukan Jam Kerja = ";
    cin>> a[i].jamkerjakaryawan;
     cout<<"masukan golongan anda 1/2/3 =";
    cin>>a[i].golongankaryawan;
    cout << "Status pernikahan Y/T = ";
    cin >> a[i].pernikahankaryawan;
  }
  for (int i = 0; i < jumlahk; i++) {
   if(a[i].golongankaryawan == '1')
    {
        a[i].golongangajikaryawan =5000000;}
    else if (a[i].golongankaryawan == '2')
    {
        a[i].golongangajikaryawan =4000000;}
    else if (a[i].golongankaryawan == '3')
    {
        a[i].golongangajikaryawan =3000000;}
    else {
        cout<<"golongan yang adan cari tidak tersedia"<<endl;}
  }
for (int i = 0; i < jumlahk; i++)
  {
  if(a[i].pernikahankaryawan == 'Y')
    {
        a[i].gajipernikahan =2000000;
        }
    else if (a[i].pernikahankaryawan == 'T')
    {
        a[i].gajipernikahan =1000000;
       }
  } 
 for (int i = 0; i < jumlahk; i++)
{
  a[i].gajikeseluruhankaryawan = a[i].golongangajikaryawan+a[i].gajipernikahan+a[i].jamkerjakaryawan*a[i].rateperjamkaryawan; 
}
 cout<<"\n";
 cout<<"|No|           Nama           |   NIK   |  golongan | status pernikahan | Bonus Pernikahan  |  Gaji Pokok   |  Rate perjam  |  Jam Kerja  |  Gaji Total  |\n";
 cout<<"\n";
  for(int i=0;i<jumlahk;i++){
  cout<<"|"<<setiosflags(ios::left)<<setw(2)<<i+1<<"|";
   cout<<" "<<setiosflags(ios::left)<<setw(25)<<a[i].namakaryawan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(7)<<a[i].nikkarywan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(11)<<a[i].golongankaryawan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(19)<<a[i].pernikahankaryawan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(19)<<a[i].gajipernikahan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(15)<<a[i].golongangajikaryawan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(14)<<a[i].rateperjamkaryawan<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(13)<<a[i].jamkerjakaryawan<<"|"<<endl;
  }
  for (int i = 0; i < 5; i++)
  {
    gajik =a[i].gajikeseluruhankaryawan;
  }
   cout<<"Gaji Keseluruhan Karyawan= "<<gajik;
}
