#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, film.length, RANK() OVER (ORDER BY LENGTH DESC) AS "RANK" 
FROM FILM
WHERE TITLE IS NOT NULL;

#Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
SELECT TITLE, FILM.LENGTH, RATING, RANK() OVER (PARTITION BY RATING ORDER BY LENGTH DESC) AS "RANK"
FROM FILM 
WHERE TITLE IS NOT NULL;


#How many films are there for each of the categories in the category table. Use appropriate join to write this query
select * from film_category;
SELECT D.name, count(C.film_id) as num_film
FROM category AS D
JOIN film_category AS C
ON D.category_id = C.category_id
group by D.name;

#Which actor has appeared in the most films?
SELECT D.first_name,D.last_name, count(C.film_id) as num_film
FROM actor AS D
JOIN film_actor AS C
ON D.actor_id = C.actor_id
group by D.first_name, D.last_name
order by num_film desc
limit 1;

#Most active customer (the customer that has rented the most number of films)
SELECT D.first_name, D.last_name, count(C.rental_id) as num_rental
FROM customer AS D
JOIN rental AS C
ON D.customer_id = C.customer_id
group by D.first_name, D.last_name
order by num_rental desc
limit 1;