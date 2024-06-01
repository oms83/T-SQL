create table #ttPeople
(
	personID int identity primary key,
	name varchar(100),
);

insert into #ttPeople (name) values ('Ömer MEMES'), ('Ali MEMES'), ('Osaman MEMES'), ('Musa Bozkut'), ('Yusuf Bozkurt');

select * from #ttPeople
/*
1	?mer MEMES
2	Ali MEMES
3	Osaman MEMES
4	Musa Bozkut
5	Yusuf Bozkurt
*/
update #ttPeople set name = 'Yusuf MEMES' where personID = 5;

select * from #ttPeople
/*
1	?mer MEMES
2	Ali MEMES
3	Osaman MEMES
4	Musa Bozkut
5	Yusuf MEMES
*/
delete #ttPeople where personID = 4

select * from #ttPeople
/*
1	?mer MEMES
2	Ali MEMES
3	Osaman MEMES
5	Yusuf MEMES
*/

create table #ttSales
(
	saleID int identity primary key,
	personID int,
	saleAmount decimal(10, 2)
)

insert into #ttSales (personID, saleAmount) values 
					 (1, 200), (1, 160),
					 (2, 160), (3, 400),
					 (5, 323), (5, 400)

select * from #ttSales
/*
1	1	200.00
2	1	160.00
3	2	160.00
4	3	400.00
5	5	323.00
6	5	400.00
*/

select p.personID, p.name, s.saleAmount from #ttPeople p
inner join #ttSales s on p.personID = s.personID
/*
1	?mer MEMES	200.00
1	?mer MEMES	160.00
2	Ali MEMES	160.00
3	Osaman MEMES	400.00
5	Yusuf MEMES	323.00
5	Yusuf MEMES	400.00
*/


-------------------------
declare @vtPeople table
(
	personID int identity primary key,
	name varchar(100)
)

insert into @vtPeople (name) 
select name from #ttPeople

select * from @vtPeople

/*
1	?mer MEMES
2	Ali MEMES
3	Osaman MEMES
4	Yusuf MEMES
*/
