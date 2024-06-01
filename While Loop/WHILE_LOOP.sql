-- ex1
declare @x int = 1;
while @x<=10
begin 
	if @x = 5
		continue;
	print cast(@x as varchar(max))
	set @x = @x + 1
end



-- ex2
declare @a int = 1;
while @a<=10
begin 
	if @a = 6
		return
	print cast(@a as varchar(max))
	set @a = @a + 1
end



-- ex3
declare @b int = 1;
while @b<=10
begin 
	if @b = 6
		return
	print cast(@b as varchar(max))
	set @a = @a + 1
end

declare @q int = 1;
declare @w int = 1;
while @q < 11
begin
	set @w = 1
	while @w < 10
	begin 
		print cast(@q as varchar) + ' * ' + cast(@w as varchar) + ' = ' + cast(@q*@w as varchar)
		set @w = @w + 1
	end
	print ''
	set @q = @q + 1
end



-- ex4
declare @col int = 1;
declare @row int = 1;
declare @header varchar(500) = char(9);
while @col <= 10
begin
	set @header = @header + cast(@col as varchar) + char(9)
	set @col = @col + 1
end
  
print @header
  
set @col = 1
declare @result varchar(500);

while @row <= 10
begin 
  
	set @result = cast(@row as varchar) + char(9)
	set @col = 1
  
	while @col <= 10
	begin
		set @result = @result + cast(@row*@col as varchar) + char(9)
		set @col = @col + 1
	end
  
	print @result
	set @result = char(0)
	set @row = @row + 1
  
end


--
