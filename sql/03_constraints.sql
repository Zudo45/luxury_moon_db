-- ==============================================
-- Archivo: 03_constraints.sql
-- Descripción: Define las llaves foráneas (FK)
-- Base de datos: luxury_moon_db
-- ==============================================

USE luxury_moon_db;

-- ==============================================
-- Relaciones de la tabla producto
-- ==============================================
ALTER TABLE producto
  ADD CONSTRAINT fk_producto_categoria
  FOREIGN KEY (id_categoria)
  REFERENCES categoria(id_categoria)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

-- ==============================================
-- Relaciones de la tabla pedido
-- ==============================================
ALTER TABLE pedido
  ADD CONSTRAINT fk_pedido_cliente
  FOREIGN KEY (id_cliente)
  REFERENCES cliente(id_cliente)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

ALTER TABLE pedido
  ADD CONSTRAINT fk_pedido_empleado
  FOREIGN KEY (id_empleado)
  REFERENCES empleado(id_empleado)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

-- ==============================================
-- Relaciones de la tabla detalle_pedido
-- ==============================================
ALTER TABLE detalle_pedido
  ADD CONSTRAINT fk_detalle_pedido_pedido
  FOREIGN KEY (id_pedido)
  REFERENCES pedido(id_pedido)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE detalle_pedido
  ADD CONSTRAINT fk_detalle_pedido_producto
  FOREIGN KEY (id_producto)
  REFERENCES producto(id_producto)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

-- ==============================================
-- Relaciones de la tabla venta
-- ==============================================
ALTER TABLE venta
  ADD CONSTRAINT fk_venta_pedido
  FOREIGN KEY (id_pedido)
  REFERENCES pedido(id_pedido)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

ALTER TABLE venta
  ADD CONSTRAINT fk_venta_empleado
  FOREIGN KEY (id_empleado)
  REFERENCES empleado(id_empleado)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

-- ==============================================
-- Relaciones de la tabla factura
-- ==============================================
ALTER TABLE factura
  ADD CONSTRAINT fk_factura_venta
  FOREIGN KEY (id_venta)
  REFERENCES venta(id_venta)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

-- ==============================================
-- Relaciones de la tabla reserva
-- ==============================================
ALTER TABLE reserva
  ADD CONSTRAINT fk_reserva_cliente
  FOREIGN KEY (id_cliente)
  REFERENCES cliente(id_cliente)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

-- ==============================================
-- Relaciones de la tabla reserva_mesa
-- ==============================================
ALTER TABLE reserva_mesa
  ADD CONSTRAINT fk_reserva_mesa_reserva
  FOREIGN KEY (id_reserva)
  REFERENCES reserva(id_reserva)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE reserva_mesa
  ADD CONSTRAINT fk_reserva_mesa_mesa
  FOREIGN KEY (id_mesa)
  REFERENCES mesa(id_mesa)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;

-- 03_constraints.sql
SELECT '✅ Restricciones aplicadas exitosamente' AS resultado;
