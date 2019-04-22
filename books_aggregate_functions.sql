CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books
	(
		book_id INT NOT NULL IDENTITY(1,1),
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where I am Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
SELECT author_lname, COUNT(*) AS number_of_books FROM books GROUP BY author_lname;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;
SELECT MIN(pages) AS min_pages FROM books;
SELECT MAX(pages) AS max_pages FROM books;
SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books);
SELECT * FROM books WHERE pages = (SELECT Max(pages) FROM books);
SELECT * FROM books ORDER BY pages ASC offset 0 ROWS FETCH NEXT 1 ROWS only;
SELECT SUM(pages) FROM books;
SELECT author_lname, AVG(stock_quantity) AS average_quantity FROM books GROUP BY author_lname;

SELECT COUNT(*) AS number_of_books FROM books;
SELECT released_year , COUNT(*) AS number_of_released_books FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) AS total_number_of_books FROM books;
SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author_full_name, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year;