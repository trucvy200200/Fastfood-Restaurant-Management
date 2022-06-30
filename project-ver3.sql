CREATE DATABASE FASTFOOD_RESTAURANT_SYSTEM
GO
use FASTFOOD_RESTAURANT_SYSTEM
GO
CREATE TABLE Menu
(
	Dish_ID int PRIMARY KEY,
	Dish_Name varchar (50),
	Price float ,
	Dish_Status int,
	photo varbinary(Max)

)

GO
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 1,'VEG.BURGER', 70, 50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\VEG.BURGER.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 2,'VEG.CHILLY BURGER', 70, 50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\VEG.CHILLY BURGER.jpg' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 3,'CHICKEN BURGER', 110, 50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\CHICKEN BURGER.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 4,'MUTTON BURGER', 125,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\MUTTON BURGER.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 5,'HAM BURGER', 110,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\HAM BURGER.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 6,'SALAMI BURGER', 110,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\SALAMI BURGER.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 7,'FISH BURGER', 125,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\FISH BURGER.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 8,'PIZZA CHEESE', 180,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\PIZZA CHEESE.jpg' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 9,'PIZZA TOMATO CHEESE', 180,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\PIZZA TOMATO CHEESE.jpg' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 10,'PIZZA MUSHROOM CHEESE', 210,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\PIZZA MUSHROOM CHEESE.jpg' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 11,'PIZZA CHICKEN CHEESE', 250,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\PIZZA CHICKEN CHEESE.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 12,'PIZZA SAUSAGE', 250,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\PIZZA SAUSAGE.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 13,'CHEESE SANDWICH', 130,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\CHEESE SANDWICH.jfif' , Single_Blob) as Picture
insert into Menu (Dish_ID, Dish_Name, Price, Dish_Status, photo)
select 14,'CHICKEN CHEESE SANDWICH', 145,50, BulkColumn from OPENROWSET (BULK 'D:\FastFood_2213\FastFood\menu\CHICKEN CHEESE SANDWICH.jpg' , Single_Blob) as Picture


GO
CREATE TABLE Customer
(
		Cus_ID int  PRIMARY KEY,
		Cus_Name varchar (50),
		Cus_Phone_Number varchar(50),
		Cus_Address varchar (50),
)
GO
CREATE TABLE Bill
(
	Bill_ID int  PRIMARY KEY,
	Total_Price float,
	Sold_Date date,
	Cus_ID int
	constraint FK_CusID foreign key (Cus_ID)  references Customer(Cus_ID) on update cascade on delete cascade 
)

GO
CREATE TABLE Bill_Detail
(
	Bill_ID int ,
	Dish_ID int ,
	Dish_Num int,
	Price float,
	PRIMARY KEY (Bill_ID, Dish_ID)
)
GO
alter table Bill_Detail add constraint FK_BillDetail_DishID foreign key (Dish_ID)  references Menu(Dish_ID) on update cascade on delete cascade 
GO
alter table Bill_Detail add constraint FK_BillDetail_BillID foreign key (Bill_ID) references Bill(Bill_ID) on update cascade on delete cascade 


GO
CREATE TABLE Delivery
(
	Bill_ID int  PRIMARY KEY,
	Cus_Address nvarchar(50),
	Delivery_Date Date,
	CONSTRAINT FK_BillID FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID) on update cascade on delete cascade 
)

GO
CREATE TABLE Staff
(
	ID int  PRIMARY KEY,
	Staff_Name nvarchar(50),
	Phone_Number varchar(11),
	Salary float,
	Type varchar(50)
)



GO
INSERT INTO Customer values (1, 'Nguyen Van A', '0345348321', 'TPHCM')
INSERT INTO Customer values (2, 'Nguyen Van B', '0342132121', 'TPHCM')
INSERT INTO Customer values (3, 'Nguyen Van C', '0342123981', 'TPHCM')
INSERT INTO Customer values (4, 'Nguyen Van D', '0212341234', 'TP Thu Duc')
INSERT INTO Customer values (5, 'Nguyen Van E', '0982721331', 'TP Thu Duc')
INSERT INTO Customer values (6, 'Nguyen Van F', '0234214123', 'TP Thu Duc')
INSERT INTO Customer values (7, 'Nguyen Van G', '0921324512', 'TPHCM')
INSERT INTO Customer values (8, 'Nguyen Van H', '0721324215', 'TP Thu Duc')


GO
INSERT INTO Bill values (1, 140, '2022-03-01',1)
INSERT INTO Bill values (2, 450, '2022-03-01',5)
INSERT INTO Bill values (3, 440, '2022-03-01',3)
INSERT INTO Bill values (4, 390, '2022-03-02',2)
INSERT INTO Bill values (5, 705, '2022-03-03',4)


GO
INSERT INTO Bill_Detail values (1, 1, 1, 70)
INSERT INTO Bill_Detail values (1, 2, 1, 70)
INSERT INTO Bill_Detail values (2, 2, 1, 70)
INSERT INTO Bill_Detail values (2, 13, 1, 130)
INSERT INTO Bill_Detail values (2, 7, 2, 250)
INSERT INTO Bill_Detail values (3, 9,  1, 180)
INSERT INTO Bill_Detail values (3, 13,  2, 260)
INSERT INTO Bill_Detail values (4, 11, 1,250)
INSERT INTO Bill_Detail values (4,1, 2, 140)
INSERT INTO Bill_Detail values (5, 4,  3, 375)
INSERT INTO Bill_Detail values (5, 5, 3, 330)



GO
INSERT INTO Delivery values(1,  '01 Võ Văn Ngân TP. Thủ Đức', '2022-03-01')
INSERT INTO Delivery values(2,  '01 Võ Văn Ngân TP. Thủ Đức', '2022-03-01')
INSERT INTO Delivery values(4,  '02 Hoàng Diệu 2 TP. Thủ Đức', '2022-03-02')


GO
INSERT INTO Staff values (1, 'Tom Hiddleston', '034534821', 10000, 'manager')
INSERT INTO Staff values (2, 'Calantha', '022412341', 10000,  'manager')
INSERT INTO Staff values (3, 'Tryphena', '012435134', 5000, 'employee')
INSERT INTO Staff values (4, 'Vera', '024124213', 5000, 'employee')
INSERT INTO Staff values (5, 'Theodora', '019282134', 5000,  'employee')
INSERT INTO Staff values (6, 'Stella', '093832123', 5000, 'employee')

GO
create trigger dbo.update_status on [dbo].[Bill_Detail]
for insert
as
begin
	declare @dish_Id int, @dish_num int
	
	select @dish_Id=inserted.Dish_ID, @dish_num=inserted.Dish_Num
	from inserted

	update Menu
	set Dish_Status=Dish_Status-@dish_num
	where Dish_ID=@dish_Id
end



GO
alter trigger dbo.update_status on [dbo].[Bill_Detail]
for insert
as
begin
	declare @dish_Id int, @dish_num int, @dish_status int
	
	select @dish_Id=inserted.Dish_ID, @dish_num=inserted.Dish_Num
	from inserted
	
	select @dish_status=menu.Dish_Status
	from menu
	where Dish_ID=@dish_Id

	if (@dish_status=0)
	begin
		print('Sold out!')
		rollback 
	end
	else
	begin
		update Menu
		set Dish_Status=Dish_Status-@dish_num
		where Dish_ID=@dish_Id
	end
end


GO
alter table Bill_Detail add constraint Check_DishNum Check(Dish_Num>0)
GO
alter table Bill add constraint Check_Price Check(Total_Price > 0)



--EXEC Add_Employee 'Vy', '0906941863', 5000, 'employee'  
GO
create Function Count_Guest (@Sold_Date date)
returns INT 
as
begin
	declare @count int
	begin
	select @count=count(*)
	from Bill
	Group by Sold_Date
	Having Sold_Date=@Sold_Date
	end
	return @count	
end
--Select dbo.Count_Guest('2022-03-01')
GO
create function get_GuestInfo(@ID varchar(50))
returns table return
		Select * from Customer where Cus_ID=@ID
GO
--Select * from dbo.get_GuestInfo(1)

GO
create function get_Guest_Bill_Detail(@CusID int)
returns table 
		return
		Select a.Dish_ID, b.Dish_Name, a.Dish_Num, a.Price from Bill_Detail a inner join Menu b on a.Dish_ID=b.Dish_ID
		where a.Bill_ID=(select Bill_ID from Bill where Cus_ID=@CusID) 
--Select * from dbo.get_Guest_Bill_Detail(1)
		
GO 
create procedure Remove_Employee
	@ID int
as
BEGIN
	declare @idx int =0
	select @idx=ID
	from staff
	where ID=@ID
	if (@idx=0)
		begin
		print ('ID is not available')
		rollback
		end
	else
	begin
	delete from Staff where ID=@ID
	end
END


GO
create procedure Update_Employee
	@ID int, @Staff_Name nvarchar(50), @PhoneNumber varchar(11), @Salary float, @Type varchar(50)
AS
BEGIN
   declare @idx int =0
   
   select @idx=ID
   from staff
   where ID=@ID

   if (@idx=0)
		begin
		print ('ID is not available')
		rollback
		end
	else 
	begin
	update staff
	set ID=@ID,Staff_Name=@Staff_Name, Phone_Number=@PhoneNumber, Salary=@Salary
	where ID = @ID
	end
END


GO
create procedure Update_DishStatus
	@Dish_ID int, @DishStatus int
as
begin
	declare @idx int =0
	select @idx=Dish_ID
	from menu
	where Dish_ID=@Dish_ID
	if (@idx=0)
		begin
		print ('Dish_ID is not available')
		rollback
		end
	else
	begin
	 update menu
	 set Dish_Status=@DishStatus
	 where Dish_ID=@Dish_ID
	end
end

GO
create procedure Update_Price
	@Dish_ID varchar(50), @DishPrice float
as
begin
	declare @idx int = 0
	select @idx=Dish_ID
	from menu
	where Dish_ID=@Dish_ID
	if (@idx=0)
		begin
		print ('Dish_ID is not available')
		rollback
		end
	else
	begin
	update menu
	set Price=@DishPrice
	where Dish_ID=@Dish_ID
	end
end


GO
create procedure Calculate_DateRevenue
	@Sold_Date date
as
begin
	declare @idx date = '1111-1-1'
	
	select @idx=Sold_Date
	from Bill
	where Sold_Date=@Sold_Date

	if (@idx='1111-1-1')
	begin
		print ('Date is not available')
		rollback
		end
	else
	begin
	select sum(Total_Price)
	from Bill
	Group by Sold_Date
	Having Sold_Date=@Sold_Date
	end
end


GO
CREATE PROCEDURE List_Dish
	@Cus_ID int
AS
BEGIN
	declare @idx int =0

	select @idx=Bill.Cus_ID
	from Bill
	where Cus_ID=@Cus_ID

	if (@idx=0)
	begin
		print ('Customer ID is not available')
		rollback
		end
	else
	begin
		select a.Bill_ID, b.Dish_ID, b.Dish_Num, b.Price, a.Sold_Date
		from Bill a join Bill_Detail b on a.Bill_ID=b.Bill_ID
		where a.Cus_ID=@Cus_ID
	end
end

GO
CREATE PROCEDURE FindGuest_TheMostProfit
AS
BEGIN
	declare @max float, @Cus_ID int

	select @max=max(Total_Price)
	from Bill a join Bill_Detail b on a.Bill_ID=b.Bill_ID

	
	select @Cus_ID = Cus_ID
	from Bill a join Bill_Detail b on a.Bill_ID=b.Bill_ID
	where Total_Price=@max
	
	select *
	from Customer
	where Cus_ID=@Cus_ID
end


GO
create procedure SortPrice_lowtohigh
as
begin
	select * from Menu order by Price
end

--exec SortPrice_lowtohigh 

GO
CREATE PROCEDURE SortPrice_hightolow
as
begin
	select * 
	from Menu
	order by Price desc
end
--exec SortPrice_hightolow 

GO
create procedure Add_CusInfo
	@Cus_ID int , @Cus_Name nvarchar(50), @Cus_Phone varchar(11), @Cus_Address varchar(50)
as
Begin
	insert into Customer values(@Cus_ID, @Cus_Name, @Cus_Phone, @Cus_Address)
end
--exec Add_Customer

--Giảm giá nếu mua hàng tù 1000 tro lên
GO
CREATE TRIGGER Sale on Bill
after insert
as
begin 
	declare @Total float
	select @Total =a.Total_Price
	from inserted a
	if (@Total >= 1000)
		begin
			update Bill	
			set Total_Price=Total_Price-Total_Price*0.05
		end
end

GO
alter TRIGGER Sale on Bill
after insert, update
as
begin 
	declare @Total float
	select @Total =a.Total_Price
	from inserted a
	if (@Total >= 1000)
		begin
			update Bill	
			set Total_Price=Total_Price-Total_Price*0.05
		end
end

GO
create table login
(
	Id INT NOT NULL PRIMARY KEY, 
    username VARCHAR(50) NOT NULL, 
    pass NCHAR(10) NULL
)
GO


GO
Insert into login values(1, 'user01','12321')
Insert into login values(2, 'user02','2211')
--VIEW
GO
CREATE VIEW Total_Bill
As
	select *
	from Bill;

GO
Create VIEW Customer_View
AS
	Select * from Customer

GO
create VIEW Employee_View
AS
	Select * from staff

GO
create view Number_Employee_Type
as
	select Type, Count(Type) Number from Staff group by Type

GO 
create VIEW date_revenue_view 
as
	select Sold_Date, sum(Total_Price) Revenue
	from Bill
	Group by Sold_Date


--Employee login
GO
CREATE Login Test_Login1 with password='123'
GO
CREATE User employee1 for Login Test_Login1
GO
CREATE Login Test_Login2 with password='1234'
GO
CREATE User employee2 for Login Test_Login2
GO
CREATE Login Test_Login3 with password='12'
GO
CREATE User employee3 for Login Test_Login3
GO
CREATE ROLE Employee 
GO
GRANT SELECT on Staff to Employee
go
grant select on Menu to Employee
GO
Sp_AddRoleMember Employee, employee1
GO
Sp_AddRoleMember Employee, employee2
GO
Sp_AddRoleMember Employee, employee3
--Admin login
GO
CREATE Login Admin_Login with password = '1'
GO 
CREATE User Admin 
FOR Login Admin_Login

GO
Sp_addRoleMember db_owner, Admin

--Customer login
GO
create Login Cus1 with password = 'cus1'
GO
create User Customer1 for Login Cus1
GO
create Login Cus2 with password = 'cus2'
GO
create User Customer2 for Login Cus2
GO
create Login Cus3 with password = 'cus3'
GO
create User Customer3 for Login Cus3
create role customerGroup
GO
grant select on Bill to customerGroup
GO
grant select on Bill_Detail to customerGroup
go
grant select on Menu to customerGroup
go
Sp_addRoleMember CustomerGroup, Customer1
GO
Sp_AddRoleMember CustomerGroup, Customer2
GO
Sp_AddRoleMember CustomerGroup, Customer3
GO