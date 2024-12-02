USE fast_food_BD
/*1 Listar todos los productos y sus categor�as
Pregunta: �C�mo puedo obtener una lista de todos los productos junto con sus categor�as?*/
--La siguiente consulta muestra una lista de todos los productos junto con su categoria con ayuda de JOIN
SELECT p.producto,c.categoria
FROM productos AS p JOIN categorias AS c ON p.categoria_id=c.categoria_id

/*2 Obtener empleados y su sucursal asignada
Pregunta: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?*/
--La siguiente consulta muestra cada empleado con la sucursal a la que pertenece
SELECT e.nombre_emp,s.sucursal
FROM empleados AS e JOIN sucursales AS s ON e.sucursal_id=s.sucursal_id

/*3 Identificar productos sin categor�a asignada
Pregunta: �Existen productos que no tienen una categor�a asignada?*/
--Con la siguiente consulta se evidencia que todos los productos tienen una categoria asignada gracias a LEFT JOIN
SELECT p.producto,c.categoria
FROM productos AS p LEFT JOIN categorias AS c ON p.categoria_id=c.categoria_id

/*4 Detalle completo de �rdenes
Pregunta: �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente, 
Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?*/
--La siguiente muestra Cada orden ID con la informacion del empleado, del cliente y el mensajero correspondiente

SELECT o.orden_id,c.cliente,e.nombre_emp,m.mensajero
FROM ordenes AS o JOIN clientes AS c ON o.cliente_id=c.cliente_id
				  JOIN empleados AS e ON o.empleado_id=e.empleado_id
				  JOIN mensajeros AS m ON o.mensajero_id=m.mensajero_id

/*5 Productos vendidos por sucursal
Pregunta: �Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?*/
--La siguiente consulta muestra el total de productos por categoria vendidos por sucursal
SELECT s.sucursal,c.categoria,SUM(do.cantidad) AS [TOTAL PRODUCTOS]
FROM ordenes AS o JOIN detalle_orden AS do ON o.orden_id=do.orden_id
	 JOIN productos AS p ON do.producto_id=p.producto_id
	 JOIN categorias AS c ON p.categoria_id=c.categoria_id
	 JOIN sucursales AS s ON o.sucursal_id=s.sucursal_id
GROUP BY s.sucursal, c.categoria
