
create table Students2
(
	studentID int Primary key identity,
	Name varchar(100),
)
insert into Students2 (Name) values
					  ('Omer MEMES'),
					  ('Ali MEMES'),
					  ('Yusuf MEMES'),
					  ('Musa MEMES');

create table Sujbects
(
	subjectID int primary key identity,
	Name varchar(100)
)
insert into Sujbects (Name) values
					  ('Math'),
					  ('Biology'),
					  ('Geometric'),
					  ('IQ');


create table TakeExams
(
	takeExamID int identity(1, 1) primary key,
	studnetID int,
	subjectID int,
	grade int,
	examDate DateTime Default GetDate(),
	foreign key (studnetID) references Students2(studentID),
	foreign key (subjectID) references Sujbects(subjectID)
)


insert into TakeExams (studnetID, subjectID, grade, examDate) values
					  (1, 4, 100, '05-06-2018')
					 ,(1, 4, 100, '01-02-2019')
					 ,(2, 3, 70, '05-06-2020')
					 ,(3, 2, 85, '01-09-2022')
					 ,(4, 1, 88, '03-06-2023')
					 ,(2, 1, 90, '02-02-2021');


Select S.Name, T.grade, T.examDate, U.Name from Students2 S
inner join TakeExams T on T.studnetID = S.studentID
inner join Sujbects U on U.subjectID = T.subjectID
/*
Omer MEMES	100	2018-05-06 00:00:00.000	IQ
Omer MEMES	100	2019-01-02 00:00:00.000	IQ
Ali MEMES	70	2020-05-06 00:00:00.000	Geometric
Yusuf MEMES	85	2022-01-09 00:00:00.000	Biology
Musa MEMES	88	2023-03-06 00:00:00.000	Math
Ali MEMES	90	2021-02-02 00:00:00.000	Math
*/

create function GetGradesOfSubjet(@studnetID int, @subjectTilte varchar(100))
returns Table
as
return 
(
	Select T.grade from Students2 S
	inner join TakeExams T on T.studnetID = S.studentID
	inner join Sujbects U on U.subjectID = T.subjectID
	where S.studentID = @studnetID
	and   U.Name = @subjectTilte
);
Select * From dbo.GetGradesOfSubjet(1, 'IQ')
/*
100
100
*/
