/*
Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
Id de la factura
fecha de la factura
nombre de la empresa de correo
nombre del cliente
categoría del producto vendido
nombre del producto
precio unitario
cantidad
*/
SELECT f.FacturaID , f.FechaFactura,c.Compania empresa_correo, cl.Compania cliente, ca.CategoriaNombre categoriaProducto, p.ProductoNombre, fc.PrecioUnitario, fc.Cantidad
FROM Facturas f INNER JOIN Correos c ON c.CorreoID=f.EnvioVia
INNER JOIN Clientes cl ON cl.ClienteID=f.ClienteID
INNER JOIN FacturaDetalle fc ON fc.FacturaID=f.FacturaID
INNER JOIN Productos p ON p.ProductoID=fc.ProductoID
INNER JOIN Categorias ca ON ca.CategoriaID=p.CategoriaID;

#Listar todas las categorías junto con información de sus productos. Incluir todas las categorías aunque no tengan productos.
SELECT * FROM Categorias c LEFT JOIN Productos p ON p.CategoriaID=c.CategoriaID;
#Listar la información de contacto de los clientes que no hayan comprado nunca en emarket.
SELECT c.* FROM Facturas f RIGHT JOIN Clientes c ON c.ClienteID=f.ClienteID WHERE f.FacturaID IS NULL; 
/*Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y la información de contacto de su proveedor.
Tener en cuenta que puede haber productos para los cuales no se indicó quién es el proveedor.*/
SELECT p.ProductoNombre, c.CategoriaNombre AS Categoria, pr.Contacto FROM Productos p LEFT JOIN Proveedores pr ON p.ProveedorID=pr.ProveedorID
INNER JOIN Categorias c ON c.CategoriaID=p.CategoriaID;
#Para cada categoría listar el promedio del precio unitario de sus productos.
SELECT c.CategoriaNombre,AVG(fd.PrecioUnitario) promedio_pecio_unitario FROM Productos p RIGHT JOIN Categorias c ON c.CategoriaID=p.CategoriaID
INNER JOIN FacturaDetalle fd ON fd.ProductoID=p.ProductoID
GROUP BY c.CategoriaNombre;
#Para cada cliente, indicar la última factura de compra. Incluir a los clientes que nunca hayan comprado en e-market.
SELECT c.Compania, MAX(f.FechaFactura) FROM Clientes c LEFT JOIN Facturas f ON f.ClienteID=c.ClienteID GROUP BY c.Compania;
/*Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un listado con todas las empresas de correo, 
y la cantidad de facturas correspondientes. Realizar la consulta utilizando RIGHT JOIN.*/
SELECT c.Compania empresa_de_correo, COUNT(f.FacturaID) FROM Correos c  RIGHT JOIN Facturas f ON c.CorreoID=f.EnvioVia GROUP BY c.Compania;