-- Membuat database dan memilihnya
CREATE DATABASE IF NOT EXISTS Bimbel_ABC;
USE Bimbel_ABC;

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
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Siswa_SMP (nama, jenis_kelamin, alamat, kelas, diskon) VALUES 
('Budi', 'Laki-laki', 'Jl. Merdeka No. 1', '9 SMP',  20.00),
('Siti', 'Perempuan', 'Jl. Kebangsaan No. 2', '8 SMP',  0.00),
('Andi', 'Laki-laki', 'Jl. Sudirman No. 3', '7 SMP',  0.00),
('Alya', 'Perempuan', 'Jl. Kartini No. 4', '9 SMP',  0.00),
('Rama', 'Laki-laki', 'Jl. Diponegoro No. 5', '8 SMP', 0.00),
('Lina', 'Perempuan', 'Jl. Gatot Subroto No. 6', '7 SMP',  0.00),
('Doni', 'Laki-laki', 'Jl. Antasari No. 7', '9 SMP',  20.00),
('Ratna', 'Perempuan', 'Jl. Pramuka No. 8', '8 SMP',  0.00),
('Bayu', 'Laki-laki', 'Jl. Panjaitan No. 9', '9 SMP',  20.00),
('Sari', 'Perempuan', 'Jl. Ahmad Yani No. 10', '7 SMP',  0.00);

select * from Siswa_SMP;

INSERT INTO Siswa_SMA (nama, jenis_kelamin, alamat, kelas, jurusan, diskon) VALUES 
('Ahmad', 'Laki-laki', 'Jl. Merdeka No. 11', '12 SMA', 'IPA',  20.00),
('Rani', 'Perempuan', 'Jl. Kebangsaan No. 12', '11 SMA', 'IPS',  0.00),
('Zahra', 'Perempuan', 'Jl. Sudirman No. 13', '10 SMA', 'IPA',  0.00),
('Dika', 'Laki-laki', 'Jl. Kartini No. 14', '12 SMA', 'IPS',  20.00),
('Nina', 'Perempuan', 'Jl. Diponegoro No. 15', '11 SMA', 'IPA',  0.00),
('Bima', 'Laki-laki', 'Jl. Gatot Subroto No. 16', '10 SMA', 'IPA',  0.00),
('Lia', 'Perempuan', 'Jl. Antasari No. 17', '12 SMA', 'IPS',  20.00),
('Faris', 'Laki-laki', 'Jl. Pramuka No. 18', '11 SMA', 'IPA',  0.00),
('Putri', 'Perempuan', 'Jl. Panjaitan No. 19', '10 SMA', 'IPS',  0.00),
('Yudi', 'Laki-laki', 'Jl. Ahmad Yani No. 20', '12 SMA', 'IPA',  20.00);

Select * from Siswa_SMA;

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


INSERT INTO Instruktur (nama, mata_pelajaran) VALUES 
('Faris', 'Matematika'),
('Irgi', 'Biologi'),
('Angreni', 'Fisika'),
('Dewi', 'Kimia'),
('Budi', 'Bahasa Inggris'),
('Alya', 'Ekonomi'),
('Rudi', 'Geografi'),
('Sari', 'Sejarah'),
('Yudi', 'Sosiologi'),
('Nina', 'Bahasa Indonesia');
SELECT * FROM Instruktur;

-- Contoh data untuk modul yang dibuat oleh instruktur Faris
INSERT INTO Modul (id_instruktur, id_mapel, nama_modul, insentif)
VALUES 
(1, 1, 'Modul Matematika Dasar', 1000),    
(2, 2, 'Modul Fisika Dasar', 1000),       
(3, 3, 'Modul Biologi Tingkat Lanjut', 1000), 
(4, 4, 'Modul Kimia Dasar', 1000);         
select * from modul ;

INSERT INTO Pendaftaran (id_siswa, id_mapel, id_kelas, id_instruktur) VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),  
(3, 3, 3, 3),  
(4, 4, 1, 4),  
(5, 5, 2, 5),  
(6, 6, 3, 6),  
(7, 1, 1, 7),  
(8, 2, 2, 8),  
(9, 3, 3, 9),  
(10, 4, 1, 10); 
select * from Pendaftaran;

INSERT INTO Kelas (id_mapel, id_instruktur, kapasitas) VALUES 
(1, 1, 20), 
(2, 2, 15), 
(3, 3, 25),  
(4, 4, 30),  
(5, 5, 10),  
(6, 6, 12),
(7, 7, 25),
(8, 8, 32),
(9, 9, 13),
(10, 10, 12);
select * from Kelas;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nomor 7 A
DELIMITER //
CREATE PROCEDURE TampilModulFaris()
BEGIN
    SELECT * FROM Modul WHERE id_instruktur = (
        SELECT id_instruktur FROM Instruktur WHERE nama = 'Faris'
    );
END //
DELIMITER ;
call TampilModulFaris();
-- Nomor 7 B
DELIMITER //
CREATE PROCEDURE TampilModulIPA()
BEGIN
    SELECT * FROM Modul
    WHERE id_mapel IN (
        SELECT id_mapel FROM Mapel 
        WHERE nama IN ('Matematika', 'Biologi', 'Kimia', 'Fisika')
    );
END //
DELIMITER ;
call TampilModulIPA();
-- 7D
DELIMITER //
CREATE FUNCTION JumlahSiswaFaris()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SET jumlah = (
        SELECT COUNT(*) FROM Pendaftaran
        WHERE id_instruktur = (SELECT id_instruktur FROM Instruktur WHERE nama = 'Faris')
    );
    RETURN jumlah;
END 
//DELIMITER ;
select JumlahSiswaFaris();
-- 7C
CREATE VIEW ModulFaris AS
SELECT * FROM Modul
WHERE id_instruktur = (SELECT id_instruktur FROM Instruktur WHERE nama = 'Faris');

select * from ModulFaris;
-- 7e
CREATE VIEW SiswaFarisMatematika AS
SELECT Siswa_SMA.nama AS Nama_Siswa, Instruktur.nama AS Nama_Instruktur, Mapel.nama AS Nama_Mapel
FROM Pendaftaran
JOIN Siswa_SMA ON Pendaftaran.id_siswa = Siswa_SMA.id_siswa
JOIN Instruktur ON Pendaftaran.id_instruktur = Instruktur.id_instruktur
JOIN Mapel ON Pendaftaran.id_mapel = Mapel.id_mapel
WHERE Instruktur.nama = 'Faris' AND Mapel.nama = 'Matematika';
select * from SiswaFarisMatematika;

DELIMITER //

CREATE PROCEDURE HapusSiswaSMPFarisMatematika()
BEGIN
    -- Hapus data dari tabel Pendaftaran terkait siswa SMP yang diajar oleh instruktur Faris pada mapel Matematika
    DELETE p
    FROM 
        Pendaftaran AS p
    JOIN 
        Instruktur AS i ON p.id_instruktur = i.id_instruktur
    JOIN 
        Mapel AS m ON p.id_mapel = m.id_mapel
    JOIN 
        Siswa_SMP AS s_smp ON p.id_siswa = s_smp.id_siswa
    WHERE 
        i.nama = 'Faris' 
        AND m.nama = 'Matematika';

    -- Hapus data dari tabel Siswa_SMP setelah menghapus entri terkait di tabel Pendaftaran
    DELETE s_smp
    FROM 
        Siswa_SMP AS s_smp
    JOIN 
        Pendaftaran AS p ON s_smp.id_siswa = p.id_siswa
    JOIN 
        Instruktur AS i ON p.id_instruktur = i.id_instruktur
    JOIN 
        Mapel AS m ON p.id_mapel = m.id_mapel
    WHERE 
        i.nama = 'Faris' 
        AND m.nama = 'Matematika';
END //

DELIMITER ;
call  HapusSiswaSMPFarisMatematika();








DELIMITER //

CREATE PROCEDURE TampilSiswaFarisMatematika()
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
    JOIN 
        Instruktur AS i ON p.id_instruktur = i.id_instruktur
    JOIN 
        Mapel AS m ON p.id_mapel = m.id_mapel
    LEFT JOIN 
        Siswa_SMP AS s_smp ON p.id_siswa = s_smp.id_siswa
    LEFT JOIN 
        Siswa_SMA AS s_sma ON p.id_siswa = s_sma.id_siswa
    WHERE 
        i.nama = 'Faris' 
        AND m.nama = 'Matematika';
END //

DELIMITER ;
call TampilSiswaFarisMatematika();


DELIMITER //
CREATE TRIGGER TambahKapasitasKelas
AFTER INSERT ON Pendaftaran
FOR EACH ROW
BEGIN
    UPDATE Kelas SET kapasitas = kapasitas + 1 WHERE id_kelas = NEW.id_kelas;
END //
DELIMITER ;

show create trigger TambahKapasitasKelas;

show triggers like 'Pendaftaran';

DELIMITER //
CREATE TRIGGER KurangiKapasitasKelas
AFTER DELETE ON Pendaftaran
FOR EACH ROW
BEGIN
    UPDATE Kelas SET kapasitas = kapasitas - 1 WHERE id_kelas = OLD.id_kelas;
END //
DELIMITER ;

show create trigger KurangiKapasitasKelas;

show triggers like 'Pendaftaran';