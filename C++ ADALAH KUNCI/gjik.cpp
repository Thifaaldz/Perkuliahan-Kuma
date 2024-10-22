#include <iostream>
#include <iomanip>
using namespace std;

int main() {
  string nk[50];
  int jk[50];
  float rp[100];
  int gaji[100];
  int jks;
  int nb = 0;
  int nt = INT_MAX;
  int total=0;
 
    cout<<"Jumlah Karyawan = ";cin>>jks;
    
  for (int i = 0; i < jks; i++) {
    cout << "Nama Karyawan = ";
    cin >> nk[i];
    cout << "Banyak Jam Kerja = ";
    cin >> jk[i];
    cout << "Masukan Rate Per-Jam = ";
    cin >> rp[i];
  }

  for (int i = 0; i < jks; i++) {
    if (jk[i] <= 40) {
      gaji[i] = jk[i]*rp[i];
    } else  {
      gaji[i] = 40*rp[i]+(jk[i]-40)*1.5*rp[i];
    }
  }
  for (int i = 0; i < jks; i++) {
   
    if (gaji[i] > nb) {
      nb = gaji[i];
    }

    if (gaji[i] < nt) {
      nt = gaji[i];
    }
  }
 for (int i = 0; i < jks; i++){
   total += gaji[i];}

   cout<<"Tabel By Thifaaldzaki:\n";
 cout<<"\n";
 cout<<"|No|           Nama           | Jam Kerja | Rate Per Jam |  Total Gaji   |\n";
 cout<<"\n";
  for(int i=0;i<jks;i++){
  cout<<"|"<<setiosflags(ios::left)<<setw(2)<<i+1<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(25)<<nk[i]<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(10)<<jk[i]<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(13)<<rp[i]<<"|";
  cout<<" "<<setiosflags(ios::left)<<setw(14)<<gaji[i]<<"|";
  cout<<"\n__\n";
  }
  {
     cout<<"\nTotal Gaji ="<<total;
     cout<<"\nGaji Terbesar ="<<nb;
     cout<<"\nGaji Terkecil="<<nt;
}
}