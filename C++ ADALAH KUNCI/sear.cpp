#include<iostream>
#include<string>
using namespace std;

struct gaji {
 string nama;
 int total;
 int ratej;
 int jk;
 
 int input(){
 cin>>nama;
  cin>>ratej;
  cin>>jk;
  return ratej;
  return jk;
  }
int penghitungangaji ()
{
  return ratej*jk;}
  
  void outputgaji(){
  cout<<total;}
  };

vv 
{ gaji a;
  a.input();
  a.total = a.penghitungangaji();
  a.outputgaji();
}