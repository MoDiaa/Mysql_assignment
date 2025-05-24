CREATE DATABASE Library_Management_System;
USE Library_Management_System;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    publish_date DATE,
    genre VARCHAR(100),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Authors (first_name, last_name) VALUES 
('George', 'Orwell'), 
('Jane', 'Austen'),
('J.K.', 'Rowling'),
('Mark', 'Twain'),
('Ernest', 'Hemingway');

INSERT INTO Books (title, author_id, publish_date, genre) VALUES
('1984', 1, '1949-06-08', 'Dystopian'),
('Pride and Prejudice', 2, '1813-01-28', 'Romance'),
('Harry Potter and the Sorcerer''s Stone', 3, '1997-06-26', 'Fantasy'),
('Adventures of Huckleberry Finn', 4, '1884-12-10', 'Adventure'),
('The Old Man and the Sea', 5, '1952-09-01', 'Literary Fiction');

INSERT INTO Members (first_name, last_name, email, phone) VALUES
('Ali', 'Mahmoud', 'ali@example.com', '01000000001'),
('Sara', 'Youssef', 'sara@example.com', '01000000002'),
('Omar', 'Fahmy', 'omar@example.com', '01000000003'),
('Laila', 'Nader', 'laila@example.com', '01000000004'),
('Hany', 'Mostafa', 'hany@example.com', '01000000005');

INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-05-01', NULL),
(2, 2, '2025-05-03', '2025-05-10'),
(3, 3, '2025-05-05', NULL),
(4, 4, '2025-05-06', NULL),
(5, 5, '2025-05-08', '2025-05-15');


INSERT INTO Books (title, author_id, publish_date, genre)
VALUES ('Animal Farm', 1, '1945-08-17', 'Political Satire');

SELECT b.title
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
WHERE a.first_name = 'J.K.' AND a.last_name = 'Rowling';

UPDATE Loans
SET return_date = '2025-05-20'
WHERE loan_id = 1;

DELETE FROM Loans WHERE member_id = 5;
DELETE FROM Members WHERE member_id = 5;


INSERT INTO Members (first_name, last_name, email, phone)
VALUES ('Hany', 'Mostafa', 'hany@example.com', '01000000005');




