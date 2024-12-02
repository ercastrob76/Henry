USE fast_food_BD

/*1 Eficiencia de los mensajeros: ¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos
gestionados por todo el equipo de mensajería?*/
SELECT AVG(DATEDIFF(MINUTE,fecha_despacho,fecha_entrega))
FROM ordenes

/*2 Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos?*/
SELECT oo.descripcion AS ORIGEN, SUM(o.total_compra) AS [TOTAL VENTA]
FROM ordenes AS o JOIN origenes_orden AS oo ON o.origen_id=oo.origen_id
GROUP BY oo.descripcion
ORDER BY SUM(o.total_compra) DESC
	
/*3 Productividad de los Empleados: ¿Cuál es el nivel de ingreso generado por Empleado?*/
SELECT e.nombre_emp AS Empleado, SUM(o.total_compra) AS [TOTAL VENTA]
FROM ordenes AS o JOIN empleados AS e ON e.empleado_id=o.empleado_id
GROUP BY e.nombre_emp
ORDER BY SUM(o.total_compra) DESC

/*4 Análisis de Demanda por Horario y Día: ¿Cómo varía la demanda de productos a lo largo del día?
	NOTA: Esta consulta no puede ser implementada sin una definición clara del horario (mañana, tarde, noche) 
	en la base de datos existente. Asumiremos que HorarioVenta refleja esta información correctamente.*/
	--DEbido a que solo hay una orden en la base de datos y esta se realizo en la manana solo aparecen productos 
	--comprados en la manana
SELECT o.horario_venta AS [Horario Venta], SUM(do.cantidad) AS [TOTAL PRODUCTOS]
FROM ordenes AS o JOIN detalle_orden AS do ON o.orden_id=do.orden_id
GROUP BY o.horario_venta
ORDER BY SUM(do.cantidad) DESC

/*5 Comparación de Ventas Mensuales: ¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?*/
SELECT DATENAME(month,fecha_entrega) AS MES,SUM(total_compra) AS [TOTAL VENTA]
FROM ordenes
GROUP BY DATENAME(month,fecha_entrega)
ORDER BY [TOTAL VENTA] DESC

/*Análisis de Fidelidad del Cliente: ¿Qué porcentaje de clientes son recurrentes versus nuevos clientes cada mes? 
NOTA: La consulta se enfocaría en la frecuencia de órdenes por cliente para inferir la fidelidad.*/
SELECT c.cliente,DATENAME(month,o.fecha_entrega),COUNT(o.cliente_id) AS [FRECUENCIA CLIENTE]
FROM ordenes AS o JOIN clientes AS c ON o.cliente_id=c.cliente_id
GROUP BY c.cliente,DATENAME(month,o.fecha_entrega)
ORDER BY [FRECUENCIA CLIENTE] DESC

/*A continuacion se muestran las inserciones realizadas a las tablas detalle_orden y ordenes*/

INSERT INTO detalle_orden (orden_id, producto_id, cantidad, precio) VALUES
(2,1,2,23.44),
(2,2,1,45.14),
(2,3,3,46.37),
(3,1,3,23.44),
(3,2,2,45.14),
(3,3,1,46.37),
(3,4,2,42.34),
(4,3,1,46.37),
(4,5,2,18.25),
(4,6,2,20.08);

INSERT INTO ordenes (cliente_id, empleado_id, sucursal_id, mensajero_id, pago_id, origen_id, horario_venta, total_compra, kilometros_recorrer, fecha_despacho, fecha_entrega, fecha_orden_tomada, fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-03-10 08:30:00', '2023-03-10 09:00:00', '2023-03-10 08:00:00', '2023-03-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-04-15 14:30:00', '2023-04-15 15:00:00', '2023-04-15 13:30:00', '2023-04-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-05-20 19:30:00', '2023-05-20 20:00:00', '2023-05-20 19:00:00', '2023-05-20 19:15:00');

INSERT INTO ordenes (cliente_id, empleado_id, sucursal_id, mensajero_id, pago_id, origen_id, horario_venta, total_compra, kilometros_recorrer, fecha_despacho, fecha_entrega, fecha_orden_tomada, fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-03-15 08:30:00', '2023-03-15 09:00:00', '2023-03-15 08:00:00', '2023-03-15 08:15:00');
