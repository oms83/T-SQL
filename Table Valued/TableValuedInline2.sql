SELECT s.StudentID, s.Name, s.Subject, t.Name 
FROM  dbo.GetStudentsBySubject('Math') s
INNER JOIN Teachers t ON t.Subject = s.Subject
