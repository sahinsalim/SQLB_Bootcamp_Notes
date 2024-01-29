--CREATE table Kitaplar(
--	KitapID int primary key identity(1,1),
--	KitapAdi nvarchar(50) not null,
--	Yazar nvarchar(50) not null,
--	SayfaSayisi nvarchar(50) not null,
--	YayinEvi nvarchar(50) not null
--)

--create table Kullanicilar(
--	KullaniciID int primary key identity(1,1),
--	KullaniciAdi nvarchar(50) unique not null,
--	Email nvarchar(50) unique not null,
--	TCNo nvarchar(11) unique not null,
--	Bolum nvarchar(80) not null,
--	Sinif int not null check (Sinif>=1 and Sinif<=4),
--	DogumTarihi date not null
--)

--create table AlinanKitaplar(
--	AlinanKitapID int primary key identity(1,1),
--	KitapID int foreign key references Kitaplar(KitapID),
--	KullaniciID int foreign key references Kullanicilar(KullaniciID),
--	AlmaTarihi date not null,
--	ÝadeTarihi date 
--)

--INSERT INTO Kitaplar (KitapAdi, Yazar, SayfaSayisi, Yayinevi)
--VALUES
--    ('Dönüþüm', 'Franz Kafka', 150, 'Everest Yayýnlarý'),
--    ('1984', 'George Orwell', 300, 'Penguin Books'),
--    ('Suç ve Ceza', 'Fyodor Dostoyevsky', 500, 'Ýþ Bankasý Kültür Yayýnlarý'),
--    ('Sefiller', 'Victor Hugo', 700, 'Can Yayýnlarý'),
--    ('Beyaz Diþ', 'Jack London', 250, 'Ýthaki Yayýnlarý'),
--    ('Göçebe', 'Erin Hunter', 350, 'Artemis Yayýnlarý'),
--    ('Harry Potter ve Felsefe Taþý', 'J.K. Rowling', 400, 'Yapý Kredi Yayýnlarý'),
--    ('1984', 'George Orwell', 300, 'Pegasus Yayýnlarý'),
--    ('Ýstanbul Hatýrasý', 'Ahmet Ümit', 200, 'Ýthaki Yayýnlarý'),
--    ('Ýnsan Neyle Yaþar', 'Lev Tolstoy', 120, 'Can Yayýnlarý')


--INSERT INTO Kullanicilar (KullaniciAdi, Email, TCNo, Bolum, DogumTarihi, Sinif)
--VALUES
--    ('ahmet01', 'ahmet@email.com', '12345678901', 'Bilgisayar Mühendisliði', '1995-05-15', 3),
--    ('mehmet02', 'mehmet@email.com', '23456789012', 'Elektrik Mühendisliði', '1997-08-20', 2),
--    ('ayse03', 'ayse@email.com', '34567890123', 'Makine Mühendisliði', '1996-02-10', 4),
--    ('elif04', 'elif@email.com', '45678901234', 'Kimya Mühendisliði', '1998-11-25', 1),
--    ('ali05', 'ali@email.com', '56789012345', 'Ýnþaat Mühendisliði', '1999-07-30', 2)



--Insert into AlinanKitaplar(KitapID, KullaniciID, AlmaTarihi, ÝadeTarihi)
--values
--(1,1,'2024-01-15',DATEADD(DAY,15,'2024-01-15')),
--(2,3,'2024-01-20',DATEADD(DAY,15,'2024-01-20')),
--(3,2,'2024-01-25',DATEADD(DAY,15,'2024-01-25')),
--(4,4,'2024-01-30',DATEADD(DAY,15,'2024-01-30')),
--(7,5,'2024-02-15',DATEADD(DAY,15,'2024-02-15'))

--SELECT COUNT(*) as ToplamKitapSayisi
--from Kitaplar

--Select SUM(SayfaSayisi) from Kitaplar

--avg

--select MIN(SayfaSayisi) from Kitaplar


--Select MAX(SayfaSayisi) from Kitaplar



--select
--Kullanicilar.Bolum,
--Kullanicilar.KullaniciAdi,
--Kitaplar.KitapAdi
--from 
--Kullanicilar
--inner join AlinanKitaplar on Kullanicilar.KullaniciID = AlinanKitaplar.KullaniciID
--inner join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID


--select
--K.Bolum,
--K.KullaniciAdi,
--KK.KitapAdi
--from 
--Kullanicilar K
--inner join AlinanKitaplar on K.KullaniciID = AlinanKitaplar.KullaniciID
--inner join Kitaplar KK on AlinanKitaplar.KitapID = KK.KitapID


--select
--Kitaplar.KitapAdi,
--Kullanicilar.KullaniciAdi
--from
--Kitaplar
--left Join AlinanKitaplar on Kitaplar.KitapID = AlinanKitaplar.KitapID
--left join Kullanicilar on AlinanKitaplar.KullaniciID = Kullanicilar.KullaniciID


--select
--Kitaplar.KitapAdi,
--Kullanicilar.KullaniciAdi
--from
--AlinanKitaplar
--Right join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID
--Right join Kullanicilar on AlinanKitaplar.KullaniciID = Kullanicilar.KullaniciID


--select 
--Kullanicilar.KullaniciAdi,
--Count(AlinanKitaplar.AlinanKitapID) as AldigiKitapSayisi
--from
--kullanicilar
--join AlinanKitaplar on Kullanicilar.KullaniciID = AlinanKitaplar.KullaniciID
--group by
--Kullanicilar.KullaniciAdi

--select
--Kitaplar.Yazar,
--COUNT(Kitaplar.KitapID) as 'Yazdýðý Kitap Sayýsý'
--from 
--kitaplar
--group by
--Kitaplar.Yazar

--select
--Kullanicilar.KullaniciAdi,
--SUM(Kitaplar.SayfaSayisi) as 'Toplam Sayfa Sayisi'
--from
--Kullanicilar
--join AlinanKitaplar on Kullanicilar.KullaniciID = AlinanKitaplar.KullaniciID
--join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID
--group by
--Kullanicilar.KullaniciAdi


--select 
--Kullanicilar.KullaniciAdi,
--COUNT(AlinanKitaplar.AlinanKitapID) as 'Aldýðý Kitap Sayýsý'
--from
--Kullanicilar
--inner join AlinanKitaplar on Kullanicilar.KullaniciID = AlinanKitaplar.KullaniciID
--group by
--Kullanicilar.KullaniciAdi
--having
--COUNT(AlinanKitaplar.AlinanKitapID) >=2


--select
--Kitaplar.KitapAdi,
--Kitaplar.Yazar,
--SUM(Kitaplar.SayfaSayisi) as 'Toplam Sayfa Sayýsý'
--from
--Kitaplar
--group by
--Kitaplar.Yazar
--having
--SUM(Kitaplar.SayfaSayisi) >= 500

--select top 1
--Kitaplar.Yazar,
--COUNT(AlinanKitaplar.KitapID) as ToplamAlýnanKitapSayýsý
--from
--Kitaplar
--join AlinanKitaplar on Kitaplar.KitapID = AlinanKitaplar.KitapID
--group by
--Kitaplar.KitapID, Kitaplar.Yazar, Kitaplar.YayinEvi
--order by
--ToplamAlýnanKitapSayýsý Desc


--select
--Kitaplar.KitapAdi,
--Kullanicilar.Email,
--AlinanKitaplar.AlmaTarihi,
--AlinanKitaplar.ÝadeTarihi,
--DATEDIFF(day,AlinanKitaplar.ÝadeTarihi,GETDATE()) as 'Gecikme Günü'
--from
--AlinanKitaplar
--inner join Kullanicilar on AlinanKitaplar.KullaniciID= Kullanicilar.KullaniciID
--inner join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID
--where
--AlinanKitaplar.ÝadeTarihi < GETDATE()


--Select KullaniciID from Kullanicilar
--Intersect -- ortak olanlarý al sadece diyor bu komut.
--select KullaniciID from AlinanKitaplar


--select KitapID from Kitaplar
--Except -- Ortak olmayanlarý al sadece diyor bu komut.
--Select KitapID from AlinanKitaplar

--Select KitapID from Kitaplar
--union 
--select KitapID from AlinanKitaplar


--Select KitapID from Kitaplar
--union all
--select KitapID from AlinanKitaplar

--Hackerrank

--select
--Kitaplar.Yazar,
--COUNT(Kitaplar.KitapID) as YazdigiKitapSayisi,
--sum(Kitaplar.SayfaSayisi) as ToplamSayfaSayisi
--from
--Kitaplar
--group by
--Kitaplar.Yazar


--select top 1
--Kullanicilar.Sinif,
--COUNT(AlinanKitaplar.AlinanKitapID) as KitapSayisi
--from 
--Kullanicilar
--inner join AlinanKitaplar on Kullanicilar.KullaniciID = AlinanKitaplar.KullaniciID
--group by
--Kullanicilar.Sinif
--order by
--KitapSayisi desc

--select top 1
--Kitaplar.KitapAdi,
--Kullanicilar.KullaniciAdi,
--AlinanKitaplar.AlmaTarihi
--from 
--AlinanKitaplar
--inner join Kitaplar on AlinanKitaplar.KitapID= Kitaplar.KitapID
--inner join Kullanicilar on AlinanKitaplar.KullaniciID = Kullanicilar.KullaniciID
--order by
--AlinanKitaplar.AlmaTarihi desc

--select top 1
--KitapAdi,
--Yazar,
--SayfaSayisi
--from
--Kitaplar
--order by
--Kitaplar.SayfaSayisi desc


--select
--Kullanicilar.Sinif,
--COUNT(AlinanKitaplar.AlinanKitapID) as TotalBook,
--AVG(Kitaplar.SayfaSayisi) as OrtPage
--from 
--Kullanicilar
--inner join AlinanKitaplar on Kullanicilar.KullaniciID = AlinanKitaplar.KullaniciID
--inner join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID
--where
--Kullanicilar.Sinif = 2
--group by
--Kullanicilar.Sinif


--select
--Kullanicilar.Sinif,
--COUNT(AlinanKitaplar.AlinanKitapID) as TotalBook,
--AVG(Kitaplar.SayfaSayisi) as OrtPage
--from 
--AlinanKitaplar
--inner join Kullanicilar on AlinanKitaplar.KullaniciID = Kullanicilar.KullaniciID
--inner join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID
--where
--Kullanicilar.Sinif = 2
--group by
--Kullanicilar.Sinif





































































