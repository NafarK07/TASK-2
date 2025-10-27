USE LibraryManagement;

INSERT INTO Authors (first_name, last_name, email)
VALUES 
('Nafar', 'Khan', 'nafar.jimkanpur@gmail.com'),
('George', 'Orwell', 'george.orwell@example.com'),
('J.K.', 'Rowling', 'jk.rowling@example.com'),
('Agatha', 'Christie', NULL); -- NULL email example

INSERT INTO Books (isbn, title, publication_year, total_copies, available_copies)
VALUES
('9780451524935', '1984', 1949, 5, 5),
('9780556570374', 'Time Machine', 1999, 10, 5),
('9780747532743', 'Harry Potter and the Philosopher''s Stone', 1997, 10, 8),
('9780007136834', 'Murder on the Orient Express', 1934, 4, DEFAULT); -- Using DEFAULT

INSERT INTO Members (first_name, last_name, email, join_date)
VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '2023-02-01'),
('Priya', 'Verma', 'priya.verma@example.com', '2023-03-10'),
('Rani', 'Patel', 'Rani.Patel@example.com', '2023-03-30'),
('Rohan', 'Patel', 'rohan.patel@example.com', '2023-04-20');

INSERT INTO Book_Authors (book_id, author_id)
VALUES
(1, 2), -- 1984 by George Orwell
(2, 1), -- time machine by nafar
(3, 3), -- Harry Potter by J.K. Rowling
(4, 4); -- Murder on the Orient Express by Agatha Christie

select * from book_authors;

INSERT INTO Borrowings (book_id, member_id, borrow_date, return_date)
VALUES
(1, 1, '2024-01-10', '2024-02-10'),
(2, 2, '2024-03-01', NULL), -- NULL return_date (not yet returned)
(3, 3, '2024-03-15', '2024-03-25'),
(4, 4, '2024-02-01', NULL); -- NULL return_date (not yet returned)

select * from borrowings;

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 2;

select * from Books;

UPDATE Members
SET email = 'p.rani-update@example.com'
WHERE member_id = 3;

select * from Members;

DELETE FROM Borrowings
WHERE borrowing_id = 4;

select * FROM Borrowings;

DELETE FROM Authors
WHERE author_id = 1; -- nafar khan deleted → his book link removed from Book_Authors

select * FROM authors;

-- Find records with NULL return_date
SELECT * FROM Borrowings WHERE return_date IS NULL;

-- Update NULL return_date to a real date
UPDATE Borrowings
SET return_date = '2024-04-01'
WHERE book_id = 2;

SELECT * FROM Borrowings;