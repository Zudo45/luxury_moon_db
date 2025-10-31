-- ===========================================================
-- Archivo: 02_create_tables.sql
-- Proyecto: Sistema de Gestión Restobar Luxury Moon
-- Descripción: Creación de las tablas principales del modelo
-- ===========================================================

USE luxury_moon_db;

-- ===========================================================
-- Tabla: categoria
-- ===========================================================
CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
  descripcion VARCHAR(200),
  estado ENUM('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Tabla: cliente
-- ===========================================================
CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  tipo_documento ENUM('DNI','CE','PASAPORTE','RUC') NOT NULL,
  numero_documento VARCHAR(20) NOT NULL UNIQUE,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  telefono VARCHAR(15) NOT NULL,
  direccion VARCHAR(200),
  fecha_nacimiento DATE,
  estado ENUM('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Tabla: empleado
-- ===========================================================
CREATE TABLE empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  codigo_empleado VARCHAR(10) NOT NULL UNIQUE,
  tipo_documento ENUM('DNI','CE','PASAPORTE') NOT NULL,
  numero_documento VARCHAR(20) NOT NULL UNIQUE,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  telefono VARCHAR(15) NOT NULL,
  fecha_contratacion DATE NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  estado ENUM('ACTIVO','INACTIVO','VACACIONES','LICENCIA') DEFAULT 'ACTIVO',
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Tabla: producto
-- ===========================================================
CREATE TABLE producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  codigo_producto VARCHAR(20) NOT NULL UNIQUE,
  nombre_producto VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio_unitario DECIMAL(10,2) NOT NULL,
  stock_actual INT DEFAULT 0,
  stock_minimo INT DEFAULT NULL,
  unidad_medida ENUM('UNIDAD','PORCION','LITRO','KILO') DEFAULT 'UNIDAD',
  estado ENUM('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  es_bebida TINYINT(1) DEFAULT 0,
  tiempo_preparacion INT,
  imagen_url VARCHAR(255),
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Tabla: mesa
-- ===========================================================
CREATE TABLE mesa (
  id_mesa INT AUTO_INCREMENT PRIMARY KEY,
  numero_mesa VARCHAR(10) NOT NULL UNIQUE,
  capacidad INT NOT NULL,
  ubicacion ENUM('TERRAZA','SALON_PRINCIPAL','VIP','BAR','EXTERIOR') NOT NULL,
  estado ENUM('DISPONIBLE','OCUPADA','RESERVADA','MANTENIMIENTO') DEFAULT 'DISPONIBLE',
  descripcion VARCHAR(200),
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================================
-- Tabla: pedido
-- ===========================================================
CREATE TABLE pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_empleado INT NOT NULL,
  codigo_pedido VARCHAR(15) NOT NULL UNIQUE,
  fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
  tipo_pedido ENUM('MESA','DELIVERY','PARA_LLEVAR') DEFAULT 'MESA',
  estado_pedido ENUM('PENDIENTE','EN_PREPARACION','LISTO','ENTREGADO','CANCELADO') DEFAULT 'PENDIENTE',
  subtotal DECIMAL(10,2),
  descuento DECIMAL(10,2) DEFAULT 0.00,
  igv DECIMAL(10,2),
  total DECIMAL(10,2),
  observaciones TEXT,
  fecha_modificacion DATETIME
);

-- ===========================================================
-- Tabla: detalle_pedido
-- ===========================================================
CREATE TABLE detalle_pedido (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  estado_detalle ENUM('PENDIENTE','EN_PREPARACION','LISTO','ENTREGADO','CANCELADO') DEFAULT 'PENDIENTE',
  observaciones VARCHAR(200)
);

-- ===========================================================
-- Tabla: venta
-- ===========================================================
CREATE TABLE venta (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NULL,
  id_empleado INT NOT NULL,
  codigo_venta VARCHAR(15) NOT NULL UNIQUE,
  fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
  metodo_pago ENUM('EFECTIVO','TARJETA','YAPE','PLIN','TRANSFERENCIA','MIXTO') NOT NULL,
  monto_pagado DECIMAL(10,2) NOT NULL,
  vuelto DECIMAL(10,2),
  estado_venta ENUM('PAGADO','PENDIENTE','ANULADO') DEFAULT 'PAGADO',
  observaciones TEXT
);

-- ===========================================================
-- Tabla: factura
-- ===========================================================
CREATE TABLE factura (
  id_factura INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  numero_factura VARCHAR(20) NOT NULL UNIQUE,
  serie_factura VARCHAR(10) NOT NULL,
  tipo_comprobante ENUM('BOLETA','FACTURA','TICKET') DEFAULT 'BOLETA',
  fecha_emision DATETIME DEFAULT CURRENT_TIMESTAMP,
  subtotal DECIMAL(10,2),
  igv DECIMAL(10,2),
  total DECIMAL(10,2),
  estado_factura ENUM('EMITIDA','ANULADA') DEFAULT 'EMITIDA',
  ruta_pdf VARCHAR(255)
);

-- ===========================================================
-- Tabla: reserva
-- ===========================================================
CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  codigo_reserva VARCHAR(15) NOT NULL UNIQUE,
  fecha_reserva DATE NOT NULL,
  hora_reserva TIME NOT NULL,
  numero_personas INT NOT NULL,
  estado_reserva ENUM('PENDIENTE','CONFIRMADA','CANCELADA','COMPLETADA','NO_ASISTIO') DEFAULT 'PENDIENTE',
  comentarios TEXT,
  fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  fecha_modificacion DATETIME
);

-- ===========================================================
-- Tabla: reserva_mesa
-- ===========================================================
CREATE TABLE reserva_mesa (
  id_reserva_mesa INT AUTO_INCREMENT PRIMARY KEY,
  id_reserva INT NOT NULL,
  id_mesa INT NOT NULL,
  fecha_asignacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY (id_reserva, id_mesa)
);

-- 02_create_tables.sql
SELECT '✅ Tablas creadas exitosamente' AS resultado;
