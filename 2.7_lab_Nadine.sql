-- 2.7 LAB - Nadine (use sakila)

-- Task 1: How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT fc.category_id, sum(f.film_id)  FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
GROUP BY fc.category_id
ORDER BY fc.category_id ASC;

-- Task 2: Display the total amount rung up by each staff member in August of 2005.
SELECT SUM(p.amount), s.first_name, p.payment_date
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY  s.staff_id
ORDER BY s.staff_id ASC;
-- Answer: Mike = 11853,65 and Jon = 12218,48

-- Task 3: Which actor has appeared in the most films?
SELECT COUNT(fa.film_id), a.first_name, a.last_name
FROM sakila.film_actor fa
JOIN sakila.actor a
ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY COUNT(fa.film_id) DESC;
-- Answer: Susan Davis

-- Task 4: Most active customer (the customer that has rented the most number of films)
SELECT cu.customer_id, cu.first_name, cu.last_name, COUNT(re.rental_id)
FROM sakila.customer cu
JOIN sakila.rental re
ON cu.customer_id = re.customer_id
GROUP BY cu.customer_id
ORDER BY COUNT(re.rental_id) DESC;
-- Answer: Most active customer: Eleanor Hunt (46 rentals)

-- Task 5: Display the first and last names, as well as the address, of each staff member.
SELECT * FROM sakila.address;
SELECT st.staff_id, st.first_name, st.last_name, ad.address 
FROM sakila.staff st
JOIN sakila.address ad
ON st.address_id = ad.address_id
GROUP BY st.staff_id;
-- Answer: As I could not find another address column specified for staff, I had to use the general address table and the address column in there.

-- Task 6: List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(fa.actor_id)
FROM sakila.film_actor fa
JOIN sakila.film f
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY COUNT(fa.actor_id) DESC;

-- Task 7: Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, SUM(p.amount)
FROM sakila.payment p
JOIN sakila.customer c
ON c.customer_id = p.customer_id
GROUP BY c.last_name
ORDER BY c.last_name ASC;

-- Task 8: List number of films per category (same as task1)
SELECT fc.category_id, sum(f.film_id)  FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
GROUP BY fc.category_id
ORDER BY fc.category_id ASC;