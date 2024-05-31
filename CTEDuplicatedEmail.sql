CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Email NVARCHAR(50)
);

INSERT INTO Contacts (Name, Email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Emma', 'emma@example.com'),
('Fiona', 'fiona@example.com'),
('Grace', 'grace@example.com'),
('Henry', 'henry@example.com'),
('Isabella', 'isabella@example.com'),
('Jack', 'jack@example.com'),
('Katherine', 'katherine@example.com'),
('Liam', 'liam@example.com'),
('Mia', 'mia@example.com'),
('Noah', 'noah@example.com'),
('Olivia', 'olivia@example.com'),
('Paul', 'paul@example.com'),
('Quincy', 'quincy@example.com'),
('Rachel', 'rachel@example.com'),
('Sophia', 'sophia@example.com'),
('Tom', 'tom@example.com'),
('Alice2', 'alice@example.com'),
('Bob2', 'bob@example.com'),
('Charlie2', 'charlie@example.com'),
('David2', 'david@example.com'),
('Emma2', 'emma@example.com'),
('Fiona2', 'fiona@example.com');
--------------------------------------------

WITH DuplicatedEmails AS 
(
	SELECT Email, COUNT(*) AS DuplicatedEmail FROM Contacts 
	GROUP BY Email
	HAVING COUNT(*) > 1
)
SELECT C.Name, C.Email FROM DuplicatedEmails D
INNER JOIN Contacts C ON C.Email = D.Email



