#include <iostream>
using namespace std;

int main()
{
char nama [30] [30];
int gaji [30];
int jm;

cout<<"masukkan jumlah karyawan: ";
cin>>jm;

for (int i=1;i<=jm;i++){
cout<<"masukkan nama karyawan: ";
cin>>nama[i];
cout<<"masukkan gaji karyawan: ";
cin>>gaji[i];
}   
cout<<"========================="<<endl;
cout<<"tampilkan data karyawan"<<endl;
for (int i=1;i<=jm;i++){
cout<<"nama Karyawan : "<<nama[i]<<endl;
cout<<"Gaji Karyawan : " <<gaji[i]<<endl;
}
return 0;
}