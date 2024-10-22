#include <iostream>
#include <iomanip>
#include <string>
#include <limits>
using namespace std;

// Deklarasi struktur pegawai
struct pegawai {
    string nk; // Nama pegawai
    int nik;   // Nomor NIK
    char pk;   // Status pernikahan
    double rp;    // Gaji per jam
    int jk;    // Jam kerja
    char gl;   // Golongan
    int gg;    // Gaji pokok
    int pp;    // Tunjangan pernikahan
    int gajik; // Gaji total
};

int main() {
    const int jumlahKaryawan = 4;  
    int gajikeseluruhan = 0;

   
    pegawai karyawan[jumlahKaryawan];

    for (int i = 0; i < jumlahKaryawan; i++) {
        cout << "Data Karyawan ke-" << i + 1 << ":\n";

        cout << "Nama Karyawan: ";
        cin.ignore(); // Membersihkan buffer input sebelum menggunakan getline
        getline(cin, karyawan[i].nk); // Gunakan getline untuk nama lengkap

        cout << "Nomor NIK: ";
        cin >> karyawan[i].nik;

        cout << "Status pernikahan [Y/T]: ";
        cin >> karyawan[i].pk;
        karyawan[i].pk = toupper(karyawan[i].pk); // Ubah input menjadi huruf besar untuk pemeriksaan tanpa memperdulikan huruf besar/kecil

        // Loop validasi input untuk status pernikahan
        while (karyawan[i].pk != 'Y' && karyawan[i].pk != 'T') {
            cout << "Input tidak valid. Silahkan masukkan 'Y' (menikah) atau 'T' (belum menikah): ";
            cin.clear(); // Bersihkan status error
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Abaikan input tidak valid
            cin >> karyawan[i].pk;
            karyawan[i].pk = toupper(karyawan[i].pk);
        }

        cout << "Masukan Gaji per Jam: ";
        cin >> karyawan[i].rp;

        cout << "Masukan Jam Kerja: ";
        cin >> karyawan[i].jk;

        cout << "Masukkan Golongan Anda [1/2/3]: ";
        cin >> karyawan[i].gl;
        cout<<endl;
        // Loop validasi input untuk golongan
        while (karyawan[i].gl != '1' && karyawan[i].gl != '2' && karyawan[i].gl != '3') {
            cout << "Golongan tidak valid. Silahkan masukkan '1', '2', atau '3': ";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            cin >> karyawan[i].gl;
        }
    }

    for (int i = 0; i < jumlahKaryawan; i++) {
        if (karyawan[i].gl == '1') {
            karyawan[i].gg = 5000000;
        } else if (karyawan[i].gl == '2') {
            karyawan[i].gg = 4000000;
        } else if (karyawan[i].gl == '3') {
            karyawan[i].gg = 3000000;
        }

        if (karyawan[i].pk == 'Y') {
            karyawan[i].pp = 2000000;
        } else {
            karyawan[i].pp = 1000000;
        }

        karyawan[i].gajik = karyawan[i].gg + karyawan[i].pp + karyawan[i].jk * karyawan[i].rp;
    }
     for (int i = 0; i < jumlahKaryawan; i++) {

        gajikeseluruhan  += karyawan[i].gajik;
     }
    
    cout << "\n";
    cout << "|No|" << setw(25) << left << "NIK" << setw(10) << left << "| Golongan |"
         << setw(20) << left << "Status Pernikahan" << setw(14) << left << "| Gaji Pokok |"
         << setw(14) << left << "Gaji per Jam |" << setw(14) << left << "Jam Kerja |"
         << setw(14) << left << "Gaji Total |\n";
    
    for (int i = 0; i < jumlahKaryawan; i++) {
        cout << "|" << setw(2) << left << i + 1 << "|"
             << setw(25) << left << karyawan[i].nik << "|"
             << setw(10) << left << karyawan[i].gl << "|"
             << setw(20) << left << (karyawan[i].pk == 'Y' ? "Menikah" : "Belum Menikah") << "|" // Tampilkan status yang bisa dibaca manusia
             << setw(14) << left << karyawan[i].gg << "|"
             << setw(14) << left << karyawan[i].rp << "|"
             << setw(14) << left << karyawan[i].jk << "|"
             << setw(14) << left << karyawan[i].gajik << "|\n";
    }
    cout<<"Total Gaji ="<<gajikeseluruhan;
return 0;
}