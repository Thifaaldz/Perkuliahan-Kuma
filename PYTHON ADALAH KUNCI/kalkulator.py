
def tambah(x, y):
    return x + y


def kurang(x, y):
    return x - y

def kali(x, y):
    return x * y

def bagi(x, y):
    if y == 0:
        return "Tidak dapat membagi dengan nol"
    return x / y

print("Thifaaldz_:")
print("MAU APA:")
print("1. +")
print("2. -")
print("3. x")
print("4. :")


pilihan = input("pilih (1/2/3/4): ")


angkapertama = float(input("angka 1: "))
angkakedua = float(input("angka 2: "))


if pilihan == '1':
    print(f"Hasil: {tambah(angkapertama, angkakedua)}")
elif pilihan == '2':
    print(f"Hasil: {kurang(angkapertama, angkakedua)}")
elif pilihan == '3':
    print(f"Hasil: {kali(angkapertama, angkakedua)}")
elif pilihan == '4':
    print(f"Hasil: {bagi(angkapertama, angkakedua)}")
else:
    print("salah.")
