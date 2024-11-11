-- Menghapus database jika sudah ada
DROP DATABASE IF EXISTS bimble1;

-- Membuat database baru
CREATE DATABASE bimble1;
USE bimble1;

-- Tabel Karyawan
DROP TABLE IF EXISTS karyawan;
CREATE TABLE karyawan (
    kode_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    jabatan ENUM('keuangan', 'resepsionis', 'administrasi'),
    tugas TEXT,
    gaji DECIMAL(10,2)
);

-- Tabel Instruktur
DROP TABLE IF EXISTS instruktur;
CREATE TABLE instruktur (
    kode_instruktur INT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jumlah_modul INT DEFAULT 0,
    gaji_perjam DECIMAL(10,2) DEFAULT 100.00,
    status_hadir BOOLEAN DEFAULT TRUE,
    kode_karyawan INT,
    FOREIGN KEY (kode_karyawan) REFERENCES karyawan(kode_karyawan)
);

-- Tabel Mapel
DROP TABLE IF EXISTS mapel;
CREATE TABLE mapel (
    kode_mapel INT PRIMARY KEY AUTO_INCREMENT,
    nama_mapel VARCHAR(100) NOT NULL,
    harga_persemester DECIMAL(10,2) NOT NULL,
    status_aktif BOOLEAN DEFAULT TRUE
);

-- Tabel Modul
DROP TABLE IF EXISTS table_modul;
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
DROP TABLE IF EXISTS siswa_smp;
CREATE TABLE siswa_smp (
    kode_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    kode_kelas INT,
    kelas ENUM('7', '8', '9') NOT NULL,
    total_bayar DECIMAL(10,2),
    status_potongan BOOLEAN DEFAULT FALSE
);

-- Tabel Siswa SMA
DROP TABLE IF EXISTS siswa_sma;
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
DROP TABLE IF EXISTS kelas;
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
DROP TABLE IF EXISTS pembayaran_smp;
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
DROP TABLE IF EXISTS pembayaran_sma;
CREATE TABLE pembayaran_sma (
    kode_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran ENUM('lunas', 'cicil'),
    status_potongan BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa)
);

-- Tabel Keluhan SMP
DROP TABLE IF EXISTS keluhan_smp;
CREATE TABLE keluhan_smp (
    kode_keluhan INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    deskripsi_keluhan TEXT,
    tanggal_keluhan DATE,
    status_keluhan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa)
);

-- Tabel Keluhan SMA
DROP TABLE IF EXISTS keluhan_sma;
CREATE TABLE keluhan_sma (
    kode_keluhan INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    deskripsi_keluhan TEXT,
    tanggal_keluhan DATE,
    status_keluhan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa)
);

-- Tabel Pendaftaran Siswa Baru
DROP TABLE IF EXISTS pendaftaran_siswabaru;
CREATE TABLE pendaftaran_siswabarusmp (
    kode_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    tanggal_daftar DATE,
    program VARCHAR(50),
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa)
);
CREATE TABLE pendaftaran_siswabaruSMA (
    kode_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    tanggal_daftar DATE,
    program VARCHAR(50),
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa)
);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO siswa_smp (nama, kelas, total_bayar, status_potongan) VALUES
('Agnes', '7', 0.00, FALSE),
('Anisa', '8', 0.00, FALSE),
('Rosita', '7', 0.00, FALSE),
('Fahra', '9', 0.00, FALSE),
('Rachel', '7', 0.00, FALSE),
('Akbar', '8', 0.00, FALSE),
('Gabriella', '8', 0.00, FALSE),
('Misel', '7', 0.00, FALSE),
('Itari', '9', 0.00, FALSE),
('Kia', '8', 0.00, FALSE);

INSERT INTO siswa_sma (nama, kelas, jurusan, total_bayar, status_potongan) VALUES
('Meta', '12', 'IPA', 0.00, FALSE),
('Keyla', '10', 'IPS', 0.00, FALSE),
('Gina', '11', 'IPA', 0.00, FALSE),
('Adel', '12', 'IPS', 0.00, FALSE),
('Abel', '12', 'IPA', 0.00, FALSE),
('Daniel', '10', 'IPS', 0.00, FALSE),
('Elisa', '11', 'IPA', 0.00, FALSE),
('Debora', '11', 'IPS', 0.00, FALSE),
('Maria', '12', 'IPA', 0.00, FALSE),
('Juniati', '10', 'IPS', 0.00, FALSE);

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

INSERT INTO mapel (nama_mapel, harga_persemester, status_aktif) VALUES
('Matematika', 7000000.00, TRUE),
('Biologi', 7000000.00, TRUE),
('Kimia', 7000000.00, TRUE),
('Fisika', 7000000.00, TRUE),
('Bahasa Indonesia', 3700000.00, TRUE),
('Bahasa Inggris', 3700000.00, TRUE),
('Ekonomi', 3700000.00, TRUE),
('Seni Budaya', 3000000.00, TRUE),
('Pendidikan Agama', 3000000.00, TRUE),
('Olahraga', 3000000.00, TRUE);

INSERT INTO table_modul (kode_modul, nama_modul, kode_instruktur, deskripsi, tanggal_mulai, kode_mapel) VALUES
(1, 'Matematika Dasar', 1, 'Modul Matematika', '2024-01-01', 1),
(2, 'Biologi Umum', 2, 'Modul Biologi', '2024-01-10', 2),
(3, 'Kimia Dasar', 3, 'Modul Kimia', '2024-01-15', 3),
(4, 'Fisika Klasik', 4, 'Modul Fisika', '2024-01-20', 4),
(5, 'Bahasa Indonesia', 5, 'Modul Bahasa Indonesia', '2024-02-01', 5),
(6, 'Bahasa Inggris', 6, 'Modul Bahasa Inggris', '2024-02-05', 6),
(7, 'Ekonomi Mikro', 7, 'Modul Ekonomi', '2024-02-10', 7),
(8, 'Seni Budaya', 8, 'Modul Seni Budaya', '2024-02-15', 8),
(9, 'Pendidikan Agama', 9, 'Modul Agama', '2024-03-01', 9),
(10, 'Olahraga', 10, 'Modul Olahraga', '2024-03-05', 10);

-- Pendaftaran untuk Siswa SMP
INSERT INTO pendaftaran_siswabaru (kode_siswa, tanggal_daftar, program) VALUES
(1, '2024-01-01', 'Matematika'),
(1, '2024-01-02', 'Biologi'),
(1, '2024-01-03', 'Fisika'),
(2, '2024-01-01', 'Matematika'),
(2, '2024-01-02', 'Biologi'),
(2, '2024-01-03', 'Fisika'),
(3, '2024-01-01', 'Matematika'),
(3, '2024-01-02', 'Biologi'),
(3, '2024-01-03', 'Fisika'),
(4, '2024-01-01', 'Matematika'),
(4, '2024-01-02', 'Biologi'),
(4, '2024-01-03', 'Fisika'),
(5, '2024-01-01', 'Matematika'),
(5, '2024-01-02', 'Biologi'),
(5, '2024-01-03', 'Fisika'),
(6, '2024-01-01', 'Matematika'),
(6, '2024-01-02', 'Biologi'),
(6, '2024-01-03', 'Fisika'),
(7, '2024-01-01', 'Matematika'),
(7, '2024-01-02', 'Biologi'),
(7, '2024-01-03', 'Fisika'),
(8, '2024-01-01', 'Matematika'),
(8, '2024-01-02', 'Biologi'),
(8, '2024-01-03', 'Fisika'),
(9, '2024-01-01', 'Matematika'),
(9, '2024-01-02', 'Biologi'),
(9, '2024-01-03', 'Fisika'),
(10, '2024-01-01', 'Matematika'),
(10, '2024-01-02', 'Biologi'),
(10, '2024-01-03', 'Fisika');

-- Pendaftaran untuk Siswa SMA
INSERT INTO pendaftaran_siswabaru (kode_siswa, tanggal_daftar, program) VALUES
(1, '2024-01-01', 'Matematika'),
(1, '2024-01-02', 'Biologi'),
(1, '2024-01-03', 'Fisika'),
(2, '2024-01-01', 'Matematika'),
(2, '2024-01-02', 'Biologi'),
(2, '2024-01-03', 'Fisika'),
(3, '2024-01-01', 'Matematika'),
(3, '2024-01-02', 'Biologi'),
(3, '2024-01-03', 'Fisika'),
(4, '2024-01-01', 'Matematika'),
(4, '2024-01-02', 'Biologi'),
(4, '2024-01-03', 'Fisika'),
(5, '2024-01-01', 'Matematika'),
(5, '2024-01-02', 'Biologi'),
(5, '2024-01-03', 'Fisika'),
(6, '2024-01-01', 'Matematika'),
(6, '2024-01-02', 'Biologi'),
(6, '2024-01-03', 'Fisika'),
(7, '2024-01-01', 'Matematika'),
(7, '2024-01-02', 'Biologi'),
(7, '2024-01-03', 'Fisika'),
(8, '2024-01-01', 'Matematika'),
(8, '2024-01-02', 'Biologi'),
(8, '2024-01-03', 'Fisika'),
(9, '2024-01-01', 'Matematika'),
(9, '2024-01-02', 'Biologi'),
(9, '2024-01-03', 'Fisika'),
(10, '2024-01-01', 'Matematika'),
(10, '2024-01-02', 'Biologi'),
(10, '2024-01-03', 'Fisika');

INSERT INTO karyawan (nama, jabatan, tugas, gaji) VALUES
('Ayu', 'resepsionis', 'Penerimaan siswa baru', 3000000.00),
('Budi', 'keuangan', 'Mengelola keuangan dan pembayaran', 5000000.00),
('Cindy', 'administrasi', 'Pengelolaan data dan dokumen', 4000000.00),
('Dewi', 'resepsionis', 'Menyambut tamu dan penerimaan siswa', 3000000.00),
('Eka', 'keuangan', 'Membuat laporan keuangan bulanan', 4500000.00);

INSERT INTO pembayaran_smp (kode_siswa, kode_karyawan, jumlah_pembayaran, metode_pembayaran, status_potongan) VALUES
(1, 1, 5000000.00, 'lunas', TRUE),
(2, 2, 2500000.00, 'cicil', FALSE),
(3, 1, 5000000.00, 'lunas', TRUE),
(4, 3, 2500000.00, 'cicil', FALSE),
(5, 2, 5000000.00, 'lunas', TRUE),
(6, 4, 2500000.00, 'cicil', FALSE),
(7, 1, 5000000.00, 'lunas', TRUE),
(8, 5, 2500000.00, 'cicil', FALSE),
(9, 2, 5000000.00, 'lunas', TRUE),
(10, 3, 2500000.00, 'cicil', FALSE);

INSERT INTO pembayaran_sma (kode_siswa, jumlah_pembayaran, metode_pembayaran, status_potongan) VALUES
(1, 1000000.00, 'lunas', FALSE),
(2, 500000.00, 'cicil', TRUE),
(3, 750000.00, 'lunas', FALSE),
(4, 250000.00, 'cicil', TRUE),
(5, 1200000.00, 'lunas', FALSE),
(6, 600000.00, 'cicil', FALSE),
(7, 800000.00, 'lunas', TRUE),
(8, 450000.00, 'cicil', FALSE),
(9, 950000.00, 'lunas', FALSE),
(10, 350000.00, 'cicil', TRUE);

INSERT INTO keluhan_smp (kode_siswa, deskripsi_keluhan, tanggal_keluhan, status_keluhan) VALUES
(1, 'Materi pelajaran sulit dipahami', '2023-10-01', 'Pending'),
(2, 'Kelas terlalu ramai sehingga tidak fokus', '2023-10-02', 'Pending'),
(3, 'Instruktur sering terlambat', '2023-10-03', 'Ditangani'),
(4, 'Ruang kelas terlalu panas', '2023-10-04', 'Pending'),
(5, 'Waktu belajar kurang efektif', '2023-10-05', 'Pending'),
(6, 'Tugas terlalu banyak dalam satu minggu', '2023-10-06', 'Ditangani'),
(7, 'Kurang waktu diskusi dengan instruktur', '2023-10-07', 'Pending'),
(8, 'Sarana belajar kurang lengkap', '2023-10-08', 'Pending'),
(9, 'Tidak ada latihan soal untuk ujian', '2023-10-09', 'Ditangani'),
(10, 'Instruktur tidak hadir pada jadwal seharusnya', '2023-10-10', 'Pending');

INSERT INTO keluhan_sma (kode_siswa, deskripsi_keluhan, tanggal_keluhan, status_keluhan) VALUES
(1, 'Instruktur kurang jelas dalam menjelaskan materi', '2023-09-01', 'Pending'),
(2, 'Fasilitas kelas kurang memadai', '2023-09-02', 'Ditangani'),
(3, 'Jadwal kelas sering berubah', '2023-09-03', 'Pending'),
(4, 'Materi yang disampaikan terlalu cepat', '2023-09-04', 'Pending'),
(5, 'Kurang waktu untuk konsultasi dengan instruktur', '2023-09-05', 'Pending'),
(6, 'Tugas tambahan terlalu banyak', '2023-09-06', 'Ditangani'),
(7, 'Kondisi ruangan kurang nyaman', '2023-09-07', 'Pending'),
(8, 'Tidak ada latihan soal khusus untuk ujian', '2023-09-08', 'Ditangani'),
(9, 'Instruktur tidak hadir tanpa pemberitahuan', '2023-09-09', 'Pending'),
(10, 'Kelas terlalu padat dan pengap', '2023-09-10', 'Pending');

INSERT INTO pendaftaran_siswabaru (kode_siswa, tanggal_daftar, program) VALUES
(1, '2023-08-01', 'Bimbingan Belajar Matematika'),
(2, '2023-08-15', 'Bimbingan Belajar Fisika'),
(3, '2023-09-10', 'Bimbingan Belajar Kimia'),
(4, '2023-10-05', 'Bimbingan Belajar Biologi'),
(5, '2023-11-20', 'Bimbingan Belajar Bahasa Inggris'),
(6, '2023-12-01', 'Bimbingan Belajar Matematika'),
(7, '2023-12-15', 'Bimbingan Belajar Fisika'),
(8, '2024-01-01', 'Bimbingan Belajar Kimia'),
(9, '2024-01-10', 'Bimbingan Belajar Biologi'),
(10, '2024-02-01', 'Bimbingan Belajar Bahasa Inggris');
INSERT INTO pendaftaran_siswabaruSMA (kode_siswa, tanggal_daftar, program) VALUES
(1, '2023-08-01', 'Bimbingan Belajar Matematika'),
(2, '2023-08-15', 'Bimbingan Belajar Fisika'),
(3, '2023-09-10', 'Bimbingan Belajar Kimia'),
(4, '2023-10-05', 'Bimbingan Belajar Biologi'),
(5, '2023-11-20', 'Bimbingan Belajar Bahasa Inggris'),
(6, '2023-12-01', 'Bimbingan Belajar Matematika'),
(7, '2023-12-15', 'Bimbingan Belajar Fisika'),
(8, '2024-01-01', 'Bimbingan Belajar Kimia'),
(9, '2024-01-10', 'Bimbingan Belajar Biologi'),
(10, '2024-02-01', 'Bimbingan Belajar Bahasa Inggris');
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
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE GetModulByFaris()
BEGIN
    SELECT 
        tm.kode_modul, 
        tm.nama_modul, 
        tm.deskripsi, 
        tm.tanggal_mulai, 
        m.nama_mapel
    FROM table_modul AS tm
    JOIN instruktur AS i ON tm.kode_instruktur = i.kode_instruktur
    JOIN mapel AS m ON tm.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris';
END //

DELIMITER ;
CALL GetModulByFaris();

DELIMITER //

CREATE PROCEDURE GetModulByMapelIPA()
BEGIN
    SELECT 
        tm.kode_modul, 
        tm.nama_modul, 
        tm.deskripsi, 
        tm.tanggal_mulai, 
        m.nama_mapel
    FROM table_modul AS tm
    JOIN mapel AS m ON tm.kode_mapel = m.kode_mapel
    WHERE m.nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika');
END //

DELIMITER ;
CALL GetModulByMapelIPA();

DELIMITER //

CREATE PROCEDURE GetInstrukturFarisMapelIPA()
BEGIN
    SELECT 
        i.kode_instruktur,
        i.nama AS nama_instruktur,
        i.jumlah_modul,
        i.gaji_perjam,
        m.nama_mapel
    FROM instruktur AS i
    JOIN table_modul AS tm ON i.kode_instruktur = tm.kode_instruktur
    JOIN mapel AS m ON tm.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' 
      AND m.nama_mapel IN ('Matematika', 'Fisika', 'Kimia');
END //

DELIMITER ;
CALL GetInstrukturFarisMapelIPA();

DELIMITER //

CREATE PROCEDURE GetSiswaSMAByInstrukturFaris()
BEGIN
    SELECT 
        s.kode_siswa,
        s.nama AS nama_siswa,
        s.kelas,
        s.jurusan,
        m.nama_mapel,
        i.nama AS nama_instruktur
    FROM siswa_sma AS s
    JOIN pendaftaran_siswabaruSMA AS p ON s.kode_siswa = p.kode_siswa
    JOIN table_modul AS tm ON p.program = tm.nama_modul
    JOIN instruktur AS i ON tm.kode_instruktur = i.kode_instruktur
    JOIN mapel AS m ON tm.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris';
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS GetSiswaSMAByInstrukturFaris ;

CALL GetSiswaSMAByInstrukturFaris();

DELIMITER //

CREATE PROCEDURE LihatDataSiswa()
BEGIN
    SELECT 
        s.nama AS nama_siswa,
        k.nama_kelas,
        m.nama_mapel,
        i.nama AS nama_instruktur,
        i.gaji_perjam AS gaji_instruktur,
        i.status_hadir AS instruktur_hadir
    FROM 
        siswa_smp AS s
    JOIN 
        kelas AS k ON s.kode_kelas = k.kode_kelas
    JOIN 
        mapel AS m ON k.kode_mapel = m.kode_mapel
    JOIN 
        instruktur AS i ON k.kode_instruktur = i.kode_instruktur
    WHERE 
        m.status_aktif = TRUE;
END //

DELIMITER ;
call LihatDataSiswa();

DELIMITER //

CREATE PROCEDURE TampilSiswaFarisMatematika()
BEGIN
    SELECT 
        s_smp.kode_siswa AS kode_siswa_smp,
        s_smp.nama AS nama_siswa_smp,
        'SMP' AS jenjang,
        i.nama AS nama_instruktur,
        m.nama_mapel
    FROM 
        siswa_smp s_smp
    JOIN 
        kelas k ON s_smp.kode_kelas = k.kode_kelas
    JOIN 
        instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN 
        mapel m ON k.kode_mapel = m.kode_mapel
    WHERE 
        i.nama = 'Faris'
        AND m.nama_mapel = 'Matematika'

    UNION

    SELECT 
        s_sma.kode_siswa AS kode_siswa_sma,
        s_sma.nama AS nama_siswa_sma,
        'SMA' AS jenjang,
        i.nama AS nama_instruktur,
        m.nama_mapel
    FROM 
        siswa_sma s_sma
    JOIN 
        kelas k ON s_sma.kode_kelas = k.kode_kelas
    JOIN 
        instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN 
        mapel m ON k.kode_mapel = m.kode_mapel
    WHERE 
        i.nama = 'Faris'
        AND m.nama_mapel = 'Matematika';
END //

DELIMITER ;
call TampilSiswaFarisMatematika();

DELIMITER //

CREATE PROCEDURE HapusSiswaSMPFarisMatematika()
BEGIN
    DELETE s_smp
    FROM 
        siswa_smp s_smp
    JOIN 
        kelas k ON s_smp.kode_kelas = k.kode_kelas
    JOIN 
        instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN 
        mapel m ON k.kode_mapel = m.kode_mapel
    WHERE 
        i.nama = 'Faris'
        AND m.nama_mapel = 'Matematika';
END //

DELIMITER ;
CALL HapusSiswaSMPFarisMatematika();

DELIMITER //

CREATE PROCEDURE UpdateInstrukturFarisToAngreni()
BEGIN
    -- Update kode_instruktur pada kelas yang diampu oleh Faris dengan mata pelajaran Fisika
    UPDATE kelas k
    JOIN instruktur i_faris ON k.kode_instruktur = i_faris.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    JOIN instruktur i_angreni ON i_angreni.nama = 'Angreni'
    SET k.kode_instruktur = i_angreni.kode_instruktur
    WHERE 
        i_faris.nama = 'Faris'
        AND m.nama_mapel = 'Fisika';
END //

DELIMITER ;
call UpdateInstrukturFarisToAngreni();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE FUNCTION JumlahSiswaDiajariFaris() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;

    SELECT 
        (SELECT COUNT(*)
         FROM kelas k
         JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
         JOIN siswa_smp s_smp ON s_smp.kode_kelas = k.kode_kelas
         WHERE i.nama = 'Faris')
        +
        (SELECT COUNT(*)
         FROM kelas k
         JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
         JOIN siswa_sma s_sma ON s_sma.kode_kelas = k.kode_kelas
         WHERE i.nama = 'Faris')
    INTO jumlah;
    
    RETURN jumlah;
END //

DELIMITER ;

SELECT JumlahSiswaDiajariFaris();

DELIMITER //

CREATE FUNCTION JumlahSiswaSMPKelas9DiajariIrgi() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;

    SELECT COUNT(*)
    INTO jumlah
    FROM siswa_smp s_smp
    JOIN kelas k ON s_smp.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE 
        i.nama = 'Irgi'
        AND s_smp.kelas = '9';
    
    RETURN jumlah;
END //

DELIMITER ;
SELECT JumlahSiswaSMPKelas9DiajariIrgi();

DELIMITER //

CREATE FUNCTION JumlahSiswaSMAKelas12BiologiAngren() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;

    SELECT COUNT(*)
    INTO jumlah
    FROM siswa_sma s_sma
    JOIN kelas k ON s_sma.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE 
        i.nama = 'Angren'
        AND s_sma.kelas = '12'
        AND m.nama_mapel = 'Biologi';
    
    RETURN jumlah;
END //

DELIMITER ;
SELECT JumlahSiswaSMAKelas12BiologiAngren();
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW view_modul_by_faris AS
SELECT * 
FROM table_modul 
WHERE kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris');

CREATE VIEW view_modul_ipa AS
SELECT * 
FROM table_modul 
WHERE kode_mapel IN (
    SELECT kode_mapel 
    FROM mapel 
    WHERE nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika')
);

CREATE VIEW view_faris_modul_ipa AS
SELECT * 
FROM table_modul 
WHERE kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
  AND kode_mapel IN (
      SELECT kode_mapel 
      FROM mapel 
      WHERE nama_mapel IN ('Matematika', 'Fisika', 'Kimia')
  );

CREATE VIEW view_siswa_sma_by_faris AS
SELECT siswa_sma.* 
FROM siswa_sma 
JOIN kelas ON siswa_sma.kode_kelas = kelas.kode_kelas
WHERE kelas.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris');

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

SELECT * FROM view_modul_by_faris;

SELECT * FROM view_modul_ipa;

SELECT * FROM view_faris_modul_ipa;

SELECT * FROM view_siswa_sma_by_faris;
SELECT * FROM view_siswa_smp_sma_matematika;
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


















