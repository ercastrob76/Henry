--Creacion de la base de datos fast_food_BD
CREATE DATABASE fast_food_BD;
--Definir el uso de la base de datos fast_food
USE fast_food_BD

--Creacion de la tabla categorias
CREATE TABLE categorias (
    categoria_id INT IDENTITY(1,1) PRIMARY KEY,
    categoria NVARCHAR(100) NOT NULL,
);

--Creacion de la tabla productos
CREATE TABLE productos (
	producto_id INT IDENTITY(1,1) PRIMARY KEY,
	producto NVARCHAR(100) NOT NULL,
	categoria_id INT,
	precio MONEY,
	CONSTRAINT FK_productos_categorias FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);


--Creacion de la tabla sucursales
CREATE TABLE  sucursales (
	sucursal_id INT IDENTITY(1,1) PRIMARY KEY,
	sucursal NVARCHAR(100) NOT NULL,
	direccion  NVARCHAR(100)
);

--Creacion de la tabla empleados
CREATE TABLE empleados(
	empleado_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre_emp NVARCHAR(100) NOT NULL,
	posicion NVARCHAR(100) NOT NULL,
	departamento NVARCHAR(100) NOT NULL,
	sucursal_id INT,
	rol NVARCHAR(100) NOT NULL,
	CONSTRAINT FK_empleados_sucursales FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id)
);


--Creacion de la tabla clientes
CREATE TABLE clientes (
	cliente_id INT IDENTITY(1,1) PRIMARY KEY,
	cliente	NVARCHAR(100) NOT NULL,
	direccion	NVARCHAR(100) NOT NULL,
);


--Creacion de la tabla origenes
CREATE TABLE origenes_orden(
	origen_id INT IDENTITY(1,1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL,
);


--Creacion de la tabla pago
CREATE TABLE tipos_pago(
     pago_id INT IDENTITY(1,1) PRIMARY KEY,
     descripcion NVARCHAR(100) NOT NULL,
);

--Creacion de la tabla mensajeros
CREATE TABLE mensajeros (
	mensajero_id	INT IDENTITY(1,1) PRIMARY KEY,
	mensajero	NVARCHAR(100) NOT NULL,
	externo	BIT,
);


--Creacion de la tabla ordenes
CREATE TABLE ordenes (
	orden_id	INT IDENTITY(1,1) PRIMARY KEY,
	cliente_id INT,
	empleado_id	INT,
	sucursal_id	INT,
	mensajero_id INT,
	pago_id		INT,
	origen_id	INT,
	horario_venta	NVARCHAR(100) NOT NULL,
	total_compra	MONEY,
	kilometros_recorrer	INT,
	fecha_despacho	DATETIME,
	fecha_entrega	DATETIME,
	fecha_orden_tomada	DATETIME,
	fecha_orden_lista	DATETIME,
	
	CONSTRAINT FK_ordenes_clientes FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
	CONSTRAINT FK_ordenes_empleados FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
	CONSTRAINT FK_ordenes_sucursales FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id),
	CONSTRAINT FK_ordenes_origenes FOREIGN KEY (origen_id) REFERENCES origenes_orden(origen_id),
	CONSTRAINT FK_ordenes_pagos FOREIGN KEY (pago_id) REFERENCES tipos_pago(pago_id),
	CONSTRAINT FK_ordenes_mensajeros FOREIGN KEY (mensajero_id) REFERENCES mensajeros(mensajero_id),
);


--Creacion de tabla detalle_orden
CREATE TABLE detalle_orden (
	orden_id INT,
	producto_id INT,
	cantidad INT,
	precio MONEY,
	CONSTRAINT FK_detalle_ordenes FOREIGN KEY (orden_id) REFERENCES ordenes(orden_id),
	CONSTRAINT FK_detalle_producto FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
);

