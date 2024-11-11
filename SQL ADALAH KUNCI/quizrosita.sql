use bimbelku;
create database bimbelku;
drop database bimbelku;


CREATE TABLE instruktur (
    kode_instruktur INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    jumlah_modul INT DEFAULT 0,
    gaji_perjam DECIMAL(10,2) DEFAULT 100.00,
    status_hadir BOOLEAN DEFAULT TRUE
);


CREATE TABLE siswa_smp (
    kode_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    kelas ENUM('7', '8', '9') NOT NULL,
    total_bayar DECIMAL(10,2),
    status_potongan BOOLEAN DEFAULT FALSE
);


CREATE TABLE siswa_sma (
    kode_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    kelas ENUM('10', '11', '12') NOT NULL,
    jurusan ENUM('IPA', 'IPS') NOT NULL,
    total_bayar DECIMAL(10,2),
    status_potongan BOOLEAN DEFAULT FALSE
);


CREATE TABLE mapel (
    kode_mapel INT PRIMARY KEY AUTO_INCREMENT,
    nama_mapel VARCHAR(100) NOT NULL,
    harga_persemester DECIMAL(10,2) NOT NULL,
    status_aktif BOOLEAN DEFAULT TRUE
);


CREATE TABLE kelas (
    kode_kelas INT PRIMARY KEY AUTO_INCREMENT,
    kode_mapel INT,
    kapasitas INT CHECK(kapasitas IN (10, 15)),
    jumlah_siswa INT DEFAULT 0,
    jadwal DATETIME,
    kode_instruktur INT,
    FOREIGN KEY (kode_mapel) REFERENCES mapel(kode_mapel),
    FOREIGN KEY (kode_instruktur) REFERENCES instruktur(kode_instruktur)
);


CREATE TABLE siswa_mapel_smp (
    kode_siswa INT,
    kode_mapel INT,
    kode_kelas INT,
    PRIMARY KEY (kode_siswa, kode_mapel, kode_kelas),
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa),
    FOREIGN KEY (kode_mapel) REFERENCES mapel(kode_mapel),
    FOREIGN KEY (kode_kelas) REFERENCES kelas(kode_kelas)
);


CREATE TABLE siswa_mapel_sma (
    kode_siswa INT,
    kode_mapel INT,
    kode_kelas INT,
    PRIMARY KEY (kode_siswa, kode_mapel, kode_kelas),
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa),
    FOREIGN KEY (kode_mapel) REFERENCES mapel(kode_mapel),
    FOREIGN KEY (kode_kelas) REFERENCES kelas(kode_kelas)
);
CREATE TABLE pembayaran_smp (
    kode_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    kode_karyawan int,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran ENUM('lunas', 'cicil'),
    status_potongan BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa),
    FOREIGN KEY (kode_karyawan) REFERENCES karyawan(kode_karyawan)
);

CREATE TABLE pembayaran_sma (
    kode_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_karyawan int,
    kode_siswa INT,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran ENUM('lunas', 'cicil'),
    status_potongan BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa),
    FOREIGN KEY (kode_karyawan) REFERENCES karyawan(kode_karyawan)
);

CREATE TABLE karyawan (
    kode_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    jabatan ENUM('keuangan', 'resepsionis', 'administrasi'),
    tugas TEXT,
    gaji DECIMAL(10,2)
);

CREATE TABLE keluhan_smp (
    kode_keluhan INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    deskripsi_keluhan TEXT,
    tanggal_keluhan DATE,
    status_keluhan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa)
);
drop table keluhan_smp;
CREATE TABLE keluhan_sma (
    kode_keluhan INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    deskripsi_keluhan TEXT,
    tanggal_keluhan DATE,
    status_keluhan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_sma(kode_siswa)
);
CREATE TABLE IF NOT EXISTS pendaftaran_siswabaru (
    kode_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    kode_siswa INT,
    tanggal_pendaftaran DATE,
    status_pendaftaran VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (kode_siswa) REFERENCES siswa_smp(kode_siswa)
);

CREATE TABLE modul (
    kode_modul INT PRIMARY KEY AUTO_INCREMENT,
    nama_modul VARCHAR(100) NOT NULL,
    kode_instruktur INT,
    kode_mapel INT,
    jumlah_halaman INT DEFAULT 0,
    tanggal_pembuatan DATE,
    status_aktif BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (kode_instruktur) REFERENCES instruktur(kode_instruktur),
    FOREIGN KEY (kode_mapel) REFERENCES mapel(kode_mapel)
);

INSERT INTO siswa_smp (nama, kelas, total_bayar, status_potongan) VALUES
('Ani', '7', 500000, TRUE),
('Budi', '8', 550000, FALSE),
('Cici', '9', 600000, TRUE),
('Dede', '7', 450000, FALSE),
('Eka', '8', 530000, TRUE),
('Fani', '9', 580000, FALSE),
('Gita', '7', 520000, TRUE),
('Hani', '8', 500000, FALSE),
('Iwan', '9', 600000, TRUE),
('Joko', '7', 480000, TRUE);

INSERT INTO siswa_sma (nama, kelas, jurusan, total_bayar, status_potongan) VALUES
('Kiki', '10', 'IPA', 750000, FALSE),
('Lina', '11', 'IPS', 700000, TRUE),
('Mira', '12', 'IPA', 800000, FALSE),
('Nisa', '10', 'IPS', 720000, TRUE),
('Omar', '11', 'IPA', 740000, FALSE),
('Putri', '12', 'IPS', 780000, TRUE),
('Qori', '10', 'IPA', 760000, FALSE),
('Rina', '11', 'IPS', 750000, TRUE),
('Siti', '12', 'IPA', 820000, FALSE),
('Tomi', '10', 'IPS', 700000, TRUE);

INSERT INTO mapel (nama_mapel, harga_persemester, status_aktif) VALUES
('Matematika', 1000000, TRUE),
('Bahasa jerman', 900000, TRUE),
('IPA', 1100000, TRUE),
('IPS', 950000, TRUE),
('Bahasa Inggris', 1000000, TRUE),
('Fisika', 1150000, TRUE),
('Kimia', 1200000, TRUE),
('Biologi', 1100000, TRUE),
('Ekonomi', 950000, TRUE),
('Sejarah', 900000, TRUE);

INSERT INTO instruktur (nama, jumlah_modul, gaji_perjam, status_hadir) VALUES
('Faris', 5, 100.00, TRUE),
('Irgi', 3, 100.00, TRUE),
('Angreni', 4, 100.00, TRUE);

INSERT INTO kelas (kode_kelas, kode_mapel, kapasitas, jumlah_siswa, jadwal, kode_instruktur) VALUES
(17,1, 10, 8, '2024-01-10 10:00:00', 1),
(18,2, 15, 10, '2024-01-11 11:00:00', 2),
(19,3, 10, 7, '2024-01-12 12:00:00', 3),
(20,4, 15, 12, '2024-01-13 13:00:00', 1),
(21,5, 10, 9, '2024-01-14 14:00:00', 2),
(22,6, 15, 11, '2024-01-15 15:00:00', 3),
(23,7, 10, 8, '2024-01-16 16:00:00', 1),
(24,8, 15, 10, '2024-01-17 17:00:00', 2),
(25, 9, 10, 9, '2024-01-18 18:00:00', 3),
(26,10, 15, 11, '2024-01-19 19:00:00', 1);
drop table kelas;
INSERT INTO karyawan (nama, jabatan, tugas, gaji) VALUES
('Pak Anton', 'keuangan', 'Mengelola keuangan bimbel', 4000000),
('Bu Diah', 'resepsionis', 'Menerima tamu dan pendaftaran', 3000000),
('Pak Imam', 'administrasi', 'Mengelola administrasi siswa', 3500000),
('Pak Joko', 'keuangan', 'Mengatur anggaran bimbel', 4200000),
('Bu Rina', 'resepsionis', 'Melayani informasi kelas', 2900000),
('Pak Soleh', 'administrasi', 'Menyimpan data siswa', 3600000),
('Bu Siti', 'keuangan', 'Mencatat pembayaran siswa', 4100000),
('Pak Budi', 'resepsionis', 'Mengatur jadwal kelas', 3100000),
('Pak Roni', 'administrasi', 'Mencatat keluhan siswa', 3700000),
('Bu Mega', 'keuangan', 'Membuat laporan bulanan', 4300000);

INSERT INTO pembayaran_smp (kode_siswa, kode_karyawan, jumlah_pembayaran, metode_pembayaran, status_potongan) VALUES
(1, 1, 500000, 'lunas', TRUE),
(2, 2, 550000, 'cicil', FALSE),
(3, 3, 600000, 'lunas', TRUE),
(4, 4, 450000, 'cicil', FALSE),
(5, 5, 530000, 'lunas', TRUE),
(6, 6, 580000, 'cicil', FALSE),
(7, 7, 520000, 'lunas', TRUE),
(8, 8, 500000, 'cicil', FALSE),
(9, 9, 600000, 'lunas', TRUE),
(10, 10, 480000, 'cicil', TRUE);

INSERT INTO pembayaran_sma (kode_karyawan, kode_siswa, jumlah_pembayaran, metode_pembayaran, status_potongan) VALUES
(1, 1, 750000, 'lunas', FALSE),
(2, 2, 700000, 'cicil', TRUE),
(3, 3, 800000, 'lunas', FALSE),
(4, 4, 720000, 'cicil', TRUE),
(5, 5, 740000, 'lunas', FALSE),
(6, 6, 780000, 'cicil', TRUE),
(7, 7, 760000, 'lunas', FALSE),
(8, 8, 750000, 'cicil', TRUE),
(9, 9, 820000, 'lunas', FALSE),
(10, 10, 700000, 'cicil', TRUE);


INSERT INTO keluhan_smp (kode_siswa, deskripsi_keluhan, tanggal_keluhan, status_keluhan) VALUES
(1, 'Kesulitan memahami materi', '2024-01-05', 'Pending'),
(2, 'Instruktur terlalu cepat mengajar', '2024-01-10', 'Resolved'),
(3, 'Ruangan terlalu dingin', '2024-01-15', 'Pending'),
(4, 'Jadwal tidak sesuai', '2024-01-20', 'Pending'),
(5, 'Kekurangan modul', '2024-01-25', 'Resolved'),
(6, 'Terlambat mulai kelas', '2024-01-30', 'Pending'),
(7, 'Kesulitan dengan PR', '2024-02-04', 'Resolved'),
(8, 'Suara instruktur kurang jelas', '2024-02-09', 'Pending'),
(9, 'Butuh tambahan kelas', '2024-02-14', 'Pending'),
(10, 'Ruangan terlalu bising', '2024-02-19', 'Resolved');

INSERT INTO keluhan_sma (kode_siswa, deskripsi_keluhan, tanggal_keluhan, status_keluhan) VALUES
(1, 'Kesulitan memahami materi', '2024-01-05', 'Pending'),
(2, 'Instruktur terlalu cepat mengajar', '2024-01-10', 'Resolved'),
(3, 'Ruangan terlalu dingin', '2024-01-15', 'Pending'),
(4, 'Jadwal tidak sesuai', '2024-01-20', 'Pending'),
(5, 'Kekurangan modul', '2024-01-25', 'Resolved'),
(6, 'Terlambat mulai kelas', '2024-01-30', 'Pending'),
(7, 'Kesulitan dengan PR', '2024-02-04', 'Resolved'),
(8, 'Suara instruktur kurang jelas', '2024-02-09', 'Pending'),
(9, 'Butuh tambahan kelas', '2024-02-14', 'Pending'),
(10, 'Ruangan terlalu bising', '2024-02-19', 'Resolved');



INSERT INTO siswa_mapel_smp (kode_siswa, kode_mapel, kode_kelas) VALUES
(1, 1, 17),
(2, 2, 18),
(3, 3, 19),
(4, 4, 20),
(5, 5, 21),
(6, 6, 22),
(7, 7, 23),
(8, 8, 24),
(9, 9, 25),
(10, 10, 26);


INSERT INTO siswa_mapel_sma (kode_siswa, kode_mapel, kode_kelas) VALUES
(1, 1, 17),
(2, 2, 18),
(3, 3, 19),
(4, 4, 20),
(5, 5, 21),
(6, 6, 22),
(7, 7, 23),
(8, 8, 24),
(9, 9, 25),
(10, 10, 26);


INSERT INTO pendaftaran_siswabaru (kode_siswa, tanggal_pendaftaran, status_pendaftaran) VALUES
(1, '2024-10-01', 'Pending'),
(2, '2024-10-02', 'Diterima'),
(3, '2024-10-03', 'Ditolak'),
(4, '2024-10-04', 'Pending'),
(5, '2024-10-05', 'Diterima'),
(6, '2024-10-06', 'Ditolak'),
(7, '2024-10-07', 'Pending'),
(8, '2024-10-08', 'Diterima'),
(9, '2024-10-09', 'Ditolak'),
(10, '2024-10-10', 'Pending');

INSERT INTO modul (nama_modul, kode_instruktur, kode_mapel, jumlah_halaman, tanggal_pembuatan, status_aktif) VALUES
('Modul Matematika Dasar', 1, 1, 120, '2024-01-01', TRUE),
('Modul Bahasa jerman', 2, 2, 110, '2024-02-01', TRUE),
('Modul IPA Lanjutan', 3, 3, 150, '2024-03-01', TRUE),
('Modul IPS', 1, 4, 140, '2024-04-01', FALSE),
('Modul Bahasa Inggris', 2, 5, 130, '2024-05-01', TRUE),
('Modul Fisika Dasar', 3, 6, 160, '2024-06-01', FALSE),
('Modul Kimia', 1, 7, 170, '2024-07-01', TRUE),
('Modul Biologi', 2, 8, 180, '2024-08-01', TRUE),
('Modul Ekonomi', 3, 9, 100, '2024-09-01', FALSE),
('Modul Sejarah', 1, 10, 90, '2024-10-01', TRUE);

SELECT * FROM instruktur;
SELECT * FROM siswa_smp;
SELECT * FROM siswa_sma;
SELECT * FROM mapel;
SELECT * FROM kelas;
SELECT * FROM siswa_mapel_smp;
SELECT * FROM siswa_mapel_sma;
SELECT * FROM pembayaran_smp;
SELECT * FROM pembayaran_sma;
SELECT * FROM karyawan;
SELECT * FROM keluhan_smp;
SELECT * FROM keluhan_sma;
SELECT * FROM pendaftaran_siswabaru;
SELECT * FROM modul;

DROP TABLE IF EXISTS siswa_mapel_smp;
DROP TABLE IF EXISTS siswa_mapel_sma;
DROP TABLE IF EXISTS pembayaran_smp;
DROP TABLE IF EXISTS pembayaran_sma;
DROP TABLE IF EXISTS keluhan_smp;
DROP TABLE IF EXISTS keluhan_sma;
DROP TABLE IF EXISTS pendaftaran_siswabaru;
DROP TABLE IF EXISTS modul;
DROP TABLE IF EXISTS kelas;
DROP TABLE IF EXISTS siswa_smp;
DROP TABLE IF EXISTS siswa_sma;
DROP TABLE IF EXISTS instruktur;
DROP TABLE IF EXISTS mapel;
DROP TABLE IF EXISTS karyawan;
----------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE insert_siswa_smp(
    IN p_nama VARCHAR(100),
    IN p_kelas ENUM('7', '8', '9'),
    IN p_total_bayar DECIMAL(10,2),
    IN p_status_potongan BOOLEAN
)
BEGIN
    INSERT INTO siswa_smp (nama, kelas, total_bayar, status_potongan)
    VALUES (p_nama, p_kelas, p_total_bayar, p_status_potongan);
END //

DELIMITER ;
CALL insert_siswa_smp('Andi', '8', 0.00, FALSE);

DELIMITER //

CREATE PROCEDURE update_siswa_smp(
    IN p_kode_siswa INT,
    IN p_nama VARCHAR(100),
    IN p_kelas ENUM('7', '8', '9'),
    IN p_total_bayar DECIMAL(10,2),
    IN p_status_potongan BOOLEAN
)
BEGIN
    UPDATE siswa_smp
    SET 
        nama = p_nama,
        kelas = p_kelas,
        total_bayar = p_total_bayar,
        status_potongan = p_status_potongan
    WHERE kode_siswa = p_kode_siswa;
END //

DELIMITER ;
DROP PROCEDURE update_siswa_smp;
CALL update_siswa_smp(1, 'Nama Baru', '9', 6000000.00, TRUE);

DELIMITER //

CREATE PROCEDURE insert_pendaftaran_siswabaru(
    IN p_kode_siswa INT,
    IN p_tanggal_pendaftaran DATE,
    IN p_status_pendaftaran VARCHAR(20)
)
BEGIN
    INSERT INTO pendaftaran_siswabaru (kode_siswa, tanggal_pendaftaran, status_pendaftaran)
    VALUES (p_kode_siswa, p_tanggal_pendaftaran, p_status_pendaftaran);
END //

DELIMITER ;
DROP PROCEDURE insert_pendaftaran_siswabaru;
CALL insert_pendaftaran_siswabaru(1, '2024-01-01', 'Diterima');

DELIMITER //

CREATE PROCEDURE select_pembayaran_sma_ipa_12()
BEGIN
    SELECT p.kode_pembayaran, s.nama, s.kelas, s.jurusan, p.jumlah_pembayaran, p.metode_pembayaran, p.status_potongan
    FROM pembayaran_sma p
    JOIN siswa_sma s ON p.kode_siswa = s.kode_siswa
    WHERE s.kelas = '12' AND s.jurusan = 'IPA';
END //

DELIMITER ;
DROP PROCEDURE select_pembayaran_sma_ipa_12;
CALL select_pembayaran_sma_ipa_12();
-------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE menampilkan_modul_yang_dibuat_faris()
BEGIN
    SELECT * 
    FROM modul 
    WHERE kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris');
END //

DELIMITER ;
DROP PROCEDURE menampilkan_modul_yang_dibuat_faris;
CALL menampilkan_modul_yang_dibuat_faris();

DELIMITER //

CREATE PROCEDURE menampilkan_modul_khusus_mapel_ipa()
BEGIN
    SELECT * 
    FROM modul 
    WHERE kode_mapel IN (
        SELECT kode_mapel 
        FROM mapel 
        WHERE nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika')
    );
END //

DELIMITER ;
DROP PROCEDURE menampilkan_modul_khusus_mapel_ipa;
CALL menampilkan_modul_khusus_mapel_ipa();

DELIMITER //

CREATE PROCEDURE menampilkan_data_faris_mengajar_mapel_mtk_fisika_kimia()
BEGIN
    SELECT i.kode_instruktur, i.nama, m.nama_mapel
    FROM instruktur i
    JOIN kelas k ON i.kode_instruktur = k.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel IN ('Matematika', 'Fisika', 'Kimia');
END //

DELIMITER ;
DROP PROCEDURE menampilkan_data_faris_mengajar_mapel_mtk_fisika_kimia;
CALL menampilkan_data_faris_mengajar_mapel_mtk_fisika_kimia();

DELIMITER //

CREATE PROCEDURE menampilkan_data_siswa_sma_diajar_faris()
BEGIN
    SELECT s.kode_siswa, s.nama, s.kelas, s.jurusan
    FROM siswa_sma s
    JOIN siswa_mapel_sma sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';
END //

DELIMITER ;
DROP PROCEDURE   menampilkan_data_siswa_sma_diajar_faris;
CALL  menampilkan_data_siswa_sma_diajar_faris();

DELIMITER //

CREATE PROCEDURE menampilkan_siswa_sma_smp_diajar_faris()
BEGIN
    SELECT 'SMP' AS school_level, s.kode_siswa, s.nama, s.kelas
    FROM siswa_smp s
    JOIN siswa_mapel_smp sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika'
    
    UNION ALL
    
    SELECT 'SMA' AS school_level, s.kode_siswa, s.nama, s.kelas
    FROM siswa_sma s
    JOIN siswa_mapel_sma sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';
END //

DELIMITER ;
DROP PROCEDURE  menampilkan_siswa_sma_smp_diajar_faris;
CALL menampilkan_siswa_sma_smp_diajar_faris();


DELIMITER //

DELIMITER //

DELIMITER //

CREATE PROCEDURE delete_siswa_smp_diajar_faris_mapel_mtk()
BEGIN
    -- Step 1: Create a temporary table to hold kode_siswa of target students
    CREATE TEMPORARY TABLE temp_siswa AS
    SELECT s.kode_siswa
    FROM siswa_smp s
    JOIN siswa_mapel_smp sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Matematika';

    -- Step 2: Delete from keluhan_smp for these students
    DELETE FROM keluhan_smp
    WHERE kode_siswa IN (SELECT kode_siswa FROM temp_siswa);

    -- Step 3: Delete from pembayaran_smp for these students
    DELETE FROM pembayaran_smp
    WHERE kode_siswa IN (SELECT kode_siswa FROM temp_siswa);

    -- Step 4: Delete from pendaftaran_siswabaru for these students
    DELETE FROM pendaftaran_siswabaru
    WHERE kode_siswa IN (SELECT kode_siswa FROM temp_siswa);

    -- Step 5: Delete from siswa_mapel_smp for these students
    DELETE FROM siswa_mapel_smp
    WHERE kode_siswa IN (SELECT kode_siswa FROM temp_siswa);

    -- Step 6: Delete from siswa_smp
    DELETE FROM siswa_smp
    WHERE kode_siswa IN (SELECT kode_siswa FROM temp_siswa);

    -- Step 7: Drop the temporary table
    DROP TEMPORARY TABLE temp_siswa;
END //

DELIMITER ;
drop table  temp_siswa;
DROP PROCEDURE delete_siswa_smp_diajar_faris_mapel_mtk;
CALL delete_siswa_smp_diajar_faris_mapel_mtk();


DELIMITER //

CREATE PROCEDURE mengubah_faris_menjadi_angrein_mapel_fisika()
BEGIN
    UPDATE kelas k
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    SET k.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Angreni')
    WHERE i.nama = 'Faris' AND m.nama_mapel = 'Fisika';
END //

DELIMITER ;
DROP PROCEDURE mengubah_faris_menjadi_angrein_mapel_fisika;
CALL  mengubah_faris_menjadi_angrein_mapel_fisika();

------------------------------------------------------------------------
DELIMITER //

CREATE FUNCTION menampilkan_semua_siswa_yang_diajar_faris()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE menghitung_siswa INT;

    SELECT COUNT(DISTINCT s.kode_siswa) INTO menghitung_siswa
    FROM siswa_smp s
    JOIN siswa_mapel_smp sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Faris';

    RETURN menghitung_siswa;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION menampilkan_siswa_smp_kls9_diajar_irgi()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE menghitung_siswa INT;

    SELECT COUNT(DISTINCT s.kode_siswa) INTO menghitung_siswa
    FROM siswa_smp s
    JOIN siswa_mapel_smp sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    WHERE i.nama = 'Irgi' AND s.kelas = '9';

    RETURN menghitung_siswa;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION tampilkanyangmengikutibahasajerman()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE menghitung_siswa INT;

    SELECT COUNT(DISTINCT s.kode_siswa) INTO menghitung_siswa
    FROM siswa_smp s
    JOIN siswa_mapel_smp sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Angren' AND m.nama_mapel = 'Bahasa Jerman';

    RETURN menghitung_siswa;
END //

DELIMITER ;
DELIMITER //

CREATE FUNCTION menampilkan_siswaa_sma_kls12_mapel_biologi_diajar_angren()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE menghitung_siswa INT;

    SELECT COUNT(DISTINCT s.kode_siswa) INTO student_count
    FROM siswa_sma s
    JOIN siswa_mapel_sma sm ON s.kode_siswa = sm.kode_siswa
    JOIN kelas k ON sm.kode_kelas = k.kode_kelas
    JOIN instruktur i ON k.kode_instruktur = i.kode_instruktur
    JOIN mapel m ON k.kode_mapel = m.kode_mapel
    WHERE i.nama = 'Angren' AND s.kelas = '12' AND m.nama_mapel = 'Biologi';

    RETURN menghitung_siswa;
END //

DELIMITER ;

SELECT menampilkan_semua_siswa_yang_diajar_faris();  
SELECT menampilkan_siswa_smp_kls9_diajar_irgi(); 
SELECT menampilkan_semua_siswa_diajar_angren_mapel_B.jerman();  
SELECT menampilkan_siswaa_sma_kls12_mapel_biologi_diajar_angren();   
------------------------------------------------------------
CREATE VIEW view_modul_faris AS
SELECT *
FROM modul
WHERE kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris');

CREATE VIEW view_modul_ipa AS
SELECT *
FROM modul
WHERE kode_mapel IN (
    SELECT kode_mapel FROM mapel WHERE nama_mapel IN ('Matematika', 'Biologi', 'Kimia', 'Fisika')
);

CREATE VIEW view_faris_mapel_matematika_fisika_kimia AS
SELECT *
FROM instruktur
WHERE nama = 'Faris' AND kode_instruktur IN (
    SELECT kode_instruktur FROM modul WHERE kode_mapel IN (
        SELECT kode_mapel FROM mapel WHERE nama_mapel IN ('Matematika', 'Fisika', 'Kimia')
    )
);

CREATE VIEW view_siswa_sma_faris AS
SELECT s.*
FROM siswa_sma s
JOIN siswa_mapel_sma sms ON s.kode_siswa = sms.kode_siswa
WHERE sms.kode_kelas IN (
    SELECT k.kode_kelas FROM kelas k
    WHERE k.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
);

CREATE VIEW view_siswa_smp_sma_faris_matematika AS
SELECT s_smp.kode_siswa, s_smp.nama, 'SMP' AS tingkat
FROM siswa_smp s_smp
JOIN siswa_mapel_smp sms ON s_smp.kode_siswa = sms.kode_siswa
WHERE sms.kode_kelas IN (
    SELECT k.kode_kelas FROM kelas k
    WHERE k.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
      AND k.kode_mapel = (SELECT kode_mapel FROM mapel WHERE nama_mapel = 'Matematika')
)
UNION ALL
SELECT s_sma.kode_siswa, s_sma.nama, 'SMA' AS tingkat
FROM siswa_sma s_sma
JOIN siswa_mapel_sma sms ON s_sma.kode_siswa = sms.kode_siswa
WHERE sms.kode_kelas IN (
    SELECT k.kode_kelas FROM kelas k
    WHERE k.kode_instruktur = (SELECT kode_instruktur FROM instruktur WHERE nama = 'Faris')
      AND k.kode_mapel = (SELECT kode_mapel FROM mapel WHERE nama_mapel = 'Matematika')
);


--------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE SelectAllKaryawan()
BEGIN
    SELECT * FROM karyawan;
END //

DELIMITER ;
CALL SelectAllKaryawan();

------------------------------------------------------------------
DELIMITER //

CREATE TRIGGER setelah_insert_karyawan
AFTER INSERT ON karyawan
FOR EACH ROW
BEGIN
    
    INSERT INTO log_activity (activity, activity_date) VALUES (CONCAT('Karyawan baru ditambahkan: ', NEW.nama), NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER sebelum_delete_karyawan
BEFORE DELETE ON karyawan
FOR EACH ROW
BEGIN
  
    DECLARE count_pembayaran INT;
    SELECT COUNT(*) INTO count_pembayaran FROM pembayaran_smp WHERE kode_karyawan = OLD.kode_karyawan;
    
    IF count_pembayaran > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tidak dapat menghapus karyawan yang memiliki data pembayaran terkait.';
    END IF;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER setelah_update_karyawan
AFTER UPDATE ON karyawan
FOR EACH ROW
BEGIN
    INSERT INTO log_activity (activity, activity_date) VALUES (CONCAT('Karyawan diperbarui: ', NEW.nama), NOW());
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER sebelum_update_kelas
BEFORE UPDATE ON kelas
FOR EACH ROW
BEGIN
    IF NEW.jumlah_siswa > NEW.kapasitas THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Jumlah siswa melebihi kapasitas kelas!';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER setelah_update_siswa_smp
AFTER UPDATE ON siswa_smp
FOR EACH ROW
BEGIN
    IF NEW.total_bayar < 1000 THEN
        UPDATE siswa_smp SET status_potongan = FALSE WHERE kode_siswa = NEW.kode_siswa;
    ELSE
        UPDATE siswa_smp SET status_potongan = TRUE WHERE kode_siswa = NEW.kode_siswa;
    END IF;
END //

DELIMITER ;