--begin Transaction

--insert into Notlar(OgrenciID, DersID, Notu)
--values
--(3,2,85)

--Update Ogrenciler
--set Ad = 'Alican�m'
--where OgrenciID = 10

--select*from Ogrenciler
--select*from Notlar

--Rollback
----Commit


--declare @sayi1 int 
--declare @sayi2 int
--declare @sonuc int
--set @sayi1 = 6
--set @sayi2 = 8
--set @sonuc = @sayi1 * @sayi2
--select @sonuc as Toplam


--declare @OrtalamaNot float
--select @OrtalamaNot = AVG(Notu) from Notlar
--select @OrtalamaNot as OrtalamaNot


--declare @MaksNot float
--select @MaksNot = MAX(Notu) from Notlar
--select @MaksNot as 'En y�ksek not'


--declare @TotalOgrenci int
--declare @BolumAdi nvarchar(40) = 'Bilgisayar M�hendisli�i'

--select @TotalOgrenci =	COUNT(*) 
--from Ogrenciler O
--inner join Bolumler B on O.BolumID = B.BolumID
--where B.BolumAdi = @BolumAdi

--select @TotalOgrenci as 'Toplam Ogrenci Sayisi'

--declare @CalisanAkademisyenler int
--declare @BolumAdi nvarchar(40) = '�n�aat M�hendisli�i'

--select @CalisanAkademisyenler = COUNT(*)
--from Akademisyenler A
--inner join Bolumler B on A.BolumID = B.BolumID
--where B.BolumAdi = @BolumAdi

--select @CalisanAkademisyenler as 'Akademisyenler'


--declare @AkademisyenAdi nvarchar(50) = 'Prof. Dr. Can'

--select D.DersAdi
--from Dersler D
--join Akademisyenler A on D.AkademisyenID = A.AkademisyenID
--WHERE A.Ad = @AkademisyenAdi


--declare @OgrenciID int = 11
--declare @DersinAdi nvarchar(50)

--select D.DersAdi
--from Dersler D
--join Notlar N on D.DersID = N.DersID
--where N.OgrenciID = @OgrenciID

--declare @EklenenOgrenci table (OgrenciID int)

--insert into Ogrenciler(Ad,Soyad,BolumID)
--OUTPUT INSERTED.OgrenciID into @EklenenOgrenci
--VALUES('Salim','�ahin',1)
--select * from @EklenenOgrenci


--declare @GuncellenenAkademisyen table (AkademisyenID int,
--Ad nvarchar(50), Soyad nvarchar(50), BolumID int)

--Update Akademisyenler
--set Ad = 'Prof. Dr. Salim'
--OUTPUT  INSERTED.AkademisyenID, INSERTED.Ad, INSERTED.Soyad,
-- INSERTED.BolumID into @GuncellenenAkademisyen
--WHERE AkademisyenID = 1

--select * from @GuncellenenAkademisyen


--declare @GuncellenenNot table (NotID int, OgrenciID int, DersID int, Notu Float)
--Update Notlar
--set Notu=99 
--OUTPUT INSERTED.NotID, INSERTED.OgrenciID, INSERTED.DersID, 
--INSERTED.Notu into @GuncellenenNot
--where OgrenciID=5 and DersID = 3
--select * from @GuncellenenNot


--declare @SilinenBolum table (BolumID int, BolumAdi nvarchar(50))
--Delete from Bolumler
--OUTPUT DELETED.BolumID, DELETED.BolumAdi
--into @SilinenBolum
--Where BolumID = 3

--select * from @SilinenBolum




--declare @not int = 75

--IF @not >= 50
--begin
--	print '��renci Ba�ar�l�'
--end

--else
--begin
--	print '��renci Ba�ar�s�z'
--end


--declare @OgrenciID int = 2
--declare @NotOrtalamas� float 

--select @NotOrtalamas� = AVG(Notu)
--from Notlar
--where OgrenciID = @OgrenciID

--if @NotOrtalamas� >= 60
--begin
--	print 'Ders Ge�ildi.'
--end
--else
--begin
--	print 'Dersten Kald�.'
--end





--declare @AkademisyenID int = 1
--declare @unvan nvarchar(40)

--select @unvan = Ad
--from Akademisyenler
--where AkademisyenID = @AkademisyenID

--IF @unvan like 'Prof. Dr.%'
--begin
--	print 'Akademisyen Profes�rd�r.'
--end
--else
--begin
--	print 'Akademisyen Profes�r de�ildir.'
--end

-- else if de var burada . sadece if ve else de�il.



--alter table Dersler
--Add Zorunluluk nvarchar(50)


--update Dersler
--set Zorunluluk = 'Zorunlu'


--declare @dersID int = 4
--declare @Zorunluluk nvarchar(50)

--select @Zorunluluk = Zorunluluk
--from Dersler
--where DersID = @DersID

--IF @Zorunluluk = 'Zorunlu'
--begin
--	print 'Bu ders zorunludur.'
--end
--else
--begin
--	print 'Bu ders se�melidir.'
--end


--declare @OgrenciID int = 2

--declare @NotOrtalama float

--select @NotOrtalama = AVG(Notu)
--from Notlar
--where OgrenciID = @OgrenciID

--select
--	case
--		WHEN @NotOrtalama >=90 THEN 'AA'
--		WHEN @NotOrtalama >=80 THEN 'BA'
--		WHEN @NotOrtalama >=70 THEN 'BB'
--		WHEN @NotOrtalama >=60 THEN 'CB'
--		WHEN @NotOrtalama >=50 THEN 'DD'
--		else 'FF'
--	end as NotDurumu


--declare @AkademisyenID int = 3
--declare @unvan varchar(50)

--select @unvan = Ad
--from Akademisyenler
--where AkademisyenID = @AkademisyenID

--select
--	case
--		when @unvan like 'Prof. Dr.%' then 'Profes�r Doktor'
--		when @unvan like 'Do�. Dr.%' then 'Do�ent Doktor'
--		else 'Di�er'
--	end as Unvan�



--declare @dersID int = 4
--declare @Zorunluluk nvarchar(50)

--select @Zorunluluk = Zorunluluk
--from Dersler
--where DersID = @DersID

--select 
--	case	
--		when @Zorunluluk = 'Zorunlu' then 'Ders Zorunludur.'
--		when @Zorunluluk = 'Se�meli' then 'Ders Se�m elidir.'
--		else 'Ders Zorunlulu�u Belirtilmemi�tir.'
--	end as 'Zorunluluk Durumu'



















