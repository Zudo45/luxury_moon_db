-- ==========================================
-- Auditoría - Luxury Moon
-- Crea tabla de auditoría y triggers en tablas clave
-- ==========================================

CREATE TABLE IF NOT EXISTS auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100),
    accion  VARCHAR(10),   -- INSERT | UPDATE | DELETE
    tabla   VARCHAR(50),
    id_afectado BIGINT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Borra triggers previos si existieran (evitar duplicados)
DROP TRIGGER IF EXISTS trg_audit_pedido_ins;
DROP TRIGGER IF EXISTS trg_audit_pedido_upd;
DROP TRIGGER IF EXISTS trg_audit_pedido_del;

DROP TRIGGER IF EXISTS trg_audit_detalle_pedido_ins;
DROP TRIGGER IF EXISTS trg_audit_detalle_pedido_upd;
DROP TRIGGER IF EXISTS trg_audit_detalle_pedido_del;

DROP TRIGGER IF EXISTS trg_audit_venta_ins;
DROP TRIGGER IF EXISTS trg_audit_venta_upd;
DROP TRIGGER IF EXISTS trg_audit_venta_del;

DROP TRIGGER IF EXISTS trg_audit_factura_ins;
DROP TRIGGER IF EXISTS trg_audit_factura_upd;
DROP TRIGGER IF EXISTS trg_audit_factura_del;

DROP TRIGGER IF EXISTS trg_audit_reserva_ins;
DROP TRIGGER IF EXISTS trg_audit_reserva_upd;
DROP TRIGGER IF EXISTS trg_audit_reserva_del;

DELIMITER $$

-- PEDIDO (PK: id_pedido)
CREATE TRIGGER trg_audit_pedido_ins AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'INSERT', 'pedido', NEW.id_pedido);
END$$

CREATE TRIGGER trg_audit_pedido_upd AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'UPDATE', 'pedido', NEW.id_pedido);
END$$

CREATE TRIGGER trg_audit_pedido_del AFTER DELETE ON pedido
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'DELETE', 'pedido', OLD.id_pedido);
END$$


-- DETALLE_PEDIDO (PK: id_detalle)
CREATE TRIGGER trg_audit_detalle_pedido_ins AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'INSERT', 'detalle_pedido', NEW.id_detalle);
END$$

CREATE TRIGGER trg_audit_detalle_pedido_upd AFTER UPDATE ON detalle_pedido
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'UPDATE', 'detalle_pedido', NEW.id_detalle);
END$$

CREATE TRIGGER trg_audit_detalle_pedido_del AFTER DELETE ON detalle_pedido
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'DELETE', 'detalle_pedido', OLD.id_detalle);
END$$


-- VENTA (PK: id_venta)
CREATE TRIGGER trg_audit_venta_ins AFTER INSERT ON venta
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'INSERT', 'venta', NEW.id_venta);
END$$

CREATE TRIGGER trg_audit_venta_upd AFTER UPDATE ON venta
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'UPDATE', 'venta', NEW.id_venta);
END$$

CREATE TRIGGER trg_audit_venta_del AFTER DELETE ON venta
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'DELETE', 'venta', OLD.id_venta);
END$$


-- FACTURA (PK: id_factura)
CREATE TRIGGER trg_audit_factura_ins AFTER INSERT ON factura
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'INSERT', 'factura', NEW.id_factura);
END$$

CREATE TRIGGER trg_audit_factura_upd AFTER UPDATE ON factura
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'UPDATE', 'factura', NEW.id_factura);
END$$

CREATE TRIGGER trg_audit_factura_del AFTER DELETE ON factura
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'DELETE', 'factura', OLD.id_factura);
END$$


-- RESERVA (PK: id_reserva)
CREATE TRIGGER trg_audit_reserva_ins AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'INSERT', 'reserva', NEW.id_reserva);
END$$

CREATE TRIGGER trg_audit_reserva_upd AFTER UPDATE ON reserva
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'UPDATE', 'reserva', NEW.id_reserva);
END$$

CREATE TRIGGER trg_audit_reserva_del AFTER DELETE ON reserva
FOR EACH ROW
BEGIN
  INSERT INTO auditoria(usuario, accion, tabla, id_afectado)
  VALUES (CURRENT_USER(), 'DELETE', 'reserva', OLD.id_reserva);
END$$

DELIMITER ;

SELECT '✅ Auditoría creada (pedido, detalle_pedido, venta, factura, reserva)' AS resultado;
