--
CREATE DATABASE quizzzzz;
USE quizzzzz;

CREATE TABLE Siswa_SMP (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    alamat VARCHAR(255),
    kelas ENUM('7 SMP', '8 SMP', '9 SMP'),
    diskon DECIMAL(5,2)
);

CREATE TABLE Siswa_SMA (
    id_siswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    alamat VARCHAR(255),
    kelas ENUM('10 SMA', '11 SMA', '12 SMA'),
    jurusan ENUM('IPA', 'IPS'),
    diskon DECIMAL(5,2)
);


CREATE TABLE Instruktur (
    id_instruktur INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    mata_pelajaran VARCHAR(50)
);


CREATE TABLE Mapel (
    id_mapel INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    kuota_minimal INT,
    biaya_per_jam DECIMAL(10, 2)
);

CREATE TABLE Kelas_SMP (
    id_kelas INT PRIMARY KEY AUTO_INCREMENT,
    kapasitas INT,
    id_mapel INT,
    id_instruktur INT,
    id_siswa_smp INT,
    FOREIGN KEY (id_mapel) REFERENCES Mapel(id_mapel),
    FOREIGN KEY (id_instruktur) REFERENCES Instruktur(id_instruktur),
    FOREIGN KEY (id_siswa_smp) REFERENCES Siswa_SMP(id_siswa)
);


CREATE TABLE Kelas_SMA (
    id_kelas INT PRIMARY KEY AUTO_INCREMENT,
    kapasitas INT,
    id_mapel INT,
    id_instruktur INT,
    id_siswa_sma INT,
    FOREIGN KEY (id_mapel) REFERENCES Mapel(id_mapel),
    FOREIGN KEY (id_instruktur) REFERENCES Instruktur(id_instruktur),
    FOREIGN KEY (id_siswa_sma) REFERENCES Siswa_SMA(id_siswa)
);



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

SELECT * FROM Siswa_SMA;

SELECT * FROM Siswa_SMP;

select * from instruktur;

desc Siswa_SMA;

desc Siswa_SMP;

desc Instruktur;

desc mapel;

