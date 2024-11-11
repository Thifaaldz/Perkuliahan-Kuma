	-- Create the database and use it
	CREATE DATABASE IF NOT EXISTS mart_UTS;
	USE mart_UTS;
    

	CREATE TABLE member_mart (
		member_id VARCHAR(50) DEFAULT '-',
		nama_member VARCHAR(50) NOT NULL DEFAULT '-',
		alamat_member VARCHAR(50) NOT NULL DEFAULT '-',
		jenis_kelamin ENUM ('laki-laki', 'Perempuan') DEFAULT 'laki-laki',
		daftar_member TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		member_berakhir TIMESTAMP,
		kategori_diskon DECIMAL(10, 2),
		primary key (member_id)
	) ENGINE = InnoDB;


	CREATE TABLE pelanggan_mart (
		pelanggan_id VARCHAR(50) DEFAULT '-' ,
		nama_pelanggan VARCHAR(50) NOT NULL DEFAULT '-',
		jenis_kelamin ENUM ('laki-laki', 'Perempuan') DEFAULT 'laki-laki',
		primary key (pelanggan_id)
	) ENGINE = InnoDB;


	CREATE TABLE supplier_mart (
		supplier_id VARCHAR(50) DEFAULT '-' ,
		toko_supplier VARCHAR(50) NOT NULL DEFAULT '-',
		alamat_supplier VARCHAR(50) NOT NULL DEFAULT '-',
		kontak_supplier VARCHAR(50) NOT NULL DEFAULT '-',
		terakhir_pengiriman date,
		primary key (supplier_id)
	) ENGINE = InnoDB;


	CREATE TABLE barang_mart (
		barang_id VARCHAR(50) DEFAULT '-' ,
		nama_barang VARCHAR(50) NOT NULL DEFAULT '-',
		Merk_barang VARCHAR(50) NOT NULL DEFAULT '-',
		harga_barang INT,
		jumlah_barang INT,
		kategori_barang ENUM ('elektronik', 'furniture'),
		supplier_id VARCHAR(50) DEFAULT '-',
		primary key (barang_id)
	) ENGINE = InnoDB;


	CREATE TABLE karyawan_mart (
		karyawan_id VARCHAR(50) DEFAULT '-',
		nama_karyawan VARCHAR(50) NOT NULL DEFAULT '-',
		jenis_kelamin ENUM ('laki-laki', 'Perempuan') DEFAULT 'laki-laki',
		email_karyawan VARCHAR(50) NOT NULL DEFAULT '-',
		nomor_karyawan INT UNSIGNED,
		gaji_karyawan INT UNSIGNED,
		jabatan_karyawan ENUM ('Store Manajer', 'wakil manajer', 'Supervisor', 'customer service', 'cashier', 'administrasi', 'sales', 'cleaning service'),
		primary key (karyawan_id)
	) ENGINE = InnoDB;


	CREATE TABLE Penjualan_Mart (
		penjualan_id VARCHAR(50) DEFAULT '-' ,
		nama_pelanggan VARCHAR(50) NOT NULL DEFAULT '-',
		member_id VARCHAR(50) DEFAULT '-',
		pelanggan_id VARCHAR(50) DEFAULT '-',
		barang_id VARCHAR(50) DEFAULT '-',
		harga_barang INT,
		jumlah_terjual int,
		diskon DECIMAL(10, 2),
		pembayaran ENUM('Lunas', 'Kredit'),
		tanggal_pembelian TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		karyawan_id VARCHAR(50) DEFAULT '-',
		primary key (penjualan_id)
	) ENGINE = InnoDB;


	CREATE TABLE pengadaan_mart (
		pengadaan_id VARCHAR(50) DEFAULT '-' ,
		tanggal_pemesanan DATE,
		tanggal_terkirim DATE,
		nama_barang VARCHAR(50) NOT NULL DEFAULT '-',
		barang_id VARCHAR(50) DEFAULT '-',
		jumlah_barang INT UNSIGNED,
		supplier_id VARCHAR(50) DEFAULT '-',
		primary key (pengadaan_id)
	) ENGINE = InnoDB;


	ALTER TABLE barang_mart
	ADD CONSTRAINT fk_barang_supplier FOREIGN KEY (supplier_id) REFERENCES supplier_mart(supplier_id)ON DELETE CASCADE;
	ALTER TABLE Penjualan_Mart
	ADD CONSTRAINT fk_penjualan_member FOREIGN KEY (member_id) REFERENCES member_mart(member_id) ON DELETE CASCADE,
	ADD CONSTRAINT fk_penjualan_pelanggan FOREIGN KEY (pelanggan_id) REFERENCES pelanggan_mart(pelanggan_id) ON DELETE CASCADE,
	ADD CONSTRAINT fk_penjualan_barang FOREIGN KEY (barang_id) REFERENCES barang_mart(barang_id) ON DELETE CASCADE,
	ADD CONSTRAINT fk_penjualan_karyawan FOREIGN KEY (karyawan_id) REFERENCES karyawan_mart(karyawan_id)ON DELETE CASCADE;
	ALTER TABLE pengadaan_mart
	ADD CONSTRAINT fk_pengadaan_barang FOREIGN KEY (barang_id) REFERENCES barang_mart(barang_id) ON DELETE CASCADE,
	ADD CONSTRAINT fk_pengadaan_supplier FOREIGN KEY (supplier_id) REFERENCES supplier_mart(supplier_id)ON DELETE CASCADE;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO member_mart (member_id, nama_member, alamat_member, jenis_kelamin, member_berakhir, kategori_diskon) VALUES
('MEM001', 'Naruto Uzumaki', 'Konohagakure', 'laki-laki', '2025-12-31 00:00:00', 10.00),
('MEM002', 'Sakura Haruno', 'Konohagakure', 'Perempuan', '2025-12-31 00:00:00', 15.00),
('MEM003', 'Sasuke Uchiha', 'Konohagakure', 'laki-laki', '2025-12-31 00:00:00', 12.50),
('MEM004', 'Luffy Monkey D', 'East Blue', 'laki-laki', '2025-12-31 00:00:00', 20.00),
('MEM005', 'Zoro Roronoa', 'East Blue', 'laki-laki', '2025-12-31 00:00:00', 18.00),
('MEM006', 'Nami', 'East Blue', 'Perempuan', '2025-12-31 00:00:00', 22.00),
('MEM007', 'Usopp', 'East Blue', 'laki-laki', '2025-12-31 00:00:00', 17.00),
('MEM008', 'Sanji', 'East Blue', 'laki-laki', '2025-12-31 00:00:00', 13.00),
('MEM009', 'Chopper', 'Drum Island', 'laki-laki', '2025-12-31 00:00:00', 10.00),
('MEM010', 'Robin Nico', 'Arabasta', 'Perempuan', '2025-12-31 00:00:00', 25.00),
('MEM011', 'Franky', 'Water 7', 'laki-laki', '2025-12-31 00:00:00', 14.00),
('MEM012', 'Brook', 'Thousand Sunny', 'laki-laki', '2025-12-31 00:00:00', 16.00),
('MEM013', 'Jinbei', 'Fish-Man Island', 'laki-laki', '2025-12-31 00:00:00', 19.00),
('MEM014', 'Goku', 'Planet Earth', 'laki-laki', '2025-12-31 00:00:00', 30.00),
('MEM015', 'Vegeta', 'Planet Earth', 'laki-laki', '2025-12-31 00:00:00', 28.00),
('MEM016', 'Piccolo', 'Planet Earth', 'laki-laki', '2025-12-31 00:00:00', 26.00),
('MEM017', 'Bulma', 'Capsule Corporation', 'Perempuan', '2025-12-31 00:00:00', 15.00),
('MEM018', 'Frieza', 'Planet Namek', 'laki-laki', '2025-12-31 00:00:00', 32.00),
('MEM019', 'Trunks', 'Capsule Corporation', 'laki-laki', '2025-12-31 00:00:00', 22.00),
('MEM020', 'Cell', 'Otherworld', 'laki-laki', '2025-12-31 00:00:00', 35.00);
select * from member_mart;


INSERT INTO pelanggan_mart (pelanggan_id, nama_pelanggan, jenis_kelamin) VALUES
('PLG001', 'Iron Man', 'laki-laki'),
('PLG002', 'Captain America', 'laki-laki'),
('PLG003', 'Black Widow', 'Perempuan'),
('PLG004', 'Thor', 'laki-laki'),
('PLG005', 'Hawkeye', 'laki-laki'),
('PLG006', 'Hulk', 'laki-laki'),
('PLG007', 'Spider-Man', 'laki-laki'),
('PLG008', 'Doctor Strange', 'laki-laki'),
('PLG009', 'Captain Marvel', 'Perempuan'),
('PLG010', 'Scarlet Witch', 'Perempuan'),
('PLG011', 'Lara Croft', 'Perempuan'),
('PLG012', 'Kratos', 'laki-laki'),
('PLG013', 'Nathan Drake', 'laki-laki'),
('PLG014', 'Ellie', 'Perempuan'),
('PLG015', 'Joel', 'laki-laki'),
('PLG016', 'Master Chief', 'laki-laki'),
('PLG017', 'Dante', 'laki-laki'),
('PLG018', 'Geralt of Rivia', 'laki-laki'),
('PLG019', 'Aloy', 'Perempuan'),
('PLG020', 'Samus Aran', 'Perempuan');
select * from pelanggan_mart;

INSERT INTO supplier_mart (supplier_id, toko_supplier, alamat_supplier, kontak_supplier, terakhir_pengiriman) VALUES
('SUP001', 'UD.XXX', 'Konohagakure', '080123456789', '2024-10-15'),
('SUP002', 'Toko Ramen Naruto', 'Konohagakure', '080987654321', '2024-11-05'),
('SUP003', 'Toko Capsule Corp', 'Planet Earth', '080234567890', '2024-09-20'),
('SUP004', 'Toko Going Merry', 'East Blue', '080345678901', '2024-10-10'),
('SUP005', 'Toko Konoha Medika', 'Konohagakure', '080456789012', '2024-11-01'),
('SUP006', 'Toko Uchiha Clan', 'Konohagakure', '080567890123', '2024-08-25'),
('SUP007', 'Toko Thousand Sunny', 'East Blue', '080678901234', '2024-07-18'),
('SUP008', 'Toko Arlong Park', 'East Blue', '080789012345', '2024-10-12'),
('SUP009', 'Toko U.A. Merchandise', 'U.A. High School', '080890123456', '2024-09-30'),
('SUP010', 'UD.AAA', 'Konohagakure', '080901234567', '2024-11-07');

select * from supplier_mart;

INSERT INTO barang_mart (barang_id, nama_barang, Merk_barang, harga_barang, jumlah_barang, kategori_barang, supplier_id) VALUES
('BR001', 'Laptop Gaming', 'Asus', 15000000, 200, 'elektronik', 'SUP001'),
('BR002', 'Smartphone', 'Samsung', 8000000, 400, 'elektronik', 'SUP002'),
('BR003', 'Smartwatch', 'Apple', 5000000, 100, 'elektronik', 'SUP003'),
('BR004', 'Kursi Kantor', 'Ikea', 1200000, 300, 'furniture', 'SUP004'),
('BR005', 'Meja Makan', 'Ashley Furniture', 4500000, 400, 'furniture', 'SUP005'),
('BR006', 'TV', 'LG', 10000000, 600, 'elektronik', 'SUP006'),
('BR007', 'Soundbar', 'Sony', 4500000, 200, 'elektronik', 'SUP007'),
('BR008', 'Lemari Pakaian', 'Informa', 2500000, 212, 'furniture', 'SUP008'),
('BR009', 'Kulkas 2 Pintu', 'Sharp', 6500000, 120, 'elektronik', 'SUP009'),
('BR010', 'Meja Kerja', 'Daya Furniture', 2000000, 135, 'furniture', 'SUP010'),
('BR011', 'Kulkas 2 Pintu', 'samsung', 300000000, 550, 'elektronik', 'SUP010'),
('BR012', 'Kursi Tamu', 'IKEA', 2000000, 160, 'furniture', 'SUP010'),
('BR013', 'Kursi Makan', 'IKEA', 30000, 220, 'furniture', 'SUP010'),
('BR014', 'Kursi Sova', 'IKEA', 80000, 610, 'furniture', 'SUP010'),
('BR015', 'Kulkas 1 Pintu', 'samsung', 300000000, 150, 'elektronik', 'SUP010'),
('BR016', 'Spring Bed', 'kingkoil', 2000000,220,'furniture','SUP001');
select * from barang_mart;


INSERT INTO karyawan_mart (karyawan_id, nama_karyawan, jenis_kelamin, email_karyawan, nomor_karyawan, gaji_karyawan, jabatan_karyawan) 
VALUES
('KAR001', 'Naruto Uzumaki', 'laki-laki', 'naruto@konohacorp.com', 1234567890, 8000000, 'Store Manajer'),
('KAR002', 'Sakura Haruno', 'Perempuan', 'sakura@konohacorp.com', 1234567891, 7000000, 'wakil manajer'),
('KAR003', 'Sasuke Uchiha', 'laki-laki', 'sasuke@konohacorp.com', 1234567892, 7500000, 'Supervisor'),
('KAR004', 'Luffy', 'laki-laki', 'luffy@onepiececorp.com', 1234567893, 6000000, 'cashier'),
('KAR005', 'Zoro', 'laki-laki', 'zoro@onepiececorp.com', 1234567894, 6500000, 'cashier'),
('KAR006', 'Nami', 'Perempuan', 'nami@onepiececorp.com', 1234567895, 6000000, 'cashier'),
('KAR007', 'Hinata Hyuga', 'Perempuan', 'hinata@konohacorp.com', 1234567896, 7000000, 'administrasi'),
('KAR008', 'Kakashi Hatake', 'laki-laki', 'kakashi@konohacorp.com', 1234567897, 8000000, 'administrasi'),
('KAR009', 'Lelouch vi Britannia', 'laki-laki', 'lelouch@geasscorp.com', 1234567898, 8500000, 'administrasi'),
('KAR010', 'Light Yagami', 'laki-laki', 'light@deathnotecorp.com', 1234567899, 8000000, 'sales'),
('KAR011', 'Asuna Yuuki', 'Perempuan', 'asuna@saocorp.com', 1234567900, 7000000, 'sales'),
('KAR012', 'Kirito', 'laki-laki', 'kirito@saocorp.com', 1234567901, 7500000, 'sales'),
('KAR013', 'Kamina', 'laki-laki', 'kamina@gurrencorp.com', 1234567902, 6000000, 'cleaning service'),
('KAR014', 'Yuno Gasai', 'Perempuan', 'yuno@futurecorp.com', 1234567903, 7000000, 'cleaning service'),
('KAR015', 'Shikamaru Nara', 'laki-laki', 'shikamaru@konohacorp.com', 1234567904, 7500000, 'cleaning service');
select * from karyawan_mart;
INSERT INTO Penjualan_Mart (penjualan_id, nama_pelanggan, member_id, pelanggan_id, barang_id, harga_barang, jumlah_terjual, diskon, pembayaran, tanggal_pembelian, karyawan_id) VALUES
('PJ001', 'Naruto Uzumaki', 'MEM001', NULL, 'BR001', 15000000, 1, 10.00, 'Lunas', '2024-08-05 10:00:00', 'KAR001'),
('PJ002', 'Naruto Uzumaki', 'MEM001', NULL, 'BR002', 8000000, 1, 10.00, 'Kredit', '2024-08-05 10:05:00', 'KAR001'),
('PJ003', 'Sakura Haruno', 'MEM002', NULL, 'BR003', 5000000, 2, 15.00, 'Lunas', '2024-08-10 12:15:00', 'KAR002'),
('PJ004', 'Sakura Haruno', 'MEM002', NULL, 'BR004', 1200000, 1, 15.00, 'Kredit', '2024-08-10 12:20:00', 'KAR002'),
('PJ005', 'Sasuke Uchiha', 'MEM003', NULL, 'BR005', 4500000, 1, 12.50, 'Lunas', '2024-08-15 14:30:00', 'KAR003'),
('PJ006', 'Sasuke Uchiha', 'MEM003', NULL, 'BR006', 10000000, 1, 12.50, 'Kredit', '2024-08-15 14:35:00', 'KAR003'),
('PJ007', 'Luffy Monkey D', 'MEM004', NULL, 'BR007', 4500000, 2, 20.00, 'Lunas', '2024-09-05 16:00:00', 'KAR004'),
('PJ008', 'Luffy Monkey D', 'MEM004', NULL, 'BR008', 2500000, 1, 20.00, 'Kredit', '2024-09-05 16:05:00', 'KAR004'),
('PJ009', 'Zoro Roronoa', 'MEM005', NULL, 'BR009', 6500000, 1, 18.00, 'Lunas', '2024-09-10 18:10:00', 'KAR005'),
('PJ010', 'Zoro Roronoa', 'MEM005', NULL, 'BR010', 2000000, 1, 18.00, 'Kredit', '2024-09-10 18:15:00', 'KAR005'),
('PJ011', 'Nami', 'MEM006', NULL, 'BR011', 300000000, 1, 22.00, 'Kredit', '2024-09-15 10:25:00', 'KAR006'),
('PJ012', 'Nami', 'MEM006', NULL, 'BR012', 2000000, 2, 22.00, 'Kredit', '2024-09-15 10:30:00', 'KAR006'),
('PJ013', 'Usopp', 'MEM007', NULL, 'BR013', 30000, 5, 17.00, 'Lunas', '2024-09-20 11:15:00', 'KAR007'),
('PJ014', 'Usopp', 'MEM007', NULL, 'BR014', 80000, 3, 17.00, 'Kredit', '2024-09-20 11:20:00', 'KAR007'),
('PJ015', 'Sanji', 'MEM008', NULL, 'BR015', 300000000, 1, 13.00, 'Lunas', '2024-09-25 12:05:00', 'KAR008'),
('PJ016', 'Sanji', 'MEM008', NULL, 'BR016', 2000000, 1, 13.00, 'Kredit', '2024-09-25 12:10:00', 'KAR008'),
('PJ017', 'Chopper', 'MEM009', NULL, 'BR001', 15000000, 1, 10.00, 'Lunas', '2024-10-01 14:30:00', 'KAR009'),
('PJ018', 'Chopper', 'MEM009', NULL, 'BR002', 8000000, 1, 10.00, 'Kredit', '2024-10-01 14:35:00', 'KAR009'),
('PJ019', 'Robin Nico', 'MEM010', NULL, 'BR003', 5000000, 1, 25.00, 'Lunas', '2024-10-10 16:40:00', 'KAR010'),
('PJ020', 'Robin Nico', 'MEM010', NULL, 'BR004', 1200000, 1, 25.00, 'Kredit', '2024-10-10 16:45:00', 'KAR010'),
('PJ021', 'Franky', 'MEM011', NULL, 'BR005', 4500000, 1, 14.00, 'Lunas', '2024-10-15 18:50:00', 'KAR011'),
('PJ022', 'Franky', 'MEM011', NULL, 'BR006', 10000000, 1, 14.00, 'Kredit', '2024-10-15 18:55:00', 'KAR011'),
('PJ023', 'Brook', 'MEM012', NULL, 'BR007', 4500000, 1, 16.00, 'Lunas', '2024-10-20 20:00:00', 'KAR012'),
('PJ024', 'Brook', 'MEM012', NULL, 'BR008', 2500000, 1, 16.00, 'Kredit', '2024-10-20 20:05:00', 'KAR012'),
('PJ025', 'Jinbei', 'MEM013', NULL, 'BR009', 6500000, 1, 19.00, 'Lunas', '2024-10-25 08:10:00', 'KAR013'),
('PJ026', 'Jinbei', 'MEM013', NULL, 'BR010', 2000000, 1, 19.00, 'Kredit', '2024-10-25 08:15:00', 'KAR013'),
('PJ027', 'Goku', 'MEM014', NULL, 'BR011', 300000000, 1, 30.00, 'Kredit', '2024-11-01 09:05:00', 'KAR014'),
('PJ028', 'Goku', 'MEM014', NULL, 'BR012', 2000000, 1, 30.00, 'Kredit', '2024-11-01 09:10:00', 'KAR014'),
('PJ029', 'Vegeta', 'MEM015', NULL, 'BR013', 30000, 1, 28.00, 'Lunas', '2024-11-05 10:15:00', 'KAR015'),
('PJ030', 'Vegeta', 'MEM015', NULL, 'BR014', 80000, 1, 28.00, 'Kredit', '2024-11-05 10:20:00', 'KAR015'),
('PJ031', 'Piccolo', 'MEM016', NULL, 'BR015', 300000000, 1, 26.00, 'Lunas', '2024-11-10 11:25:00', 'KAR001'),
('PJ032', 'Piccolo', 'MEM016', NULL, 'BR016', 2000000, 1, 26.00, 'Kredit', '2024-11-10 11:30:00', 'KAR001'),
('PJ033', 'Bulma', 'MEM017', NULL, 'BR001', 15000000, 1, 15.00, 'Lunas', '2024-11-15 12:35:00', 'KAR002'),
('PJ034', 'Bulma', 'MEM017', NULL, 'BR002', 8000000, 1, 15.00, 'Kredit', '2024-11-15 12:40:00', 'KAR002'),
('PJ035', 'Frieza', 'MEM018', NULL, 'BR003', 5000000, 2, 30.00, 'Lunas', '2024-11-20 13:00:00', 'KAR003'),
('PJ036', 'Frieza', 'MEM018', NULL, 'BR004', 1200000, 1, 30.00, 'Kredit', '2024-11-20 13:05:00', 'KAR003'),
('PJ037', 'Cell', 'MEM019', NULL, 'BR005', 4500000, 1, 20.00, 'Lunas', '2024-11-25 14:15:00', 'KAR004'),
('PJ038', 'Cell', 'MEM019', NULL, 'BR006', 10000000, 1, 20.00, 'Kredit', '2024-11-25 14:20:00', 'KAR004'),
('PJ039', 'Majin Buu', 'MEM020', NULL, 'BR007', 4500000, 1, 25.00, 'Lunas', '2024-11-30 15:30:00', 'KAR005'),
('PJ040', 'Majin Buu', 'MEM020', NULL, 'BR008', 2500000, 1, 25.00, 'Kredit', '2024-11-30 15:35:00', 'KAR005');
select *from penjualan_mart;
INSERT INTO Penjualan_Mart (penjualan_id, nama_pelanggan, member_id, pelanggan_id, barang_id, harga_barang, jumlah_terjual, diskon, pembayaran, tanggal_pembelian, karyawan_id) VALUES
-- Pelanggan 1 hingga 5
('PJ041', 'Iron Man', NULL, 'PLG001', 'BR001', 15000000, 1, 10.00, 'Lunas', '2024-08-01 10:00:00', 'KAR001'),
('PJ042', 'Iron Man', NULL, 'PLG001', 'BR002', 8000000, 1, 10.00, 'Kredit', '2024-08-01 10:05:00', 'KAR001'),
('PJ043', 'Iron Man', NULL, 'PLG001', 'BR003', 5000000, 1, 10.00, 'Lunas', '2024-08-01 10:10:00', 'KAR001'),

('PJ044', 'Captain America', NULL, 'PLG002', 'BR004', 1200000, 1, 15.00, 'Lunas', '2024-08-02 11:15:00', 'KAR002'),
('PJ045', 'Captain America', NULL, 'PLG002', 'BR005', 4500000, 1, 15.00, 'Kredit', '2024-08-02 11:20:00', 'KAR002'),
('PJ046', 'Captain America', NULL, 'PLG002', 'BR006', 10000000, 1, 15.00, 'Lunas', '2024-08-02 11:25:00', 'KAR002'),

-- Pelanggan 6 hingga 10
('PJ047', 'Black Widow', NULL, 'PLG003', 'BR007', 4500000, 1, 20.00, 'Lunas', '2024-08-03 13:30:00', 'KAR003'),
('PJ048', 'Black Widow', NULL, 'PLG003', 'BR008', 2500000, 1, 20.00, 'Kredit', '2024-08-03 13:35:00', 'KAR003'),
('PJ049', 'Black Widow', NULL, 'PLG003', 'BR009', 6500000, 1, 20.00, 'Lunas', '2024-08-03 13:40:00', 'KAR003'),

('PJ050', 'Thor', NULL, 'PLG004', 'BR010', 2000000, 1, 18.00, 'Lunas', '2024-08-04 14:00:00', 'KAR004'),
('PJ051', 'Thor', NULL, 'PLG004', 'BR011', 300000000, 1, 18.00, 'Kredit', '2024-08-04 14:05:00', 'KAR004'),
('PJ052', 'Thor', NULL, 'PLG004', 'BR012', 2000000, 1, 18.00, 'Lunas', '2024-08-04 14:10:00', 'KAR004'),

-- Pelanggan 11 hingga 15
('PJ053', 'Hawkeye', NULL, 'PLG005', 'BR013', 30000, 1, 17.00, 'Lunas', '2024-08-05 10:25:00', 'KAR005'),
('PJ054', 'Hawkeye', NULL, 'PLG005', 'BR014', 80000, 1, 17.00, 'Kredit', '2024-08-05 10:30:00', 'KAR005'),
('PJ055', 'Hawkeye', NULL, 'PLG005', 'BR015', 300000000, 1, 17.00, 'Lunas', '2024-08-05 10:35:00', 'KAR005'),

('PJ056', 'Hulk', NULL, 'PLG006', 'BR016', 2000000, 1, 12.00, 'Lunas', '2024-08-06 12:00:00', 'KAR006'),
('PJ057', 'Hulk', NULL, 'PLG006', 'BR001', 15000000, 1, 12.00, 'Kredit', '2024-08-06 12:05:00', 'KAR006'),
('PJ058', 'Hulk', NULL, 'PLG006', 'BR002', 8000000, 1, 12.00, 'Lunas', '2024-08-06 12:10:00', 'KAR006'),

-- Pelanggan 16 hingga 20
('PJ059', 'Spider-Man', NULL, 'PLG007', 'BR003', 5000000, 1, 20.00, 'Lunas', '2024-08-07 14:10:00', 'KAR007'),
('PJ060', 'Spider-Man', NULL, 'PLG007', 'BR004', 1200000, 1, 20.00, 'Kredit', '2024-08-07 14:15:00', 'KAR007'),
('PJ061', 'Spider-Man', NULL, 'PLG007', 'BR005', 4500000, 1, 20.00, 'Lunas', '2024-08-07 14:20:00', 'KAR007'),

('PJ062', 'Doctor Strange', NULL, 'PLG008', 'BR006', 10000000, 1, 25.00, 'Lunas', '2024-08-08 16:30:00', 'KAR008'),
('PJ063', 'Doctor Strange', NULL, 'PLG008', 'BR007', 4500000, 1, 25.00, 'Kredit', '2024-08-08 16:35:00', 'KAR008'),
('PJ064', 'Doctor Strange', NULL, 'PLG008', 'BR008', 2500000, 1, 25.00, 'Lunas', '2024-08-08 16:40:00', 'KAR008'),

('PJ065', 'Captain Marvel', NULL, 'PLG009', 'BR009', 6500000, 1, 18.00, 'Lunas', '2024-08-09 12:00:00', 'KAR009'),
('PJ066', 'Captain Marvel', NULL, 'PLG009', 'BR010', 2000000, 1, 18.00, 'Kredit', '2024-08-09 12:05:00', 'KAR009'),
('PJ067', 'Captain Marvel', NULL, 'PLG009', 'BR011', 300000000, 1, 18.00, 'Lunas', '2024-08-09 12:10:00', 'KAR009'),

('PJ068', 'Scarlet Witch', NULL, 'PLG010', 'BR012', 2000000, 1, 22.00, 'Lunas', '2024-08-10 14:30:00', 'KAR010'),
('PJ069', 'Scarlet Witch', NULL, 'PLG010', 'BR013', 30000, 1, 22.00, 'Kredit', '2024-08-10 14:35:00', 'KAR010'),
('PJ070', 'Scarlet Witch', NULL, 'PLG010', 'BR014', 80000, 1, 22.00, 'Lunas', '2024-08-10 14:40:00', 'KAR010'),

('PJ071', 'Samus Aran', NULL, 'PLG020', 'BR001', 15000000, 1, 10.00, 'Lunas', '2024-08-11 11:00:00', 'KAR011'),
('PJ072', 'Samus Aran', NULL, 'PLG020', 'BR002', 8000000, 1, 10.00, 'Kredit', '2024-08-11 11:05:00', 'KAR011'),
('PJ073', 'Samus Aran', NULL, 'PLG020', 'BR003', 5000000, 1, 10.00, 'Lunas', '2024-08-11 11:10:00', 'KAR011'),

('PJ074', 'Lara Croft', NULL, 'PLG011', 'BR001', 15000000, 1, 10.00, 'Lunas', '2024-08-11 11:00:00', 'KAR011'),
('PJ075', 'Lara Croft', NULL, 'PLG011', 'BR002', 8000000, 1, 10.00, 'Kredit', '2024-08-11 11:05:00', 'KAR011'),
('PJ076', 'Lara Croft', NULL, 'PLG011', 'BR003', 5000000, 1, 10.00, 'Lunas', '2024-08-11 11:10:00', 'KAR011'),

('PJ077', 'Kratos', NULL, 'PLG012', 'BR004', 1200000, 1, 15.00, 'Lunas', '2024-08-12 12:20:00', 'KAR012'),
('PJ078', 'Kratos', NULL, 'PLG012', 'BR005', 4500000, 1, 15.00, 'Kredit', '2024-08-12 12:25:00', 'KAR012'),
('PJ079', 'Kratos', NULL, 'PLG012', 'BR006', 10000000, 1, 15.00, 'Lunas', '2024-08-12 12:30:00', 'KAR012'),

-- Pelanggan 16 hingga 20
('PJ080', 'Nathan Drake', NULL, 'PLG013', 'BR007', 4500000, 1, 20.00, 'Lunas', '2024-08-13 14:15:00', 'KAR013'),
('PJ081', 'Nathan Drake', NULL, 'PLG013', 'BR008', 2500000, 1, 20.00, 'Kredit', '2024-08-13 14:20:00', 'KAR013'),
('PJ082', 'Nathan Drake', NULL, 'PLG013', 'BR009', 6500000, 1, 20.00, 'Lunas', '2024-08-13 14:25:00', 'KAR013'),

('PJ083', 'Ellie', NULL, 'PLG014', 'BR010', 2000000, 1, 18.00, 'Lunas', '2024-08-14 13:00:00', 'KAR014'),
('PJ084', 'Ellie', NULL, 'PLG014', 'BR011', 300000000, 1, 18.00, 'Kredit', '2024-08-14 13:05:00', 'KAR014'),
('PJ085', 'Ellie', NULL, 'PLG014', 'BR012', 2000000, 1, 18.00, 'Lunas', '2024-08-14 13:10:00', 'KAR014'),

('PJ086', 'Joel', NULL, 'PLG015', 'BR013', 30000, 1, 17.00, 'Lunas', '2024-08-15 12:30:00', 'KAR015'),
('PJ087', 'Joel', NULL, 'PLG015', 'BR014', 80000, 1, 17.00, 'Kredit', '2024-08-15 12:35:00', 'KAR015'),
('PJ088', 'Joel', NULL, 'PLG015', 'BR015', 300000000, 1, 17.00, 'Kredit', '2024-08-15 12:40:00', 'KAR015'),

('PJ089', 'Master Chief', NULL, 'PLG016', 'BR016', 2000000, 1, 12.00, 'Lunas', '2024-08-16 15:45:00', 'KAR001'),
('PJ090', 'Master Chief', NULL, 'PLG016', 'BR001', 15000000, 1, 12.00, 'Kredit', '2024-08-16 15:50:00', 'KAR001'),
('PJ091', 'Master Chief', NULL, 'PLG016', 'BR002', 8000000, 1, 12.00, 'Lunas', '2024-08-16 15:55:00', 'KAR001'),

('PJ092', 'Dante', NULL, 'PLG017', 'BR003', 5000000, 1, 20.00, 'Lunas', '2024-08-17 16:30:00', 'KAR002'),
('PJ093', 'Dante', NULL, 'PLG017', 'BR004', 1200000, 1, 20.00, 'Kredit', '2024-08-17 16:35:00', 'KAR002'),
('PJ094', 'Dante', NULL, 'PLG017', 'BR005', 4500000, 1, 20.00, 'Lunas', '2024-08-17 16:40:00', 'KAR002'),

('PJ095', 'Geralt of Rivia', NULL, 'PLG018', 'BR006', 10000000, 1, 25.00, 'Lunas', '2024-08-18 17:00:00', 'KAR003'),
('PJ096', 'Geralt of Rivia', NULL, 'PLG018', 'BR007', 4500000, 1, 25.00, 'Kredit', '2024-08-18 17:05:00', 'KAR003'),
('PJ097', 'Geralt of Rivia', NULL, 'PLG018', 'BR008', 2500000, 1, 25.00, 'Lunas', '2024-08-18 17:10:00', 'KAR003'),

('PJ098', 'Aloy', NULL, 'PLG019', 'BR009', 6500000, 1, 18.00, 'Lunas', '2024-08-19 14:00:00', 'KAR004'),
('PJ099', 'Aloy', NULL, 'PLG019', 'BR010', 2000000, 1, 18.00, 'Kredit', '2024-08-19 14:05:00', 'KAR004'),
('PJ100', 'Aloy', NULL, 'PLG019', 'BR011', 300000000, 1, 18.00, 'Lunas', '2024-08-19 14:10:00', 'KAR004');




INSERT INTO pengadaan_mart (pengadaan_id, tanggal_pemesanan, tanggal_terkirim, nama_barang, barang_id, jumlah_barang, supplier_id) VALUES
-- Supplier 1 (SUP001)
('PG001', '2024-08-01', '2024-08-03', 'Laptop Gaming', 'BR001', 10, 'SUP001'),
('PG002', '2024-08-15', '2024-08-18', 'Smartphone', 'BR002', 15, 'SUP001'),
('PG003', '2024-09-01', '2024-09-03', 'Smartwatch', 'BR003', 20, 'SUP001'),
('PG004', '2024-09-15', '2024-09-17', 'TV', 'BR006', 12, 'SUP001'),
('PG005', '2024-10-01', '2024-10-03', 'Soundbar', 'BR007', 18, 'SUP001'),

-- Supplier 2 (SUP002)
('PG006', '2024-08-05', '2024-08-07', 'Kursi Kantor', 'BR004', 30, 'SUP001'),
('PG007', '2024-08-20', '2024-08-23', 'Meja Makan', 'BR005', 25, 'SUP001'),
('PG008', '2024-09-05', '2024-09-08', 'Lemari Pakaian', 'BR008', 22, 'SUP001'),
('PG009', '2024-09-20', '2024-09-22', 'Kulkas 2 Pintu', 'BR009', 10, 'SUP001'),
('PG010', '2024-10-05', '2024-10-07', 'Meja Kerja', 'BR010', 15, 'SUP001'),

-- Supplier 3 (SUP003)
('PG011', '2024-08-10', '2024-08-12', 'Kulkas 1 Pintu', 'BR011', 50, 'SUP003'),
('PG012', '2024-08-25', '2024-08-28', 'Kursi Tamu', 'BR012', 100, 'SUP001'),
('PG013', '2024-09-10', '2024-09-12', 'Kursi Makan', 'BR013', 20, 'SUP001'),
('PG014', '2024-09-25', '2024-09-27', 'Kursi Sova', 'BR014', 60, 'SUP001'),
('PG015', '2024-10-10', '2024-10-12', 'Kulkas 1 Pintu', 'BR015', 50, 'SUP001'),

-- Supplier 4 (SUP004)
('PG016', '2024-08-02', '2024-08-04', 'Spring Bed', 'BR016', 100, 'SUP004'),
('PG017', '2024-08-16', '2024-08-18', 'Laptop Gaming', 'BR001', 10, 'SUP004'),
('PG018', '2024-09-02', '2024-09-04', 'Smartphone', 'BR002', 15, 'SUP004'),
('PG019', '2024-09-16', '2024-09-18', 'Smartwatch', 'BR003', 20, 'SUP004'),
('PG020', '2024-10-02', '2024-10-04', 'Soundbar', 'BR007', 18, 'SUP004'),

-- Supplier 5 (SUP005)
('PG021', '2024-08-07', '2024-08-09', 'Kursi Kantor', 'BR004', 30, 'SUP001'),
('PG022', '2024-08-22', '2024-08-25', 'Meja Makan', 'BR005', 25, 'SUP005'),
('PG023', '2024-09-07', '2024-09-09', 'Lemari Pakaian', 'BR008', 22, 'SUP001'),
('PG024', '2024-09-22', '2024-09-24', 'Kulkas 2 Pintu', 'BR009', 10, 'SUP005'),
('PG025', '2024-10-07', '2024-10-09', 'Meja Kerja', 'BR010', 15, 'SUP005'),
-- Supplier 6 (SUP006)
('PG026', '2024-08-03', '2024-08-05', 'Smartphone', 'BR002', 15, 'SUP006'),
('PG027', '2024-08-18', '2024-08-21', 'Smartwatch', 'BR003', 20, 'SUP006'),
('PG028', '2024-09-03', '2024-09-05', 'Kursi Kantor', 'BR004', 30, 'SUP006'),
('PG029', '2024-09-18', '2024-09-21', 'Meja Makan', 'BR005', 25, 'SUP006'),
('PG030', '2024-10-03', '2024-10-06', 'Kulkas 2 Pintu', 'BR009', 10, 'SUP006'),

-- Supplier 7 (SUP007)
('PG031', '2024-08-05', '2024-08-07', 'Kulkas 1 Pintu', 'BR011', 50, 'SUP007'),
('PG032', '2024-08-20', '2024-08-23', 'Kursi Tamu', 'BR012', 100, 'SUP007'),
('PG033', '2024-09-05', '2024-09-08', 'Kursi Makan', 'BR013', 20, 'SUP007'),
('PG034', '2024-09-20', '2024-09-23', 'Kursi Sova', 'BR014', 60, 'SUP007'),
('PG035', '2024-10-05', '2024-10-08', 'Kulkas 1 Pintu', 'BR015', 50, 'SUP007'),

-- Supplier 8 (SUP008)
('PG036', '2024-08-07', '2024-08-09', 'Spring Bed', 'BR016', 100, 'SUP008'),
('PG037', '2024-08-22', '2024-08-25', 'Laptop Gaming', 'BR001', 10, 'SUP008'),
('PG038', '2024-09-07', '2024-09-09', 'Smartphone', 'BR002', 15, 'SUP008'),
('PG039', '2024-09-22', '2024-09-24', 'Smartwatch', 'BR003', 20, 'SUP008'),
('PG040', '2024-10-08', '2024-10-10', 'Soundbar', 'BR007', 18, 'SUP008'),

-- Supplier 9 (SUP009)
('PG041', '2024-08-10', '2024-08-12', 'Kursi Kantor', 'BR004', 30, 'SUP009'),
('PG042', '2024-08-25', '2024-08-28', 'Meja Makan', 'BR005', 25, 'SUP009'),
('PG043', '2024-09-10', '2024-09-12', 'Lemari Pakaian', 'BR008', 22, 'SUP009'),
('PG044', '2024-09-25', '2024-09-27', 'Kulkas 2 Pintu', 'BR009', 10, 'SUP009'),
('PG045', '2024-10-10', '2024-10-12', 'Meja Kerja', 'BR010', 15, 'SUP009'),

-- Supplier 10 (SUP010)
('PG046', '2024-08-12', '2024-08-14', 'Kulkas 1 Pintu', 'BR011', 50, 'SUP010'),
('PG047', '2024-08-27', '2024-08-30', 'Kursi Tamu', 'BR012', 100, 'SUP010'),
('PG048', '2024-09-12', '2024-09-15', 'Kursi Makan', 'BR013', 20, 'SUP010'),
('PG049', '2024-09-27', '2024-09-29', 'Kursi Sova', 'BR014', 60, 'SUP010'),
('PG050', '2024-10-12', '2024-10-14', 'Kulkas 1 Pintu', 'BR015', 50, 'SUP010');
select * from pengadaan_mart;
-- Insert data transaksi untuk Spring Bed King Koil pada bulan Oktober 2024
INSERT INTO Penjualan_Mart (
    penjualan_id, nama_pelanggan, member_id, pelanggan_id, barang_id, 
    harga_barang, jumlah_terjual, diskon, pembayaran, karyawan_id, tanggal_pembelian
)
VALUES 
('PJ201', 'Geralt of Rivia', NULL, 'PLG018', 'BR016', 2000000, 2, 15.00, 'Lunas', 'KAR002', '2024-10-05 10:30:00'),
('PJ202', 'Kratos', NULL, 'PLG012', 'BR016', 2000000, 3, 10.00, 'Kredit', 'KAR003', '2024-10-12 14:45:00'),
('PJ203', 'Joel', NULL, 'PLG015', 'BR016', 2000000, 1, 5.00, 'Lunas', 'KAR004', '2024-10-15 16:00:00'),
('PJ204', 'Nathan Drake', NULL, 'PLG013', 'BR016', 2000000, 4, 20.00, 'Lunas', 'KAR005', '2024-10-20 11:20:00'),
('PJ205', 'Ellie', NULL, 'PLG014', 'BR016', 2000000, 2, 10.00, 'Kredit', 'KAR006', '2024-10-25 13:10:00');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5(A)
DELIMITER //
CREATE PROCEDURE penjualan(
    IN p_penjualan_id VARCHAR(50),
    IN p_nama_pelanggan VARCHAR(50),
    IN p_member_id VARCHAR(50),
    IN p_pelanggan_id VARCHAR(50),
    IN p_barang_id VARCHAR(50),
    IN p_harga_barang INT,
    IN p_jumlah_terjual INT,
    IN p_diskon DECIMAL(10, 2),
    IN p_pembayaran ENUM('Lunas', 'Kredit'),
    IN p_karyawan_id VARCHAR(50) )
BEGIN
    DECLARE stok_barang INT;
    SELECT jumlah_barang INTO stok_barang FROM barang_mart WHERE barang_id = p_barang_id;
    IF stok_barang >= p_jumlah_terjual THEN
        INSERT INTO Penjualan_Mart (
            penjualan_id, nama_pelanggan, member_id, pelanggan_id, barang_id,
            harga_barang, jumlah_terjual, diskon, pembayaran, karyawan_id
        ) VALUES (
            p_penjualan_id, p_nama_pelanggan, p_member_id, p_pelanggan_id, p_barang_id,
            p_harga_barang, p_jumlah_terjual, p_diskon, p_pembayaran, p_karyawan_id);
        UPDATE barang_mart
        SET jumlah_barang = jumlah_barang - p_jumlah_terjual
        WHERE barang_id = p_barang_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stok tidak mencukupi';
    END IF;
END //
DELIMITER ;
select * from barang_mart;
CALL penjualan('PJ101', 'Aloy', NULL, 'PLG019', 'BR001', 300000000, 1, 18.00, 'Lunas', 'KAR004');


-- 5 (B)
DELIMITER //
CREATE PROCEDURE update_pembayaran(
    IN p_penjualan_id VARCHAR(50)
)
BEGIN
    SELECT * FROM Penjualan_Mart WHERE penjualan_id = p_penjualan_id;
    UPDATE Penjualan_Mart
    SET pembayaran = 'Lunas'
    WHERE penjualan_id = p_penjualan_id;
    SELECT * FROM Penjualan_Mart WHERE penjualan_id = p_penjualan_id;
END //
DELIMITER ;
drop procedure if exists update_pembayaran_lunas;
select * from penjualan_mart;
CALL update_pembayaran('PJ002');

DELIMITER //
CREATE PROCEDURE update_kartu(
    IN p_member_id VARCHAR(50),
    IN p_member_berakhir TIMESTAMP
)
BEGIN
    SELECT * FROM member_mart WHERE member_id = p_member_id;
    UPDATE member_mart
    SET member_berakhir = p_member_berakhir
    WHERE member_id = p_member_id;
    SELECT * FROM member_mart WHERE member_id = p_member_id;
END //
DELIMITER ;
select * from member_mart;
CALL update_kartu('MEM001', '2026-12-31 23:59:59');

-- 5 (D)
DELIMITER //

CREATE PROCEDURE HapusSupplier_lama()
BEGIN
    CREATE TEMPORARY TABLE TempOldestSupplier AS
    SELECT supplier_id
    FROM supplier_mart
    WHERE terakhir_pengiriman = (SELECT MIN(terakhir_pengiriman) FROM supplier_mart);
    SELECT * FROM supplier_mart
    WHERE supplier_id IN (SELECT supplier_id FROM TempOldestSupplier);
    DELETE FROM supplier_mart
    WHERE supplier_id IN (SELECT supplier_id FROM TempOldestSupplier);
    DROP TEMPORARY TABLE TempOldestSupplier;
END //
DELIMITER ;


SELECT * FROM supplier_mart
ORDER BY terakhir_pengiriman ASC;

CALL HapusSupplier_lama();


-- 5 (E)
DELIMITER //
CREATE PROCEDURE delete_supplier_tidakaktif(
    IN p_supplier_id VARCHAR(50)
)
BEGIN
    SELECT * FROM barang_mart WHERE supplier_id = p_supplier_id;
    DELETE FROM barang_mart WHERE supplier_id = p_supplier_id;
    SELECT * FROM supplier_mart WHERE supplier_id = p_supplier_id;
    DELETE FROM supplier_mart WHERE supplier_id = p_supplier_id;

END //
DELIMITER ;
select * from supplier_mart;
CALL delete_supplier_tidakaktif('SUP003');
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6 A
DELIMITER //
CREATE FUNCTION pelangganmember_kredit() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM Penjualan_Mart
    WHERE pembayaran = 'Kredit' AND member_id IS NOT NULL;
    RETURN jumlah;
END //
DELIMITER ;
SELECT pelangganmember_kredit();

-- 6B
DELIMITER //
CREATE FUNCTION pelangganmember_Lunas() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM Penjualan_Mart
    WHERE pembayaran = 'Lunas' AND member_id IS NOT NULL;
    RETURN jumlah;
END //
DELIMITER ;
SELECT pelangganmember_Lunas();

-- 6C
DELIMITER //
CREATE FUNCTION MejaMakanAgustus_September2024() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM Penjualan_Mart AS p
    JOIN barang_mart AS b ON p.barang_id = b.barang_id
    WHERE b.kategori_barang = 'furniture'
      AND b.nama_barang = 'Meja Makan'
      AND p.tanggal_pembelian BETWEEN '2024-08-01' AND '2024-09-30';
    RETURN jumlah;
END //
DELIMITER ;
SELECT MejaMakanAgustus_September2024();
-- 6D
DELIMITER //
CREATE FUNCTION SpringBedKingKoil_Oktober2024() 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM Penjualan_Mart AS p
    JOIN barang_mart AS b ON p.barang_id = b.barang_id
    WHERE b.nama_barang = 'spring bed'
      AND b.kategori_barang = 'furniture'
      AND p.tanggal_pembelian BETWEEN '2024-10-01' AND '2024-10-31';
    RETURN jumlah;
END //
DELIMITER ;

SELECT SpringBedKingKoil_Oktober2024();
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7A
CREATE VIEW BarangElektronik AS
SELECT *
FROM barang_mart
WHERE kategori_barang = 'elektronik'
  AND (nama_barang = 'Kulkas 2 Pintu' 
       OR nama_barang = 'Kulkas 1 Pintu'
       OR nama_barang = 'TV');

SELECT * FROM BarangElektronik;
-- 7B
CREATE VIEW Penjualan_Credit AS
SELECT p.penjualan_id, p.nama_pelanggan, p.member_id, p.barang_id, p.harga_barang, 
       p.jumlah_terjual, p.diskon, p.pembayaran, p.tanggal_pembelian,
       b.nama_barang, b.kategori_barang
FROM Penjualan_Mart p
JOIN member_mart m ON p.member_id = m.member_id
JOIN barang_mart b ON p.barang_id = b.barang_id
WHERE p.pembayaran = 'Kredit'
  AND p.member_id <> '-'
  AND (b.kategori_barang = 'furniture' 
       OR b.nama_barang = 'Kulkas 2 Pintu'
       OR b.nama_barang = 'Kulkas 1 Pintu'
       OR b.nama_barang = 'TV');

SELECT * FROM Penjualan_Credit;
-- 7C
CREATE VIEW UD_AAA_AugOkt2024 AS
SELECT p.pengadaan_id, p.tanggal_pemesanan, p.tanggal_terkirim, 
       p.nama_barang, p.jumlah_barang, p.supplier_id,
       s.toko_supplier
FROM pengadaan_mart p	
JOIN supplier_mart s ON p.supplier_id = s.supplier_id
WHERE s.toko_supplier = 'UD.AAA'
  AND p.tanggal_pemesanan BETWEEN '2024-08-01' AND '2024-10-31';
  
  SELECT * FROM UD_AAA_AugOkt2024;
-- 7D
CREATE VIEW Penjualan_KulkasTVCreditMember AS
SELECT p.penjualan_id, p.nama_pelanggan, p.member_id, p.barang_id, p.harga_barang, 
       p.jumlah_terjual, p.diskon, p.pembayaran, p.tanggal_pembelian,
       b.nama_barang, b.kategori_barang
FROM Penjualan_Mart p
JOIN member_mart m ON p.member_id = m.member_id
JOIN barang_mart b ON p.barang_id = b.barang_id
WHERE p.pembayaran = 'Kredit'
  AND (nama_barang = 'Kulkas 2 Pintu' 
       OR nama_barang = 'Kulkas 1 Pintu'
       OR nama_barang = 'TV');
SELECT * FROM Penjualan_KulkasTVCreditMember;

-- 7E 
CREATE VIEW UD_XXX_AugOkt2024 AS
SELECT p.pengadaan_id, p.tanggal_pemesanan, p.tanggal_terkirim, 
       p.nama_barang, p.jumlah_barang, p.supplier_id,
       s.toko_supplier, b.kategori_barang
FROM pengadaan_mart p
JOIN supplier_mart s ON p.supplier_id = s.supplier_id
JOIN barang_mart b ON p.barang_id = b.barang_id
WHERE s.toko_supplier = 'UD.XXX'
  AND b.kategori_barang = 'furniture'
  AND p.tanggal_pemesanan BETWEEN '2024-08-01' AND '2024-10-31';

SELECT * FROM UD_XXX_AugOkt2024;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 8A
DELIMITER //
CREATE PROCEDURE TampilSeluruhKaryawan()
BEGIN
    SELECT * FROM karyawan_mart;
END //
DELIMITER ;
call TampilSeluruhKaryawan;
-- 8B
DELIMITER //

CREATE PROCEDURE TampilKaryawanAdmin()
BEGIN
    SELECT * FROM karyawan_mart
    WHERE jabatan_karyawan = 'administrasi';
END //

DELIMITER ;
call TampilKaryawanAdmin();
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    p.pelanggan_id,
    p.nama_pelanggan,
    pj.penjualan_id,
    pj.barang_id,
    pj.harga_barang,
    pj.jumlah_terjual,
    pj.harga_barang * pj.jumlah_terjual AS total_transaksi,
    CASE 
        WHEN (pj.harga_barang * pj.jumlah_terjual) BETWEEN 1000000 AND 5000000 THEN (pj.harga_barang * pj.jumlah_terjual) * 0.02
        WHEN (pj.harga_barang * pj.jumlah_terjual) > 5000000 AND (pj.harga_barang * pj.jumlah_terjual) <= 10000000 THEN (pj.harga_barang * pj.jumlah_terjual) * 0.025
        WHEN (pj.harga_barang * pj.jumlah_terjual) > 10000000 AND (pj.harga_barang * pj.jumlah_terjual) <= 25000000 THEN (pj.harga_barang * pj.jumlah_terjual) * 0.03
        WHEN (pj.harga_barang * pj.jumlah_terjual) > 25000000 THEN (pj.harga_barang * pj.jumlah_terjual) * 0.04
        ELSE 0
    END AS diskon
FROM 
    pelanggan_mart p
JOIN 
    Penjualan_Mart pj ON p.pelanggan_id = pj.pelanggan_id;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER update_stok_barang AFTER INSERT ON Penjualan_Mart
FOR EACH ROW
BEGIN
    UPDATE barang_mart 
    SET jumlah_barang = jumlah_barang - NEW.jumlah_terjual
    WHERE barang_id = NEW.barang_id;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER cek_stok_minimum AFTER UPDATE ON barang_mart
FOR EACH ROW
BEGIN
    IF NEW.jumlah_barang < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Peringatan: Stok barang hampir habis!';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_terakhir_pengiriman AFTER INSERT ON pengadaan_mart
FOR EACH ROW
BEGIN
    UPDATE supplier_mart
    SET terakhir_pengiriman = NEW.tanggal_terkirim
    WHERE supplier_id = NEW.supplier_id;
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER diskon_member_sebelum_penjualan BEFORE INSERT ON Penjualan_Mart
FOR EACH ROW
BEGIN
    IF NEW.member_id IS NOT NULL THEN
        SET NEW.diskon = NEW.harga_barang * 0.05;
    END IF;
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER validasi_jumlah_pengadaan BEFORE INSERT ON pengadaan_mart
FOR EACH ROW
BEGIN
    IF NEW.jumlah_barang <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Jumlah barang yang dipesan harus lebih dari nol.';
    END IF;
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER set_expired_date_member BEFORE INSERT ON member_mart
FOR EACH ROW
BEGIN
    SET NEW.member_berakhir = DATE_ADD(NEW.daftar_member, INTERVAL 1 YEAR);
END;
//
DELIMITER ;
CREATE TABLE log_gaji_karyawan (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    karyawan_id VARCHAR(50),
    gaji_lama INT,
    gaji_baru INT,
    tanggal_perubahan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //
CREATE TRIGGER log_perubahan_gaji AFTER UPDATE ON karyawan_mart
FOR EACH ROW
BEGIN
    IF OLD.gaji_karyawan <> NEW.gaji_karyawan THEN
        INSERT INTO log_gaji_karyawan (karyawan_id, gaji_lama, gaji_baru)
        VALUES (OLD.karyawan_id, OLD.gaji_karyawan, NEW.gaji_karyawan);
    END IF;
END;
//
DELIMITER ;

SHOW TRIGGERS;
SHOW TRIGGERS FROM mart_UTS;








