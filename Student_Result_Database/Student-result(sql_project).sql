CREATE DATABASE StudentresultDB;
USE StudentresultDB;

CREATE TABLE Students(Student_ID INT PRIMARY KEY,Name VARCHAR(255),Department VARCHAR(255),Year VARCHAR(255));
CREATE TABLE Subjects(Subject_ID INT PRIMARY KEY,Subject_Name VARCHAR(255),Credits INT);
CREATE TABLE Marks(	Mark_ID INT PRIMARY KEY,Student_ID INT,FOREIGN KEY(Student_ID) REFERENCES Students(Student_ID),Subject_ID INT,FOREIGN KEY(Subject_ID) REFERENCES Subjects(Subject_ID),Marks INT);

USE StudentresultDB;

INSERT INTO Students(Student_ID,Name,Department,Year) VALUES (1, 'Amit Sharma', 'Computer Science', 1),
(2, 'Neha Verma', 'Information Technology', 2),
(3, 'Rahul Singh', 'Mechanical', 3),
(4, 'Priya Patel', 'Electrical', 4),
(5, 'Kiran Rao', 'Civil', 1);

INSERT INTO Subjects(Subject_ID,Subject_Name,Credits) VALUES (1, 'Mathematics', 4),
(2, 'Physics', 3),(3,'English',2);

INSERT INTO Marks(Mark_ID,Student_ID,Subject_ID,Marks) VALUES (1, 1, 1, 85),
(2, 1, 2, 78),(3,1,3,88),
(4, 2, 1, 81),(5,2,2,75),(6,2,3,89),(7,3,1,67),(8,3,2,84),(9,3,3,68),
(10, 4, 1, 92),(11, 4,2,90),(12,4,3,98),(13,5,1,78),(14,5,2,69),
(15, 5, 3, 74); 

SELECT m.Student_ID,s.Subject_ID,s.Subject_Name,m.Marks FROM Marks AS m JOIN Subjects AS s ON s.Subject_ID=m.Subject_ID WHERE m.Subject_ID=1 ORDER BY Marks DESC limit 3;

SELECT m.Student_ID,s.Subject_ID,s.Subject_Name,m.Marks FROM Marks AS m JOIN Subjects AS s ON s.Subject_ID=m.Subject_ID WHERE m.Subject_ID=2 ORDER BY Marks DESC limit 3;

SELECT m.Student_ID,s.Subject_ID,s.Subject_Name,m.Marks FROM Marks AS m JOIN Subjects AS s ON s.Subject_ID=m.Subject_ID WHERE m.Subject_ID=3 ORDER BY Marks DESC limit 3;

SELECT s.Department,AVG(m.Marks) AS Average_marks FROM Marks AS m JOIN Students AS s ON s.Student_ID=m.Student_ID GROUP BY Department;

SELECT s.Student_ID,s.Name,COUNT(m.Subject_ID) AS failed_subjects FROM Students AS s JOIN Marks AS m ON s.Student_ID=m.Student_ID WHERE m.Marks<70 GROUP BY s.Student_ID,s.Name HAVING COUNT(m.Subject_ID)>=1;