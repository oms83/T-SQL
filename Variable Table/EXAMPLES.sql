Declare @vtPeople Table
(
	PersonID int primary key identity(1,1),
	Name varchar(100)
);

insert into @vtPeople (Name) values ('Omer MEMES');
insert into @vtPeople (Name) values ('Ali MEMES');

select * from @vtPeople
/*
1	Omer MEMES
2	Ali MEMES
*/
-------------------------------------------------------


create table ptPeople
(
	PersonID int primary key identity(1,1),
	Name varchar(100)
)

insert into ptPeople (Name) values ('Omer MEMES');
insert into ptPeople (Name) values ('Ali MEMES');

declare @vtFilter table
(
	PersonID int primary key identity(1,1),
	Name varchar(100)
)

insert into @vtFilter select name from ptPeople

select * from @vtFilter
/*
1	Omer MEMES
2	Ali MEMES
*/
-------------------------------------------------------


create table courses
(
	courseID int primary key identity,
	title varchar(100),
	PersonID int,
)

insert into courses (title, PersonID) values ('math', 1);
insert into courses (title, PersonID) values ('algorithm', 2);

select c.PersonID, p.Name, c.title from courses c
inner join @vtFilter p on p.PersonID = c.PersonID
/*
1	Omer MEMES	math
2	Ali MEMES	algorithm
*/
-------------------------------------------------------


declare @vtSales table 
(
	saleID int identity primary key,
	productID int,
	saleAmount decimal(10, 2)
);

insert into @vtSales (productID, saleAmount) values (101, 123.43);
insert into @vtSales (productID, saleAmount) values (101, 100.00);

select * from @vtSales;
/*
1	101	123.43
2	101	100.00
*/

update @vtSales set saleAmount = 150.00 where saleID = 2;

select * from @vtSales;
/*
1	101	123.43
2	101	150.00
*/
-------------------------------------------------------


declare @vtCustomer table
(
	customerID int identity primary key,
	name varchar(100)
);
insert into @vtCustomer (name) values ('Omer MEMES');
insert into @vtCustomer (name) values ('Ali MEMES'), ('Osman MEMES'), ('Musa Bozkurt');

select * from @vtCustomer 
/*
1	Omer MEMES
2	Ali MEMES
3	Osman MEMES
4	Musa Bozkurt
*/
delete from @vtCustomer Where customerID = 3

select * from @vtCustomer 
/*
1	Omer MEMES
2	Ali MEMES
4	Musa Bozkurt
*/
