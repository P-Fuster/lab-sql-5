-- Lab | SQL Queries 5
-- 1. Drop column picture from staff.
alter table staff
drop column picture;
select * from staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff 
values (3, 'Tammy','Sanders', 79, 'Tammy.Sanders@sakilacustomer.org', 2, 1, 'Tammy', 'hola', '2006-02-15 04:57:20');
select * from staff; 

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select staff_id from staff
where first_name = 'Mike' and last_name = 'Hillyer';
select film_id from film
where title = "Academy Dinosaur";
select inventory_id from inventory
where film_id = 1 and store_id = 1;

insert into rental
values (16050, '2021-11-07 20:20:30', 3 , 130, '2021-11-07 20:20:30', 1, '2021-11-07 20:20:30');

-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
-- Check if there are any non-active users
-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer
create table deleted_users (
`customer_id` int unique not null,
`email` varchar(50) default null,
`date` timestamp);

select * from customer
where active = 0;

insert into deleted_users
values(510,	'BEN.EASTER@sakilacustomer.org', '2006-02-15 04:57:20'),
(534, 'CHRISTIAN.JUNG@sakilacustomer.org', '2006-02-15 04:57:20'),
(169, 'ERICA.MATTHEWS@sakilacustomer.org', '2006-02-15 04:57:20'),
(368, 'HARRY.ARCE@sakilacustomer.org', '2006-02-15 04:57:20'),
(241, 'HEIDI.LARSON@sakilacustomer.org','2006-02-15 04:57:20'),
(558, 'JIMMIE.EGGLESTON@sakilacustomer.org', '2006-02-15 04:57:20'),
(64, 'JUDITH.COX@sakilacustomer.org', '2006-02-15 04:57:20'),
(315, 'KENNETH.GOODEN@sakilacustomer.org', '2006-02-15 04:57:20'),
(482, 'MAURICE.CRAWLEY@sakilacustomer.org', '2006-02-15 04:57:20'),
(406, 'NATHAN.RUNYON@sakilacustomer.org', '2006-02-15 04:57:20'),
(271, 'PENNY.NEAL@sakilacustomer.org', '2006-02-15 04:57:20'),
(16, 'SANDRA.MARTIN@sakilacustomer.org', '2006-02-15 04:57:20'),
(124, 'SHEILA.WELLS@sakilacustomer.org', '2006-02-15 04:57:20'),
(592, 'TERRANCE.ROUSH@sakilacustomer.org', '2006-02-15 04:57:20'),
(446, 'THEODORE.CULP@sakilacustomer.org', '2006-02-15 04:57:20');

SET FOREIGN_KEY_CHECKS=0;

delete from customer where active = 0;

