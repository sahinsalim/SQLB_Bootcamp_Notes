--CREATE function dbo.GetAdressInfo(
--	@UserID int
--)
--returns table
--as
--return(
--	select
--	A.ID as AdressID,
--	A.ULKE_ID,
--	U.ULKE,
--	I.IL,
--	ILCE.ILCE,
--	S.SEMT,
--	A.POSTAKODU,
--	A.ACIKADRES
--	from
--	ADRES A
--	inner join ULKE U on A.ULKE_ID = U.ID
--	inner join ILLER I on A.IL_ID = I.ID
--	inner join ILCELER ILCE on A.ILCE_ID = ILCE.ID
--	inner join SEMTLER S on A.SEMT_ID = S.ID
--	Where
--	A.KULLANICI_ID = @UserID
--)
--select * from dbo.GetAdressInfo(37)



--CREATE view UserInformationVýew
--as
--select ID, KULLANICI_ADI, ADSOYAD, CINSIYET, DOGUMTARIHI
--from KULLANICILAR

--select * from UserInformationVýew

--create view AddressInformationView
--as
--select
--	A.ID as AdressID,
--	U.ULKE,
--	I.IL,
--	ILCE.ILCE,
--	S.SEMT,
--	A.ACIKADRES
--	from 
--	ADRES A 
--	inner join ULKE U on A.ULKE_ID = U.ID
--	inner join ILLER I on A.IL_ID = I.ID
--	inner join ILCELER ILCE on A.ILCE_ID = ILCE.ID
--	inner join SEMTLER S on A.SEMT_ID = S.ID

--SELECT * FROM AddressInformationView




-- TRÝGGER 

--create trigger tr_EmailControl 
--on KULLANICILAR
--AFTER insert
--as
--begin
--	set nocount on

--	if(select COUNT(*) from inserted 
--	where CHARINDEX('@',EMAIL)>0 
--	and CHARINDEX('.',SUBSTRING(EMAIL,CHARINDEX('@', EMAIL)+1,LEN(EMAIL)))>0)=0
--	begin
--		RAISERROR('GEÇERLÝ BÝR ADRES GÝRMELÝSÝNÝZ!',16,1)
--	rollback
--	end
--end


--insert into KULLANICILAR(KULLANICI_ADI,SIFRE,ADSOYAD,EMAIL,CINSIYET,DOGUMTARIHI,KAYITTARIHI,TELNO1,TELNO2)
--VALUES
--('Salim Can','123456','Salim Can Þahin','salimshn@gmail.com','E','2002-12-30',GETDATE(),'12345','123123')


--create trigger tr_KullaniciKayitTarihi
--on KULLANICILAR
--FOR INSERT
--as
--begin
--	set nocount on

--	update KULLANICILAR 
--	set KAYITTARIHI = GETDATE() 
--	from KULLANICILAR k
--	inner join inserted i on k.ID = i.ID
--end

--insert into KULLANICILAR(KULLANICI_ADI,SIFRE,ADSOYAD,EMAIL,CINSIYET,DOGUMTARIHI,KAYITTARIHI,TELNO1,TELNO2)
--VALUES
--('Can','1234256','Salim Can CA','samshn@gmail.com','E','2002-11-30',GETDATE(),'12345','123123')


--CREATE trigger tr_KullaniciAdresSil
--on KULLANICILAR
--AFTER DELETE
--AS
--BEGIN
--	set nocount on

--	delete from ADRES
--	where KULLANICI_ID in (select ID from deleted)
--end

--Delete from Kullanýcýlar
--where ID = 36


-- VÝEW ÖZELLÝKLE DAHA ÖNCEMLÝ. AMA BÝL BÝR ÇOÐUNU


--select
--A.ACIKADRES
--from ADRES A
--inner join KULLANICILAR K on K.ID = A.ID
--where K.ID = 40

--SELECT
--K.KULLANICI_ADI
--FROM KULLANICILAR K
--inner join ADRES A on K.ID = A.KULLANICI_ID
--inner join ILCELER ILCE on A.ILCE_ID = ILCE.ID
--inner join ILLER I on ILCE.IL_ID = I.ID
--WHERE I.IL = 'TRABZON'

-- YAÞ ARALIKLARINA GÖRE KULLANICI GETÝRELÝM

--SELECT KULLANICI_ADI , DOGUMTARIHI, DATEDIFF(year,DOGUMTARIHI,GETDATE()) AS YAS
--from KULLANICILAR
--where DATEDIFF(year,DOGUMTARIHI,GETDATE()) between 25 and 50


--SELECT
--K.KULLANICI_ADI,
--K.CINSIYET,
--S.SEMT
--FROM KULLANICILAR K
--inner join ADRES A on K.ID = A.KULLANICI_ID
--inner join SEMTLER S on A.SEMT_ID = S.ID
--WHERE S.ID = 1 AND CINSIYET = 'E'


-- tüm illerin kullanýcý sayýsý ve her ilin ortalama yaþý
--SELECT
--IL.IL,
--COUNT(K.ID) AS ToplamKullanici,
--AVG(DATEDIFF(YEAR,K.DOGUMTARIHI,GETDATE())) AS OrtalamaYas
--FROM ILLER IL
--left join ILCELER ILCE on IL.ID = ILCE.IL_ID
--left join ADRES A on ILCE.ID = A.ILCE_ID
--left join KULLANICILAR K on A.KULLANICI_ID = K.ID
--group by IL.IL 
--ORDER BY ToplamKullanici DESC


































































































