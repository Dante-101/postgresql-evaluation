-- pagila

SELECT *
FROM actor;

SELECT *
FROM film;

SELECT *
FROM staff;

SELECT address, district
FROM address;

SELECT title, description
FROM film;

SELECT city, country_id
FROM city;

SELECT DISTINCT last_name
FROM customer;

SELECT DISTINCT first_name
FROM actor;

SELECT DISTINCT inventory_id
FROM rental;

SELECT COUNT(*)
FROM film;

SELECT COUNT(*)
FROM category;

SELECT COUNT(DISTINCT first_name)
FROM actor;

SELECT rental_id, return_date - rental_date
FROM rental;