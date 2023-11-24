#Reportes parte 1:

/*Obtener el nombre y apellido de los primeros 5 actores disponibles.
Utilizar alias para mostrar los nombres de las columnas en español.*/

SELECT first_name Nombre, last_name Apellido FROM actor LIMIT 5; 
 
/*Obtener un listado que incluya nombre, apellido y correo electrónico de los clientes
(customers) inactivos. Utilizar alias para mostrar los nombres de las columnas en español.*/
SELECT first_name Nombre, last_name Apellido, email Mail FROM customer;
/*Obtener un listado de films incluyendo título, año y descripción de los films que tienen un 
rental_duration mayor a cinco. Ordenar por rental_duration de mayor a menor. Utilizar alias para
 mostrar los nombres de las columnas en español.*/
 SELECT title titulo_film, description descripcion, release_year año_lanzamiento FROM film
 WHERE rental_duration > 5 ORDER BY rental_duration DESC; 
 
/*Obtener un listado de alquileres (rentals) que se hicieron durante el mes de mayo de 2005, 
incluir en el resultado todas las columnas disponibles.*/
SELECT * 
FROM rental
WHERE EXTRACT(MONTH FROM rental_date) = 5 AND EXTRACT(YEAR FROM rental_date)=2005;
/*Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada cantidad.*/
SELECT COUNT(*) cantidad_total_alquileres FROM rental;

/*Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada total,
junto a una columna con la cantidad de alquileres con el alias Cantidad y una columna que indique el Importe promedio por alquiler.*/

/*Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuántos alquileres lo hacen?*/


/*Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan gastado
más de 150 dólares en alquileres.*/


/*Generar un reporte que muestre por mes de alquiler (rental_date de tabla rental), la cantidad de alquileres y 
la suma total pagada (amount de tabla payment) para el año de alquiler 2005 (rental_date de tabla rental)*/


/*Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? (columna inventory_id
en la tabla rental). Para cada una de ellas indicar la cantidad de alquileres.*/

