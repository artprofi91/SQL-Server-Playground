CREATE TABLE customers(
	id INT IDENTITY (1,1) PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE orders(
	id INT IDENTITY (1,1) PRIMARY KEY,
	order_date DATE,
	amount DECIMAL (8,2),
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;
-- inner join
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders 
	ON customers.id = orders.customer_id;

--left join
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders 
	ON customers.id = orders.customer_id;

SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id; 


SELECT 
    first_name, 
    last_name,
    ISNULL(SUM(orders.amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id, first_name, last_name
ORDER BY total_spent;

SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;




CREATE TABLE students(
	id INT IDENTITY (1,1) PRIMARY KEY,
	first_name VARCHAR(100),
);

CREATE TABLE papers(
	title VARCHAR(100),
	grade INT,
	student_id INT,
	FOREIGN KEY(student_id) REFERENCES students(id)
	ON DELETE CASCADE
);
INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

SELECT first_name, title, grade FROM students
JOIN papers ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, ISNULL(title, 'Missing') AS title, ISNULL(grade, 0) AS grade FROM students
LEFT JOIN papers ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, AVG(ISNULL(grade, 0))AS grade, 
	CASE 
		WHEN AVG(ISNULL(grade, 0)) >= 75 THEN 'PASSING'
		ELSE 'FAILING'
	END AS passing_status 
FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY grade DESC;