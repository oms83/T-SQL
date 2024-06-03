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


-- Find By ID 1
create procedure SP_GetPersonInfoByID1
	@personID int
as 
begin 
	select * from People where PersonID = @personID
end

exec SP_GetPersonInfoByID1
	@personID =1
/*
1	OMER	MEMES	oms83@gmail.com
*/
--------------------------------------------


-- Find By ID 2
create procedure SP_GetPersonInfoByID2
	@personID int,
	@firstName varchar(100) out,
	@lastName varchar(100) output,
	@email varchar(100) out,
	@isFound bit out
as 
begin
	
	--if (select 1 from People where PersonID = @personID) = 1
	if EXISTS(select 1 from People where PersonID = @personID)
	begin 
		select @firstName = FirstName, @lastName = LastName , @email = Email 
		from People
		where PersonID = @personID;

		set @isFound = 1;
	end
	else	
		set @isFound = 0;
end

declare @personID int = 1;
declare @firstName varchar(100);
declare @lastName varchar(100);
declare @email varchar(100);
declare @isFound bit;

exec SP_GetPersonInfoByID2
	@personID = @personID,
	@firstName = @firstName out,
	@lastName = @lastName out,
	@email = @email out,
	@isFound = @isFound out

if @isFound = 1
	select @personID 'Person ID', @firstName as 'First Name', @lastName as 'Last Name', @email as Email
else
	select 'Person with ID: ' + cast (@personID as varchar) + ' is not found'
--------------------------------------------


-- IsExists
create procedure SP_IsExistByID
	@personID int
as
begin
	if EXISTS(select * from People where PersonID = @personID)
		return 1
	else	
		return 0
end


declare @isExists bit;
declare  @ID int = 1;
execute @isExists = SP_IsExistByID
	@personID = @ID

if @isExists = 1
	select 'Person with ID: ' + cast (@ID as varchar) + ' is found';
else	
	select 'Person with ID: ' + cast (@ID as varchar) + ' is not found'
	
--------------------------------------------

