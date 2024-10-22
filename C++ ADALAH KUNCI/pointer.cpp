#include <iostream> 
int main() { 
    int angka = 42; 
    int *ptr = &angka; 
    std::cout << "Nilai dari variabel angka: " << *ptr << std::endl; 
    std::cout << "Alamat memori variabel angka: " << *ptr << std::endl; 
    int arr[3] = {10, 20, 30}; 
    int *arrPtr = arr; 
    for (int i = 0; i < 3; ++i) 
    { std::cout << "Elemen ke-" << i << ": " << *(arrPtr + i) << std::endl; }
     int *dynPtr = new int; 
     *dynPtr = 200; 
     std::cout << "Nilai dari alokasi dinamis: " << *dynPtr << std::endl; 
     delete dynPtr; 
     return 0; }
