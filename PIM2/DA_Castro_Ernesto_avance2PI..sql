USE fast_food_BD
-- Insertar datos en Categorias
INSERT INTO categorias (categoria) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

Select * from categorias

-- Insertar datos en Productos
INSERT INTO productos (producto, categoria_id, precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada César', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

Select * from productos

-- Insertar datos en Sucursales
INSERT INTO sucursales (sucursal, direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

Select * from Sucursales

-- Insertar datos en Empleados
INSERT INTO empleados (nombre_emp, posicion, departamento, sucursal_id, rol) VALUES
('John Doe', 'Gerente', 'Administración', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafetería', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Logística', 1, 'Mensajero'), ('Lucas Miller', 'Atención al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia García', 'Encargado de Turno', 'Administración', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

Select * from empleados

-- Insertar datos en Clientes
INSERT INTO clientes (cliente, direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

Select * from clientes

-- Insertar datos en OrigenesOrden
INSERT INTO origenes_orden (descripcion) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');

Select * from origenes_orden

-- Insertar datos en TiposPago
INSERT INTO tipos_pago (descripcion) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');

Select * from tipos_pago

-- Insertar datos en Mensajeros
INSERT INTO mensajeros (mensajero, externo) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

Select * from mensajeros

-- Insertar datos en Ordenes
INSERT INTO ordenes (cliente_id, empleado_id, sucursal_id, mensajero_id, pago_id, origen_id, horario_venta, total_compra, kilometros_recorrer, fecha_despacho, fecha_entrega, fecha_orden_tomada, fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

Select * from Ordenes

-- Insertar datos en DetalleOrdenes
INSERT INTO detalle_orden (orden_id, producto_id, cantidad, precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

Select * from detalle_orden

--Para los ejemplos solicitados con UPDATE y DELETE se inserta un nuevo registro para no modificar los datos suministrados para poblar las tablas

--Se agrega elregistro del empleado Pablo Perez a la tbla empleados
INSERT INTO empleados (nombre_emp, posicion, departamento, sucursal_id, rol) VALUES
('Pablo Perez', 'Cocinero', 'Cocina', 3, 'Vendedor');

Select * FROM empleados;
--Se actualizan la posicion y el departamento del emplealdo Pablo Perez
UPDATE empleados SET posicion = 'Barista', departamento='Cafeteria' WHERE nombre_emp ='Pablo Perez' ;

Select * FROM empleados;
--Se borra el registro del empleado Pablo Perez de la tabla empleados
DELETE FROM empleados WHERE nombre_emp ='Pablo Perez';

Select * FROM empleados;

--Se adiciona un Cliente once a la tabla clientes
INSERT INTO clientes (cliente, direccion) VALUES
('Cliente once', '1020 K Street');

Select * FROM clientes;
--Se actualizan el campo cliente y la direccion del Cliente once
UPDATE clientes SET cliente='Cliente Once', direccion= '2050 H Street' WHERE cliente ='Cliente once' ;

Select * FROM clientes;
--Se borra el registro del Cliente Once de la tabla clientes
DELETE FROM clientes WHERE cliente ='Cliente Once';

Select * FROM clientes;

/*CONSULTAS SOLICITADAS
Registros únicos

Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes? */

--Al hacer la sigugiente consulta el resultado muestra 10 registros diferentes o unicos
SELECT DISTINCT *
FROM ordenes

/* Empleados por departamento

Pregunta: ¿Cuántos empleados existen en cada departamento?*/

--Con la siguiente consulta se puede ver cuantos empleados hay por cada departamento
SELECT COUNT(*) AS TOTAL_EMPLEADOS, departamento AS DEPARTAMENTO
FROM empleados
GROUP BY departamento;

/*Productos por categoría

Pregunta: ¿Cuántos productos hay por código de categoría?*/

--La siguiente consulta muestra cuantos productos hay por cada codigo de categoria
SELECT COUNT(*) AS TOTAL_PRODUCTOS, categoria_id AS CATEGORIA
FROM productos
GROUP BY categoria_id

/*Importación de clientes

Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?*/
--Con la siguiente consulta se obtiene el numero de registros importados a la tabla clientes

SELECT COUNT(*) as TOTAL_CLIENTES
FROM clientes

/*Análisis de desempeño de sucursales

Pregunta: ¿Cuáles son las sucursales con un promedio de Facturación/Ingresos superior a 1000.00 y que minimizan sus costos
en base al promedio de kilómetros recorridos de todas de sus entregas gestionadas? Para un mejor relevamiento, ordene el listado 
por el Promedio Km Recorridos.
La siguiente consulta permite listar las sucursales con ingresos superiores a 1000 y el kilometraje promedio
de cada una de la lista se puede ver que la sucursal Lago tiene el mayor ingreso y el menor kilometraje*/
SELECT sucursal_id AS SUCURSAL, AVG(total_compra) AS AVG_FACTURACION, AVG(kilometros_recorrer) AS AVG_KMS
FROM ordenes
GROUP BY sucursal_id
HAVING AVG(total_compra) > 1000
ORDER BY AVG_KMS ASC;



