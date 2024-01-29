--create database SirketS
--use Sirkets

--create table Kullanicilar(
--	KullaniciID int primary key identity(100,1),
--	KullaniciAdi nvarchar(40),
--	Email nvarchar(40)
--)

--Create table Urunler(
--	UrunID int primary key identity(100,1),
--	UrunAdi nvarchar(40),
--	UrunFiyati decimal(10,2)
--)

--Create table Siparisler(
--	SiparisID int primary key identity(100,1),
--	KullaniciID int foreign key references Kullanicilar(KullaniciID),
--	UrunID int foreign key references Urunler(UrunID),
----  AltSiparis int foreign key (AltSiparis) references Siparisler(SiparisID)  Bu Recursive oluyor.
--	Adet int
--)

--insert into Kullanicilar(KullaniciAdi,Email) values
--('Salim','salimshn02@gmail.com'),
--('Yunus','yemcelik@gmail.com'),
--('Melike','melikess@gmail.com')


--Insert into Urunler(UrunAdi, Urunfiyati) values
--('Laptop',23499),
--('Monit�r',4249),
--('Klavye',1899)

--Insert into Siparisler(KullaniciID, UrunID, Adet) values
--(102,101,3),
--(100,102,1),
--(101,101,2)

--Update Kullanicilar
--set Email = 'salimshn02@gmail.com' where KullaniciID = 100

--delete from Siparisler
--where UrunID=101

--select * from Siparisler where Adet >=3 

--select * from Siparisler 
--WHERE Adet>1 And UrunID = 101

--select * from Siparisler
--where KullaniciID = 101 or Adet >3

--select * from Kullanicilar 
--where KullaniciID in(100,102)    --Burada 100 ve 102 olanlar� diyor. aral�k de�il bu


--select distinct KullaniciID from Siparisler

--select * from Kullanicilar
--Order by KullaniciAdi ASC --ASC ALFABET�K DESC �SE TERS SIRALAR

--select * from Kullanicilar
--Order by KullaniciAdi ASC, Email DESC -- Burada �nce ada g�re. e�er adlar ayn�ysa vs bu sefer
---- email e g�re s�ralar.

--Alter table Kullanicilar
--Add DogumTarihi date

--select * from Kullanicilar 
--where DogumTarihi between '2000-01-01' and '2002-12-31' 

--select * from Kullanicilar 
--Where KullaniciID between 100 and 102

--select * from Kullanicilar Where DogumTarihi < '2001-12-13'

--alter table Siparisler 
--Add SiparisTarihi date

--select DATEDIFF(DAY,'2024-01-24','2024-12-15') as Tarih_Farki

--select GETDATE() as Suanki_Tarih


--Insert into Siparisler(KullaniciID, UrunID, Adet, SiparisTarihi)
--values(101,102,4,GETDATE())

--ALTER TABLE Kullanicilar
--add KayitTarihi date

--Insert into Kullanicilar(KullaniciAdi, Email, DogumTarihi,KayitTarihi)
--values('Emjan','emjanaga@gmail.com',GETDATE(),GetDate())

--Update Kullanicilar
--set Email = 'salimshn02@gmail.com' where KullaniciID = 100

--update Kullanicilar
--set KayitTarihi = GETDATE() Where KayitTarihi is Null



--select * from Kullanicilar 
--WHERE CONVERT(DATE, KayitTarihi) = CONVERT(DATE, GETDATE())
--AND DATEDIFF(YEAR, DogumTarihi,GETDATE()) >18

--ALTER table Kullanicilar
--Add Yas int

--Update Kullanicilar
--set Yas = DATEDIFF(YEAR,DogumTarihi,GETDATE())

--select Convert(varchar, GETDATE(),105) AS BUG�N  -- burda format de�i�ip date i char yapt�m.

--SELECT CAST('2024-01-01' as DATETIME) AS CastDate  -- Burda direkt veri tipi de�i�ti.

--select DATEADD(MONTH,3,'2024-01-01') as UcaySonra  -- Verilen tarihe 3 ay ekledi.

-- like operat�r�  %  ,  _

--select * from Kullanicilar
--Where Email like '%@gmail.com%'    -- Email in i�inde @gmail.com i�erenleri getirdi. 
--WHERE Email like 's%'   -- Email S ile ba�layanlar� �ekti. b�y�k k���k harf fark etmiyor burda.
--WHERE Email like '%@gmail.com'  -- Sonunda @gmail.com olanlar� verdi

--Select * from Urunler
--where UrunAdi like 'L__t%'    -- L ile ba�licak arada herhangibir �ey sonra t gelicek dedik.
--where UrunAdi like '_____e%'  -- 5 tane herhangi harf sonra 6. harf e olucak.

--Select * from Urunler
--where UrunAdi like 'K%e'  -- k ile ba�lay�p e ile biten demek bu.

--SELECT top 1 
--SiparisID,
--KullaniciID,
--Adet
--from Siparisler order by SiparisTarihi desc













































