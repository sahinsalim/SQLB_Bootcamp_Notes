-- USE L�BRARY

-- basit bir join i�lemi serisi. Kullan�c�lar� ve ald�klar� kitaplar� d�nd�r�r.
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





-- her bir ��rencinin ald��� toplam kitap say�s�n� sorgula
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


-- Yazarlar�n yazd��� toplam kitap say�s� ve toplam sayfa say�s�
--select
--outhor,
--COUNT(bookID) as WrotenBooks,
--SUM(pages) as WrotenBooksTotalPages
--from Books
--group by outhor




-- Hangi kullan�c�n�n toplam ka� kitap ald���n� ve bu kitaplar�n toplam kitap say�s�n� yazd�r�r.
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


-- Toplam yazd��� kitaplar�n sayfa say�s� 300 ve 300 den b�y�k olanlar.
--select
--B.outhor,
--SUM(B.pages) as TotalPages
--from (SELECT DISTINCT outhor, pages from Books) B
--group by B.outhor
--having
--SUM(B.pages) >= 300



--En �ok al�nan kitab�n yazar�n�n ad� ve yay�nevini yaz�n.
--select top 1 
--B.outhor,
--B.publishingHouse,
--COUNT(r.bookID) as TotalBook
--from Books B
--inner join rentedBooks r on B.bookID = r.bookID
--group by B.outhor, B.publishingHouse
--order by TotalBook desc


-- teslim tarihi ge�mi� kitaplar�n bilgileri 
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


-- BUNLARI KULLANAB�L�RS�N 

-- �ki sorguda ortak ��kt�lar� ekrana yazd�r�r.
--select bookID from Books
--intersect
--select bookID from rentedBooks

-- �ki sorgudaki farklar� ekrana yazd�r�r.
--select bookID from Books
--except
--select bookID from rentedBooks

----Burada iki sorgudaki sonu�lar� birle�tiriyor. sonra ortak olan kay�tlar� ��kar�r
--SELECT bookID from Books
--union
--SELECT bookID from rentedBooks

----Burada iki sorgudaki sonu�lar� birle�tiriyor sonra ortak olan kay�tlar�da dahil ediyor.
--select bookID from Books
--union all 
--select BookID from rentedBooks

----Bu �ekilde intersect veya except i de kullanabiliriz.
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

-- S�n�flara g�re en �ok kitap okuyan s�n�f ve okudu�u kitap say�s�
--select top 1
--U.grade,
--COUNT(r.bookID) as TotalBook
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--group by U.grade
--order by TotalBook desc

---- s�n�flara g�re en �ok sayfa okumu� s�n�f ve sayfa say�s�
--select top 1
--U.grade,
--SUM(B.pages) as TotalPages
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--group by U.grade
--order by TotalPages desc

-- en son al�nan kitab�n ad� alan�n ad� ve al�nma tarihi
--select top 1
--B.bookName,
--U.userName,
--r.purchaseDate
--from rentedBooks r
--inner join Books B on r.bookID = B.bookID
--inner join Users U on r.userID = U.userID
--order by r.purchaseDate desc

-- En �ok sayfa say�s�na sahip kitab�n yazar�
--select top 1
--B.bookName,
--B.outhor,
--B.pages
--from Books B
--order by B.pages desc

-- 2. s�n�ftaki ��renciler ve toplam okudu�u sayfa say�s� ve okudu�u toplam kitaplar
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

-- Transaction ile  rollback aras�nda kod yazar�z rollback dersek sonucu i�ler ama kaydetmez. 
-- ama� biz bunu yap�nca kontrol ederiz sonra commitleriz o zaman kaydeder
--begin 
--transaction
--insert into Books(bookName, outhor, pages, publishingHouse)
--values
--('Gecenin �lk Karanl���', 'Salim Can',550, '�ahin Yay�nlar�')

--update Users
--set userName = 'salimcn1'
--where userID = 6

--select * from Books
--select * from Users

--rollback
----commit


-- De�i�kenler

--declare @sayi1 int
--set @sayi1 = 5
--select @sayi1

--declare @AVGPages float
--select @AVGPages = AVG(pages) from Books
--select @AVGPages as AverageBooksPages


-- Beyaz di� kitab�n� okuyan ��renci say�s�
--declare @UsersCount int
--declare @BooksName nvarchar(50) = 'Beyaz Di�'

--select @UsersCount = COUNT(*)
--from rentedBooks r
--join Books B on r.bookID = B.bookID
--where B.bookName = @BooksName

--select @UsersCount as UsersCount


-- USE OKULOTOMASYON 

-- in�aat m�h. akademisyenleri say�s�
--declare @akademisyen int
--declare @bolumAdi nvarchar(50) = '�n�aat M�hendisli�i'

--select @akademisyen = COUNT(*)
--from Akademisyenler A
--join Bolumler B on A.BolumID = B.BolumID
--where B.BolumAdi = @bolumAdi

--select @akademisyen as AkademisyenSayisi


---- can �n girdi�i dersler
--declare @akademisyenAdi nvarchar(50) = 'Prof. Dr. Can'
--select D.DersAdi 
--from Dersler D
--join Akademisyenler A on D.AkademisyenID= A.AkademisyenID
--where A.Ad = @akademisyenAdi



--output sana de�i�en  g�ncellenen tabloyu ifadeyi verir

-- ��renci ekle ve eklenen ��rencinin ad�n� yazd�r.
--declare @EklenenOgrenci table (Ad nvarchar(40))
--insert into Ogrenciler(Ad,Soyad,BolumID)
--OUTPUT inserted.Ad INTO @EklenenOgrenci
--values('Salimc','Can',1)


-- akademisyenin ad�n� g�ncelle ve yazd�r.
--declare @GuncellenenAkademisyen table (AkademisyenID int,
--Ad nvarchar(50), Soyad nvarchar(50), BolumID int)

--Update Akademisyenler
--set Ad = 'Prof. Dr. Salim'
--OUTPUT  INSERTED.AkademisyenID, INSERTED.Ad, INSERTED.Soyad,
-- INSERTED.BolumID into @GuncellenenAkademisyen
--WHERE AkademisyenID = 1

--select * from @GuncellenenAkademisyenmisyen

-- id si 3 ve ders id si 2 olan notu de�i�tir.
--declare @guncellenenNot table(NotID int, Notu float)
--update Notlar
--set Notu = 99
--OUTPUT inserted.NotID, inserted.Notu into @guncellenenNot
--where OgrenciID = 3 and DersID = 2

--select * from @guncellenenNot


-- ders silme (silemedik ��nk� foreign key ile ba�l�.)
--declare @silinenders table (DersID int, DersAdi nvarchar(50))
--delete from Dersler
--OUTPUT deleted.DersID , deleted.DersAdi into @silinenders
--where DersID = 3
--select * from @silinenders



--�F ELSE �ART BLOKLARI

--declare @not  int = 75

--if @not >= 70
--begin
--	print 'GE�T�'
--end
--else
--begin
--	print 'Kald�'
--end



-- Ortalamas� 60 tan y�ksekse ge�ti kald� �artlar� 
--declare @OgrenciID int = 2
--declare @ortalamaNot float

--select @ortalamaNot = AVG(Notu)
--from Notlar
--where OgrenciID  = @OgrenciID
--if @ortalamaNot >= 60
--begin
--	print 'Ders Ge�ildi.'
--end
--else
--begin
--	print 'Ders Ba�ar�s�z'
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


-- case yap�s�
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

-- WH�LE

--declare @sinirNot float = 80
--declare @ogrenciId int
--declare @not float

--set @ogrenciId = (select MIN(NotId) from Notlar)
--set @not = (select Notu from Notlar where NotId = @ogrenciId)

--while @ogrenciId is not null
--begin
-- if @not >= @sinirNot
-- begin
--  print '��renci ID: ' + cast(@ogrenciId as varchar(10)) + ', Notu: ' + cast(@not as varchar(10)) + ',ba�ar�l�.'
-- end
-- else
-- begin
--  print '��renci ID: ' + cast(@ogrenciId as varchar(10)) + ', Notu: ' + cast(@not as varchar(10)) + ',ba�ar�s�z.'
-- end
-- set @ogrenciId = (select MIN(NotId) from Notlar where NotId > @ogrenciId)
-- set @not = (select Notu from Notlar where NotId = @ogrenciId)

--end




-- ilk sipari�veren kullan�c� ad� tel no ve sipari� tarihi
--select top 1
--Kullan�c�.Ad�,
--Kullan�c�.Tel,
--Sipari�.Sipari�Tarihi
--from  Siparisler
--join kullan�c� on siparisler.kullan�c�ID = siparisler.siparisID
--order by siparistarihi

--2023-2024 aras� en �ok sipari� edilen �r�n
--select top 1
--urun.ad�,
--sum(urunID) as totalsat�s�
--from urunler
--inner join siparisler on urun.urun�d = siparis.urun�d
--where siparistarihi between 'a' and 'b'
--group by u.adi
--order by totalsat�s� desc


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


-- procedure olu�turma
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











































































