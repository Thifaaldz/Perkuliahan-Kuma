CREATE DATABASE uts_TetapSegarMarttt;
USE uts_TetapSegarMarttt;
drop database uts_TetapSegarMarttt;

CREATE TABLE pelanggan_member (
    id_member INT PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255),	
    member_expired date,
    level_diskon DECIMAL(5, 2)  
);


CREATE TABLE pelanggan_NonMember (
    id_nonmember INT PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255)
);


CREATE TABLE Supliyer (
    id_Supliyer INT PRIMARY KEY,
    nama VARCHAR(100),
    kontak VARCHAR(50)
);

create table karyawan(
id_karyawan INT PRIMARY KEY,
nama_karyawan VARCHAR(100),
nomor_telepon varchar(100)not null,
status_karyawan enum('administrasi', 'sales', 'kasir')
);


CREATE TABLE Barang (
    id_barang INT PRIMARY KEY,
    nama_barang VARCHAR(100),
    harga DECIMAL(10, 2),
    stok INT,
	kategori_barang ENUM('Elektronik', 'Furniture'),
	id_Supliyer INT,
    FOREIGN KEY ( id_Supliyer) REFERENCES  Supliyer(id_Supliyer)
);

CREATE TABLE Penjualan (
    id_penjualan INT PRIMARY KEY,
    nama varchar (100),
    id_member INT UNIQUE,
    id_nonmember INT UNIQUE,
	id_barang INT,
    total_harga DECIMAL(15, 2),
    diskon DECIMAL(5, 2),
    jumlah INT,
    metode ENUM('Lunas', 'Kredit'),
    tanggal DATE,
    id_karyawan int,
    FOREIGN KEY (id_member) REFERENCES pelanggan_Member(id_member),
    FOREIGN KEY (id_nonmember) REFERENCES pelanggan_NonMember(id_nonmember),
    FOREIGN KEY (id_barang) REFERENCES Barang(id_barang),
    FOREIGN KEY ( id_karyawan) REFERENCES  karyawan (id_karyawan)
);

create table transaksi_pembelian(
id_transaksi_pembelian INT PRIMARY KEY,
tanggal_pembelian date,
harga_barang decimal(15,2),
id_barang int,
id_supliyer int,
FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
FOREIGN KEY (id_supliyer) REFERENCES supliyer(id_supliyer)
);

INSERT INTO pelanggan_member (id_member, nama, alamat, level_diskon, member_expired)
VALUES
(1, 'John Doe', 'Jl. Merdeka No. 10', 2.5, '2024-9-07 '),
(2, 'Jane Smith', 'Jl. Kemerdekaan No. 5', 3,'2024-12-07'),
(3, 'Alice Johnson', 'Jl. Sudirman No. 8', 2,'2024-12-07'),
(4, 'Michael Brown', 'Jl. Raya No. 20', 4,'2024-12-07'),
(5, 'Emily White', 'Jl. Sejahtera No. 15', 3.5,'2024-12-07'),
(6, 'Chris Green', 'Jl. Rawa No. 3', 2.5,'2024-12-07'),
(7, 'Jessica Black', 'Jl. Pantai No. 9', 2,'2024-12-07'),
(8, 'Daniel Blue', 'Jl. Sutra No. 12', 3,'2024-12-07'),
(9, 'Olivia Red', 'Jl. Sumber No. 7', 2.5,'2024-12-07'),
(10, 'Sophia Yellow', 'Jl. Mawar No. 6', 3,'2024-12-07');

INSERT INTO pelanggan_NonMember (id_nonmember, nama, alamat)
VALUES
(001, 'Mark Gold', 'Jl. Pinang No. 21'),
(002, 'Linda Silver', 'Jl. Mutiara No. 16'),
(003, 'Robert Brown', 'Jl. Cendana No. 18'),
(004, 'David Blue', 'Jl. Bukit No. 22'),
(005, 'Patricia Green', 'Jl. Pahlawan No. 14'),
(006, 'Steven Gray', 'Jl. Taman No. 5'),
(007, 'Laura White', 'Jl. Merpati No. 3'),
(008, 'Paul Black', 'Jl. Raya No. 8'),
(009, 'Angela Pink', 'Jl. Kembang No. 11'),
(010, 'William Blue', 'Jl. Gemilang No. 20');

INSERT INTO Supliyer (id_Supliyer, nama, kontak)
VALUES
(1, 'ABC Electronics', '08123456789'),
(2, 'XYZ Furniture', '08234567890'),
(3, 'MNO Supplies', '08345678901'),
(4, 'PQR Home Goods', '08456789012'),
(5, 'STU Appliance', '08567890123'),
(6, 'DEF Woodworks', '08678901234'),
(7, 'GHI Electronics', '08789012345'),
(8, 'JKL Decor', '08890123456'),
(9, 'LMN Kitchenware', '08901234567'),
(10, 'OPQ Construction', '09012345678');

INSERT INTO karyawan (id_karyawan, nama_karyawan, nomor_telepon, status_karyawan)
VALUES
(1, 'Ahmad', '081234567890', 'sales'),
(2, 'Budi', '082345678901', 'kasir'),
(3, 'Charlie', '083456789012', 'administrasi'),
(4, 'David', '084567890123', 'sales'),
(5, 'Eva', '085678901234', 'kasir'),
(6, 'Fiona', '086789012345', 'administrasi'),
(7, 'George', '087890123456', 'sales'),
(8, 'Hilda', '088901234567', 'kasir'),
(9, 'Irene', '089012345678', 'sales'),
(10, 'John', '090123456789', 'administrasi');

INSERT INTO Barang (id_barang, nama_barang, harga, stok, kategori_barang, id_Supliyer)
VALUES
(1, 'Kulkas 2 Pintu', 5000000, 10, 'Elektronik', 5),
(2, 'TV 42 Inch', 4500000, 5, 'Elektronik', 1),
(3, 'Meja Makan Jati', 3500000, 8, 'Furniture', 2),
(4, 'Sofa Set', 6000000, 3, 'Furniture', 6),
(5, 'Kasur Spring Bed', 2000000, 20, 'Furniture', 3),
(6, 'Lampu LED', 500000, 15, 'Elektronik', 7),
(7, 'Mesin Cuci', 3000000, 12, 'Elektronik', 4),
(8, 'Lemari Pakaian', 2500000, 10, 'Furniture', 5),
(9, 'Kursi Tamu', 1200000, 18, 'Furniture', 8),
(10, 'Blender', 400000, 30, 'Elektronik', 9);


INSERT INTO transaksi_pembelian (id_transaksi_pembelian, tanggal_pembelian, harga_barang, id_barang, id_supliyer)
VALUES
(1, '2024-11-01', 5000000, 1, 5),
(2, '2024-11-02', 4500000, 2, 1),
(3, '2024-11-03', 3500000, 3, 2),
(4, '2024-11-04', 6000000, 4, 6),
(5, '2024-11-05', 2000000, 5, 3),
(6, '2024-11-06', 500000, 6, 7),
(7, '2024-11-07', 3000000, 7, 4),
(8, '2024-11-08', 2500000, 8, 5),
(9, '2024-11-09', 1200000, 9, 8),
(10, '2024-11-10', 400000, 10, 9);

INSERT INTO Penjualan 
(id_penjualan, nama, id_member, id_nonmember, id_barang, tanggal, total_harga, diskon, jumlah, metode, id_karyawan) 
VALUES
(1, 'John Doe', 1, NULL, 1, '2024-11-01', 5000000, 5.0, 1, 'Kredit', 2),
(2, 'Jane Smith', 2, NULL, 2, '2024-11-02', 4500000, 3.0, 1, 'Kredit', 1),
(3, 'Mark Gold', NULL, 1, 3, '2024-11-03', 10500000, 0.0, 3, 'Lunas', 3),
(4, 'Linda Silver', NULL, 2, 4, '2024-11-04', 6000000, 2.5, 1, 'Kredit', 4),
(5, 'Michael Brown', 4, NULL, 5, '2024-11-05', 4000000, 4.0, 2, 'Lunas', 5),
(6, 'Alice Johnson', 3, NULL, 6, '2024-11-06', 7500000, 3.0, 5, 'Kredit', 2),
(7, 'Angela Pink', NULL, 9, 7, '2024-11-07', 9000000, 1.5, 3, 'Lunas', 6),
(8, 'Patricia Green', NULL, 5, 8, '2024-11-08', 10000000, 2.0, 4, 'Kredit', 7),
(9, 'Sophia Yellow', 10, NULL, 9, '2024-11-09', 6000000, 3.0, 5, 'Lunas', 8),
(10, 'Chris Green', 6, NULL, 10, '2024-11-10', 4000000, 2.5, 10, 'Kredit', 10);



SELECT * FROM pelanggan_member;
SELECT * FROM pelanggan_NonMember;
SELECT * FROM Supliyer;
SELECT * FROM karyawan;
SELECT * FROM Barang;
SELECT * FROM Penjualan;
SELECT * FROM transaksi_pembelian;


DROP TABLE IF EXISTS transaksi_pembelian;
DROP TABLE IF EXISTS Penjualan;
DROP TABLE IF EXISTS Barang;
DROP TABLE IF EXISTS karyawan;
DROP TABLE IF EXISTS Supliyer;
DROP TABLE IF EXISTS pelanggan_NonMember;
DROP TABLE IF EXISTS pelanggan_member;

SHOW TABLES;
DESCRIBE pelanggan_member;
DESCRIBE pelanggan_NonMember;
DESCRIBE Supliyer;
DESCRIBE karyawan;
DESCRIBE Barang;
DESCRIBE Penjualan;
DESCRIBE transaksi_pembelian;


-------------------------------------------------------------------------------------
-- 5(A)
DELIMITER //
CREATE PROCEDURE insertPembelian(
    IN in_id_transaksi INT,
    IN in_id_barang INT,
    IN in_id_supliyer INT,
    IN in_harga DECIMAL(15,2),
    IN in_jumlah INT,
    IN in_tanggal DATE
)
BEGIN
    -- Insert data pembelian baru
    INSERT INTO transaksi_pembelian (id_transaksi_pembelian, id_barang, id_supliyer, harga_barang, tanggal_pembelian)
    VALUES (in_id_transaksi, in_id_barang, in_id_supliyer, in_harga, in_tanggal);

    -- Update stok di tabel Barang
    UPDATE Barang
    SET stok = stok + in_jumlah
    WHERE id_barang = in_id_barang;

    -- Tampilkan tabel Barang setelah stok bertambah
    SELECT * FROM Barang WHERE id_barang = in_id_barang;
END //
DELIMITER ;
CALL insertPembelian(14, 1, 1, 300000, 25, '2024-11-15');
SELECT * FROM Barang;
SELECT id_transaksi_pembelian FROM transaksi_pembelian;
SELECT * FROM Barang WHERE id_barang = 1;
drop PROCEDURE insertPembelian;

-- (B)
DELIMITER //

CREATE PROCEDURE UpdateKreditLunas()
BEGIN
    -- Tampilkan data pelanggan yang melakukan pembelian Kulkas 2 Pintu dengan metode Kredit
    SELECT * FROM Penjualan
    WHERE id_barang = 1 AND metode = 'Kredit';

    -- Update metode pembayaran menjadi Lunas untuk pembelian Kulkas 2 Pintu
    UPDATE Penjualan
    SET metode = 'Lunas'
    WHERE id_barang = 1 AND metode = 'Kredit';

    -- Tampilkan kembali data pelanggan setelah update
    SELECT * FROM Penjualan
    WHERE id_barang = 1;
END //

DELIMITER ;
CALL UpdateKreditLunas();

-- (C)
DELIMITER //
CREATE PROCEDURE Update_Expired_KartuAnggota(
    IN p_id_member INT,
    IN p_tgl_baru DATE
)
BEGIN
    -- Menampilkan data pelanggan sebelum diupdate
    SELECT * FROM pelanggan_member WHERE id_member = p_id_member;

    -- Update tanggal expired kartu anggota
    UPDATE pelanggan_member
    SET member_expired = p_tgl_baru
    WHERE id_member = p_id_member AND member_expired < CURDATE();

    -- Menampilkan data pelanggan setelah diupdate
    SELECT * FROM pelanggan_member WHERE id_member = p_id_member;
END //
DELIMITER ;
CALL Update_Expired_KartuAnggota(1, '2025-01-01');

-- (D)
DELIMITER $$

CREATE PROCEDURE DeleteExpiredBarang(expired_date DATE)
BEGIN
    -- Tampilkan data barang yang akan dihapus
    SELECT * 
    FROM barang 
    WHERE id_barang IN (
        SELECT id_barang 
        FROM transaksi_pembelian
        WHERE tanggal_pembelian < expired_date
    );

    -- Hapus data barang berdasarkan tanggal expired
    DELETE FROM barang 
    WHERE id_barang IN (
        SELECT id_barang 
        FROM transaksi_pembelian
        WHERE tanggal_pembelian < expired_date
    );

    -- Tampilkan data barang yang tersisa
    SELECT * 
    FROM barang;
END $$

DELIMITER ;
CALL DeleteExpiredBarang('2024-11-05');

-- (E)
DELIMITER $$

CREATE PROCEDURE DeleteSupplierBankrupt()
BEGIN
    -- Tampilkan data supplier sebelum dihapus
    SELECT * 
    FROM supliyer 
    WHERE id_Supliyer NOT IN (
        SELECT DISTINCT id_Supliyer 
        FROM barang
    );

    -- Hapus supplier yang tidak memasok barang lagi
    DELETE FROM supliyer 
    WHERE id_Supliyer NOT IN (
        SELECT DISTINCT id_Supliyer 
        FROM barang
    );

    -- Tampilkan data supplier setelah penghapusan
    SELECT * 
    FROM supliyer;
END $$

DELIMITER ;
CALL DeleteSupplierBankrupt();
SELECT * FROM Supliyer;
DELETE FROM Supliyer WHERE id_Supliyer = 10;
---------------------------------------------------------------------------------------------------------------
-- 6(A)
DELIMITER //
CREATE FUNCTION JumlahPelangganLunas()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah_lunas INT;
    SELECT COUNT(DISTINCT id_member)
    INTO jumlah_lunas
    FROM Penjualan
    WHERE metode = 'Lunas' AND id_member IS NOT NULL;
    RETURN jumlah_lunas;
END//
DELIMITER ;

-- Panggil fungsi
SELECT JumlahPelangganLunas() AS jumlah_pelanggan_lunas;

SELECT DISTINCT P.id_member, M.nama AS nama_pelanggan
FROM Penjualan P
JOIN pelanggan_member M ON P.id_member = M.id_member
WHERE P.metode = 'Lunas';

-- (B)
DELIMITER //
CREATE FUNCTION JumlahPelangganKredit()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah_kredit INT;
    SELECT COUNT(DISTINCT id_member)
    INTO jumlah_kredit
    FROM Penjualan
    WHERE metode = 'Kredit' AND id_member IS NOT NULL;
    RETURN jumlah_kredit;
END//
DELIMITER ;
SELECT JUMLAHPELANGGANKREDIT() AS jumlah_pelanggan_kredit;
SELECT DISTINCT P.id_member, M.nama AS nama_pelanggan
FROM Penjualan P
JOIN pelanggan_member M ON P.id_member = M.id_member
WHERE P.metode = 'Kredit';


-- (C)
DELIMITER //
CREATE FUNCTION JumlahTransaksiFurnitureSeptember()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah_transaksi INT;
    SELECT COUNT(*)
    INTO jumlah_transaksi
    FROM Penjualan P
    JOIN Barang B ON P.id_barang = B.id_barang
    WHERE B.kategori_barang = 'Furniture' AND P.tanggal BETWEEN '2024-09-01' AND '2024-09-30';
    RETURN jumlah_transaksi;
END//
DELIMITER ;
SELECT JumlahTransaksiFurnitureSeptember() AS jumlah_transaksi_furniture_september;
SELECT P.id_penjualan, M.nama AS nama_pelanggan, B.nama_barang, P.tanggal, P.total_harga
FROM Penjualan P
JOIN Barang B ON P.id_barang = B.id_barang
LEFT JOIN pelanggan_member M ON P.id_member = M.id_member
WHERE B.kategori_barang = 'Furniture'
  AND P.tanggal BETWEEN '2024-09-01' AND '2024-09-30';

-- (D)
CREATE VIEW View_KategoriKursi AS
SELECT id_barang, nama_barang, harga, stok, kategori_barang
FROM Barang
WHERE nama_barang LIKE '%Kursi Tamu%' OR nama_barang LIKE '%Sofa%';

SELECT * FROM View_KategoriKursi;
-------------------------------------------------------------------------------------------------------------------------
-- 7(A)
CREATE VIEW view_barang_furniture AS
SELECT id_barang, nama_barang, harga, stok, kategori_barang
FROM Barang
WHERE kategori_barang = 'Furniture' AND nama_barang IN ('Kursi Tamu', 'Sofa Set', 'Meja Makan Jati');
SELECT * FROM view_barang_furniture;

-- (B)
CREATE VIEW view_transaksi_furniture_supplier AS
SELECT p.id_penjualan, p.tanggal, b.nama_barang, b.kategori_barang, s.nama AS nama_supplier
FROM Penjualan p
JOIN Barang b ON p.id_barang = b.id_barang
JOIN Supliyer s ON b.id_Supliyer = s.id_Supliyer
WHERE b.kategori_barang = 'Furniture'
AND s.nama = 'XYZ Furniture' AND p.metode = 'Lunas';

SELECT * FROM view_transaksi_furniture_supplier;

-- (C)
CREATE VIEW view_transaksi_elektronik_member AS
SELECT p.id_penjualan, p.tanggal, b.nama_barang, b.kategori_barang, pl.nama AS nama_pelanggan
FROM Penjualan p
JOIN Barang b ON p.id_barang = b.id_barang
JOIN pelanggan_member pl ON p.id_member = pl.id_member
WHERE b.kategori_barang = 'Elektronik'
AND b.nama_barang IN ('Kulkas 2 Pintu', 'TV 42 Inch')
AND p.metode = 'Kredit';

SELECT * FROM view_transaksi_elektronik_member;
-- (D)
CREATE VIEW view_transaksi_agustus_oktober AS
SELECT id_penjualan, tanggal, total_harga, id_barang, id_member, metode
FROM Penjualan
WHERE tanggal BETWEEN '2024-08-01' AND '2024-10-31';

SELECT * FROM view_transaksi_agustus_oktober;

-- (E)
CREATE VIEW view_transaksi_furniture_elektronik_member AS
SELECT p.id_penjualan, p.tanggal, b.nama_barang, b.kategori_barang, pl.nama AS nama_pelanggan
FROM Penjualan p
JOIN Barang b ON p.id_barang = b.id_barang
JOIN pelanggan_member pl ON p.id_member = pl.id_member
WHERE (b.kategori_barang = 'Furniture' OR b.kategori_barang = 'Elektronik')
AND b.nama_barang IN ('Kulkas 2 Pintu', 'TV 42 Inch', 'Kursi Tamu', 'Sofa Set', 'Meja Makan Jati')
AND p.metode = 'Kredit';

SELECT * FROM view_transaksi_furniture_elektronik_member;

-------------------------------------------------------------------------------------------------
-- 8
DELIMITER //

CREATE PROCEDURE tampilkan_seluruh_karyawan()
BEGIN
    SELECT id_karyawan, nama_karyawan, nomor_telepon, status_karyawan
    FROM karyawan;
END //

DELIMITER ;
CALL tampilkan_seluruh_karyawan();
------------------------------------------------------------------
-- 9
SELECT
    p.id_member,
    p.nama AS nama_pelanggan,
    tp.id_transaksi_pembelian,
    tp.tanggal_pembelian,
    tp.harga_barang,
    tp.id_barang,
    b.nama_barang,
    tp.id_supliyer,
    s.nama AS nama_supplier,
    tp.harga_barang * (1 - 
        CASE 
            WHEN tp.harga_barang BETWEEN 1000000 AND 5000000 THEN 0.02
            WHEN tp.harga_barang BETWEEN 5000001 AND 10000000 THEN 0.025
            WHEN tp.harga_barang BETWEEN 10000001 AND 25000000 THEN 0.03
            WHEN tp.harga_barang > 25000000 THEN 0.04
            ELSE 0
        END) AS total_after_discount
FROM
    transaksi_pembelian tp
JOIN
    pelanggan_member p ON tp.id_supliyer = p.id_member  -- Menghubungkan dengan tabel pelanggan
JOIN
    barang b ON tp.id_barang = b.id_barang  -- Menghubungkan dengan tabel barang
JOIN
    supliyer s ON tp.id_supliyer = s.id_Supliyer  -- Menghubungkan dengan tabel supplier
ORDER BY
    tp.tanggal_pembelian;










