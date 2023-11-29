/*Mostrar el nombre, peso y altura de los pokémon cuyo peso sea mayor a 150.
Tablas: pokemon
Campos: nombre, peso, altura
*/
SELECT nombre, peso, altura FROM pokemon WHERE peso>150;

/*Muestra los nombres y potencias de los movimientos que tienen una precisión mayor 90.
Tablas: movimiento, tipo
Campos: m.nombre, t.nombre, potencia
*/
SELECT m.nombre AS movimiento, t.nombre AS tipo, potencia FROM movimiento m INNER JOIN tipo t ON m.id_tipo=t.id_tipo WHERE m.precision_mov>90;
/*Mostrar tipo, nombre y potencia de los movimientos que tienen una potencia mayor igual que 120.
Tablas: movimiento, tipo
Campos: m.nombre, t.nombre, potencia
*/
SELECT m.nombre AS movimiento, t.nombre AS tipo ,  potencia FROM movimiento m INNER JOIN tipo t ON m.id_tipo=t.id_tipo WHERE m.potencia>=120;
/*Muestra los nombres de los tipos de Pokémon junto con sus tipos de ataque correspondientes de aquellos cuya potencia sea igual a 0.
Tablas: tipo, tipo_ataque, movimiento
Campos: t.nombre ta.tipo m.potencia
*/
SELECT t.nombre AS tipo_pokemon, t_a.tipo AS tipo_ataque, m.potencia AS potencia
FROM  tipo t 
INNER JOIN tipo_ataque t_a ON t.id_tipo_ataque = t_a.id_tipo_ataque 
INNER JOIN movimiento m ON m.id_tipo=t.id_tipo 
WHERE m.potencia=0;
/*Muestra los nombres y números de Pokédex de los primeros 10 Pokémon en orden alfabético.
Tablas: pokemon
Campos: numero_pokedex, nombre
*/
SELECT nombre,numero_pokedex FROM pokemon ORDER BY nombre LIMIT 10;
/*Muestra los nombres y alturas de los Pokémon de tipo "Eléctrico", ordenados por altura de forma descendente.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, altura
*/
SELECT p.nombre AS nombre_pokemon, p.altura AS altura_pokemon FROM pokemon p 
INNER JOIN pokemon_tipo pt ON pt.numero_pokedex=p.numero_pokedex INNER JOIN tipo t ON t.id_tipo=pt.id_tipo
WHERE t.nombre LIKE "%Electrico%" ORDER BY p.nombre DESC;
/*¿Cuál es la suma total de los valores de "Defensa" en todas las estadísticas base?
Tablas: estadisticas_base
Campos: defensa
*/
SELECT SUM(defensa) AS total_defensa FROM estadisticas_base;
/*¿Cuántos Pokémon tienen el tipo "Fuego"?
	Tablas: pokemon_tipo, tipo
Campos: *
*/
SELECT COUNT(*) AS total_tipo_fuego FROM pokemon_tipo pt INNER JOIN tipo t ON pt.id_tipo=t.id_tipo
WHERE t.nombre LIKE "Fuego";

/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo.
Tablas: pokemon_tipo, tipo
Campos: nombre, numero_pokedex
*/
SELECT t.nombre ,COUNT(pt.numero_pokedex) FROM pokemon_tipo pt INNER JOIN tipo t ON pt.id_tipo=t.id_tipo
GROUP BY t.nombre;
/*Muestra los nombres de los tipos de Pokémon junto con el promedio de peso de los Pokémon de cada tipo. Ordena los resultados de manera descendente según el promedio de peso.
Tablas: pokemon, pokemon_tipo, tipo
Campos: t.nombre, p.peso
*/
SELECT t.nombre AS tipo_pokemon, AVG(p.peso) AS promedio_peso FROM pokemon p 
INNER JOIN pokemon_tipo pt ON p.numero_pokedex= pt.numero_pokedex 
INNER JOIN tipo t ON t.id_tipo=pt.id_tipo
GROUP BY t.nombre ORDER BY promedio_peso DESC;
/*Muestra los nombres de los Pokémon que tienen más de un tipo.
Tablas: pokemon, pokemon_tipo
Campos: nombre
*/
SELECT p.nombre AS pokemon FROM pokemon p 
INNER JOIN pokemon_tipo pt ON pt.numero_pokedex = p.numero_pokedex
GROUP BY p.nombre
having COUNT(pt.id_tipo) >1;

/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen un peso promedio mayor a 10.
Tablas: pokemon, pokemon_tipo, tipo
Campos: nombre, numero_pokedex
*/

/*Muestra los nombres de los movimientos de tipo de ataque "Especial" con una potencia superior a 10 y una descripción que contenga al menos 20 palabras.
Tablas: movimiento, tipo_ataque
Campos: nombre, potencia, tipo, descripcion
*/
/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen una velocidad promedio superior a 80. Solo incluye tipos que tienen al menos 3 Pokémon con esas características.
	Tablas: tipo, pokemon_tipo, estadisticas_base
Campos: t.nombre, *
*/
/*Muestra el nombre de cada Pokémon junto con su tipo, velocidad base y puntos de salud (PS) base. Ordena los resultados por la velocidad base de forma descendente.
	Tablas: pokemon, estadisticas_base, pokemon_tipo, tipo
Campos: p.nombre, t.nombre, eb.velocidad, eb.ps
*/
/*Muestra los nombres de los movimientos de tipo "Agua" junto con los nombres de los Pokémon que pueden aprenderlos y el peso promedio de estos Pokémon.
	Tablas: movimiento, tipo_ataque, pokemon_tipo, tipo, pokemon
Campos: m.nombre, p.nombre, peso
*/