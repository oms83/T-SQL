
CREATE Trigger trg_UpdateStudents On StudentsView
instead of update
as 
begin 
	update StudentInfo set Name = I.Name, Address = I.Address
	from studentInfo S
	inner join inserted I 
	On I.StudentID = S.StudentID 

	update AcademicInfo set Grade = I.Grade, Course = I.Course
	from AcademicInfo A
	inner join inserted I 
	On I.StudentID = A.StudentID 

end

SELECT * FROM StudentsView
Update StudentsView SET Name = 'OMER MEMES' WHERE StudentID = 1

  /*
  
  updates occur to the original tables as well
  
  1	OMER MEMES	123 Main St	Computer Science	100
  2	Jane Smith	456 Oak Ave	Mathematics	85

*/
