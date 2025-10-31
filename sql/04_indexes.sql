USE luxury_moon_db;

-- ==============================================
-- Tabla cliente
-- Búsquedas frecuentes por número de documento o apellido
-- ==============================================
CREATE INDEX idx_cliente_numero_documento ON cliente (numero_documento);
CREATE INDEX idx_cliente_apellidos ON cliente (apellidos);
CREATE INDEX idx_cliente_nombres ON cliente (nombres);

-- ==============================================
-- Tabla producto
-- Búsquedas por nombre o categoría
-- ==============================================
CREATE INDEX idx_producto_nombre ON producto (nombre_producto);
CREATE INDEX idx_producto_categoria ON producto (id_categoria);

-- ==============================================
-- Tabla pedido
-- Consultas por cliente y fecha
-- ==============================================
CREATE INDEX idx_pedido_cliente ON pedido (id_cliente);
CREATE INDEX idx_pedido_fecha ON pedido (fecha_pedido);

-- ==============================================
-- Tabla venta
-- Consultas por pedido y fecha de venta
-- ==============================================
CREATE INDEX idx_venta_pedido ON venta (id_pedido);
CREATE INDEX idx_venta_fecha ON venta (fecha_venta);

-- ==============================================
-- Tabla detalle_pedido
-- Relación rápida entre pedido y producto
-- ==============================================
CREATE INDEX idx_detalle_pedido_pedido ON detalle_pedido (id_pedido);
CREATE INDEX idx_detalle_pedido_producto ON detalle_pedido (id_producto);

-- ==============================================
-- Confirmación final
-- ==============================================
-- 04_indexes.sql
SELECT '✅ Índices creados exitosamente' AS resultado;
