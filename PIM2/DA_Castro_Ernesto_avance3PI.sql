USE fast_food_BD
/*1. Total de ventas globales

Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?*/
--La Consulta siguiente devuelve el Total de ventas haciendo la suma de todos los registros de total_compra
SELECT SUM(total_compra) AS TOTAL_VENTAS
FROM ordenes;


/*2. Promedio de precios de productos por categoría

Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?*/
--La siguiente consulta muestra el precio promedio por cada categoria
SELECT AVG(precio) AS AVG_PRECIO, categoria_id AS CATEGORIA
FROM productos
GROUP BY categoria_id;

/* 3. Orden mínima y máxima por sucursal

Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?*/
--La siguiente consulta muestra la compra total maxima y minima para cada sucursal
SELECT MIN(total_compra) AS ORDEN_MIN,MAX(total_compra) AS ORDEN_MAX,sucursal_id AS SUCURSAL
FROM ordenes
GROUP BY sucursal_id;

/* 4. Mayor número de kilómetros recorridos para entrega
Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?*/
--La siguiente consulta muestra el mayor kilometraje recorrido para una entrega
SELECT MAX(kilometros_recorrer) AS MAX_KM
FROM ordenes

/* 5. Promedio de cantidad de productos por orden
Pregunta: ¿Cuál es la cantidad promedio de productos por orden?*/
--La siguiente consulta muestra el promedio de productos por orden
SELECT AVG(cantidad) AS AVG_PRODUCTOS_ORDEN, orden_id AS ORDEN
FROM detalle_orden
GROUP BY orden_id;

/*6. Total de ventas por tipo de pago
Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?*/
--La siguiente consulta retorna la venta total por tipo de pago
SELECT SUM(total_compra) AS TOTAL_VENTA, pago_id AS TIPO_PAGO
FROM ordenes
GROUP BY pago_id;

/* 7. Sucursal con la venta promedio más alta
Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?*/
--La siguiente consulta muestra la sucursal con el promedio de venta mas alta
SELECT TOP 1 AVG(total_compra) AS TOTAL_VENTA, sucursal_id AS SUCURSAL
FROM ordenes
GROUP BY sucursal_id
ORDER BY TOTAL_VENTA DESC

/* 8. Sucursal con la mayor cantidad de ventas por encima de un umbral
Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?*/
--La siguiente consulta muestra las sucursales con ventas totales por encima de 1000
SELECT SUM(total_compra) AS TOTAL_VENTA, sucursal_id AS SUCURSAL
FROM ordenes
GROUP BY sucursal_id
HAVING SUM(total_compra)>1000
ORDER BY TOTAL_VENTA DESC

/* 9. Comparación de ventas promedio antes y después de una fecha específica
Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?*/
--La siguiente consulta permite obtener los promedios de venta total antes y despues de 01-07-2023
SELECT 
	CASE
		WHEN fecha_orden_tomada <'2023-07-01' THEN 'Antes de Julio 01'
		ELSE 'Despues de Julio 01'
	END AS PERIODO,	AVG(total_compra) AS AVG_TOTAL_VENTA

FROM ordenes
GROUP BY 
	CASE
		WHEN fecha_orden_tomada <'2023-07-01' THEN 'Antes de Julio 01'
		ELSE 'Despues de Julio 01'
		END;

/* 10. Análisis de actividad de ventas por horario
Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas,
y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/
--La siguiente consulta entrega las cantidades de ventas, las ventas preomedio y la venta maxima por horario
SELECT horario_venta AS HORARIO, COUNT(orden_id) AS No_VENTAS,MAX(total_compra) AS MAX_VENTA, AVG(total_compra) AS AVG_TOTAL_VENTA
FROM ordenes
GROUP BY horario_venta
ORDER BY MAX_VENTA DESC