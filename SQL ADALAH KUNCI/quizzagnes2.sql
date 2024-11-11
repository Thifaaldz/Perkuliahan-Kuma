-- Menghapus database jika sudah ada
DROP DATABASE IF EXISTS bimble1;

-- Membuat database baru
CREATE DATABASE bimble1;
USE bimble1;

-- Tabel Karyawan
CREATE TABLE karyawan (
    kode_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    jabatan ENUM('keuangan', 'resepsionis', 'administrasi'),
    tugas TEXT,
    gaji DECIMAL(10,2)
);

-- Tabel Instruktur
CREATE TABLE instruktur (
    kode_instruktur INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    jumlah_modul INT DEFAULT 0,
    gaji_perjam DECIMAL(10,2) DEFAULT 100.00,
    status_hadir BOOLEAN DEFAULT TRUE
);

-- Tabel Mapel
CREATE TABLE mapel (
    kode_mapel INT PRIMARY KEY AUTO_INCREMENT,
    nama_mapel VARCHAR(100) NOT NULL,
    harga_persemester DECIMAL(10,2) NOT NULL,
    status_aktif BOOLEAN DEFAULT TRUE
);

-- Tabel Modul
CREATE TABLE table_modul (
    kode_modul INT PRIMARY KEY,
    nama_modul VARCHAR(100) NOT NULL,
    kode_instruktur INT,
    deskripsi TEXT,
    tanggal_mulai DATE,
    kode_mapel INT,
    FOREIGN KEY (kode_instruktur) REFERENCES instruktur(kode_instruktur),
    FOREIGN KEY (kode_mapel) REFERENCES mapel(kode_mapel)
);

-- Tabel Siswa SMP
CREATE TABLE siswa_smp (
    kode_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    kode_kelas INT,
    kelas ENUM('7', '8', '9') NOT NULL,
    total_bayar DECIMAL(10,2),
    status_potongan BOOLEAN DEFAULT FALSE
);

-- Tabel Siswa SMA
CREATE TABLE siswa_sma (
    kode_siswa INT PRIMARY KEY AUTO_INCREMENT,
    kode_kelas INT,
    nama VARCHAR(100) NOT NULL,
    kelas ENUM('10', '11', '12') NOT NULL,
    jurusan ENUM('IPA', 'IPS') NOT NULL,
    total_bayar DECIMAL(10,2),
    status_potongan BOOLEAN DEFAULT FALSE
);

-- Tabel Kelas
CREATE TABLE kelas (
    kode_kelas INT PRIMARY KEY AUTO_INCREMENT,
    kode_mapel INT,
    nama_kelas INT,
    kode_instruktur INT,
    kapasitas INT CHECK(kapasitas IN (10, 15)),
    jumlah_siswa INT DEFAULT 0,
    jadwal DATETIME,
    FOREIGN KEY (kode_mapel) REFERENCES mapel(kode_mapel),
    FOREIGN KEY (kode_instruktur) REFERENCES instruktur(kode_instruktur)
);

-- Tabel Pembayaran SMP
CREATE TABLE pembayaran_smp (
    kode_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    kode_karyawan INT,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran ENUM('lunas', 'cicil'),
    status_potongan BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa),
    FOREIGN KEY (kode_karyawan) REFERENCES karyawan(kode_karyawan)
);

-- Tabel Pembayaran SMA
CREATE TABLE pembayaran_sma (
    kode_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran ENUM('lunas', 'cicil'),
    status_potongan BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa)
);

-- Tabel Keluhan SMP
CREATE TABLE keluhan_smp (
    kode_keluhan INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    deskripsi_keluhan TEXT,
    tanggal_keluhan DATE,
    status_keluhan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa)
);

-- Tabel Keluhan SMA
CREATE TABLE keluhan_sma (
    kode_keluhan INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    deskripsi_keluhan TEXT,
    tanggal_keluhan DATE,
    status_keluhan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa)
);

-- Tabel Pendaftaran Siswa Baru SMP
CREATE TABLE pendaftaran_siswabarusmp (
    kode_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    tanggal_daftar DATE,
    program VARCHAR(50),
    kode_kelas INT,  -- Add the kode_kelas foreign key
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa),
    FOREIGN KEY (kode_kelas) REFERENCES kelas(kode_kelas)  -- Foreign key reference to kelas
);

-- Tabel Pendaftaran Siswa Baru SMA
CREATE TABLE pendaftaran_siswabaruSMA (
    kode_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    tanggal_daftar DATE,
    program VARCHAR(50),
    kode_kelas INT,  -- Add the kode_kelas foreign key
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa),
    FOREIGN KEY (kode_kelas) REFERENCES kelas(kode_kelas)  -- Foreign key reference to kelas
);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO karyawan (nama, jabatan, tugas, gaji) VALUES
('Ayu', 'resepsionis', 'Penerimaan siswa baru', 3000000.00),
('Budi', 'keuangan', 'Mengelola keuangan dan pembayaran', 5000000.00),
('Cindy', 'administrasi', 'Pengelolaan data dan dokumen', 4000000.00),
('Dewi', 'resepsionis', 'Menyambut tamu dan penerimaan siswa', 3000000.00),
('Eka', 'keuangan', 'Membuat laporan keuangan bulanan', 4500000.00);



-- Insert Data into Instruktur Table
INSERT INTO instruktur (kode_instruktur, nama, jumlah_modul, gaji_perjam, status_hadir) VALUES
(1, 'Faris', 5, 100.00, TRUE),
(2, 'Irgi', 3, 100.00, TRUE),
(3, 'Angreni', 4, 100.00, TRUE),
(4, 'Budi', 6, 100.00, TRUE),
(5, 'Cynthia', 2, 100.00, TRUE),
(6, 'Daniel', 7, 100.00, TRUE),
(7, 'Elisa', 4, 100.00, TRUE),
(8, 'Gina', 5, 100.00, TRUE),
(9, 'Hadi', 3, 100.00, TRUE),
(10, 'Indah', 2, 100.00, TRUE);

INSERT INTO mapel (nama_mapel, harga_persemester, status_aktif)
VALUES
    ('Matematika', 500000.00, TRUE),
    ('Bahasa Indonesia', 400000.00, TRUE),
    ('Fisika', 550000.00, TRUE),
    ('Kimia', 530000.00, TRUE),
    ('Biologi', 480000.00, TRUE),
    ('bahasa jerman', 80000.000, true);

INSERT INTO table_modul (kode_modul, nama_modul, kode_instruktur, deskripsi, tanggal_mulai, kode_mapel)
VALUES
    (1, 'Modul Matematika Dasar',1, 'Modul ini mencakup materi tentang aljabar dan geometri dasar.', '2024-12-01', 1),
    (2, 'Modul Bahasa Indonesia Dasar',2, 'Modul ini mencakup materi tentang tatabahasa dan keterampilan menulis.', '2024-12-02', 2),
	(6, 'Modul Fisika Klasik', 1, 'Modul ini mencakup materi tentang hukum Newton, energi, dan gerak.', '2024-12-05', 3),
    (7, 'Modul Kimia Dasar', 1, 'Modul ini mencakup materi tentang struktur atom dan reaksi kimia dasar.', '2024-12-07', 4),
    (8, 'Modul Biologi Sel', 1, 'Modul ini mencakup materi tentang struktur sel dan proses metabolisme.', '2024-12-10', 5),
    (3, 'Modul Fisika Klasik', 3, 'Modul ini mencakup materi tentang hukum Newton, energi, dan gerak.', '2024-12-05', 3),
    (4, 'Modul Kimia Dasar', 4, 'Modul ini mencakup materi tentang struktur atom dan reaksi kimia dasar.', '2024-12-07', 4),
    (5, 'Modul Biologi Sel', 5, 'Modul ini mencakup materi tentang struktur sel dan proses metabolisme.', '2024-12-10', 5);
    
    INSERT INTO siswa_smp (nama, kode_kelas, kelas, total_bayar, status_potongan)
VALUES
    ('Andi Pratama', 1, '7', 750000.00, FALSE),
    ('Budi Santoso', 1, '7', 780000.00, FALSE),
    ('Cici Putri', 2, '7', 800000.00, FALSE),
    ('Dedi Kurniawan', 2, '7', 790000.00, TRUE),
    ('Eka Sari', 3, '8', 850000.00, FALSE),
    ('Fajar Nurcahyo', 3, '8', 860000.00, TRUE),
    ('Gita Lestari', 4, '8', 830000.00, FALSE),
    ('Hadi Saputra', 4, '8', 810000.00, TRUE),
    ('Indah Permatasari', 5, '9', 900000.00, FALSE),
    ('Joko Prabowo', 5, '9', 910000.00, TRUE),
    ('Kartika Dewi', 6, '9', 950000.00, FALSE),
    ('Lina Asri', 6, '9', 960000.00, FALSE),
    ('Mira Suci', 7, '7', 780000.00, TRUE),
    ('Nina Salim', 7, '7', 770000.00, FALSE),
    ('Omar Hidayat', 8, '8', 820000.00, TRUE),
    ('Putra Ramadhan', 14, '8', 830000.00, FALSE),
    ('Qori Ramli', 14, '9', 990000.00, TRUE),
    ('Rina Amalia', 14, '9', 980000.00, FALSE),
    ('Siti Aisyah', 14, '7', 760000.00, FALSE);
    
    

INSERT INTO siswa_sma (kode_kelas, nama, kelas, jurusan, total_bayar, status_potongan)
VALUES
    (1, 'Andi Wijaya', '10', 'IPA', 1000000.00, FALSE),
    (1, 'Budi Santoso', '10', 'IPS', 1050000.00, TRUE),
    (2, 'Cici Putri', '10', 'IPA', 980000.00, FALSE),
    (2, 'Dedi Kurniawan', '10', 'IPS', 950000.00, TRUE),
    (3, 'Eka Sari', '11', 'IPA', 1200000.00, FALSE),
    (3, 'Fajar Nurcahyo', '11', 'IPS', 1150000.00, FALSE),
    (4, 'Gita Lestari', '11', 'IPA', 1100000.00, TRUE),
    (4, 'Hadi Saputra', '11', 'IPS', 1080000.00, FALSE),
    (5, 'Indah Permatasari', '12', 'IPA', 1300000.00, TRUE),
    (5, 'Joko Prabowo', '12', 'IPS', 1250000.00, FALSE),
    (6, 'Kartika Dewi', '12', 'IPA', 1400000.00, FALSE),
    (6, 'Lina Asri', '12', 'IPS', 1380000.00, TRUE),
    (7, 'Mira Suci', '10', 'IPA', 1020000.00, FALSE),
    (7, 'Nina Salim', '10', 'IPS', 1040000.00, TRUE),
    (8, 'Omar Hidayat', '11', 'IPA', 1180000.00, FALSE),
    (14, 'Putra Ramadhan', '11', 'IPS', 1120000.00, TRUE),
    (14, 'Qori Ramli', '10', 'IPA', 1350000.00, TRUE),
    (14, 'Rina Amalia', '11', 'IPS', 1300000.00, FALSE),
    (14, 'Siti Aisyah', '11', 'IPA', 990000.00, TRUE),
    (14, 'Taufik Hidayat', '12', 'IPS', 980000.00, FALSE);

INSERT INTO kelas (kode_mapel, nama_kelas, kode_instruktur, kapasitas, jumlah_siswa, jadwal)
VALUES
    (1, 1, 1, 15, 0, '2024-12-01 08:00:00'), -- Matematika, Instruktor 101, Kelas 1
    (2, 2, 2, 15, 0, '2024-12-02 10:00:00'), -- Bahasa Indonesia, Instruktor 102, Kelas 2
    (3, 3, 3, 15, 0, '2024-12-03 12:00:00'), -- Fisika, Instruktor 103, Kelas 3
    (4, 4, 4, 10, 0, '2024-12-04 14:00:00'), -- Kimia, Instruktor 104, Kelas 4
    (5, 5, 5, 10, 0, '2024-12-05 16:00:00'), -- Biologi, Instruktor 105, Kelas 5
    (1, 6, 6, 15, 0, '2024-12-06 08:00:00'), -- Matematika, Instruktor 106, Kelas 6
    (2, 7, 7, 15, 0, '2024-12-07 10:00:00'), -- Bahasa Indonesia, Instruktor 107, Kelas 7
    (3, 8, 8, 10, 0, '2024-12-08 12:00:00'), -- Fisika, Instruktor 108, Kelas 8
    (4, 9, 9, 10, 0, '2024-12-09 14:00:00'), -- Kimia, Instruktor 109, Kelas 9
    (5, 10, 1, 15, 0, '2024-12-10 16:00:00'), -- Biologi, Instruktor 110, Kelas 10
    (3, 11, 1, 15, 0, '2024-12-03 12:00:00'), -- Fisika, Instruktor 103, Kelas 3
    (4, 12, 1, 10, 0, '2024-12-04 14:00:00'), -- Kimia, Instruktor 104, Kelas 4
    (5, 13, 1, 10, 0, '2024-12-05 16:00:00'), -- Biologi, Instruktor 105, Kelas 5
    (6, 14, 3, 10, 0,  '2024-12-05 16:00:00');
    
    INSERT INTO pembayaran_smp (kode_siswa, kode_karyawan, jumlah_pembayaran, metode_pembayaran, status_potongan)
VALUES
    (1, 1, 750000.00, 'lunas', FALSE),
    (2, 2, 780000.00, 'cicil', TRUE),
    (3, 3, 800000.00, 'lunas', FALSE),
    (4, 4, 790000.00, 'cicil', TRUE),
    (5, 5, 850000.00, 'lunas', FALSE),
    (6, 1, 860000.00, 'lunas', TRUE),
    (7, 2, 830000.00, 'cicil', FALSE),
    (8, 3, 810000.00, 'lunas', TRUE),
    (9, 4, 900000.00, 'cicil', FALSE),
    (10, 5, 910000.00, 'lunas', TRUE),
    (11, 1, 950000.00, 'lunas', FALSE),
    (12, 2, 960000.00, 'cicil', TRUE),
    (13, 3, 780000.00, 'lunas', TRUE),
    (14, 4, 770000.00, 'cicil', FALSE),
    (15, 5, 820000.00, 'lunas', TRUE),
    (16, 1, 830000.00, 'cicil', FALSE),
    (17, 2, 990000.00, 'lunas', TRUE),
    (18, 3, 980000.00, 'cicil', FALSE),
    (19, 4, 760000.00, 'lunas', FALSE);
    
    INSERT INTO pembayaran_sma (kode_siswa, jumlah_pembayaran, metode_pembayaran, status_potongan)
VALUES
    (1, 1000000.00, 'lunas', FALSE),
    (2, 1050000.00, 'cicil', TRUE),
    (3, 980000.00, 'lunas', FALSE),
    (4, 950000.00, 'cicil', TRUE),
    (5, 1200000.00, 'lunas', FALSE),
    (6, 1150000.00, 'cicil', FALSE),
    (7, 1100000.00, 'lunas', TRUE),
    (8, 1080000.00, 'cicil', FALSE),
    (9, 1300000.00, 'lunas', TRUE),
    (10, 1250000.00, 'lunas', FALSE),
    (11, 1400000.00, 'cicil', FALSE),
    (12, 1380000.00, 'lunas', TRUE),
    (13, 1020000.00, 'cicil', FALSE),
    (14, 1040000.00, 'lunas', TRUE),
    (15, 1180000.00, 'cicil', FALSE),
    (16, 1120000.00, 'lunas', TRUE),
    (17, 1350000.00, 'lunas', TRUE),
    (18, 1300000.00, 'cicil', FALSE),
    (19, 990000.00, 'lunas', TRUE),
    (20, 980000.00, 'cicil', FALSE);
select * from siswa_sma;
INSERT INTO keluhan_smp (kode_siswa, deskripsi_keluhan, tanggal_keluhan, status_keluhan)
VALUES
    (1, 'Kesulitan memahami materi Matematika.', '2024-11-01', 'Pending'),
    (2, 'Tidak nyaman dengan metode pembelajaran.', '2024-11-02', 'Ditangani'),
    (3, 'Kekurangan materi tambahan untuk latihan.', '2024-11-03', 'Pending'),
    (4, 'Ruangan terlalu panas selama jam belajar.', '2024-11-04', 'Selesai'),
    (5, 'Terlambat menerima informasi jadwal.', '2024-11-05', 'Pending'),
    (6, 'Tidak puas dengan hasil ujian.', '2024-11-06', 'Ditangani'),
    (7, 'Permasalahan teknis pada alat peraga.', '2024-11-07', 'Pending'),
    (8, 'Kekurangan waktu diskusi di kelas.', '2024-11-08', 'Selesai'),
    (9, 'Kesulitan mengerjakan tugas kelompok.', '2024-11-09', 'Pending'),
    (10, 'Memerlukan bimbingan ekstra untuk ujian.', '2024-11-10', 'Pending');

INSERT INTO keluhan_sma (kode_siswa, deskripsi_keluhan, tanggal_keluhan, status_keluhan)
VALUES
    (1, 'Memerlukan bahan tambahan untuk praktikum IPA.', '2024-11-01', 'Pending'),
    (2, 'Kesulitan dalam memahami konsep Fisika.', '2024-11-02', 'Ditangani'),
    (3, 'Terlalu banyak tugas harian.', '2024-11-03', 'Pending'),
    (4, 'Ruangan kurang penerangan.', '2024-11-04', 'Selesai'),
    (5, 'Masalah dalam komunikasi dengan guru.', '2024-11-05', 'Pending'),
    (6, 'Memerlukan akses buku referensi tambahan.', '2024-11-06', 'Ditangani'),
    (7, 'Kesulitan dalam pembagian waktu belajar.', '2024-11-07', 'Pending'),
    (8, 'Butuh waktu tambahan untuk persiapan ujian.', '2024-11-08', 'Selesai'),
    (9, 'Kesulitan memahami materi Kimia lanjutan.', '2024-11-09', 'Pending'),
    (10, 'Ingin konsultasi tambahan untuk rencana studi.', '2024-11-10', 'Pending');

----------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE insert_siswa_smp(
    IN p_nama VARCHAR(100),
    IN p_kode_kelas INT,
    IN p_kelas ENUM('7', '8', '9'),
    IN p_total_bayar DECIMAL(10,2),
    IN p_status_potongan BOOLEAN
)
BEGIN
    INSERT INTO siswa_smp (nama, kode_kelas, kelas, total_bayar, status_potongan)
    VALUES (p_nama, p_kode_kelas, p_kelas, p_total_bayar, p_status_potongan);
END //

DELIMITER ;
call  insert_siswa_smp(
DELIMITER //

CREATE PROCEDURE update_siswa_smp(
    IN p_kode_siswa INT,
    IN p_nama VARCHAR(100),
    IN p_kode_kelas INT,
    IN p_kelas ENUM('7', '8', '9'),
    IN p_total_bayar DECIMAL(10,2),
    IN p_status_potongan BOOLEAN
)
BEGIN
    UPDATE siswa_smp
    SET nama = p_nama,
        kode_kelas = p_kode_kelas,
        kelas = p_kelas,
        total_bayar = p_total_bayar,
        status_potongan = p_status_potongan
    WHERE kode_siswa = p_kode_siswa;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_pendaftaran_siswabaru(
    IN p_kode_siswa INT,
    IN p_tanggal_daftar DATE,
    IN p_program VARCHAR(50)
)
BEGIN
    INSERT INTO pendaftaran_siswabaru (kode_siswa, tanggal_daftar, program)
    VALUES (p_kode_siswa, p_tanggal_daftar, p_program);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE select_pembayaran_bimbel_ipa_kls12_sma()
BEGIN
    SELECT pembayaran_sma.*
    FROM pembayaran_sma
    JOIN siswa_sma ON pembayaran_sma.kode_siswa = siswa_sma.kode_siswa
    WHERE siswa_sma.kelas = '12'
      AND siswa_sma.jurusan = 'IPA';
END //

DELIMITER ;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- a. Prosedur untuk menampilkan data tabel `modul` yang dibuat oleh instruktur Faris
DELIMITER //
CREATE PROCEDURE TampilModulFaris()
BEGIN
    SELECT m.*
    FROM table_modul m
    JOIN instruktur i ON m.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';
END //
DELIMITER ;
drop procedure if exists TampilModulFaris;
call TampilModulFaris();
-- b. Prosedur untuk menampilkan data tabel `modul` khusus untuk mapel IPA (Matematika, Biologi, Kimia, dan Fisika)
DELIMITER //
CREATE PROCEDURE TampilModulIPA()
BEGIN
    SELECT m.*
    FROM table_modul m
    JOIN mapel mp ON m.kode_mapel = mp.kode_mapel
    WHERE mp.nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika');
END //
DELIMITER ;
drop procedure if exists TampilModulIPA;
call TampilModulIPA();
-- c. Prosedur untuk menampilkan data tabel `instruktur` Faris mengajar mapel Matematika, Fisika, dan Kimia
DELIMITER //
CREATE PROCEDURE TampilInstrukturFarisIPA()
BEGIN
    SELECT i.*, m.*
    FROM instruktur i
    JOIN table_modul mo ON i.kode_instruktur = mo.kode_instruktur
    JOIN mapel m ON mo.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel IN ('Matematika', 'Fisika', 'Kimia');
END //
DELIMITER ;
drop procedure if exists TampilInstrukturFarisIPA;
call TampilInstrukturFarisIPA();
-- d. Prosedur untuk menampilkan data tabel `siswa_sma` yang diajar oleh instruktur Faris
DELIMITER //
CREATE PROCEDURE TampilSiswaSMAFaris()
BEGIN
    SELECT ss.*
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';
END //
DELIMITER ;
drop procedure if exists TampilSiswaSMAFaris;
call TampilSiswaSMAFaris();

-- e. Prosedur untuk menampilkan data tabel `siswa_smp` dan `siswa_sma` yang diajar oleh instruktur Faris pada Mapel Matematika
DELIMITER //
CREATE PROCEDURE TampilSiswaMatematikaFaris()
BEGIN
    SELECT 'SMP' AS jenjang, ss.kode_siswa, ss.nama, ss.kelas, ss.total_bayar, ss.status_potongan
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika'
    UNION ALL
    SELECT 'SMA' AS jenjang, ss.kode_siswa, ss.nama, ss.kelas, ss.total_bayar, ss.status_potongan
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';
END //
DELIMITER ;

drop procedure if exists TampilSiswaMatematikaFaris;
call TampilSiswaMatematikaFaris();
-- f. Prosedur untuk menghapus data `siswa_smp` yang diajar oleh instruktur Faris pada mapel Matematika
DELIMITER //
DELIMITER //
DELIMITER //
CREATE PROCEDURE HapusSiswaSMPMatematikaFaris()
BEGIN
    -- Hapus data terkait di pembayaran_smp terlebih dahulu
    DELETE ps
    FROM pembayaran_smp ps
    JOIN siswa_smp ss ON ps.kode_siswa = ss.kode_siswa
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';

    -- Hapus data terkait di keluhan_smp jika ada
    DELETE ks
    FROM keluhan_smp ks
    JOIN siswa_smp ss ON ks.kode_siswa = ss.kode_siswa
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';

    -- Hapus data di siswa_smp
    DELETE ss
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';
END //
DELIMITER ;


drop procedure if exists HapusSiswaSMPMatematikaFaris;
call HapusSiswaSMPMatematikaFaris();
-- g. Prosedur untuk mengubah instruktur dari Faris menjadi Angreni pada siswa SMP di mapel Fisika
DELIMITER //
CREATE PROCEDURE UbahInstrukturFisikaFarisToAngreni()
BEGIN
    UPDATE kelas k
    JOIN instruktur i_faris ON k.kode_instruktur = i_faris.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    JOIN instruktur i_angreni ON i_angreni.nama = 'Angreni'
    SET k.kode_instruktur = i_angreni.kode_instruktur
    WHERE i_faris.nama = 'Faris' AND m.nama_mapel = 'Fisika';
END //
DELIMITER ;
drop procedure if exists HapusSiswaSMPMatematikaFaris;
call UbahInstrukturFisikaFarisToAngreni();
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
DELIMITER //
CREATE FUNCTION JumlahSiswaDiajarkanFaris() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    DECLARE jumlah_smp INT DEFAULT 0;
    DECLARE jumlah_sma INT DEFAULT 0;

    -- Hitung jumlah siswa SMP yang diajar Faris
    SELECT COUNT(*) INTO jumlah_smp
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';

    -- Hitung jumlah siswa SMA yang diajar Faris
    SELECT COUNT(*) INTO jumlah_sma
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';

    -- Jumlahkan hasilnya
    SET jumlah = jumlah_smp + jumlah_sma;
    RETURN jumlah;
END //
DELIMITER ;
SELECT JumlahSiswaDiajarkanFaris();

DELIMITER //
CREATE FUNCTION JumlahSiswaSMPKelas9Irgi() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Irgi' AND ss.kelas = '9';

    RETURN jumlah;
END //
DELIMITER ;
select JumlahSiswaSMPKelas9Irgi();

DELIMITER //
DELIMITER //
CREATE FUNCTION JumlahSiswaBahasaJermanAngren() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah_smp INT DEFAULT 0;
    DECLARE jumlah_sma INT DEFAULT 0;
    DECLARE total_jumlah INT;

    -- Hitung jumlah siswa SMP yang diajar Angren pada mapel Bahasa Jerman
    SELECT COUNT(*) INTO jumlah_smp
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Angreni' AND m.nama_mapel = 'Bahasa Jerman';

    -- Hitung jumlah siswa SMA yang diajar Angren pada mapel Bahasa Jerman
    SELECT COUNT(*) INTO jumlah_sma
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Angreni' AND m.nama_mapel = 'Bahasa Jerman';

    -- Jumlahkan hasilnya
    SET total_jumlah = jumlah_smp + jumlah_sma;
    RETURN total_jumlah;
END //
DELIMITER ;
DROP FUNCTION IF EXISTS JumlahSiswaBahasaJermanAngren;


select JumlahSiswaBahasaJermanAngren();
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW view_modul_by_faris AS
SELECT * 
FROM table_modul 
WHERE kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris');
SELECT * FROM  view_modul_by_faris;


CREATE VIEW view_modul_ipa AS
SELECT * 
FROM table_modul 
WHERE kode_mapel IN (
    SELECT kode_mapel 
    FROM mapel 
    WHERE nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika')
);
SELECT * FROM   view_modul_ipa;
CREATE VIEW view_faris_modul_ipa AS
SELECT * 
FROM table_modul 
WHERE kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
  AND kode_mapel IN (
      SELECT kode_mapel 
      FROM mapel 
      WHERE nama_mapel IN ('Matematika', 'Fisika', 'Kimia')
  );
SELECT * FROM   view_faris_modul_ipa;

CREATE VIEW view_siswa_sma_by_faris AS
SELECT siswa_sma.* 
FROM siswa_sma 
JOIN kelas ON siswa_sma.kode_kelas = kelas.kode_kelas
WHERE kelas.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris');
SELECT * FROM  view_siswa_sma_by_faris;

CREATE VIEW view_siswa_smp_sma_matematika AS
SELECT siswa_smp.nama, 'SMP' AS tingkat, siswa_smp.kelas AS kelas
FROM siswa_smp
JOIN kelas ON siswa_smp.kode_kelas = kelas.kode_kelas
WHERE kelas.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
  AND kelas.kode_mapel = (SELECT kode_mapel FROM mapel WHERE nama_mapel = 'Matematika')
UNION ALL
SELECT siswa_sma.nama, 'SMA' AS tingkat, siswa_sma.kelas AS kelas
FROM siswa_sma
JOIN kelas ON siswa_sma.kode_kelas = kelas.kode_kelas
WHERE kelas.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
  AND kelas.kode_mapel = (SELECT kode_mapel FROM mapel WHERE nama_mapel = 'Matematika');
SELECT * FROM  view_siswa_smp_sma_matematika;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE select_all_karyawan()
BEGIN
    SELECT * FROM karyawan;
END //

DELIMITER ;
CALL select_all_karyawan();
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE TRIGGER trg_increment_jumlah_modul
AFTER INSERT ON table_modul
FOR EACH ROW
BEGIN
    UPDATE instruktur 
    SET jumlah_modul = jumlah_modul + 1
    WHERE kode_instruktur = NEW.kode_instruktur;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_decrement_jumlah_modul
AFTER DELETE ON table_modul
FOR EACH ROW
BEGIN
    UPDATE instruktur 
    SET jumlah_modul = jumlah_modul - 1
    WHERE kode_instruktur = OLD.kode_instruktur;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_increment_jumlah_siswa_smp
AFTER INSERT ON siswa_smp
FOR EACH ROW
BEGIN
    UPDATE kelas 
    SET jumlah_siswa = jumlah_siswa + 1
    WHERE kode_kelas = NEW.kode_kelas;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_increment_jumlah_siswa_sma
AFTER INSERT ON siswa_sma
FOR EACH ROW
BEGIN
    UPDATE kelas 
    SET jumlah_siswa = jumlah_siswa + 1
    WHERE kode_kelas = NEW.kode_kelas;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_decrement_jumlah_siswa_smp
AFTER DELETE ON siswa_smp
FOR EACH ROW
BEGIN
    UPDATE kelas 
    SET jumlah_siswa = jumlah_siswa - 1
    WHERE kode_kelas = OLD.kode_kelas;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_decrement_jumlah_siswa_sma
AFTER DELETE ON siswa_sma
FOR EACH ROW
BEGIN
    UPDATE kelas 
    SET jumlah_siswa = jumlah_siswa - 1
    WHERE kode_kelas = OLD.kode_kelas;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_update_total_bayar_smp
AFTER INSERT ON pembayaran_smp
FOR EACH ROW
BEGIN
    UPDATE siswa_smp 
    SET total_bayar = total_bayar + NEW.jumlah_pembayaran
    WHERE kode_siswa = NEW.kode_siswa;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_update_total_bayar_sma
AFTER INSERT ON pembayaran_sma
FOR EACH ROW
BEGIN
    UPDATE siswa_sma 
    SET total_bayar = total_bayar + NEW.jumlah_pembayaran
    WHERE kode_siswa = NEW.kode_siswa;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_adjust_total_bayar_smp
AFTER UPDATE ON pembayaran_smp
FOR EACH ROW
BEGIN
    UPDATE siswa_smp 
    SET total_bayar = total_bayar - OLD.jumlah_pembayaran + NEW.jumlah_pembayaran
    WHERE kode_siswa = NEW.kode_siswa;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER trg_adjust_total_bayar_sma
AFTER UPDATE ON pembayaran_sma
FOR EACH ROW
BEGIN
    UPDATE siswa_sma 
    SET total_bayar = total_bayar - OLD.jumlah_pembayaran + NEW.jumlah_pembayaran
    WHERE kode_siswa = NEW.kode_siswa;
END //

DELIMITER ;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- a. Prosedur untuk menampilkan data tabel `modul` yang dibuat oleh instruktur Faris
DELIMITER //
CREATE PROCEDURE TampilModulFaris()
BEGIN
    SELECT m.*
    FROM table_modul m
    JOIN instruktur i ON m.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';
END //
DELIMITER ;
drop procedure if exists TampilModulFaris;
call TampilModulFaris();
-- b. Prosedur untuk menampilkan data tabel `modul` khusus untuk mapel IPA (Matematika, Biologi, Kimia, dan Fisika)
DELIMITER //
CREATE PROCEDURE TampilModulIPA()
BEGIN
    SELECT m.*
    FROM table_modul m
    JOIN mapel mp ON m.kode_mapel = mp.kode_mapel
    WHERE mp.nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika');
END //
DELIMITER ;
drop procedure if exists TampilModulIPA;
call TampilModulIPA();
-- c. Prosedur untuk menampilkan data tabel `instruktur` Faris mengajar mapel Matematika, Fisika, dan Kimia
DELIMITER //
CREATE PROCEDURE TampilInstrukturFarisIPA()
BEGIN
    SELECT i.*, m.*
    FROM instruktur i
    JOIN table_modul mo ON i.kode_instruktur = mo.kode_instruktur
    JOIN mapel m ON mo.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel IN ('Matematika', 'Fisika', 'Kimia');
END //
DELIMITER ;
drop procedure if exists TampilInstrukturFarisIPA;
call TampilInstrukturFarisIPA();
-- d. Prosedur untuk menampilkan data tabel `siswa_sma` yang diajar oleh instruktur Faris
DELIMITER //
CREATE PROCEDURE TampilSiswaSMAFaris()
BEGIN
    SELECT ss.*
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';
END //
DELIMITER ;
drop procedure if exists TampilSiswaSMAFaris;
call TampilSiswaSMAFaris();

-- e. Prosedur untuk menampilkan data tabel `siswa_smp` dan `siswa_sma` yang diajar oleh instruktur Faris pada Mapel Matematika
DELIMITER //
CREATE PROCEDURE TampilSiswaMatematikaFaris()
BEGIN
    SELECT 'SMP' AS jenjang, ss.kode_siswa, ss.nama, ss.kelas, ss.total_bayar, ss.status_potongan
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika'
    UNION ALL
    SELECT 'SMA' AS jenjang, ss.kode_siswa, ss.nama, ss.kelas, ss.total_bayar, ss.status_potongan
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';
END //
DELIMITER ;

drop procedure if exists TampilSiswaMatematikaFaris;
call TampilSiswaMatematikaFaris();
-- f. Prosedur untuk menghapus data `siswa_smp` yang diajar oleh instruktur Faris pada mapel Matematika
DELIMITER //
DELIMITER //
DELIMITER //
CREATE PROCEDURE HapusSiswaSMPMatematikaFaris()
BEGIN
    -- Hapus data terkait di pembayaran_smp terlebih dahulu
    DELETE ps
    FROM pembayaran_smp ps
    JOIN siswa_smp ss ON ps.kode_siswa = ss.kode_siswa
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';

    -- Hapus data terkait di keluhan_smp jika ada
    DELETE ks
    FROM keluhan_smp ks
    JOIN siswa_smp ss ON ks.kode_siswa = ss.kode_siswa
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';

    -- Hapus data di siswa_smp
    DELETE ss
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';
END //
DELIMITER ;


drop procedure if exists HapusSiswaSMPMatematikaFaris;
call HapusSiswaSMPMatematikaFaris();
-- g. Prosedur untuk mengubah instruktur dari Faris menjadi Angreni pada siswa SMP di mapel Fisika
DELIMITER //
CREATE PROCEDURE UbahInstrukturFisikaFarisToAngreni()
BEGIN
    UPDATE kelas k
    JOIN instruktur i_faris ON k.kode_instruktur = i_faris.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    JOIN instruktur i_angreni ON i_angreni.nama = 'Angreni'
    SET k.kode_instruktur = i_angreni.kode_instruktur
    WHERE i_faris.nama = 'Faris' AND m.nama_mapel = 'Fisika';
END //
DELIMITER ;
drop procedure if exists HapusSiswaSMPMatematikaFaris;
call UbahInstrukturFisikaFarisToAngreni();
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
DELIMITER //
CREATE FUNCTION JumlahSiswaDiajarkanFaris() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    DECLARE jumlah_smp INT DEFAULT 0;
    DECLARE jumlah_sma INT DEFAULT 0;

    -- Hitung jumlah siswa SMP yang diajar Faris
    SELECT COUNT(*) INTO jumlah_smp
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';

    -- Hitung jumlah siswa SMA yang diajar Faris
    SELECT COUNT(*) INTO jumlah_sma
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';

    -- Jumlahkan hasilnya
    SET jumlah = jumlah_smp + jumlah_sma;
    RETURN jumlah;
END //
DELIMITER ;
SELECT JumlahSiswaDiajarkanFaris();

DELIMITER //
CREATE FUNCTION JumlahSiswaSMPKelas9Irgi() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Irgi' AND ss.kelas = '9';

    RETURN jumlah;
END //
DELIMITER ;
select JumlahSiswaSMPKelas9Irgi();

DELIMITER //
DELIMITER //
CREATE FUNCTION JumlahSiswaBahasaJermanAngren() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah_smp INT DEFAULT 0;
    DECLARE jumlah_sma INT DEFAULT 0;
    DECLARE total_jumlah INT;

    -- Hitung jumlah siswa SMP yang diajar Angren pada mapel Bahasa Jerman
    SELECT COUNT(*) INTO jumlah_smp
    FROM siswa_smp ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Angreni' AND m.nama_mapel = 'Bahasa Jerman';

    -- Hitung jumlah siswa SMA yang diajar Angren pada mapel Bahasa Jerman
    SELECT COUNT(*) INTO jumlah_sma
    FROM siswa_sma ss
    JOIN kelas k ON ss.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Angreni' AND m.nama_mapel = 'Bahasa Jerman';

    -- Jumlahkan hasilnya
    SET total_jumlah = jumlah_smp + jumlah_sma;
    RETURN total_jumlah;
END //
DELIMITER ;
DROP FUNCTION IF EXISTS JumlahSiswaBahasaJermanAngren;


select JumlahSiswaBahasaJermanAngren();

-----------------------------------------------------------------------------------------------------------------------------------------------------















