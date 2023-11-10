/*Queremos tener un listado de todas las categorías.
Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
Obtener un listado de los productos.
¿Existen productos discontinuados? (Discontinuado = 1).
Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
8. Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
*/
SELECT CategoriaNombre,Descripcion FROM categorias;
SELECT ProductoNombre FROM productos;
SELECT Discontinuado FROM productos WHERE Discontinuado=1;
SELECT ProductoNombre FROM productos WHERE ProveedorID=8;
SELECT ProductoNombre FROM productos WHERE PrecioUnitario BETWEEN 10 AND 22;
SELECT * FROM productos WHERE UnidadesStock<NivelReorden;
SELECT * FROM productos WHERE UnidadesStock<NivelReorden AND UnidadesPedidas=0;
#--------------------------------------------------------------------------------------------------
/*
Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
Queremos conocer a todos los clientes que tengan un título “Owner”.
El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
*/
SELECT Contacto, Compania, Titulo, Pais  FROM clientes ORDER BY Pais;
SELECT * FROM Clientes WHERE Titulo="Owner";
SELECT * FROM Clientes WHERE Contacto LIKE ("C%");
#-------------------------------------------------------------------------------------------------
/*Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
¿El cliente 'GOURL' realizó algún pedido?
Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
*/
SELECT * FROM facturas ORDER BY FechaFactura;
SELECT * FROM facturas WHERE PaisEnvio="USA" AND EnvioVia!=3;
SELECT * FROM facturas WHERE ClienteID="GOURL";
#SELECT * FROM facturas WHERE EmpleadoID=2 OR EmpleadoID=3 OR EmpleadoID=5 OR EmpleadoID=8 OR EmpleadoID=9;
SELECT * FROM facturas WHERE EmpleadoID IN(2,3,5,8,9);#Igual al de arriba
#----------------------------------------------------------------------------------------------------------
/*Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
Obtener un top 10 de los productos con más unidades en stock.
*/
SELECT * FROM productos ORDER BY PrecioUnitario DESC;
SELECT * FROM productos ORDER BY PrecioUnitario DESC LIMIT 5;
SELECT * FROM productos ORDER BY UnidadesStock DESC LIMIT 10;
#----------------------------------------------------------------------------------------------------------
/*Obtener un listado de FacturaID, ProductoID, Cantidad.
Ordenar el listado anterior por cantidad descendentemente.
Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.
En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad)
*/
SELECT FacturaID,ProductoID,Cantidad FROM facturadetalle;
SELECT FacturaID,ProductoID,Cantidad FROM facturadetalle ORDER BY Cantidad DESC;
SELECT FacturaID,ProductoID,Cantidad FROM facturadetalle WHERE Cantidad BETWEEN 50 AND 100;
SELECT FacturaID,ProductoID,PrecioUnitario*Cantidad as Total FROM facturadetalle;
#----------------------------------------------------------------------------------------------------------
#Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. 
SELECT * FROM clientes WHERE 
#Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".

#Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".

#Obtener un listado de todas las facturas con ID entre 10000 y 10500

#Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.

#¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?

#¿Cuál es el ID de empleado de “Buchanan”?

#¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)

