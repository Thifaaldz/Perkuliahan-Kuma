#include<iostream>
#include<string>
using namespace std;

struct gaji {
 string nama;
 int total;
 int ratej;
 int jk;
 
 int input(){
 cout<<"Masukan Nama Anda =";cin>>nama;
 cout<<"Masukan Rate Perjam = ";cin>>ratej;
 cout<<"Masukan Jam Kerja =" ;cin>>jk;
  return ratej;
  return jk;
  }
int penghitungangaji ()
{
  return ratej*jk;}
  
  void outputgaji(){
  cout<<total;}
  };

int main()
{ gaji a;
  a.input();
  a.total = a.penghitungangaji();
  a.outputgaji();
}