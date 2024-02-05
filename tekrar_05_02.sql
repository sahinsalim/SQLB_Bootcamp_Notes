-- USE LÝBRARY

-- basit bir join iþlemi serisi. Kullanýcýlarý ve aldýklarý kitaplarý döndürür.
--select
--U.userName,
--B.bookName
--from rentedBooks r
--inner join Users U on r.userID = U.userID
--inner join Books B on r.bookID = B.bookID

--select
--U.userName,
--B.bookName
--from Users U
--inner join rentedBooks r on U.userID = r.userID
--inner join Books B on r.bookID = B.bookID

--select
--U.userName,
--B.bookName
--from Books B
--inner join rentedBooks r on B.bookID = r.bookID
--inner join Users U on r.userID = U.userID


--select
--U.userName,
--B.bookName
--from rentedBooks r
--left join Users U on r.userID = U.userID
--left join Books B on r.bookID = B.bookID

--select
--U.userName,
--B.bookName
--from Users U
--left join rentedBooks r on U.userID = r.userID
--left join Books B on r.bookID = B.bookID

--select
--U.userName,
--B.bookName
--from Books B
--left join rentedBooks r on B.bookID = r.bookID
--left join Users U on r.userID = U.userID


--select
--U.userName,
--B.bookName
--from rentedBooks r
--right join Users U on r.userID = U.userID
--right join Books B on r.bookID = B.bookID

--select
--U.userName,
--B.bookName
--from Users U
--right join rentedBooks r on U.userID = r.userID
--right join Books B on r.bookID = B.bookID

--select
--U.userName,
--B.bookName
--from Books B
--right join rentedBooks r on B.bookID = r.bookID
--right join Users U on r.userID = U.userID





-- her bir öðrencinin aldýðý toplam kitap sayýsýný sorgula
--select
--U.userName,
--COUNT(B.bookID) as TotalBookCount
--from rentedBooks r
--inner join Users U on r.userID = U.userID
--inner join Books B on r.bookID = B.bookID
--group by U.userName

--select
--U.userName,
--COUNT(r.bookID) as TotalBookCount
--from Users U
--inner join rentedBooks r on U.userID = r.userID
--group by U.userName

--select
--U.userName,
--COUNT(r.bookID) as TotalBookCount
--from rentedBooks r
--inner join Users U on r.userID = U.userID
--group by U.userName


-- Yazarlarýn yazdýðý toplam kitap sayýsý ve toplam sayfa sayýsý
--select
--outhor,
--COUNT(bookID) as WrotenBooks,
--SUM(pages) as WrotenBooksTotalPages
--from Books
--group by outhor




-- Hangi kullanýcýnýn toplam kaç kitap aldýðýný ve bu kitaplarýn toplam kitap sayýsýný yazdýrýr.
--select
--U.userName,
--COUNT(B.bookID) as TotalBooks,
--SUM(B.pages) as TotalPage
--from Books B
--inner join rentedBooks r on B.bookID = r.bookID
--inner join Users U on r.userID = U.userID
--group by U.userName



--select
--U.userName,
--COUNT(B.bookID) as TotalBooks,
--SUM(B.pages) as TotalPages
--from Users U
--inner join rentedBooks r on  U.userID = r.userID
--inner join Books B on r.bookID = B.bookID
--group by U.userName



-- en az 2 kitap okuyon
--select
--U.userName,
--COUNT(r.bookID) as TotalBook
--from Users U
--inner join rentedBooks r on U.userID = r.userID
--group by U.userName
--having 
--COUNT(r.bookID) >=2


-- Toplam yazdýðý kitaplarýn sayfa sayýsý 300 ve 300 den büyük olanlar.
--select
--B.outhor,
--SUM(B.pages) as TotalPages
--from (SELECT DISTINCT outhor, pages from Books) B
--group by B.outhor
--having
--SUM(B.pages) >= 300



--En çok alýnan kitabýn yazarýnýn adý ve yayýnevini yazýn.
--select top 1 
--B.outhor,
--B.publishingHouse,
--COUNT(r.bookID) as TotalBook
--from Books B
--inner join rentedBooks r on B.bookID = r.bookID
--group by B.outhor, B.publishingHouse
--order by TotalBook desc


-- teslim tarihi geçmiþ kitaplarýn bilgileri 
---- deneme 1
--select
--U.email,
--B.bookName,
--DATEDIFF(DAY,r.returnDate,GETDATE()) as OutOfReturnDay
--from Users U
--inner join rentedBooks r on U.userID = r.userID
--inner join Books B on r.bookID = B.bookID
--where DATEDIFF(DAY,r.returnDate,GETDATE()) > 0

----deneme 2
--select
--U.email,
--B.bookName,
--r.purchaseDate,
--r.returnDate,
--DATEDIFF(day,r.returnDate,GETDATE()) as DelayTimeWithDays
--from rentedBooks r
--inner join Users U on r.userID = U.userID
--inner join Books B on r.bookID = B.bookID
--where
--r.returnDate < GETDATE()


-- BUNLARI KULLANABÝLÝRSÝN 

-- Ýki sorguda ortak çýktýlarý ekrana yazdýrýr.
--select bookID from Books
--intersect
--select bookID from rentedBooks

-- Ýki sorgudaki farklarý ekrana yazdýrýr.
--select bookID from Books
--except
--select bookID from rentedBooks

----Burada iki sorgudaki sonuçlarý birleþtiriyor. sonra ortak olan kayýtlarý çýkarýr
--SELECT bookID from Books
--union
--SELECT bookID from rentedBooks

----Burada iki sorgudaki sonuçlarý birleþtiriyor sonra ortak olan kayýtlarýda dahil ediyor.
--select bookID from Books
--union all 
--select BookID from rentedBooks

----Bu þekilde intersect veya except i de kullanabiliriz.
--(SELECT bookID from Books
--union
--SELECT bookID from rentedBooks)
--intersect
--(select bookID from Books
--union all 
--select BookID from rentedBooks)


--select
--B.outhor,
--COUNT(r.bookID) as TotalBook,
--SUM(b.pages) as TotalPages
--from Books B
--inner join rentedBooks r on B.bookID = r.bookID
--group by B.outhor

-- Sýnýflara göre en çok kitap okuyan sýnýf ve okuduðu kitap sayýsý
--select top 1
--U.grade,
--COUNT(r.bookID) as TotalBook
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--group by U.grade
--order by TotalBook desc

---- sýnýflara göre en çok sayfa okumuþ sýnýf ve sayfa sayýsý
--select top 1
--U.grade,
--SUM(B.pages) as TotalPages
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--group by U.grade
--order by TotalPages desc

-- en son alýnan kitabýn adý alanýn adý ve alýnma tarihi
--select top 1
--B.bookName,
--U.userName,
--r.purchaseDate
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--order by r.purchaseDate desc

-- En çok sayfa sayýsýna sahip kitabýn yazarý
--select top 1
--B.bookName,
--B.outhor,
--B.pages
--from Books B
--order by B.pages desc

-- 2. sýnýftaki öðrenciler ve toplam okuduðu sayfa sayýsý ve okuduðu toplam kitaplar
--select
--U.grade,
--COUNT(r.bookID) as TotalBook,
--AVG(B.pages) as AVGPages,
--SUM(B.pages) as TotalPages
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--where U.grade = 2
--group by U.grade


-- 4. DERS --

-- Transaction ile  rollback arasýnda kod yazarýz rollback dersek sonucu iþler ama kaydetmez. 
-- amaç biz bunu yapýnca kontrol ederiz sonra commitleriz o zaman kaydeder
--begin 
--transaction
--insert into Books(bookName, outhor, pages, publishingHouse)
--values
--('Gecenin Ýlk Karanlýðý', 'Salim Can',550, 'Þahin Yayýnlarý')

--update Users
--set userName = 'salimcn1'
--where userID = 6

--select * from Books
--select * from Users

--rollback
----commit


-- Deðiþkenler

--declare @sayi1 int
--set @sayi1 = 5
--select @sayi1

--declare @AVGPages float
--select @AVGPages = AVG(pages) from Books
--select @AVGPages as AverageBooksPages


-- Beyaz diþ kitabýný okuyan öðrenci sayýsý
--declare @UsersCount int
--declare @BooksName nvarchar(50) = 'Beyaz Diþ'

--select @UsersCount = COUNT(*)
--from rentedBooks r
--join Books B on r.bookID = B.bookID
--where B.bookName = @BooksName

--select @UsersCount as UsersCount


-- USE OKULOTOMASYON 

-- inþaat müh. akademisyenleri sayýsý
--declare @akademisyen int
--declare @bolumAdi nvarchar(50) = 'Ýnþaat Mühendisliði'

--select @akademisyen = COUNT(*)
--from Akademisyenler A
--join Bolumler B on A.BolumID = B.BolumID
--where B.BolumAdi = @bolumAdi

--select @akademisyen as AkademisyenSayisi


---- can ýn girdiði dersler
--declare @akademisyenAdi nvarchar(50) = 'Prof. Dr. Can'
--select D.DersAdi 
--from Dersler D
--join Akademisyenler A on D.AkademisyenID= A.AkademisyenID
--where A.Ad = @akademisyenAdi



--output sana deðiþen  güncellenen tabloyu ifadeyi verir

-- öðrenci ekle ve eklenen öðrencinin adýný yazdýr.
--declare @EklenenOgrenci table (Ad nvarchar(40))
--insert into Ogrenciler(Ad,Soyad,BolumID)
--OUTPUT inserted.Ad INTO @EklenenOgrenci
--values('Salimc','Can',1)


-- akademisyenin adýný güncelle ve yazdýr.
--declare @GuncellenenAkademisyen table (AkademisyenID int,
--Ad nvarchar(50), Soyad nvarchar(50), BolumID int)

--Update Akademisyenler
--set Ad = 'Prof. Dr. Salim'
--OUTPUT  INSERTED.AkademisyenID, INSERTED.Ad, INSERTED.Soyad,
-- INSERTED.BolumID into @GuncellenenAkademisyen
--WHERE AkademisyenID = 1

--select * from @GuncellenenAkademisyenmisyen

-- id si 3 ve ders id si 2 olan notu deðiþtir.
--declare @guncellenenNot table(NotID int, Notu float)
--update Notlar
--set Notu = 99
--OUTPUT inserted.NotID, inserted.Notu into @guncellenenNot
--where OgrenciID = 3 and DersID = 2

--select * from @guncellenenNot


-- ders silme (silemedik çünkü foreign key ile baðlý.)
--declare @silinenders table (DersID int, DersAdi nvarchar(50))
--delete from Dersler
--OUTPUT deleted.DersID , deleted.DersAdi into @silinenders
--where DersID = 3
--select * from @silinenders



--ÝF ELSE ÞART BLOKLARI

--declare @not  int = 75

--if @not >= 70
--begin
--	print 'GEÇTÝ'
--end
--else
--begin
--	print 'Kaldý'
--end



-- Ortalamasý 60 tan yüksekse geçti kaldý þartlarý 
--declare @OgrenciID int = 2
--declare @ortalamaNot float

--select @ortalamaNot = AVG(Notu)
--from Notlar
--where OgrenciID  = @OgrenciID
--if @ortalamaNot >= 60
--begin
--	print 'Ders Geçildi.'
--end
--else
--begin
--	print 'Ders Baþarýsýz'
--end



--declare @dersID int = 1
--declare @zorunluMu nvarchar(50)

--select @zorunluMu = Zorunluluk
--from Dersler
--where DersID = @dersID
--if	@zorunluMu = 'Zorunlu'
--begin
--	print 'z'
--end
--else
--begin
--	print 's'
--end


-- case yapýsý
--declare @OgrenciID int = 2
--declare @ortalamaNot float
--select @ortalamaNot = AVG(Notu)
--from Notlar
--where OgrenciID = @OgrenciID

--select
--	case
--		when @ortalamaNot >= 90 then 'AA'
--		when @ortalamaNot >= 80 then 'BB'
--		WHEN @ortalamaNot >= 70 THEN 'CC'
--		else 'FF'
--	end as NotDurumu



-- 5. DERS --

-- WHÝLE

--declare @sinirNot float = 80
--declare @ogrenciId int
--declare @not float

--set @ogrenciId = (select MIN(NotId) from Notlar)
--set @not = (select Notu from Notlar where NotId = @ogrenciId)

--while @ogrenciId is not null
--begin
-- if @not >= @sinirNot
-- begin
--  print 'Öðrenci ID: ' + cast(@ogrenciId as varchar(10)) + ', Notu: ' + cast(@not as varchar(10)) + ',baþarýlý.'
-- end
-- else
-- begin
--  print 'Öðrenci ID: ' + cast(@ogrenciId as varchar(10)) + ', Notu: ' + cast(@not as varchar(10)) + ',baþarýsýz.'
-- end
-- set @ogrenciId = (select MIN(NotId) from Notlar where NotId > @ogrenciId)
-- set @not = (select Notu from Notlar where NotId = @ogrenciId)

--end




-- ilk sipariþveren kullanýcý adý tel no ve sipariþ tarihi
--select top 1
--Kullanýcý.Adý,
--Kullanýcý.Tel,
--Sipariþ.SipariþTarihi
--from  Siparisler
--join kullanýcý on siparisler.kullanýcýID = siparisler.siparisID
--order by siparistarihi

--2023-2024 arasý en çok sipariþ edilen ürün
--select top 1
--urun.adý,
--sum(urunID) as totalsatýsý
--from urunler
--inner join siparisler on urun.urunýd = siparis.urunýd
--where siparistarihi between 'a' and 'b'
--group by u.adi
--order by totalsatýsý desc


--with MusteriAldigiUrunler as(
-- select
-- M.MusteriId,
-- M.Adi,
-- U.UrunAdi,
-- sum(S.Adet) as ToplamSatilanAdet
-- from
-- Musteri M
-- join Siparis S on M.MusteriId = S.MusteriId
-- join Urun U on S.UrunId = U.UrunId
-- group by
-- M.MusteriId, M.Adi, U.UrunAdi
--)

--select top 1
-- MAU.Adi, MAU.UrunAdi,MAU.ToplamSatilanAdet
-- from
-- MusteriAldigiUrunler MAU
-- where
-- MAU.Adi = 'a'
-- order by MAU.ToplamSatilanAdet desc



--
--use Musteriler
--


-- procedure oluþturma
--CREATE procedure AddCustomer
--	@FirstName nvarchar(50),
--	@LastName nvarchar(50),
--	@Email nvarchar(10)
--as
--begin
--	insert into Customers (FirstName, LastName,Email)
--	values (@FirstName, @LastName, @Email)
--end

-- kullanma
--exec AddCustomer 'Salim','Can','salimcn@gmail.com'











































































