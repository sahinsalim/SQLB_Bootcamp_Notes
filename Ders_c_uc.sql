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
--	�adeTarihi date 
--)

--INSERT INTO Kitaplar (KitapAdi, Yazar, SayfaSayisi, Yayinevi)
--VALUES
--    ('D�n���m', 'Franz Kafka', 150, 'Everest Yay�nlar�'),
--    ('1984', 'George Orwell', 300, 'Penguin Books'),
--    ('Su� ve Ceza', 'Fyodor Dostoyevsky', 500, '�� Bankas� K�lt�r Yay�nlar�'),
--    ('Sefiller', 'Victor Hugo', 700, 'Can Yay�nlar�'),
--    ('Beyaz Di�', 'Jack London', 250, '�thaki Yay�nlar�'),
--    ('G��ebe', 'Erin Hunter', 350, 'Artemis Yay�nlar�'),
--    ('Harry Potter ve Felsefe Ta��', 'J.K. Rowling', 400, 'Yap� Kredi Yay�nlar�'),
--    ('1984', 'George Orwell', 300, 'Pegasus Yay�nlar�'),
--    ('�stanbul Hat�ras�', 'Ahmet �mit', 200, '�thaki Yay�nlar�'),
--    ('�nsan Neyle Ya�ar', 'Lev Tolstoy', 120, 'Can Yay�nlar�')


--INSERT INTO Kullanicilar (KullaniciAdi, Email, TCNo, Bolum, DogumTarihi, Sinif)
--VALUES
--    ('ahmet01', 'ahmet@email.com', '12345678901', 'Bilgisayar M�hendisli�i', '1995-05-15', 3),
--    ('mehmet02', 'mehmet@email.com', '23456789012', 'Elektrik M�hendisli�i', '1997-08-20', 2),
--    ('ayse03', 'ayse@email.com', '34567890123', 'Makine M�hendisli�i', '1996-02-10', 4),
--    ('elif04', 'elif@email.com', '45678901234', 'Kimya M�hendisli�i', '1998-11-25', 1),
--    ('ali05', 'ali@email.com', '56789012345', '�n�aat M�hendisli�i', '1999-07-30', 2)



--Insert into AlinanKitaplar(KitapID, KullaniciID, AlmaTarihi, �adeTarihi)
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
--COUNT(Kitaplar.KitapID) as 'Yazd��� Kitap Say�s�'
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
--COUNT(AlinanKitaplar.AlinanKitapID) as 'Ald��� Kitap Say�s�'
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
--SUM(Kitaplar.SayfaSayisi) as 'Toplam Sayfa Say�s�'
--from
--Kitaplar
--group by
--Kitaplar.Yazar
--having
--SUM(Kitaplar.SayfaSayisi) >= 500

--select top 1
--Kitaplar.Yazar,
--COUNT(AlinanKitaplar.KitapID) as ToplamAl�nanKitapSay�s�
--from
--Kitaplar
--join AlinanKitaplar on Kitaplar.KitapID = AlinanKitaplar.KitapID
--group by
--Kitaplar.KitapID, Kitaplar.Yazar, Kitaplar.YayinEvi
--order by
--ToplamAl�nanKitapSay�s� Desc


--select
--Kitaplar.KitapAdi,
--Kullanicilar.Email,
--AlinanKitaplar.AlmaTarihi,
--AlinanKitaplar.�adeTarihi,
--DATEDIFF(day,AlinanKitaplar.�adeTarihi,GETDATE()) as 'Gecikme G�n�'
--from
--AlinanKitaplar
--inner join Kullanicilar on AlinanKitaplar.KullaniciID= Kullanicilar.KullaniciID
--inner join Kitaplar on AlinanKitaplar.KitapID = Kitaplar.KitapID
--where
--AlinanKitaplar.�adeTarihi < GETDATE()


--Select KullaniciID from Kullanicilar
--Intersect -- ortak olanlar� al sadece diyor bu komut.
--select KullaniciID from AlinanKitaplar


--select KitapID from Kitaplar
--Except -- Ortak olmayanlar� al sadece diyor bu komut.
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





































































