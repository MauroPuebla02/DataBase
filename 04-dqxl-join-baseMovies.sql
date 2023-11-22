#Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT series.title AS titulo, genres.name AS genero 
FROM genres  
INNER JOIN series ON series.genre_id=genre_id ;
#Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT episodes.title AS titulo_episodios, actors.first_name Nombre, actors.last_name Apellido 
FROM actors  
INNER JOIN actor_episode  ON actor_episode.actor_id=actors.id 
INNER JOIN episodes ON actor_episode.episode_id= episodes.id;
/* Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido)
que han trabajado en cualquier película de la saga de La Guerra de las galaxias. */
SELECT DISTINCT first_name Nombre , last_name Apellido
FROM actors a
INNER JOIN actor_movie am ON am.actor_id=a.id
INNER JOIN movies m ON am.movie_id=m.id
WHERE m.title LIKE "La Guerra de las galaxias%";
#Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT g.name Genero , COUNT(m.id) catidad_peliculas
FROM movies m
INNER JOIN genres g ON m.genre_id=g.id
GROUP BY Genero;