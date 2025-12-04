CREATE DATABASE IF NOT EXISTS LibraryDB1;
USE LibraryDB1;

CREATE TABLE Books1(book_id INT AUTO_INCREMENT PRIMARY KEY,title VARCHAR(255) NOT NULL,author VARCHAR(255) NOT NULL,genre VARCHAR(100),published_year YEAR,is_available BOOLEAN DEFAULT TRUE);
CREATE TABLE Members1(member_id INT AUTO_INCREMENT KEY,name VARCHAR(255),email VARCHAR(255),phone_number VARCHAR(15),join_date DATE DEFAULT (CURRENT_DATE));
CREATE TABLE Librarians1(librarian_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(255),email VARCHAR(255),phone_number VARCHAR(15),hire_date DATE DEFAULT (CURRENT_DATE));
CREATE TABLE Borrowing1(loan_id INT AUTO_INCREMENT PRIMARY KEY,book_id INT,member_id INT,librarian_id INT,borrow_date DATE DEFAULT (CURRENT_DATE),return_date DATE,FOREIGN KEY(book_id) REFERENCES Books1(book_id),FOREIGN KEY(member_id) REFERENCES Members1(member_id),FOREIGN KEY(librarian_id) REFERENCES Librarians1(librarian_id)); 

USE LibraryDB1;
INSERT INTO Books1(title,author,genre,published_year) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),('1984', 'George Orwell', 'Dystopian', 1949),('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960);
INSERT INTO Members1(name,email,phone_number) VALUES ('Alen King', 'alenking@example.com', '1234567890'),('Alece Hofman', 'alecehofman@example.com', '9876543210');
INSERT INTO Librarians1(name,email,phone_number) VALUES ('Nail Horn', 'nail@example.com', '4567891230'),('Garden McGraw', 'garden@example.com', '7894561230');

INSERT INTO Borrowing1(book_id,member_id,librarian_id) VALUES (1,1,1);
UPDATE Books1 SET is_available=FALSE WHERE book_id=1;

UPDATE Borrowing1 SET return_date=CURRENT_DATE WHERE loan_id=1;
UPDATE Books1 SET is_available=TRUE WHERE book_id=1;

SELECT * FROM Books1 WHERE is_available=TRUE;

SELECT m.name,b.title,br.borrow_date,br.return_date FROM Borrowing1 br JOIN Members1 m ON br.member_id=m.member_id JOIN Books1 b ON br.book_id=b.book_id WHERE m.member_id=1;

SELECT m.name,b.title,br.borrow_date FROM Borrowing1 br JOIN Members1 m ON br.member_id=m.member_id JOIN Books1 b ON br.book_id=b.book_id WHERE br.return_date IS NULL AND br.borrow_date<CURRENT_DATE-INTERVAL 14 DAY;

SELECT title,genre,published_year FROM Books1 WHERE author='George Orwell';

SELECT title,author,published_year FROM Books1 WHERE published_year>2000;

SELECT COUNT(*) AS total_books FROM Books1;

SELECT m.name,br.borrow_date,br.return_date FROM Borrowing1 br JOIN Members1 m ON br.member_id=m.member_id JOIN Books1 b ON br.book_id=b.book_id WHERE b.title='1984';

SELECT b.title,br.borrow_date,br.return_date FROM Borrowing1 br JOIN Books1 b ON br.book_id=b.book_id WHERE br.member_id=1;

SELECT title,author,published_year FROM Books1 WHERE genre='Fiction' AND is_available=TRUE;

SELECT m.name,COUNT(br.loan_id) AS total_books1_borrowed FROM Borrowing1 br JOIN Members1 m ON br.member_id=m.member_id GROUP BY m.name;

SELECT m.name,b.title,br.borrow_date FROM Borrowing1 br JOIN Members1 m ON  br.member_id=m.member_id JOIN Books1 b ON br.book_id=b.book_id WHERE br.return_date IS NULL AND br.borrow_date<CURRENT_DATE-INTERVAL 30 DAY;

SELECT l.name,COUNT(br.loan_id) AS total_borrowings1 FROM Borrowing1 br JOIN Librarians1 l ON br.librarian_id=l.librarian_id GROUP BY l.name ORDER BY total_borrowings1 DESC; 

SELECT m.name,b.title,br.borrow_date FROM Borrowing1 br JOIN Members1 m ON br.member_id=m.member_id JOIN Books1 b ON br.book_id=b.book_id WHERE br.return_date IS NULL;