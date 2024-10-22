create table Bahanbaku (
	IDBahanBaku varchar (50) not null default '-' ,
    NamaBarang varchar(50) unique not null default '-',
    Jumlahstock int unsigned ,
    HargaPerKG int unsigned,
    Updatebarang timestamp default current_timestamp on update current_timestamp,
    primary key (IDBahanBaku)
    )engine = InnoDB;
    
    Drop table Bahanbaku;
    
Create table Akunpelanggan (
	IDPelanggan varchar(50) not null default '-' ,
    UsernamePelanggan varchar (50) unique not null default '-' ,
    PassPelanggan varchar(50) not null default '-',
    JenisKelaminPelanggan enum ( 'lakilaki','Perempuan') not null,
    PerusahaanPelanggan varchar (50) unique not null default '-',
    AlamatPerusahaan  varchar(50) unique not null default '-',
    primary key (IDPelanggan)
    ) engine = InnoDB;
    
    Drop table Akunpelanggan;
    
Create table Pembelian (
	IDPembelian varchar (50) not null default '-' ,
    UsernamePembeli varchar (50) not null default '-',
    IDBarang varchar (50) not null default '-',
    Barangterbeli varchar (50) not null default '-',
    PetugasPelayanan varchar (50) not null default '-',
    Jumlahterbeli int unsigned,
    Waktupembelian timestamp default current_timestamp on update current_timestamp,
    PerusahaanPembeli varchar (50) not null default '-',
    AlamatPengiriman varchar(50) not null default '-',
    primary key (IDPembelian)
    ) engine = InnoDB;

	Drop table Pembelian;
    
create table Karyawan (
	IDKaryawan varchar (50) not null default '0' ,
    UsernameKaryawan varchar(50) unique not null default 'unknown',
    passKaryawan varchar (50) not null default 'disembunyikan',
    JabatanKaryawan enum ('CEO','direktur','wakil direktur','manajer','wakil manajer','Kepala divisi','Supervisior','karyawan') not null, 
    primary key (IDKaryawan)
    )engine = InnoDB;    
    
    Drop table Karyawan;
    
Insert into BahanBaku (IDBahanBaku,NamaBarang,Jumlahstock,HargaperKG)
values ('JG001','Jagung','101','40000'),
('JG002','Padi','400','10000'),
('JG003','Ubi','190','55000'),
('JG004','Gandum','325','40000'),
('BA001','Apel','765','30000'),
('BA002','Kelapa Sawit','100','400000'),
('BA003','Karet','716','3000'),
('BA004','Teh','170','20000'),
('BA005','Kopi','726','12000'),
('BA006','Tebu','100','400000'),
('BA007','Kakao','736','32000'),
('BA008','Cengkeh','180','54000');

Insert into Akunpelanggan (IDPelanggan,UsernamePelanggan,PassPelanggan,JenisKelaminPelanggan,PerusahaanPelanggan,AlamatPerusahaan)
values ('RE142','Kuma','Kuma123','lakilaki','PT Cicak','Jalan Cicak'),
('RE312','Luffy','Luffy228','lakilaki','PT Bunglon','Jalan Bunglon'),
('RE164','Sanji','Sanji891','lakilaki','PT Buaya','Jalan Buaya'),
('RE773','Zoro','Zoro673','lakilaki','PT Karet','Jalan Karet'),
('RE351','Nami','Nami473','perempuan','PT Nusa','Jalan Nusa'),
('RE751','Robin','Robin313','perempuan','PT Jeruk','Jalan Kebonjeruk'),
('RE239','Usopp','Usopp253','lakilaki','PT Sirsak','Jalan Sirsak'),
('RE031','Hancock','Hancock923','perempuan','PT manggis','Jalan Kemanggisan'),
('RE953','Rayleigh','Rayleigh782','lakilaki','PT Roger','Jalan Roger');

Insert into karyawan (IDKaryawan,UsernameKaryawan,PassKaryawan,JabatanKaryawan)
values ('ZD334','Naruto','Naruto813','CEO'),
('ZD412','Sasuke','Sasuke273','Direktur'),
('ZD643','Sakura','Sakura713','Wakil Direktur'),
('ZD234','Kakashi','Kakashi615','Manajer'),
('ZD856','Garaa','Garaa273','Wakil Manajer'),
('ZD754','Shikamaru','Shikamaru643','Kepala Divisi'),
('ZD852','Lee','Lee572','Supervisior'),
('ZD957','Hinata','Hinata231','karyawan'),
('ZD534','Choji','Choji634','Karyawan'),
('ZD764','Temari','Temari312','Karyawan'),
('ZD523','Kankuro','Kankuro411','Karyawan'),
('ZD865','Neji','Neji323','Karyawan');

alter table Pembelian add  constraint fk_Pelanggan foreign key (UsernamePembeli) references Akunpelanggan (UsernamePelanggan);

alter table Pembelian add  constraint fk_BahanBaku foreign key (IDBarang) references BahanBaku (IDBahanBaku);

alter table Pembelian add  constraint fk_BahanBaku_2 foreign key (BarangTerbeli) references BahanBaku (NamaBarang);

alter table Pembelian add  constraint fk_Karyawan foreign key (PetugasPelayanan) references karyawan (UsernameKaryawan);

alter table Pembelian add  constraint fk_Pelanggan_2 foreign key (PerusahaanPembeli) references Akunpelanggan (PerusahaanPelanggan);

alter table Pembelian add  constraint fk_Pelanggan_3 foreign key (AlamatPengiriman) references Akunpelanggan (AlamatPerusahaan);

select * from pembelian;

select * from akunpelanggan;

select * from bahanbaku;

select * from karyawan;

insert into Pembelian (IDPembelian,UsernamePembeli,IDBarang,Barangterbeli,PetugasPelayanan,JumlahTerbeli,PerusahaanPembeli,AlamatPengiriman)
values ('DZ110','kuma','JG001','Jagung','Naruto','10','PT Cicak','Jalan Cicak');

