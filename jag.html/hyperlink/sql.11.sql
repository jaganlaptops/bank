-- select statement

drop database select_db;

create database select_db;

use select_db;


-- creating tables

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255)
);


INSERT INTO Authors (author_id, author_name) VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'J.R.R. Tolkien'),
(4, 'Jane Austen'),
(5, 'Stephen King'),
(6, 'Agatha Christie'),
(7, 'Mark Twain'),
(8, 'F. Scott Fitzgerald'),
(9, 'Harper Lee'),
(10, 'Leo Tolstoy'),
(11, 'Charles Dickens'),
(12, 'Ernest Hemingway'),
(13, 'Gabriel Garcia Marquez'),
(14, 'Toni Morrison'),
(15, 'Kurt Vonnegut'),
(16, 'Aldous Huxley'),
(17, 'Mary Shelley'),
(18, 'Oscar Wilde'),
(19, 'Lewis Carroll'),
(20, 'Emily Dickinson');

select * from authors;

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'Fantasy'),
(2, 'Science Fiction'),
(3, 'Mystery'),
(4, 'Horror'),
(5, 'Romance'),
(6, 'Classic'),
(7, 'Adventure'),
(8, 'Thriller'),
(9, 'Historical'),
(10, 'Literary Fiction'),
(11, 'Non-fiction'),
(12, 'Poetry'),
(13, 'Drama'),
(14, 'Comedy'),
(15, 'Biography'),
(16, 'Self-Help'),
(17, 'Science'),
(18, 'Philosophy'),
(19, 'Crime'),
(20, 'Young Adult');


select * from genres;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(255),
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

INSERT INTO Books (book_id, book_title, author_id, genre_id) 
VALUES
(1, 'Harry Potter and the Sorcerer''s Stone', 1, 1),
(2, '1984', 2, 2),
(3, 'The Lord of the Rings', 3, 1),
(4, 'Pride and Prejudice', 4, 6),
(5, 'The Shining', 5, 4),
(6, 'Murder on the Orient Express', 6, 3),
(7, 'The Adventures of Tom Sawyer', 7, 7),
(8, 'The Great Gatsby', 8, 10),
(9, 'To Kill a Mockingbird', 9, 11),
(10, 'War and Peace', 10, 9),
(11, 'A Tale of Two Cities', 11, 6),
(12, 'The Old Man and the Sea', 12, 10),
(13, 'One Hundred Years of Solitude', 13, 6),
(14, 'Beloved', 14, 10),
(15, 'Slaughterhouse-Five', 15, 2),
(16, 'Brave New World', 16, 2),
(17, 'Frankenstein', 17, 4),
(18, 'The Picture of Dorian Gray', 18, 6),
(19, 'Alice''s Adventures in Wonderland', 19, 1),
(20, 'The Complete Poems of Emily Dickinson', 20, 12);

CREATE TABLE BookLoans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


INSERT INTO BookLoans (loan_id, book_id, loan_date, return_date)
VALUES
(1, 1, '2023-08-01', '2023-08-15'),
(2, 2, '2023-07-15', '2023-08-05'),
(3, 3, '2023-08-05', '2023-08-20'),
(4, 4, '2023-07-20', '2023-08-10'),
(5, 5, '2023-08-10', '2023-08-25'),
(6, 6, '2023-07-25', '2023-08-15'),
(7, 7, '2023-08-15', '2023-08-30'),
(8, 8, '2023-08-02', '2023-08-17'),
(9, 9, '2023-08-07', '2023-08-22'),
(10, 10, '2023-08-12', '2023-08-27'),
(11, 11, '2023-07-18', '2023-08-02'),
(12, 12, '2023-08-03', '2023-08-18'),
(13, 13, '2023-08-08', '2023-08-23'),
(14, 14, '2023-08-13', '2023-08-28'),
(15, 15, '2023-08-04', '2023-08-19'),
(16, 16, '2023-08-09', '2023-08-24'),
(17, 17, '2023-07-22', '2023-08-06'),
(18, 18, '2023-08-14', '2023-08-29'),
(19, 19, '2023-08-06', '2023-08-21'),
(20, 20, '2023-07-30', '2023-08-14');


-- 1. Question: Retrieve all authors. (genres, books, bookloans)
select * from authors;
desc authors;

select * from authors;

select * from genres;

select 
	author_id, 
    author_name 
from authors;

select author_name from authors;

-- 2. Question: List all distinct genres.
select * from genres;

insert into genres values (21, 'Fantasy');
insert into genres values (22, 'Comedy');

select * from genres;

select genre_name from genres;

select distinct genre_name from genres;

select distinct(genre_name) from genres;

-- 3. Question: How many books are in the "Fantasy" genre?

select * from books;

select * from books
where genre_id = 1;

select count(*) as no_of_books from books
where genre_id = 1;

select genre_id from genres
where genre_name = 'Fantasy';

select count(*) as no_of_books from books
where genre_id in (1, 21);


select count(*) as no_of_books from books
where genre_id in (select genre_id from genres
where genre_name = 'Fantasy');





-- 4. Question: What is the title of the book with ID 7?

select * from books;

select book_title from books
where book_id = 7;


-- 5. Question: Find all books written by J.K. Rowling.

select * from books;

select * from books
where author_id = 1;

select * from books
where author_id = (
	select author_id from authors 
    where author_name = 'J.K. Rowling');



-- 6. Question: How many books are in the 
-- "Science Fiction" genre?

select count(*) as no_of_books from books
where genre_id = (
	select genre_id from 
    genres where genre_name='Science Fiction');


-- 7. Question: List all books and their authors.
select book_title, author_id from books;



/*select 
	book_title, 
    author_name 
from books join authors on books.author_id = authors.author_id;
*/

-- 8. Question: How many book loans were returned before 
-- the due date?

select * from bookloans;




-- 9. Question: Find the author of the book 
-- "To Kill a Mockingbird".

select author_name from authors
where author_id = (select author_id from books
where book_title='To Kill a Mockingbird');


-- 10. Question: List all books in alphabetical order of titles.

select * from books;

select * from books
order by book_title asc;

select * from books
order by book_title desc;


select * from books
order by book_title; -- takes asc by default





-- 11. Question: Find the books borrowed after August 5, 2023.

select * from bookloans
where loan_date > '2023-08-05';

select * from bookloans
where loan_date > '2023-08-05';

select * from books
where book_id in (select book_id from bookloans
where loan_date > '2023-08-05');




-- 12. Question: How many authors have written at least 2 books?
select * from books;

insert into books values(23, 'XXXXX', 2, 4);
insert into books values(24, 'YYYYY', 1, 4);
insert into books values(25, 'ZZZZZ', 7, 4);

select * from books;

select author_id, count(*) from books
group by author_id
where count(*) >= 2;

select author_id, count(*) from books
group by author_id
having count(*) >= 2;



-- 13. Question: List all genres and the number of books 
-- in each genre.
select
	genre_id,
    count(*) as no_of_books
from books
group by genre_id;

select * from genres;

select * from books;



-- 14. Question: Find the author(s) who wrote the most books.

insert into books values(30, 'AAAAA', 7, 8);

SELECT 
	author_id, 
    COUNT(*) AS book_count 
FROM Books 
GROUP BY author_id 
ORDER BY book_count DESC 
LIMIT 1;

-- 15. Question: Which book has the most recent loan?



SELECT 
	book_id, 
    loan_date 
FROM BookLoans 
ORDER BY loan_date DESC LIMIT 1;

-- 16. Question: Find the average duration (in days) of book 
-- loans.

select
	return_date,
    loan_date,
    datediff(return_date, loan_date),
    avg(datediff(return_date, loan_date))
from BookLoans;



-- 17. Question: List all authors and the genres of their books.

SELECT 
	author_id, 
    genre_id 
FROM Books;

-- 18. Question: Find the total number of loans for each genre.

SELECT 
	genre_id, 
    COUNT(*) AS loan_count 
FROM BookLoans 
GROUP BY genre_id;

-- 19. Question: List the authors who have books in more than 
-- one genre.

SELECT 
	author_id,
    count(distinct genre_id) as book_count
FROM Books 
GROUP BY author_id 
having book_count > 1;

-- HAVING COUNT(DISTINCT genre_id) > 1;

-- 20. Question: Find the book with the longest loan duration.

SELECT 
	book_id, 
    loan_date, 
    return_date, 
	DATEDIFF(return_date, loan_date) AS loan_duration 
FROM BookLoans 
ORDER BY loan_duration DESC LIMIT 1;

-- 21. Question: List the top 5 most borrowed books.

SELECT 
	book_id, 
    COUNT(*) AS borrow_count 
FROM BookLoans 
GROUP BY book_id 
ORDER BY borrow_count DESC LIMIT 5;

-- 22. Question: Find the authors who have never had their 
-- books borrowed.

SELECT author_id FROM Books 
WHERE author_id NOT IN (SELECT DISTINCT book_id FROM BookLoans);

-- 23. Question: List all books and whether they have 
-- been borrowed (yes/no).

SELECT book_id, 
	CASE WHEN book_id IN (SELECT DISTINCT book_id FROM BookLoans) 
    THEN 'yes' 
    ELSE 'no' END AS borrowed FROM Books;

-- 24. Question: Find the authors with the average 
-- loan duration for their books.

SELECT 
	author_id, 
    AVG(DATEDIFF(return_date, loan_date)) AS avg_loan_duration 
FROM BookLoans 
GROUP BY author_id;

-- 25. Question: List the genres with the shortest and longest 
-- average loan duration.

SELECT 
	genre_id, 
    AVG(DATEDIFF(return_date, loan_date)) AS avg_loan_duration 
FROM BookLoans 
GROUP BY genre_id 
ORDER BY avg_loan_duration ASC LIMIT 1;

SELECT 
	genre_id, 
    AVG(DATEDIFF(return_date, loan_date)) AS avg_loan_duration 
FROM BookLoans 
GROUP BY genre_id 
ORDER BY avg_loan_duration DESC LIMIT 1;
