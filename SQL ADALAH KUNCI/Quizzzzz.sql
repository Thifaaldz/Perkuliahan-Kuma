-- Membuat database dan memilihnya
CREATE DATABASE IF NOT EXISTS Bimbel_ABC;
USE Bimbel_ABC;
drop database Bimbel_ABC;

-- Tabel Siswa SMP
CREATE TABLE Siswa_SMP (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    alamat VARCHAR(255),
    kelas ENUM('7 SMP', '8 SMP', '9 SMP'),
    diskon DECIMAL(5,2) DEFAULT 0.20 
);
drop table Siswa_SMP;

SELECT * FROM instruktur;
SHOW TABLES;
-- Tabel Siswa SMA
CREATE TABLE Siswa_SMA (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    alamat VARCHAR(255),
    kelas ENUM('10 SMA', '11 SMA', '12 SMA'),
    jurusan ENUM('IPA', 'IPS'),
    diskon DECIMAL(5,2) DEFAULT 0.20 
);
drop table Siswa_SMA;

-- Tabel Instruktur
CREATE TABLE Instruktur (
    id_instruktur INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    spesialisasi ENUM('IPA', 'IPS'),
    mata_pelajaran VARCHAR(50)
);
drop table instruktur;

-- Tabel Mapel
CREATE TABLE Mapel (
    id_mapel INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    kuota_minimal INT DEFAULT 5, 
    biaya_per_jam DECIMAL(10, 2) DEFAULT 100 
);
Drop Table Mapel;
-- Tabel Kelas
CREATE TABLE Kelas (
    id_kelas INT PRIMARY KEY AUTO_INCREMENT,
    id_mapel INT,
    id_instruktur INT,
    kapasitas INT,
    FOREIGN KEY (id_mapel) REFERENCES Mapel(id_mapel),
    FOREIGN KEY (id_instruktur) REFERENCES Instruktur(id_instruktur)
);
Drop table kelas;

-- Tabel Pendaftaran Siswa ke Mapel
CREATE TABLE Pendaftaran (
    id_pendaftaran INT PRIMARY KEY AUTO_INCREMENT,
    id_siswa INT,
    id_mapel INT,
    id_kelas INT,
    id_instruktur int,
    FOREIGN KEY (id_siswa) REFERENCES Siswa_SMA(id_siswa),
    FOREIGN KEY (id_mapel) REFERENCES Mapel(id_mapel),
    FOREIGN KEY (id_kelas) REFERENCES Kelas(id_kelas)
);
drop table Pendaftaran;
-- Tabel Modul yang dibuat Instruktur
CREATE TABLE Modul (
    id_modul INT PRIMARY KEY AUTO_INCREMENT,
    id_instruktur INT,
    id_mapel INT,
    nama_modul VARCHAR(100),
    insentif DECIMAL(10, 2) DEFAULT 1000, -- Insentif per modul
    FOREIGN KEY (id_instruktur) REFERENCES Instruktur(id_instruktur),
    FOREIGN KEY (id_mapel) REFERENCES Mapel(id_mapel)
);
drop table modul;

CREATE TABLE  karyawan (
    id_karyawan INT PRIMARY KEY AUTO_INCREMENT,   -- ID Karyawan, sebagai primary key dan auto increment
    nama VARCHAR(100) NOT NULL,                    -- Nama karyawan
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL, -- Jenis kelamin
    alamat VARCHAR(255),                            -- Alamat karyawan
    tanggal_lahir DATE,                            -- Tanggal lahir
    posisi VARCHAR(50),                            -- Posisi pekerjaan
    gaji DECIMAL(10, 2),                          -- Gaji karyawan
    tanggal_masuk DATE,                            -- Tanggal masuk kerja
    status ENUM('Aktif', 'Tidak Aktif') DEFAULT 'Aktif' -- Status karyawan
);
DROP TABLE karyawan;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Siswa_SMP (nama, jenis_kelamin, alamat, kelas, diskon) VALUES 
('Adi', 'Laki-laki', 'Jl. Merdeka No. 11', '7 SMP', 0.10),
('Bambang', 'Laki-laki', 'Jl. Merdeka No. 12', '8 SMP', 0.15),
('Citra', 'Perempuan', 'Jl. Merdeka No. 13', '9 SMP', 0.00),
('Dinda', 'Perempuan', 'Jl. Merdeka No. 14', '7 SMP', 0.20),
('Eko', 'Laki-laki', 'Jl. Merdeka No. 15', '8 SMP', 0.10),
('Farah', 'Perempuan', 'Jl. Merdeka No. 16', '9 SMP', 0.00),
('Gilang', 'Laki-laki', 'Jl. Merdeka No. 17', '7 SMP', 0.20),
('Hani', 'Perempuan', 'Jl. Merdeka No. 18', '8 SMP', 0.10),
('Indra', 'Laki-laki', 'Jl. Merdeka No. 19', '9 SMP', 0.15),
('Joko', 'Laki-laki', 'Jl. Merdeka No. 20', '7 SMP', 0.00),
('Kiki', 'Perempuan', 'Jl. Merdeka No. 21', '8 SMP', 0.10),
('Luna', 'Perempuan', 'Jl. Merdeka No. 22', '9 SMP', 0.20),
('Maya', 'Perempuan', 'Jl. Merdeka No. 23', '7 SMP', 0.10),
('Nando', 'Laki-laki', 'Jl. Merdeka No. 24', '8 SMP', 0.00),
('Oka', 'Laki-laki', 'Jl. Merdeka No. 25', '9 SMP', 0.15),
('Pia', 'Perempuan', 'Jl. Merdeka No. 26', '7 SMP', 0.10),
('Qori', 'Perempuan', 'Jl. Merdeka No. 27', '8 SMP', 0.00),
('Roni', 'Laki-laki', 'Jl. Merdeka No. 28', '9 SMP', 0.20),
('Siska', 'Perempuan', 'Jl. Merdeka No. 29', '7 SMP', 0.10),
('Tono', 'Laki-laki', 'Jl. Merdeka No. 30', '8 SMP', 0.15);

INSERT INTO Siswa_SMA (nama, jenis_kelamin, alamat, kelas, jurusan, diskon) VALUES 
('Umar', 'Laki-laki', 'Jl. Sudirman No. 1', '10 SMA', 'IPA', 0.10),
('Vita', 'Perempuan', 'Jl. Sudirman No. 2', '11 SMA', 'IPS', 0.15),
('Wawan', 'Laki-laki', 'Jl. Sudirman No. 3', '12 SMA', 'IPA', 0.00),
('Xena', 'Perempuan', 'Jl. Sudirman No. 4', '10 SMA', 'IPS', 0.20),
('Yudi', 'Laki-laki', 'Jl. Sudirman No. 5', '11 SMA', 'IPA', 0.10),
('Zahra', 'Perempuan', 'Jl. Sudirman No. 6', '12 SMA', 'IPS', 0.00),
('Anton', 'Laki-laki', 'Jl. Sudirman No. 7', '10 SMA', 'IPA', 0.20),
('Bella', 'Perempuan', 'Jl. Sudirman No. 8', '11 SMA', 'IPS', 0.10),
('Cindy', 'Perempuan', 'Jl. Sudirman No. 9', '12 SMA', 'IPA', 0.15),
('Doni', 'Laki-laki', 'Jl. Sudirman No. 10', '10 SMA', 'IPS', 0.00),
('Elma', 'Perempuan', 'Jl. Sudirman No. 11', '11 SMA', 'IPA', 0.10),
('Fahri', 'Laki-laki', 'Jl. Sudirman No. 12', '12 SMA', 'IPS', 0.20),
('Gina', 'Perempuan', 'Jl. Sudirman No. 13', '10 SMA', 'IPA', 0.10),
('Hendra', 'Laki-laki', 'Jl. Sudirman No. 14', '11 SMA', 'IPS', 0.00),
('Irma', 'Perempuan', 'Jl. Sudirman No. 15', '12 SMA', 'IPA', 0.15),
('Jaka', 'Laki-laki', 'Jl. Sudirman No. 16', '10 SMA', 'IPS', 0.10),
('Kurnia', 'Perempuan', 'Jl. Sudirman No. 17', '11 SMA', 'IPA', 0.00),
('Luki', 'Laki-laki', 'Jl. Sudirman No. 18', '12 SMA', 'IPS', 0.20),
('Mita', 'Perempuan', 'Jl. Sudirman No. 19', '10 SMA', 'IPA', 0.10),
('Nita', 'Perempuan', 'Jl. Sudirman No. 20', '11 SMA', 'IPS', 0.15);

INSERT INTO Instruktur (nama, spesialisasi, mata_pelajaran) VALUES 
('Faris', 'IPA', 'Matematika'),
('Irgi', 'IPA', 'Biologi'),
('Angreni', 'IPA', 'Fisika'),
('Dewi', 'IPA', 'Kimia'),
('Budi', 'IPS', 'Bahasa Inggris'),
('Alya', 'IPS', 'Ekonomi'),
('Rudi', 'IPS', 'Geografi'),
('Sari', 'IPS', 'Sejarah'),
('Yudi', 'IPS', 'Sosiologi'),
('Nina', 'IPS', 'Bahasa Indonesia');

INSERT INTO Mapel (nama, kuota_minimal, biaya_per_jam) VALUES 
('Matematika', 5, 100),        
('Biologi', 5, 100),           
('Fisika', 5, 100),            
('Kimia', 5, 100),             
('Bahasa Inggris', 5, 80),     
('Bahasa Indonesia', 5, 80),   
('Pendidikan Pancasila', 5, 70), 
('Ekonomi', 5, 90),            
('Seni Budaya', 5, 75),        
('Olahraga', 5, 50);           

INSERT INTO Mapel (nama, kuota_minimal, biaya_per_jam) VALUES 
('Matematika', 5, 100),        
('Biologi', 5, 100),           
('Fisika', 5, 100),            
('Kimia', 5, 100),             
('Bahasa Inggris', 5, 80),     
('Bahasa Indonesia', 5, 80),   
('Pendidikan Pancasila', 5, 70), 
('Ekonomi', 5, 90),            
('Seni Budaya', 5, 75),        
('Olahraga', 5, 50);           

INSERT INTO Modul (id_instruktur, id_mapel, nama_modul, insentif) VALUES 
(1, 1, 'Matematika', 1000),    
(2, 2, 'Biologi', 1000), 
(3, 3, 'Fisika', 1000),         
(4, 4, 'Kimia', 1000),        
(5, 5, 'Bahasa Inggris', 800),   
(6, 6, 'Ekonomi', 900),          
(7, 7, 'Pendidikan Pancasila', 700),   
(8, 8, 'Seni Budaya', 750),            
(9, 9, 'Olahraga', 500),         
(10, 10, 'Bahasa Indonesia', 800);     

INSERT INTO Kelas (id_mapel, id_instruktur, kapasitas) VALUES 
(1, 1, 20),  -- Matematika dengan instruktur Faris Pratama
(2, 3, 15),  -- Biologi dengan instruktur Angreni Sari
(3, 1, 10),  -- Kimia dengan instruktur Faris Pratama
(4, 2, 12),  -- Fisika dengan instruktur Irgi Hakim
(5, 4, 18);  -- Geografi dengan instruktur Joko Santoso

INSERT INTO Pendaftaran (id_siswa, id_mapel, id_kelas, id_instruktur) VALUES 
(1, 1, 1, 1),  -- Adi Wijaya mengambil kelas Matematika dengan instruktur Faris
(2, 2, 2, 3),  -- Budi Santoso mengambil kelas Biologi dengan instruktur Angreni
(3, 4, 4, 2),  -- Citra Dewi mengambil kelas Fisika dengan instruktur Irgi
(4, 5, 5, 4);  -- Dina Utami mengambil kelas Geografi dengan instruktur Joko

INSERT INTO Pendaftaran (id_siswa, id_mapel, id_kelas, id_instruktur) VALUES 
(6, 1, 1, 1);  -- Adi Wijaya mengambil kelas Matematika dengan instruktur Faris

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7A
DELIMITER //
CREATE PROCEDURE ShowModulFaris()
BEGIN
    SELECT * 
    FROM Modul 
    WHERE id_instruktur = (SELECT id_instruktur FROM Instruktur WHERE nama = 'Faris');
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS ShowModulFaris;
CALL ShowModulFaris();

-- 7B
DELIMITER //
CREATE PROCEDURE ShowModulIPA()
BEGIN
    SELECT * 
    FROM Modul 
    WHERE nama_modul IN ('Matematika', 'Biologi', 'Kimia', 'Fisika');
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS ShowModulIPA;
CALL ShowModulIPA();

DELIMITER //
CREATE PROCEDURE ShowInstrukturFarisIPA()
BEGIN
    SELECT i.* 
    FROM Instruktur i
    JOIN Modul m ON i.id_instruktur = m.id_instruktur
    WHERE i.nama = 'Faris' AND m.nama_modul IN ('Matematika', 'Fisika', 'Kimia');
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS ShowInstrukturFarisIPA;
CALL ShowInstrukturFarisIPA();

DELIMITER //
CREATE PROCEDURE ShowSiswaSMAFaris()
BEGIN
    SELECT s.* 
    FROM Siswa_SMA s
    JOIN Pendaftaran p ON s.id_siswa = p.id_siswa
    JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
    WHERE s.kelas = 'SMA' AND i.nama = 'Faris';
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS ShowSiswaSMAFaris;
CALL ShowSiswaSMAFaris();

DELIMITER //
CREATE PROCEDURE ShowSiswaSMPFaris()
BEGIN
    SELECT s.* 
    FROM Siswa_SMP s
    JOIN Pendaftaran p ON s.id_siswa = p.id_siswa
    JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
    WHERE s.kelas = '7,8,9' AND i.nama = 'Faris';
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS ShowSiswaSMPFaris;
CALL ShowSiswaSMPFaris();

DELIMITER //

CREATE PROCEDURE ShowStudentsFarisMatematika()
BEGIN
    SELECT 
        s_smp.nama AS Nama_Siswa_SMP, 
        s_smp.jenis_kelamin AS Jenis_Kelamin_SMP, 
        s_smp.alamat AS Alamat_SMP, 
        s_smp.kelas AS Kelas_SMP,
        
        s_sma.nama AS Nama_Siswa_SMA, 
        s_sma.jenis_kelamin AS Jenis_Kelamin_SMA, 
        s_sma.alamat AS Alamat_SMA, 
        s_sma.kelas AS Kelas_SMA,
        s_sma.jurusan AS Jurusan_SMA
        
    FROM 
        Pendaftaran AS p
    LEFT JOIN 
        Siswa_SMP AS s_smp ON p.id_siswa = s_smp.id_siswa
    LEFT JOIN 
        Siswa_SMA AS s_sma ON p.id_siswa = s_sma.id_siswa
    JOIN 
        Instruktur AS i ON p.id_instruktur = i.id_instruktur
    JOIN 
        Mapel AS m ON p.id_mapel = m.id_mapel
    WHERE 
        i.nama = 'Faris' 
        AND m.nama = 'Matematika';
END //

DELIMITER ;
CALL ShowStudentsFarisMatematika();




DELIMITER //
CREATE PROCEDURE DeleteSiswaSMPFarisMatematika()
BEGIN
    DELETE s 
    FROM Siswa_SMP s
    JOIN Pendaftaran p ON s.id_siswa = p.id_siswa
    JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
    JOIN Modul m ON p.id_mapel = m.id_mapel  -- Make sure this matches the table schema
    WHERE s.kelas = '9 SMP' AND i.nama = 'Faris' AND m.nama_modul = 'Matematika';
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS DeleteSiswaSMPFarisMatematika;
CALL DeleteSiswaSMPFarisMatematika();	

DELIMITER //

CREATE PROCEDURE UpdateInstrukturSiswaSMPFisika()
BEGIN
    -- Mengubah instruktur menjadi Angreni untuk Siswa SMP di mapel Fisika
    UPDATE Pendaftaran
    SET id_instruktur = (
        SELECT id_instruktur FROM Instruktur WHERE nama = 'Angreni'
    )
    WHERE id_instruktur = (
        SELECT id_instruktur FROM Instruktur WHERE nama = 'Faris'
    )
    AND id_mapel = (
        SELECT id_mapel FROM Mapel WHERE nama = 'Fisika'
    )
    AND id_siswa IN (
        SELECT id_siswa FROM Siswa_SMP
    );
END //

DELIMITER ;
CALL UpdateInstrukturSiswaSMPFisika();
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE FUNCTION JumlahSiswaFaris() 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(DISTINCT p.id_siswa) INTO total
    FROM Pendaftaran p
    JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
    WHERE i.nama = 'Faris';

    RETURN total;
END //

DELIMITER ;
DROP FUNCTION IF EXISTS JumlahSiswaFaris;
SELECT JumlahSiswaFaris() AS JumlahSiswaFaris;

DELIMITER //

CREATE FUNCTION JumlahSiswaSMPKelas9Irgi() 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(DISTINCT p.id_siswa) INTO total
    FROM Pendaftaran p
    JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
    JOIN Siswa_SMP s ON p.id_siswa = s.id_siswa
    WHERE i.nama = 'Irgi' AND s.kelas = '9 SMP';

    RETURN total;
END //

DELIMITER ;
DROP FUNCTION IF EXISTS JumlahSiswaSMPKelas9Irgi;
SELECT JumlahSiswaFaris() AS JumlahSiswaSMPKelas9Irgi;

DELIMITER //

CREATE FUNCTION JumlahSiswaSMABiologiKelas12Angren() 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(DISTINCT p.id_siswa) INTO total
    FROM Pendaftaran p
    JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
    JOIN Siswa_SMA s ON p.id_siswa = s.id_siswa
    JOIN Mapel m ON p.id_mapel = m.id_mapel
    WHERE i.nama = 'Angren' AND s.kelas = '12 SMA' AND m.nama = 'Biologi';

    RETURN total;
END //

DELIMITER ;
DROP FUNCTION IF EXISTS JumlahSiswaSMABiologiKelas12Angren;
SELECT JumlahSiswaFaris() AS JumlahSiswaSMABiologiKelas12Angren;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW ViewModulFaris AS
SELECT *
FROM Modul
WHERE id_instruktur = (SELECT id_instruktur FROM Instruktur WHERE nama = 'Faris');
SELECT * FROM ViewModulFaris;
DROP VIEW IF EXISTS ViewModulFaris;

CREATE VIEW ViewModulIPA AS
SELECT *
FROM Modul
WHERE id_mapel IN (
    SELECT id_mapel 
    FROM Mapel 
    WHERE nama IN ('Matematika', 'Biologi', 'Kimia', 'Fisika')
);
SELECT * FROM ViewModulIPA;
DROP VIEW IF EXISTS ViewModulIPA;

CREATE VIEW ViewInstrukturFaris AS
SELECT *
FROM Instruktur
WHERE nama = 'Faris' AND mata_pelajaran IN ('Matematika', 'Fisika', 'Kimia');
SELECT * FROM ViewInstrukturFaris;
DROP VIEW IF EXISTS ViewInstrukturFaris;

CREATE VIEW ViewSiswaSMAFaris AS
SELECT s.*
FROM Siswa_SMA s
JOIN Pendaftaran p ON s.id_siswa = p.id_siswa
JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
WHERE i.nama = 'Faris';
SELECT * FROM ViewSiswaSMAFaris;
DROP VIEW IF EXISTS ViewSiswaSMAFaris;

CREATE VIEW ViewSiswaMatematikaFaris AS
SELECT s_smp.id_siswa AS id_siswa_smp, s_smp.nama AS nama_siswa_smp, s_smp.kelas AS kelas_smp,
       s_sma.id_siswa AS id_siswa_sma, s_sma.nama AS nama_siswa_sma, s_sma.kelas AS kelas_sma
FROM Pendaftaran p
LEFT JOIN Siswa_SMP s_smp ON p.id_siswa = s_smp.id_siswa
LEFT JOIN Siswa_SMA s_sma ON p.id_siswa = s_sma.id_siswa
JOIN Instruktur i ON p.id_instruktur = i.id_instruktur
JOIN Mapel m ON p.id_mapel = m.id_mapel
WHERE i.nama = 'Faris' AND m.nama = 'Matematika';
SELECT * FROM ViewSiswaMatematikaFaris;
DROP VIEW IF EXISTS ViewSiswaMatematikaFaris;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE InsertSiswaSMP(
    IN p_nama VARCHAR(100),
    IN p_jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    IN p_alamat VARCHAR(255),
    IN p_kelas ENUM('7 SMP', '8 SMP', '9 SMP'),
    IN p_diskon DECIMAL(5,2)
)
BEGIN
    INSERT INTO Siswa_SMP (nama, jenis_kelamin, alamat, kelas, diskon)
    VALUES (p_nama, p_jenis_kelamin, p_alamat, p_kelas, p_diskon);
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS DeleteSiswaSMPFarisMatematika;
CALL InsertSiswaSMP ();	

DELIMITER //
CREATE PROCEDURE UpdateSiswaSMP(
    IN p_id_siswa INT,
    IN p_nama VARCHAR(100),
    IN p_jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    IN p_alamat VARCHAR(255),
    IN p_kelas ENUM('7 SMP', '8 SMP', '9 SMP'),
    IN p_diskon DECIMAL(5,2)
)
BEGIN
    UPDATE Siswa_SMP
    SET 
        nama = p_nama,
        jenis_kelamin = p_jenis_kelamin,
        alamat = p_alamat,
        kelas = p_kelas,
        diskon = p_diskon
    WHERE id_siswa = p_id_siswa;
END //
DELIMITER ;6
DROP PROCEDURE IF EXISTS DeleteSiswaSMPFarisMatematika;
CALL UpdateSiswaSMP();

DELIMITER //
CREATE PROCEDURE InsertPendaftaran(
    IN p_id_siswa INT,
    IN p_id_mapel INT,
    IN p_id_kelas INT,
    IN p_id_instruktur INT
)
BEGIN
    INSERT INTO Pendaftaran (id_siswa, id_mapel, id_kelas, id_instruktur)
    VALUES (p_id_siswa, p_id_mapel, p_id_kelas, p_id_instruktur);
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS DeleteSiswaSMPFarisMatematika;
CALL InsertPendaftaran();

DELIMITER //
CREATE PROCEDURE SelectPembayaranIPAKelas12SMA()
BEGIN
    SELECT s.nama AS Nama_Siswa, p.biaya_per_jam AS Biaya
    FROM Pembayaran p
    JOIN Pendaftaran pd ON p.id_pendaftaran = pd.id_pendaftaran
    JOIN Siswa_SMA s ON pd.id_siswa = s.id_siswa
    JOIN Mapel m ON pd.id_mapel = m.id_mapel
    WHERE s.kelas = '12 SMA' AND m.nama = 'Biologi'; 
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS SelectPembayaranIPAKelas12SMA;
CALL SelectPembayaranIPAKelas12SMA();
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Select * from karyawan;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE TRIGGER trg_after_insert_siswa_smp
AFTER INSERT ON Siswa_SMP
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Siswa_SMP', NEW.id_siswa, NOW());
END //

CREATE TRIGGER trg_after_update_siswa_smp
AFTER UPDATE ON Siswa_SMP
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Siswa_SMP', NEW.id_siswa, NOW());
END //

CREATE TRIGGER trg_after_delete_siswa_smp
AFTER DELETE ON Siswa_SMP
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Siswa_SMP', OLD.id_siswa, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_siswa_sma
AFTER INSERT ON Siswa_SMA
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Siswa_SMA', NEW.id_siswa, NOW());
END //

CREATE TRIGGER trg_after_update_siswa_sma
AFTER UPDATE ON Siswa_SMA
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Siswa_SMA', NEW.id_siswa, NOW());
END //

CREATE TRIGGER trg_after_delete_siswa_sma
AFTER DELETE ON Siswa_SMA
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Siswa_SMA', OLD.id_siswa, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_instruktur
AFTER INSERT ON Instruktur
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Instruktur', NEW.id_instruktur, NOW());
END //

CREATE TRIGGER trg_after_update_instruktur
AFTER UPDATE ON Instruktur
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Instruktur', NEW.id_instruktur, NOW());
END //

CREATE TRIGGER trg_after_delete_instruktur
AFTER DELETE ON Instruktur
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Instruktur', OLD.id_instruktur, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_mapel
AFTER INSERT ON Mapel
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Mapel', NEW.id_mapel, NOW());
END //

CREATE TRIGGER trg_after_update_mapel
AFTER UPDATE ON Mapel
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Mapel', NEW.id_mapel, NOW());
END //

CREATE TRIGGER trg_after_delete_mapel
AFTER DELETE ON Mapel
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Mapel', OLD.id_mapel, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_kelas
AFTER INSERT ON Kelas
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Kelas', NEW.id_kelas, NOW());
END //

CREATE TRIGGER trg_after_update_kelas
AFTER UPDATE ON Kelas
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Kelas', NEW.id_kelas, NOW());
END //

CREATE TRIGGER trg_after_delete_kelas
AFTER DELETE ON Kelas
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Kelas', OLD.id_kelas, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_pendaftaran
AFTER INSERT ON Pendaftaran
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Pendaftaran', NEW.id_pendaftaran, NOW());
END //

CREATE TRIGGER trg_after_update_pendaftaran
AFTER UPDATE ON Pendaftaran
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Pendaftaran', NEW.id_pendaftaran, NOW());
END //

CREATE TRIGGER trg_after_delete_pendaftaran
AFTER DELETE ON Pendaftaran
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Pendaftaran', OLD.id_pendaftaran, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_modul
AFTER INSERT ON Modul
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Modul', NEW.id_modul, NOW());
END //

CREATE TRIGGER trg_after_update_modul
AFTER UPDATE ON Modul
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Modul', NEW.id_modul, NOW());
END //

CREATE TRIGGER trg_after_delete_modul
AFTER DELETE ON Modul
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Modul', OLD.id_modul, NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_insert_karyawan
AFTER INSERT ON karyawan
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('INSERT', 'Karyawan', NEW.id_karyawan, NOW());
END //

CREATE TRIGGER trg_after_update_karyawan
AFTER UPDATE ON karyawan
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('UPDATE', 'Karyawan', NEW.id_karyawan, NOW());
END //

CREATE TRIGGER trg_after_delete_karyawan
AFTER DELETE ON karyawan
FOR EACH ROW
BEGIN
    INSERT INTO Log_Actions (action_type, table_name, record_id, action_time)
    VALUES ('DELETE', 'Karyawan', OLD.id_karyawan, NOW());
END //

DELIMITER ;

SHOW TRIGGERS FROM bimbel_abc;

show tables;