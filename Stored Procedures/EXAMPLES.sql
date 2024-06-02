-- Get all people
create procedure SP_ListAllPeople
as 
begin
	select * from People
end
exec SP_ListAllPeople	
/*
1	OMER	MEMES	oms83@gmail.com
2	Ali	MEMES	ali83@gmail.com
4	Ali	MEMES	ali83@gmail.com
*/

execute SP_ListAllPeople	
/*
1	OMER	MEMES	oms83@gmail.com
2	Ali	MEMES	ali83@gmail.com
4	Ali	MEMES	ali83@gmail.com
*/
--------------------------------------------


-- Add new person
create procedure PS_AddNewPerson2
	@personID INT OUT,
	@firstName Varchar(100),
	@lastName varchar(100),
	@email varchar(100)
as 
begin
	insert into People (FirstName,LastName, Email) values (@firstName, @lastName, @email);
	set @personID = SCOPE_IDENTITY();
end

declare @PID int;
exec PS_AddNewPerson2 
	@firstName = 'Omer Ahmed'
	,@lastName = 'MEMES'
	,@email = 'oms@gmail.com'
	,@personID = @PID out

execute SP_ListAllPeople
/*
1	OMER	MEMES	oms83@gmail.com
2	Ali	MEMES	ali83@gmail.com
4	Ali	MEMES	ali83@gmail.com
5	Omer Ahmed	MEMES	oms@gmail.com
*/
--------------------------------------------

-- Update person info
create procedure SP_UpdatePerson2
	@personID INT,
	@firstName Varchar(100),
	@lastName varchar(100),
	@email varchar(100)
as
begin 
	if (select found = 1 from People where PersonID = @personID)  = 1
	update People set
		 Email=@email
		,FirstName=@firstName
		,LastName = @lastName
		where PersonID = @personID;
		return 1;
	
	return 0
end

declare @result int;
exec @result = SP_UpdatePerson2
				@firstName = 'Yusuf'
				,@lastName = 'MEMES'
				,@email = 'oms@gmail.com'
				,@personID = 3

if @result = 1
begin
	select 'person info updated successfully'
	exec SP_ListAllPeople
end

else
begin
	select 'person info not updated successfully'
end
	
/*
person info updated successfully

1	OMER	MEMES	oms83@gmail.com
2	Ali	MEMES	ali83@gmail.com
4	Ali	MEMES	ali83@gmail.com
5	Omer Ahmed	MEMES	oms@gmail.com
*/
--------------------------------------------

