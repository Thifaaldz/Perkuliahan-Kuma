saldo_awal = int(input("masukan saldo kamu: "))
deposit = int(input("mau deposit berapa? "))
hutang = 200000
bayar_hutang = ""

saldo_akhir = (saldo_awal + deposit - hutang)

if saldo_akhir >= hutang:
    bayar_hutang = "transaksi anda berhasil"
else: 
    bayar_hutang = "saldo anda kurang:("

print(saldo_akhir,bayar_hutang)