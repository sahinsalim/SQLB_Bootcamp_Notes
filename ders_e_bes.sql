--declare @SinirNot float = 80
--declare @OgrenciID int
--declare @Not float

--set @OgrenciID = (select MIN(NotID) from Notlar)
--set @Not = (select Notu from Notlar where NotID = @OgrenciID)

--while @OgrenciID is not null
--begin
--	if @Not >= @SinirNot
--	begin
--		print '��renciID: ' + cast(@OgrenciID as varchar(10)) + ' Notu: ' +cast(@not as varchar(10))
--	end
--	else
--	begin
--		print '��renciID: ' + cast(@OgrenciID as varchar(10)) + ' Notu: ' +cast(@not as varchar(10))
--	end
--	set @OgrenciID = (select MIN(NotID) from Notlar where NotID > @OgrenciID)
--	set @Not = (select Notu from Notlar where OgrenciID = @OgrenciID)
--end





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




--declare @ogrenciID int
--declare @not float

--set @ogrenciID = (SELECT MIN(NotID) from Notlar)
--set @not = (SELECT Notu from Notlar where NotID = @ogrenciID)

--WHILE @ogrenciID is not null
--begin
--	IF @not < 90
--	begin
--		set @ogrenciID = (SELECT MIN(NotID) from Notlar where NotID > @ogrenciID)
--		set @not = (SELECT Notu from Notlar where NotID = @ogrenciID)
--		continue
--	end
--	print 'Ba�ar�l� ��renci - ID: '+ cast(@OgrenciID as varchar(10)) +' Notu: '+cast(@not as varchar(10))
--	set @ogrenciID = (SELECT MIN(NotID) from Notlar where NotID > @ogrenciID)
--		set @not = (SELECT Notu from Notlar where NotID = @ogrenciID)
--end


---------------- Bu go konusuna biraz daha bak. Ayn� �ekilde �stteki �rne�i de ba�tan daha anlaml� yaz.

--select * from Ogrenciler
--Update Ogrenciler set Ad = 'Rayim Can' where OgrenciID = 6
--GO

--delete from Ogrenciler where OgrenciID = 7
--select * from Ogrenciler where OgrenciID > 6


--declare @OgrenciID int
--declare @Not float

--set @OgrenciID = (select MIN(NotID) from Notlar)
--set @Not = (Select top 1 Notu from Notlar Where NotID = @OgrenciID)

--while @OgrenciID is not null
--begin
--	if @Not >= 80
--	begin
--		print 'Ogrenci ID: '+ Convert(varchar(10), @OgrenciID) + ' Notu: ' + Convert(varchar(10), @Not)

--		waitfor delay '00:00:08'
		
--		print 'Ogrenci ID: '+ Convert(varchar(10), @OgrenciID) + ' Notu: ' + Convert(varchar(10), @Not)
--	end

--	set @OgrenciID = (Select MIN (NotID) from Notlar)
--	set @Not = (Select top 1 Notu from Notlar where NotID = @OgrenciID order by NotID )
--end


--create database Siparisler
--use Siparisler


--Create Table Urun2(
--	UrunID int primary key,
--	Adi nvarchar(50),
--	Fiyat float
--)


--declare @counter int = 1

--while @counter <= 500000
--begin
-- declare @randomMusteriId int = round(rand()*4+1,0)
-- declare @randomUrunId int = round(rand()*4+1,0)
-- declare @adet int = round(rand()*5+1,0)
-- declare @tarih datetime = dateadd(day,Round(rand() * datediff(day, '2022-01-01', getdate()),0), '2022-01-01')

-- insert into Siparis (MusteriId, UrunId,Adet,Tarih) values
-- (@randomMusteriId,@randomUrunId,@adet,@tarih)

-- set @counter = @counter + 1
--end







--Select top 1
--M.MusteriID,
--M.MusteriAdi,
--COUNT(S.SiparisID) as ToplamSiparisSayisi
--from
--Musteri M
--join Siparisler S on M.MusteriID = S.MusteriID
--group by
--M.MusteriID, M.MusteriAdi
--order by ToplamSiparisSayisi desc

----ilk siparis veren kullan�c�n ad� telefon numaras� ve sipari� tarihi
--select top 1
--M.MusteriAdi,
--M.Telefon,
--S.Tarih as IlkSiparisTarihi
--from Musteri M
--join Siparisler S on M.MusteriID = S.MusteriID
--order by S.Tarih

----2022-01-01 tarihi ile 2022-12-31 tarihi aras�ndaki siparis adeti
--select COUNT(*) as ToplamSiparisAdeti
--from Siparis
--where Tarih between '2022-01-01' and '2022-12-31'


----2023-01-01 ile 2023-12-31 tarihleri aras�nda en �ok sat�lan �r�n ka� adet sat�lm��t�r ve �r�n�n ad� nedir
--select top 1
--U.UrunID,
--U.UrunAdi,
--SUM(S.Adet) as ToplamSiparisAdeti
--from Urun U
--join Siparisler S on U.UrunID = S.UrunID
--where
--	S.Tarih between '2023-01-01' and '2023-12-31'
--group by
--	U.Adi
--order by ToplamSiparisAdeti desc


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










-- Stored Procedure



--Create database Musteriler
--use Musteriler

--create table Customers(
--	CustomerID int primary key identity(1,1),
--	FirstName nvarchar(50),
--	LastName nvarchar(50),
--	Email nvarchar(50)
--)

--create table Orders(
--	OrderID int primary key identity(1,1),
--	CustomerID int foreign key references Customers(CustomerId),
--	OrderDate date,
--	TotalAmount decimal(10,2)
--)


-- Triger nedir bir sonraki dersin konusu. incele

-- Prosed�r tan�mlama.
--create Procedure AddCustomer
--	@FirstName nvarchar(50),
--	@LastName nvarchar(50),
--	@Email nvarchar(50)
--as
--begin
--	insert into Customers(FirstName, LastName, Email)
--	values(@FirstName, @LastName, @Email)
--end

--Prosed�r� Kullanma
--exec AddCustomer 'Salim', 'Sahin', 'salimshn02@gmail.com'


--Create procedure AddOrders
--	@CustomerID int,
--	@OrderDate date,
--	@TotalAmount decimal(10,2)
--as
--begin
--	insert into Orders(CustomerID, OrderDate, TotalAmount)
--	values (@CustomerID, @OrderDate, @TotalAmount)
--end

--exec AddOrders '1', '2024-01-31',100.50


--create procedure GetCustomerOrders
--	@CustomerID int
--as 
--begin
--	select * from Customers c
--	join Orders o on c.CustomerID = o.CustomerID
--	where c.CustomerID = @CustomerID
--end
	
--exec GetCustomersOrders 1


--create procedure GetCustomerBeforeDate
--	@OrderDate date
--as 
--begin
--	select * from Orders
--	where OrderDate < @OrderDate
--end

--exec GetCustomerBeforeDate '2024-02-02'















































































	