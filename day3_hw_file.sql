--(1.) List all customers who live in Texas (use JOINs)
-- have to join customer and address tables
-- have to link through address_id 
select * from customer;
--
select * 
from address
where district = 'Texas';

-- joined the two tables
select customer.customer_id , first_name , last_name , district , address.address_id 
from customer
inner join address
on address .address_id  = customer .address_id 
where district = 'Texas';


--(2.) Get all payments above $6.99 with the Customer's Full Name
-- payment:amount > 6.99
select customer.customer_id , first_name , last_name , amount
from customer
inner join payment 
on payment .customer_id = customer .customer_id
where amount > 6.99;


--(3.) Show all customers names who have made payments over $175(use subqueries)
-- not how I wanted to display it but I'll try to not repeat names later
select first_name , last_name , amount
from (
	select distinct amount , first_name , last_name 
	from customer
	inner join payment 
	on customer.customer_id = payment.customer_id
	order by amount desc
) as stuff
where amount > 175;


--(4.) List all customers that live in Nepal (use the city table)
-- so rude, no customers live in Nepal
select first_name , last_name , city 
from customer 
inner join address 
on customer.address_id = address.address_id 
inner join city
on address.city_id = city.city_id 
where city = 'Nepal'

--(5.) Which staff member had the most transactions?
select staff_id , count(rental_id) 
from (
	select first_name , last_name , rental_id , rental.staff_id
	from staff
	inner join rental
	on staff.staff_id = rental.staff_id 
) as sub group by staff_id 

--(6.) How many movies of each rating are there?
select rating, count(rating) as movie_count
from film 
group by rating;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- I need help with this stuff, spent 4 hours just getting what I have done and no one is available for me in the evenings when I do my homework. 
-- My brain just doesn't want to get this stuff tonight I guess and it's really frustrating.


--(8.) How many free rentals did our stores give away?
select amount, count(amount)
from payment 
group by amount  
having count(amount) = 0;





