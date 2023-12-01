-- Realizado por NICOLÁS DÍAZ, JUAN CRUZ FILIPPINI Y MAURO PUEBLA
/*Where
Mostrar el nombre, altura y peso de los Pokémon cuya altura sea menor a 0.5.
Tablas: pokemon
Campos: nombre, peso, altura
*/
SELECT nombre pokemon, peso peso_pokemon, altura altura_pokemon FROM pokemon WHERE altura<0.5;
/*
Mostrar los nombres, descripciones, potencia y precisión de los movimientos cuya potencia esté entre 70 y 100, la precisión sea mayor a 80.
Tablas: movimiento
Campos: nombre, descripcion, potencia, precision_mov
*/
SELECT nombre pokemon, descripcion descripcion_pokemon, potencia potencia_poke, precision_mov precision_movimineto 
FROM movimiento WHERE potencia BETWEEN 70 and 100 AND  precision_mov>80;
/*
Operadores & joins
Mostrar los nombres y potencia de los movimientos que tienen una potencia entre 50 y 80, junto con el nombre del tipo al que pertenecen.
Tablas: movimiento, tipo
Campos: m.nombre, t.nombre, potencia
*/
SELECT movimiento.nombre Nombre_movimiento, tipo.nombre Nombre_tipo, movimiento.potencia Potencia_movimiento 
FROM movimiento 
JOIN tipo ON tipo.id_tipo = movimiento.id_tipo 
WHERE potencia  BETWEEN 50 AND 80;
/*
Mostrar los nombre, potencia y tipo de los movimientos que tienen un tipo de ataque "Físico" y una precisión mayor a 85.
Tablas: tipo, tipo_ataque, movimiento
Campos: m.nombre, m.potencia, m.precision_mov, ta.tipo
*/
SELECT ta.tipo Tipo_Ataque, m.nombre Movimiento, m.potencia Potencia 
FROM tipo t 
INNER JOIN tipo_ataque ta ON ta.id_tipo_ataque= t.id_tipo
INNER JOIN movimiento m ON m.id_tipo = t.id_tipo
WHERE ta.tipo LIKE "Físico" AND precision_mov >85 ;

/*Order by
Mostrar los nombres y números de Pokédex de los Pokémon en orden descendente según su número de Pokédex.
Tablas: pokemon
Campos: numero_pokedex, nombre
*/
SELECT nombre AS nombre_pokemon, numero_pokedex AS numeros_de_pokemones
FROM pokemon
ORDER BY numeros_de_pokemones DESC;

/*Mostrar numero de pokedex, nombre y altura de los Pokémon de tipo "Roca", ordenados por altura de forma ascendente.
Tablas: pokemon, pokemon_tipo, tipo
Campos: numero_pokedex, nombre, altura
*/
SELECT np.numero_pokedex AS numeros_de_pokemones, p.nombre AS nombre_de_pokemones, p.altura AS altura_de_pokemones
FROM pokemon p
INNER JOIN pokemon_tipo np ON np.numero_pokedex=p.numero_pokedex
INNER JOIN tipo t ON t.id_tipo=np.id_tipo
WHERE t.nombre LIKE "Roca"
ORDER BY p.altura ASC;

/*Funciones de agregación
¿Cuántos Pokémon tienen una defensa superior a 100?
	Tablas: estadisticas_base
Campos: defensa
*/
SELECT COUNT(defensa) cantidad_defensa_mayor_100 FROM estadisticas_base WHERE defensa>100;

/*¿Cuál es la potencia promedio de todos los movimientos en la base de datos? ¿Cuáles son los valores máximos y mínimos de la potencia?
Tablas: movimiento
Campos: potencia
*/
SELECT AVG(potencia) promedio_potencia_mov, MAX(potencia) mayor_potencia_mov, MIN(potencia) menor_potencia_mov FROM movimiento;

/*
Group by
Muestra los nombres de los tipos de Pokémon junto con la velocidad promedio de los Pokémon de cada tipo.
Tablas: estadisticas_base, pokemon_tipo, tipo
Campos: t.nombre, eb.velocidad
*/
SELECT t.nombre tipo_movimiento, AVG(eb.velocidad) velocidad_promedio FROM estadisticas_base eb INNER JOIN pokemon_tipo pt ON eb.numero_pokedex=pt.numero_pokedex 
INNER JOIN tipo t ON t.id_tipo=pt.id_tipo
GROUP BY t.nombre;

/*Muestra los nombres de los tipos de Pokémon junto con la potencia máxima de movimientos de cualquier tipo que tienen una potencia superior a 80.
Tablas: movimiento, tipo
Campos: t.nombre, m.potencia
*/
SELECT t.nombre tipo_movimiento, MAX(potencia) potencia_maxima_tipo_mov FROM movimiento m INNER JOIN tipo t ON m.id_tipo=t.id_tipo
WHERE potencia>80 GROUP BY t.nombre;

/*Having
Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen una precisión promedio mayor a 80 en sus movimientos.
Tablas: tipo, pokemon_tipo, movimiento
Campos: t.nombre, m.precision_mov
*/
SELECT t.nombre nombre_de_pokemones, COUNT(pt.numero_pokedex) cantidad_de_pokemones
FROM tipo t
INNER JOIN pokemon_tipo pt ON pt.id_tipo=t.id_tipo
INNER JOIN movimiento mv ON mv.id_tipo=t.id_tipo
GROUP BY t.nombre
HAVING AVG(mv.precision_mov)>80;

/*Muestra los nombres de los Pokémon que tienen un promedio de ataque superior a 70 y más de un tipo.
Tablas: pokemon, pokemon_tipo, estadisticas_base
Campos: p.nombre, eb.ataque, pt.id_tipo
*/
SELECT p.nombre,AVG(eb.ataque) AS promedio
FROM pokemon p
INNER JOIN pokemon_tipo tp ON  tp.numero_pokedex=p.numero_pokedex
INNER JOIN estadisticas_base eb ON eb.numero_pokedex=p.numero_pokedex
GROUP BY p.nombre
HAVING AVG(eb.ataque)>70 AND COUNT(tp.id_tipo)>1;

/*Registros
Muestra el nombre de cada Pokémon junto con su tipo y velocidad base. Ordena los resultados por el nombre del Pokémon en orden descendente.
	Tablas: pokemon, estadisticas_base, pokemon_tipo, tipo
Campos: p.nombre, t.nombre, eb.velocidad
*/
SELECT p.nombre pokemon, t.nombre tipo_pokemon, eb.velocidad velocidad_base FROM pokemon p
INNER JOIN estadisticas_base eb ON p.numero_pokedex=eb.numero_pokedex
INNER JOIN pokemon_tipo pt ON pt.numero_pokedex=p.numero_pokedex INNER JOIN tipo t ON t.id_tipo=pt.id_tipo
ORDER BY p.nombre DESC;

/*Muestra los nombres de los tipos de Pokémon junto con la cantidad de Pokémon de cada tipo que tienen una velocidad promedio superior a 60 y una precisión promedio mayor a 85 en sus movimientos.
	Tablas: movimiento, tipo_ataque, pokemon_tipo, tipo, estadisticas_base, pokemon 
Campos: t.nombre
*/

SELECT t.nombre tipo_pokemon, COUNT(pt.numero_pokedex) cantidad_pokemon FROM pokemon p
INNER JOIN estadisticas_base eb ON p.numero_pokedex=eb.numero_pokedex
INNER JOIN pokemon_tipo pt ON pt.numero_pokedex=p.numero_pokedex INNER JOIN tipo t ON t.id_tipo=pt.id_tipo
INNER JOIN tipo_ataque ta ON ta.id_tipo_ataque=t.id_tipo_ataque INNER JOIN movimiento m ON m.id_tipo=t.id_tipo
GROUP BY t.nombre 
HAVING AVG(eb.velocidad)>60 AND AVG(m.precision_mov)>85; 


/*Muestra los nombres de los movimientos de tipo "Fuego" junto con los nombres de los Pokémon que pueden aprenderlos y el promedio de su altura. Solo incluye los movimientos con una potencia promedio mayor a 50.
		Tablas: movimiento, tipo_ataque, pokemon_tipo, tipo, pokemon
Campos: m.nombre, p.nombre, p.altura
*/

SELECT m.nombre movimiento ,p.nombre pokemon, p.altura altura
FROM pokemon p
INNER JOIN pokemon_tipo pt ON pt.numero_pokedex=p.numero_pokedex 
INNER JOIN tipo t ON t.id_tipo=pt.id_tipo
INNER JOIN tipo_ataque ta ON ta.id_tipo_ataque=t.id_tipo_ataque
INNER JOIN movimiento m ON m.id_tipo=t.id_tipo
WHERE t.nombre LIKE "Fuego" AND m.potencia>50;
