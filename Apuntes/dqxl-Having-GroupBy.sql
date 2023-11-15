#Funciones de agregación
# COUNT funcion que cuenta la cantidad de registros
SELECT COUNT(*) AS cantidad_peiculas FROM movies;
# AVG (average) promedio de toda columna deben ser datos numéricos, 
SELECT  AVG(rating), COUNT(*) FROM movies WHERE awards >5;
# SUM (suma) suma todos los registros de una columna con datos numericos
SELECT SUM(awards) AS total_premios, COUNT(*) AS cantidad_peliculas FROM movies WHERE genre_id =3;
# MIN y MAXvalor minimo de una columna
SELECT MIN(length) AS duracion_minima, MAX(length) AS duracion_maxima FROM movies;
#-----------------------------------------------------------------------------
#Funciones de agrupación
# GOUP BY agrupar registros (DQXL a partir de aca) 
SELECT genre_id AS genero, COUNT(*) AS cantidad_peliculas, SUM(awards) AS total_premio, AVG(length) AS promedio_duracion
FROM movies
GROUP BY genre_id; 
# HAVING  condicion de grupo(parecido a where) pero permite implementación de alias y funciones de agregación
SELECT genre_id, COUNT(*) AS cantidad_peliculas FROM movies GROUP BY genre_id HAVING cantidad_peliculas>=3;
