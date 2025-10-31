-- ==============================================
-- Archivo: 06_views_procedures_corregido.sql
-- Descripción: Vistas y procedimientos almacenados
-- Proyecto: Restobar Luxury Moon
-- Versión: 2.0 Corregido
-- ==============================================

USE luxury_moon_db;

-- ==============================================
-- 📊 SECCIÓN 1: VISTAS DE CONSULTA
-- ==============================================

-- =====================================================
-- Vista 1: Catálogo completo de productos con categoría
-- =====================================================
CREATE OR REPLACE VIEW vw_catalogo_productos AS
SELECT 
    p.id_producto,
    p.nombre_producto AS producto,
    p.precio_unitario AS precio,
    c.id_categoria,
    c.nombre_categoria AS categoria,
    c.descripcion AS categoria_descripcion,
    CONCAT('S/ ', FORMAT(p.precio_unitario, 2)) AS precio_formateado,
    p.stock_actual,
    p.stock_minimo,
    p.estado
FROM producto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE p.estado = 'ACTIVO'
ORDER BY c.nombre_categoria, p.nombre_producto;

-- =====================================================
-- Vista 2: Pedidos con información completa
-- =====================================================
CREATE OR REPLACE VIEW vw_pedidos_detallados AS
SELECT 
    p.id_pedido,
    p.codigo_pedido,
    p.fecha_pedido,
    p.tipo_pedido,
    p.estado_pedido,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    c.numero_documento AS cliente_documento,
    c.telefono AS cliente_telefono,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    e.codigo_empleado,
    COUNT(dp.id_detalle) AS cantidad_items,
    COALESCE(p.subtotal, 0) AS subtotal,
    COALESCE(p.igv, 0) AS igv,
    COALESCE(p.total, 0) AS total,
    CONCAT('S/ ', FORMAT(COALESCE(p.total, 0), 2)) AS total_formateado
FROM pedido p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN empleado e ON p.id_empleado = e.id_empleado
LEFT JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
GROUP BY p.id_pedido, p.codigo_pedido, p.fecha_pedido, p.tipo_pedido, p.estado_pedido,
         c.nombres, c.apellidos, c.numero_documento, c.telefono, 
         e.nombres, e.apellidos, e.codigo_empleado, p.subtotal, p.igv, p.total;

-- =====================================================
-- Vista 3: Detalle expandido de pedidos
-- =====================================================
CREATE OR REPLACE VIEW vw_detalle_pedidos_expandido AS
SELECT 
    dp.id_detalle,
    dp.id_pedido,
    p.codigo_pedido,
    p.fecha_pedido,
    p.estado_pedido,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    pr.id_producto,
    pr.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    dp.cantidad,
    dp.precio_unitario,
    dp.subtotal,
    dp.estado_detalle,
    dp.observaciones,
    CONCAT(e.nombres, ' ', e.apellidos) AS atendido_por
FROM detalle_pedido dp
INNER JOIN pedido p ON dp.id_pedido = p.id_pedido
INNER JOIN producto pr ON dp.id_producto = pr.id_producto
INNER JOIN categoria cat ON pr.id_categoria = cat.id_categoria
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN empleado e ON p.id_empleado = e.id_empleado
ORDER BY dp.id_pedido DESC, dp.id_detalle;

-- =====================================================
-- Vista 4: Ventas con información de facturación
-- =====================================================
CREATE OR REPLACE VIEW vw_ventas_completas AS
SELECT 
    v.id_venta,
    v.codigo_venta,
    v.id_pedido,
    p.codigo_pedido,
    v.fecha_venta,
    v.monto_pagado,
    v.vuelto,
    v.metodo_pago,
    v.estado_venta,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    c.numero_documento AS cliente_documento,
    CONCAT(e_cajero.nombres, ' ', e_cajero.apellidos) AS empleado_venta,
    CONCAT(e_mesero.nombres, ' ', e_mesero.apellidos) AS mesero,
    f.id_factura,
    f.numero_factura,
    f.tipo_comprobante,
    f.fecha_emision AS fecha_factura,
    f.total AS monto_facturado,
    f.estado_factura,
    CASE 
        WHEN f.id_factura IS NOT NULL THEN 'Con Comprobante'
        ELSE 'Sin Comprobante'
    END AS estado_facturacion
FROM venta v
LEFT JOIN pedido p ON v.id_pedido = p.id_pedido
LEFT JOIN cliente c ON p.id_cliente = c.id_cliente
INNER JOIN empleado e_cajero ON v.id_empleado = e_cajero.id_empleado
LEFT JOIN empleado e_mesero ON p.id_empleado = e_mesero.id_empleado
LEFT JOIN factura f ON v.id_venta = f.id_venta
ORDER BY v.fecha_venta DESC;

-- =====================================================
-- Vista 5: Resumen de mesas y su estado actual
-- =====================================================
CREATE OR REPLACE VIEW vw_estado_mesas AS
SELECT 
    m.id_mesa,
    m.numero_mesa,
    m.capacidad,
    m.ubicacion,
    m.estado,
    m.descripcion,
    CASE 
        WHEN m.estado = 'DISPONIBLE' THEN '✓ Libre'
        WHEN m.estado = 'OCUPADA' THEN '● En uso'
        WHEN m.estado = 'RESERVADA' THEN '◆ Reservada'
        WHEN m.estado = 'MANTENIMIENTO' THEN '⚠ Mantenimiento'
        ELSE m.estado
    END AS estado_visual,
    r.id_reserva,
    r.codigo_reserva,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente_reserva,
    r.fecha_reserva,
    r.hora_reserva,
    r.estado_reserva
FROM mesa m
LEFT JOIN reserva_mesa rm ON m.id_mesa = rm.id_mesa
LEFT JOIN reserva r ON rm.id_reserva = r.id_reserva
LEFT JOIN cliente c ON r.id_cliente = c.id_cliente
ORDER BY m.numero_mesa;

-- =====================================================
-- Vista 6: Reservas activas con detalles
-- =====================================================
CREATE OR REPLACE VIEW vw_reservas_activas AS
SELECT 
    r.id_reserva,
    r.codigo_reserva,
    r.fecha_reserva,
    r.hora_reserva,
    r.numero_personas,
    r.estado_reserva,
    r.comentarios,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    c.telefono AS telefono_contacto,
    c.email AS email_contacto,
    GROUP_CONCAT(m.numero_mesa ORDER BY m.numero_mesa SEPARATOR ', ') AS mesas_asignadas,
    SUM(m.capacidad) AS capacidad_total,
    CONCAT(DATE_FORMAT(r.fecha_reserva, '%d/%m/%Y'), ' ', TIME_FORMAT(r.hora_reserva, '%H:%i')) AS fecha_hora_formateada
FROM reserva r
INNER JOIN cliente c ON r.id_cliente = c.id_cliente
LEFT JOIN reserva_mesa rm ON r.id_reserva = rm.id_reserva
LEFT JOIN mesa m ON rm.id_mesa = m.id_mesa
WHERE r.fecha_reserva >= CURDATE() 
  AND r.estado_reserva IN ('PENDIENTE', 'CONFIRMADA')
GROUP BY r.id_reserva, r.codigo_reserva, r.fecha_reserva, r.hora_reserva, 
         r.numero_personas, r.estado_reserva, r.comentarios,
         c.nombres, c.apellidos, c.telefono, c.email
ORDER BY r.fecha_reserva, r.hora_reserva;

-- =====================================================
-- Vista 7: Top productos más vendidos
-- =====================================================
CREATE OR REPLACE VIEW vw_productos_mas_vendidos AS
SELECT 
    pr.id_producto,
    pr.codigo_producto,
    pr.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    COUNT(dp.id_detalle) AS veces_pedido,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.subtotal) AS ingresos_generados,
    pr.precio_unitario AS precio_actual,
    CONCAT('S/ ', FORMAT(SUM(dp.subtotal), 2)) AS ingresos_formateados
FROM producto pr
INNER JOIN categoria cat ON pr.id_categoria = cat.id_categoria
INNER JOIN detalle_pedido dp ON pr.id_producto = dp.id_producto
INNER JOIN pedido p ON dp.id_pedido = p.id_pedido
WHERE p.estado_pedido = 'ENTREGADO'
GROUP BY pr.id_producto, pr.codigo_producto, pr.nombre_producto, 
         cat.nombre_categoria, pr.precio_unitario
ORDER BY unidades_vendidas DESC;

-- =====================================================
-- Vista 8: Rendimiento de empleados
-- =====================================================
CREATE OR REPLACE VIEW vw_rendimiento_empleados AS
SELECT 
    e.id_empleado,
    e.codigo_empleado,
    CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
    e.salario,
    e.estado,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos_atendidos,
    COUNT(DISTINCT v.id_venta) AS total_ventas,
    COALESCE(SUM(v.monto_pagado), 0) AS monto_total_vendido,
    COALESCE(AVG(v.monto_pagado), 0) AS ticket_promedio,
    CONCAT('S/ ', FORMAT(COALESCE(SUM(v.monto_pagado), 0), 2)) AS ventas_formateadas
FROM empleado e
LEFT JOIN pedido p ON e.id_empleado = p.id_empleado
LEFT JOIN venta v ON p.id_pedido = v.id_pedido AND v.estado_venta = 'PAGADO'
WHERE e.estado = 'ACTIVO'
GROUP BY e.id_empleado, e.codigo_empleado, e.nombres, e.apellidos, e.salario, e.estado
ORDER BY monto_total_vendido DESC;

-- =====================================================
-- Vista 9: Reporte de ventas diarias
-- =====================================================
CREATE OR REPLACE VIEW vw_reporte_ventas_diarias AS
SELECT 
    DATE(v.fecha_venta) AS fecha,
    DAYNAME(v.fecha_venta) AS dia_semana,
    COUNT(v.id_venta) AS cantidad_ventas,
    COUNT(DISTINCT v.id_pedido) AS pedidos_atendidos,
    SUM(v.monto_pagado) AS ingresos_totales,
    AVG(v.monto_pagado) AS ticket_promedio,
    MAX(v.monto_pagado) AS venta_maxima,
    MIN(v.monto_pagado) AS venta_minima,
    SUM(CASE WHEN v.metodo_pago = 'EFECTIVO' THEN v.monto_pagado ELSE 0 END) AS efectivo,
    SUM(CASE WHEN v.metodo_pago = 'TARJETA' THEN v.monto_pagado ELSE 0 END) AS tarjeta,
    SUM(CASE WHEN v.metodo_pago = 'YAPE' THEN v.monto_pagado ELSE 0 END) AS yape,
    SUM(CASE WHEN v.metodo_pago = 'PLIN' THEN v.monto_pagado ELSE 0 END) AS plin,
    SUM(CASE WHEN v.metodo_pago = 'TRANSFERENCIA' THEN v.monto_pagado ELSE 0 END) AS transferencia
FROM venta v
WHERE v.estado_venta = 'PAGADO'
GROUP BY DATE(v.fecha_venta), DAYNAME(v.fecha_venta)
ORDER BY fecha DESC;

-- =====================================================
-- Vista 10: Clientes frecuentes
-- =====================================================
CREATE OR REPLACE VIEW vw_clientes_frecuentes AS
SELECT 
    c.id_cliente,
    CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
    c.tipo_documento,
    c.numero_documento,
    c.telefono,
    c.email,
    COUNT(DISTINCT p.id_pedido) AS total_pedidos,
    COUNT(DISTINCT v.id_venta) AS total_compras,
    COALESCE(SUM(v.monto_pagado), 0) AS total_gastado,
    COALESCE(AVG(v.monto_pagado), 0) AS gasto_promedio,
    MAX(v.fecha_venta) AS ultima_visita,
    DATEDIFF(CURDATE(), MAX(v.fecha_venta)) AS dias_desde_ultima_visita
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
LEFT JOIN venta v ON p.id_pedido = v.id_pedido AND v.estado_venta = 'PAGADO'
WHERE c.estado = 'ACTIVO'
GROUP BY c.id_cliente, c.nombres, c.apellidos, c.tipo_documento, 
         c.numero_documento, c.telefono, c.email
HAVING total_pedidos > 0
ORDER BY total_gastado DESC;

-- ==============================================
-- ⚙️ SECCIÓN 2: PROCEDIMIENTOS ALMACENADOS
-- ==============================================

-- =====================================================
-- Procedimiento 1: Registrar nuevo pedido completo
-- =====================================================
DROP PROCEDURE IF EXISTS sp_registrar_pedido;
DELIMITER //
CREATE PROCEDURE sp_registrar_pedido(
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_tipo_pedido ENUM('MESA','DELIVERY','PARA_LLEVAR'),
    OUT p_id_pedido_generado INT,
    OUT p_codigo_pedido VARCHAR(15)
)
BEGIN
    DECLARE v_fecha_actual DATETIME;
    DECLARE v_codigo VARCHAR(15);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_id_pedido_generado = -1;
        SET p_codigo_pedido = NULL;
    END;
    
    START TRANSACTION;
    
    -- Validar que el cliente existe y está activo
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE id_cliente = p_id_cliente AND estado = 'ACTIVO') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El cliente no existe o está inactivo';
    END IF;
    
    -- Validar que el empleado existe y está activo
    IF NOT EXISTS (SELECT 1 FROM empleado WHERE id_empleado = p_id_empleado AND estado = 'ACTIVO') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El empleado no existe o está inactivo';
    END IF;
    
    SET v_fecha_actual = NOW();
    SET v_codigo = CONCAT('PED-', DATE_FORMAT(v_fecha_actual, '%Y%m%d'), '-', LPAD(FLOOR(RAND() * 9999), 4, '0'));
    
    -- Insertar pedido
    INSERT INTO pedido (id_cliente, id_empleado, codigo_pedido, fecha_pedido, tipo_pedido, estado_pedido)
    VALUES (p_id_cliente, p_id_empleado, v_codigo, v_fecha_actual, p_tipo_pedido, 'PENDIENTE');
    
    SET p_id_pedido_generado = LAST_INSERT_ID();
    SET p_codigo_pedido = v_codigo;
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 2: Agregar producto al pedido
-- =====================================================
DROP PROCEDURE IF EXISTS sp_agregar_detalle_pedido;
DELIMITER //
CREATE PROCEDURE sp_agregar_detalle_pedido(
    IN p_id_pedido INT,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_observaciones VARCHAR(200)
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_subtotal DECIMAL(10,2);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Validar que el pedido existe
    IF NOT EXISTS (SELECT 1 FROM pedido WHERE id_pedido = p_id_pedido) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El pedido no existe';
    END IF;
    
    -- Obtener precio del producto
    SELECT precio_unitario INTO v_precio
    FROM producto
    WHERE id_producto = p_id_producto AND estado = 'ACTIVO';
    
    IF v_precio IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto no existe o está inactivo';
    END IF;
    
    -- Calcular subtotal
    SET v_subtotal = v_precio * p_cantidad;
    
    -- Insertar detalle
    INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario, subtotal, estado_detalle, observaciones)
    VALUES (p_id_pedido, p_id_producto, p_cantidad, v_precio, v_subtotal, 'PENDIENTE', p_observaciones);
    
    -- Actualizar totales del pedido
    CALL sp_actualizar_totales_pedido(p_id_pedido);
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 3: Actualizar totales del pedido
-- =====================================================
DROP PROCEDURE IF EXISTS sp_actualizar_totales_pedido;
DELIMITER //
CREATE PROCEDURE sp_actualizar_totales_pedido(
    IN p_id_pedido INT
)
BEGIN
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_igv DECIMAL(10,2);
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_descuento DECIMAL(10,2);
    
    -- Calcular subtotal
    SELECT COALESCE(SUM(subtotal), 0) INTO v_subtotal
    FROM detalle_pedido
    WHERE id_pedido = p_id_pedido;
    
    -- Obtener descuento actual
    SELECT COALESCE(descuento, 0) INTO v_descuento
    FROM pedido
    WHERE id_pedido = p_id_pedido;
    
    -- Calcular IGV (18%) y total
    SET v_subtotal = v_subtotal - v_descuento;
    SET v_igv = v_subtotal * 0.18;
    SET v_total = v_subtotal + v_igv;
    
    -- Actualizar pedido
    UPDATE pedido
    SET subtotal = v_subtotal,
        igv = v_igv,
        total = v_total,
        fecha_modificacion = NOW()
    WHERE id_pedido = p_id_pedido;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 4: Procesar venta y generar factura
-- =====================================================
DROP PROCEDURE IF EXISTS sp_procesar_venta;
DELIMITER //
CREATE PROCEDURE sp_procesar_venta(
    IN p_id_pedido INT,
    IN p_id_empleado_cajero INT,
    IN p_metodo_pago ENUM('EFECTIVO','TARJETA','YAPE','PLIN','TRANSFERENCIA','MIXTO'),
    IN p_monto_pagado DECIMAL(10,2),
    IN p_generar_factura BOOLEAN,
    IN p_tipo_comprobante ENUM('BOLETA','FACTURA','TICKET'),
    OUT p_id_venta_generada INT,
    OUT p_codigo_venta VARCHAR(15),
    OUT p_id_factura_generada INT
)
BEGIN
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_vuelto DECIMAL(10,2);
    DECLARE v_fecha_venta DATETIME;
    DECLARE v_codigo_venta VARCHAR(15);
    DECLARE v_numero_factura VARCHAR(20);
    DECLARE v_serie VARCHAR(10);
    DECLARE v_subtotal DECIMAL(10,2);
    DECLARE v_igv DECIMAL(10,2);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_id_venta_generada = -1;
        SET p_codigo_venta = NULL;
        SET p_id_factura_generada = -1;
    END;
    
    START TRANSACTION;
    
    -- Validar que el pedido existe y está entregado
    IF NOT EXISTS (SELECT 1 FROM pedido WHERE id_pedido = p_id_pedido AND estado_pedido = 'ENTREGADO') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El pedido no existe o no está entregado';
    END IF;
    
    -- Obtener total del pedido
    SELECT total, subtotal, igv INTO v_total, v_subtotal, v_igv
    FROM pedido
    WHERE id_pedido = p_id_pedido;
    
    IF v_total IS NULL OR v_total = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El pedido no tiene productos o el total es cero';
    END IF;
    
    -- Validar monto pagado
    IF p_monto_pagado < v_total THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El monto pagado es insuficiente';
    END IF;
    
    SET v_fecha_venta = NOW();
    SET v_vuelto = p_monto_pagado - v_total;
    SET v_codigo_venta = CONCAT('VEN-', DATE_FORMAT(v_fecha_venta, '%Y%m%d'), '-', LPAD(FLOOR(RAND() * 9999), 4, '0'));
    
    -- Registrar venta
    INSERT INTO venta (id_pedido, id_empleado, codigo_venta, fecha_venta, metodo_pago, monto_pagado, vuelto, estado_venta)
    VALUES (p_id_pedido, p_id_empleado_cajero, v_codigo_venta, v_fecha_venta, p_metodo_pago, p_monto_pagado, v_vuelto, 'PAGADO');
    
    SET p_id_venta_generada = LAST_INSERT_ID();
    SET p_codigo_venta = v_codigo_venta;
    
    -- Generar factura si se solicita
    IF p_generar_factura THEN
        IF p_tipo_comprobante = 'BOLETA' THEN
            SET v_serie = 'B001';
        ELSEIF p_tipo_comprobante = 'FACTURA' THEN
            SET v_serie = 'F001';
        ELSE
            SET v_serie = 'T001';
        END IF;
        
        SET v_numero_factura = CONCAT(v_serie, '-', LPAD(FLOOR(RAND() * 99999), 5, '0'));
        
        INSERT INTO factura (id_venta, numero_factura, serie_factura, tipo_comprobante, fecha_emision, subtotal, igv, total, estado_factura)
        VALUES (p_id_venta_generada, v_numero_factura, v_serie, p_tipo_comprobante, DATE(v_fecha_venta), v_subtotal, v_igv, v_total, 'EMITIDA');
        
        SET p_id_factura_generada = LAST_INSERT_ID();
    ELSE
        SET p_id_factura_generada = NULL;
    END IF;
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 5: Crear reserva con asignación de mesa
-- =====================================================
DROP PROCEDURE IF EXISTS sp_crear_reserva;
DELIMITER //
CREATE PROCEDURE sp_crear_reserva(
    IN p_id_cliente INT,
    IN p_fecha_reserva DATE,
    IN p_hora_reserva TIME,
    IN p_numero_personas INT,
    IN p_id_mesa INT,
    IN p_comentarios TEXT,
    OUT p_id_reserva_generada INT,
    OUT p_codigo_reserva VARCHAR(15)
)
BEGIN
    DECLARE v_codigo VARCHAR(15);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_id_reserva_generada = -1;
        SET p_codigo_reserva = NULL;
    END;
    
    START TRANSACTION;
    
    -- Validar que el cliente existe
    IF NOT EXISTS (SELECT 1 FROM cliente WHERE id_cliente = p_id_cliente AND estado = 'ACTIVO') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El cliente no existe o está inactivo';
    END IF;
    
    -- Validar que la mesa existe y está disponible
    IF NOT EXISTS (SELECT 1 FROM mesa WHERE id_mesa = p_id_mesa AND estado IN ('DISPONIBLE', 'RESERVADA')) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La mesa no está disponible';
    END IF;
    
    SET v_codigo = CONCAT('RES-', DATE_FORMAT(NOW(), '%Y%m%d'), '-', LPAD(FLOOR(RAND() * 9999), 4, '0'));
    
    -- Crear reserva
    INSERT INTO reserva (id_cliente, codigo_reserva, fecha_reserva, hora_reserva, numero_personas, estado_reserva, comentarios)
    VALUES (p_id_cliente, v_codigo, p_fecha_reserva, p_hora_reserva, p_numero_personas, 'PENDIENTE', p_comentarios);
    
    SET p_id_reserva_generada = LAST_INSERT_ID();
    SET p_codigo_reserva = v_codigo;
    
    -- Asignar mesa a la reserva
    INSERT INTO reserva_mesa (id_reserva, id_mesa)
    VALUES (p_id_reserva_generada, p_id_mesa);
    
    -- Actualizar estado de la mesa
    UPDATE mesa SET estado = 'RESERVADA' WHERE id_mesa = p_id_mesa;
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 6: Cambiar estado de mesa
-- =====================================================
DROP PROCEDURE IF EXISTS sp_cambiar_estado_mesa;
DELIMITER //
CREATE PROCEDURE sp_cambiar_estado_mesa(
    IN p_id_mesa INT,
    IN p_nuevo_estado ENUM('DISPONIBLE','OCUPADA','RESERVADA','MANTENIMIENTO')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Validar que la mesa existe
    IF NOT EXISTS (SELECT 1 FROM mesa WHERE id_mesa = p_id_mesa) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La mesa no existe';
    END IF;
    
    -- Actualizar estado
    UPDATE mesa SET estado = p_nuevo_estado WHERE id_mesa = p_id_mesa;
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 7: Actualizar estado de pedido
-- =====================================================
DROP PROCEDURE IF EXISTS sp_actualizar_estado_pedido;
DELIMITER //
CREATE PROCEDURE sp_actualizar_estado_pedido(
    IN p_id_pedido INT,
    IN p_nuevo_estado ENUM('PENDIENTE','EN_PREPARACION','LISTO','ENTREGADO','CANCELADO')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Validar que el pedido existe
    IF NOT EXISTS (SELECT 1 FROM pedido WHERE id_pedido = p_id_pedido) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El pedido no existe';
    END IF;
    
    -- Actualizar estado
    UPDATE pedido 
    SET estado_pedido = p_nuevo_estado,
        fecha_modificacion = NOW()
    WHERE id_pedido = p_id_pedido;
    
    -- Actualizar estado de los detalles también
    UPDATE detalle_pedido
    SET estado_detalle = p_nuevo_estado
    WHERE id_pedido = p_id_pedido;
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 8: Cancelar reserva y liberar mesa
-- =====================================================
DROP PROCEDURE IF EXISTS sp_cancelar_reserva;
DELIMITER //
CREATE PROCEDURE sp_cancelar_reserva(
    IN p_id_reserva INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Validar que la reserva existe
    IF NOT EXISTS (SELECT 1 FROM reserva WHERE id_reserva = p_id_reserva) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La reserva no existe';
    END IF;
    
    -- Actualizar estado de la reserva
    UPDATE reserva
    SET estado_reserva = 'CANCELADA',
        fecha_modificacion = NOW()
    WHERE id_reserva = p_id_reserva;
    
    -- Liberar mesas asociadas
    UPDATE mesa m
    INNER JOIN reserva_mesa rm ON m.id_mesa = rm.id_mesa
    SET m.estado = 'DISPONIBLE'
    WHERE rm.id_reserva = p_id_reserva;
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 9: Reporte de ventas por rango
-- =====================================================
DROP PROCEDURE IF EXISTS sp_reporte_ventas_rango;
DELIMITER //
CREATE PROCEDURE sp_reporte_ventas_rango(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT 
        DATE(v.fecha_venta) AS fecha,
        DAYNAME(v.fecha_venta) AS dia_semana,
        COUNT(v.id_venta) AS total_ventas,
        SUM(v.monto_pagado) AS ingresos_totales,
        AVG(v.monto_pagado) AS ticket_promedio,
        MAX(v.monto_pagado) AS venta_maxima,
        MIN(v.monto_pagado) AS venta_minima,
        SUM(CASE WHEN v.metodo_pago = 'EFECTIVO' THEN v.monto_pagado ELSE 0 END) AS efectivo,
        SUM(CASE WHEN v.metodo_pago = 'TARJETA' THEN v.monto_pagado ELSE 0 END) AS tarjeta,
        SUM(CASE WHEN v.metodo_pago = 'YAPE' THEN v.monto_pagado ELSE 0 END) AS yape,
        SUM(CASE WHEN v.metodo_pago = 'PLIN' THEN v.monto_pagado ELSE 0 END) AS plin,
        SUM(CASE WHEN v.metodo_pago = 'TRANSFERENCIA' THEN v.monto_pagado ELSE 0 END) AS transferencia,
        COUNT(DISTINCT f.id_factura) AS facturas_emitidas
    FROM venta v
    LEFT JOIN factura f ON v.id_venta = f.id_venta
    WHERE DATE(v.fecha_venta) BETWEEN p_fecha_inicio AND p_fecha_fin
      AND v.estado_venta = 'PAGADO'
    GROUP BY DATE(v.fecha_venta), DAYNAME(v.fecha_venta)
    ORDER BY fecha;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 10: Dashboard resumen del día
-- =====================================================
DROP PROCEDURE IF EXISTS sp_dashboard_diario;
DELIMITER //
CREATE PROCEDURE sp_dashboard_diario(
    IN p_fecha DATE
)
BEGIN
    -- Resumen general del día
    SELECT 
        p_fecha AS fecha,
        COUNT(DISTINCT p.id_pedido) AS total_pedidos,
        COUNT(DISTINCT v.id_venta) AS total_ventas,
        COUNT(DISTINCT f.id_factura) AS total_facturas,
        COALESCE(SUM(v.monto_pagado), 0) AS ingresos_totales,
        COALESCE(AVG(v.monto_pagado), 0) AS ticket_promedio,
        COUNT(DISTINCT p.id_cliente) AS clientes_atendidos,
        SUM(CASE WHEN v.metodo_pago = 'EFECTIVO' THEN v.monto_pagado ELSE 0 END) AS efectivo,
        SUM(CASE WHEN v.metodo_pago = 'TARJETA' THEN v.monto_pagado ELSE 0 END) AS tarjeta,
        SUM(CASE WHEN v.metodo_pago = 'YAPE' THEN v.monto_pagado ELSE 0 END) AS yape,
        SUM(CASE WHEN v.metodo_pago = 'PLIN' THEN v.monto_pagado ELSE 0 END) AS plin
    FROM pedido p
    LEFT JOIN venta v ON p.id_pedido = v.id_pedido AND v.estado_venta = 'PAGADO'
    LEFT JOIN factura f ON v.id_venta = f.id_venta
    WHERE DATE(p.fecha_pedido) = p_fecha;
    
    -- Top 5 productos más vendidos del día
    SELECT 
        pr.nombre_producto AS producto,
        cat.nombre_categoria AS categoria,
        SUM(dp.cantidad) AS unidades_vendidas,
        SUM(dp.subtotal) AS ingresos_producto,
        CONCAT('S/ ', FORMAT(SUM(dp.subtotal), 2)) AS ingresos_formateado
    FROM detalle_pedido dp
    INNER JOIN pedido p ON dp.id_pedido = p.id_pedido
    INNER JOIN producto pr ON dp.id_producto = pr.id_producto
    INNER JOIN categoria cat ON pr.id_categoria = cat.id_categoria
    WHERE DATE(p.fecha_pedido) = p_fecha
      AND p.estado_pedido IN ('ENTREGADO', 'EN_PREPARACION', 'LISTO')
    GROUP BY pr.id_producto, pr.nombre_producto, cat.nombre_categoria
    ORDER BY unidades_vendidas DESC
    LIMIT 5;
    
    -- Rendimiento de empleados del día
    SELECT 
        CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
        e.codigo_empleado,
        COUNT(DISTINCT p.id_pedido) AS pedidos_atendidos,
        COALESCE(SUM(v.monto_pagado), 0) AS ventas_generadas,
        CONCAT('S/ ', FORMAT(COALESCE(SUM(v.monto_pagado), 0), 2)) AS ventas_formateadas
    FROM empleado e
    LEFT JOIN pedido p ON e.id_empleado = p.id_empleado AND DATE(p.fecha_pedido) = p_fecha
    LEFT JOIN venta v ON p.id_pedido = v.id_pedido AND v.estado_venta = 'PAGADO'
    WHERE e.estado = 'ACTIVO'
    GROUP BY e.id_empleado, e.nombres, e.apellidos, e.codigo_empleado
    ORDER BY ventas_generadas DESC;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 11: Buscar productos por categoría
-- =====================================================
DROP PROCEDURE IF EXISTS sp_productos_por_categoria;
DELIMITER //
CREATE PROCEDURE sp_productos_por_categoria(
    IN p_id_categoria INT
)
BEGIN
    SELECT 
        p.id_producto,
        p.codigo_producto,
        p.nombre_producto AS producto,
        p.descripcion,
        p.precio_unitario AS precio,
        c.nombre_categoria AS categoria,
        p.stock_actual,
        p.stock_minimo,
        p.unidad_medida,
        p.es_bebida,
        CONCAT('S/ ', FORMAT(p.precio_unitario, 2)) AS precio_formateado
    FROM producto p
    INNER JOIN categoria c ON p.id_categoria = c.id_categoria
    WHERE p.id_categoria = p_id_categoria
      AND p.estado = 'ACTIVO'
    ORDER BY p.nombre_producto;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 12: Aplicar descuento a pedido
-- =====================================================
DROP PROCEDURE IF EXISTS sp_aplicar_descuento_pedido;
DELIMITER //
CREATE PROCEDURE sp_aplicar_descuento_pedido(
    IN p_id_pedido INT,
    IN p_descuento DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Validar que el pedido existe
    IF NOT EXISTS (SELECT 1 FROM pedido WHERE id_pedido = p_id_pedido) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El pedido no existe';
    END IF;
    
    -- Validar descuento válido
    IF p_descuento < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El descuento no puede ser negativo';
    END IF;
    
    -- Aplicar descuento
    UPDATE pedido
    SET descuento = p_descuento,
        fecha_modificacion = NOW()
    WHERE id_pedido = p_id_pedido;
    
    -- Recalcular totales
    CALL sp_actualizar_totales_pedido(p_id_pedido);
    
    COMMIT;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 13: Obtener pedidos pendientes
-- =====================================================
DROP PROCEDURE IF EXISTS sp_pedidos_pendientes;
DELIMITER //
CREATE PROCEDURE sp_pedidos_pendientes()
BEGIN
    SELECT 
        p.id_pedido,
        p.codigo_pedido,
        p.fecha_pedido,
        p.tipo_pedido,
        p.estado_pedido,
        CONCAT(c.nombres, ' ', c.apellidos) AS cliente,
        c.telefono,
        CONCAT(e.nombres, ' ', e.apellidos) AS empleado,
        COUNT(dp.id_detalle) AS total_items,
        p.total,
        TIMESTAMPDIFF(MINUTE, p.fecha_pedido, NOW()) AS minutos_transcurridos
    FROM pedido p
    INNER JOIN cliente c ON p.id_cliente = c.id_cliente
    INNER JOIN empleado e ON p.id_empleado = e.id_empleado
    LEFT JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
    WHERE p.estado_pedido IN ('PENDIENTE', 'EN_PREPARACION')
    GROUP BY p.id_pedido, p.codigo_pedido, p.fecha_pedido, p.tipo_pedido, 
             p.estado_pedido, c.nombres, c.apellidos, c.telefono,
             e.nombres, e.apellidos, p.total
    ORDER BY p.fecha_pedido;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 14: Obtener mesas disponibles
-- =====================================================
DROP PROCEDURE IF EXISTS sp_mesas_disponibles;
DELIMITER //
CREATE PROCEDURE sp_mesas_disponibles(
    IN p_capacidad_minima INT
)
BEGIN
    SELECT 
        m.id_mesa,
        m.numero_mesa,
        m.capacidad,
        m.ubicacion,
        m.estado,
        m.descripcion
    FROM mesa m
    WHERE m.estado = 'DISPONIBLE'
      AND m.capacidad >= p_capacidad_minima
    ORDER BY m.capacidad, m.numero_mesa;
END //
DELIMITER ;

-- =====================================================
-- Procedimiento 15: Reporte de productos por categoría
-- =====================================================
DROP PROCEDURE IF EXISTS sp_reporte_ventas_por_categoria;
DELIMITER //
CREATE PROCEDURE sp_reporte_ventas_por_categoria(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT 
        c.id_categoria,
        c.nombre_categoria AS categoria,
        COUNT(DISTINCT p.id_producto) AS productos_vendidos,
        SUM(dp.cantidad) AS unidades_vendidas,
        SUM(dp.subtotal) AS ingresos_totales,
        AVG(dp.precio_unitario) AS precio_promedio,
        CONCAT('S/ ', FORMAT(SUM(dp.subtotal), 2)) AS ingresos_formateados
    FROM categoria c
    INNER JOIN producto p ON c.id_categoria = p.id_categoria
    INNER JOIN detalle_pedido dp ON p.id_producto = dp.id_producto
    INNER JOIN pedido ped ON dp.id_pedido = ped.id_pedido
    WHERE DATE(ped.fecha_pedido) BETWEEN p_fecha_inicio AND p_fecha_fin
      AND ped.estado_pedido = 'ENTREGADO'
    GROUP BY c.id_categoria, c.nombre_categoria
    ORDER BY ingresos_totales DESC;
END //
DELIMITER ;

-- ==============================================
-- ✅ CONFIRMACIÓN FINAL
-- ==============================================
-- 06_views_procedures.sql
SELECT '✅ Vistas y procedimientos creados exitosamente' AS resultado;
  