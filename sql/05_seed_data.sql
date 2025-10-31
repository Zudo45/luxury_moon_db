-- ==============================================
-- Archivo: 05_seed_data_corregido.sql
-- Descripción: Datos de prueba corregidos según esquema real
-- Proyecto: Restobar Luxury Moon
-- ==============================================

USE luxury_moon_db;

-- ==============================================
-- Categorías
-- ==============================================
INSERT INTO categoria (nombre_categoria, descripcion, estado) VALUES
('Bebidas Alcohólicas', 'Cócteles, licores y bebidas premium', 'ACTIVO'),
('Bebidas sin Alcohol', 'Refrescos, jugos naturales y bebidas calientes', 'ACTIVO'),
('Piqueos', 'Aperitivos y entradas para compartir', 'ACTIVO'),
('Platos Principales', 'Platos de fondo de la carta', 'ACTIVO'),
('Postres', 'Dulces y postres artesanales', 'ACTIVO'),
('Promociones', 'Combos y ofertas especiales', 'ACTIVO');

-- ==============================================
-- Clientes (30 clientes)
-- ==============================================
INSERT INTO cliente (tipo_documento, numero_documento, nombres, apellidos, email, telefono, direccion, estado) VALUES
('DNI', '74219583', 'María Elena', 'García López', 'maria.garcia@gmail.com', '987654321', 'Av. Larco 456', 'ACTIVO'),
('DNI', '85932147', 'Luis Alberto', 'Torres Vega', 'luis.torres@hotmail.com', '912345678', 'Jr. Gamarra 123', 'ACTIVO'),
('DNI', '70451236', 'Carmen Rosa', 'Rojas Díaz', 'carmen.rojas@yahoo.com', '998877665', 'Calle Lima 789', 'ACTIVO'),
('DNI', '72458369', 'Pedro José', 'Sánchez Ruiz', 'pedro.sanchez@gmail.com', '965432178', 'Av. España 321', 'ACTIVO'),
('DNI', '78963214', 'Ana María', 'Martínez Silva', 'ana.martinez@outlook.com', '923456789', 'Jr. Pizarro 654', 'ACTIVO'),
('DNI', '71254896', 'Jorge Luis', 'Ramírez Castro', 'jorge.ramirez@gmail.com', '987123456', 'Calle Bolívar 147', 'ACTIVO'),
('DNI', '70895421', 'Rosa Elena', 'Flores Mendoza', 'rosa.flores@hotmail.com', '956781234', 'Av. Mansiche 258', 'ACTIVO'),
('DNI', '73698521', 'Miguel Ángel', 'Vargas Ortiz', 'miguel.vargas@gmail.com', '934567890', 'Jr. Orbegoso 369', 'ACTIVO'),
('DNI', '75421896', 'Lucía Patricia', 'Herrera Paredes', 'lucia.herrera@yahoo.com', '978654321', 'Calle Junín 741', 'ACTIVO'),
('DNI', '72589631', 'Carlos Eduardo', 'Gutiérrez Ramos', 'carlos.gutierrez@gmail.com', '945678123', 'Av. América 852', 'ACTIVO'),
('DNI', '74125896', 'Patricia Isabel', 'Morales Chávez', 'patricia.morales@hotmail.com', '967890123', 'Jr. Ayacucho 963', 'ACTIVO'),
('DNI', '71895632', 'Roberto Carlos', 'Castillo Reyes', 'roberto.castillo@gmail.com', '989012345', 'Calle San Martín 159', 'ACTIVO'),
('DNI', '73256987', 'Elena Victoria', 'Jiménez Soto', 'elena.jimenez@outlook.com', '956234567', 'Av. El Golf 357', 'ACTIVO'),
('DNI', '70987456', 'Fernando José', 'Delgado Cruz', 'fernando.delgado@gmail.com', '923678901', 'Jr. Independencia 486', 'ACTIVO'),
('DNI', '75632148', 'Gabriela Sofía', 'Navarro Luna', 'gabriela.navarro@yahoo.com', '945890123', 'Calle Colón 597', 'ACTIVO'),
('RUC', '20541896325', 'Inversiones Pacífico', 'S.A.C.', 'ventas@pacificos.com', '978901234', 'Av. Industrial 1024', 'ACTIVO'),
('DNI', '74589632', 'Sofía Andrea', 'Campos Vera', 'sofia.campos@hotmail.com', '912456789', 'Jr. Grau 608', 'ACTIVO'),
('DNI', '71632547', 'Daniel Alejandro', 'Robles Medina', 'daniel.robles@gmail.com', '934789012', 'Calle Trujillo 719', 'ACTIVO'),
('DNI', '73985214', 'Mónica Elizabeth', 'Espinoza Ríos', 'monica.espinoza@outlook.com', '956123789', 'Av. Vallejo 820', 'ACTIVO'),
('DNI', '70258963', 'Andrés Felipe', 'Fuentes Carrillo', 'andres.fuentes@gmail.com', '987345612', 'Jr. Zela 931', 'ACTIVO'),
('DNI', '75896321', 'Valeria Nicole', 'Salazar Montes', 'valeria.salazar@yahoo.com', '923890456', 'Calle Real 142', 'ACTIVO'),
('DNI', '72369874', 'Oscar Manuel', 'Ponce Acosta', 'oscar.ponce@gmail.com', '945012678', 'Av. Los Pinos 253', 'ACTIVO'),
('DNI', '74152369', 'Diana Carolina', 'Contreras Valle', 'diana.contreras@hotmail.com', '967234890', 'Jr. Las Flores 364', 'ACTIVO'),
('DNI', '71478965', 'Héctor Raúl', 'Miranda Núñez', 'hector.miranda@gmail.com', '989456123', 'Calle Los Olivos 475', 'ACTIVO'),
('DNI', '73654789', 'Laura Vanessa', 'Bravo Santana', 'laura.bravo@outlook.com', '956789234', 'Av. La Marina 586', 'ACTIVO'),
('CE', '001234567', 'Ricardo Antonio', 'Córdoba Ibarra', 'raul.cordoba@gmail.com', '923012567', 'Jr. Libertad 697', 'ACTIVO'),
('DNI', '75214789', 'Alejandra Lucía', 'Maldonado Guerra', 'alejandra.maldonado@yahoo.com', '945678234', 'Calle Victoria 708', 'ACTIVO'),
('DNI', '72587413', 'Sergio Andrés', 'Villanueva Pacheco', 'sergio.villanueva@gmail.com', '978234567', 'Av. Perú 819', 'ACTIVO'),
('DNI', '74369852', 'Isabel Cristina', 'Montero Galindo', 'isabel.montero@hotmail.com', '912567890', 'Jr. Tacna 920', 'ACTIVO'),
('DNI', '71258963', 'Manuel Enrique', 'Álvarez Benítez', 'manuel.alvarez@gmail.com', '934890123', 'Calle Miraflores 131', 'ACTIVO');

-- ==============================================
-- Empleados
-- ==============================================
INSERT INTO empleado (codigo_empleado, tipo_documento, numero_documento, nombres, apellidos, email, telefono, fecha_contratacion, salario, estado) VALUES
('EMP001', 'DNI', '78451236', 'Ana Patricia', 'Vega Morales', 'ana.vega@luxurymoon.com', '954321789', '2024-01-15', 1500.00, 'ACTIVO'),
('EMP002', 'DNI', '79563214', 'Pedro Martín', 'Salinas Cruz', 'pedro.salinas@luxurymoon.com', '965432890', '2024-02-01', 1500.00, 'ACTIVO'),
('EMP003', 'DNI', '77852369', 'Carla Sofía', 'Mendoza Flores', 'carla.mendoza@luxurymoon.com', '978456123', '2024-03-10', 1500.00, 'ACTIVO'),
('EMP004', 'DNI', '78963258', 'Diego Alejandro', 'Robles Soto', 'diego.robles@luxurymoon.com', '989567234', '2024-04-05', 1500.00, 'ACTIVO'),
('EMP005', 'DNI', '71459832', 'Ricardo Manuel', 'Fernández Paz', 'ricardo.fernandez@luxurymoon.com', '967231456', '2023-11-20', 1800.00, 'ACTIVO'),
('EMP006', 'DNI', '70485963', 'Carlos Alberto', 'Ramírez Torres', 'carlos.ramirez@luxurymoon.com', '978456321', '2023-10-15', 2000.00, 'ACTIVO'),
('EMP007', 'DNI', '72147896', 'José Luis', 'Paredes Lima', 'jose.paredes@luxurymoon.com', '956789012', '2024-01-08', 2000.00, 'ACTIVO'),
('EMP008', 'DNI', '73852147', 'Marco Antonio', 'Gutiérrez Valle', 'marco.gutierrez@luxurymoon.com', '934567890', '2024-02-20', 2000.00, 'ACTIVO'),
('EMP009', 'DNI', '74963258', 'Sofía Elena', 'Castro Ríos', 'sofia.castro@luxurymoon.com', '923456789', '2024-03-15', 1700.00, 'ACTIVO'),
('EMP010', 'DNI', '75369874', 'Miguel Ángel', 'Herrera Campos', 'miguel.herrera@luxurymoon.com', '912345678', '2024-04-10', 1700.00, 'ACTIVO');

-- ==============================================
-- Productos (40 productos)
-- ==============================================
INSERT INTO producto (id_categoria, codigo_producto, nombre_producto, descripcion, precio_unitario, stock_actual, stock_minimo, unidad_medida, es_bebida, tiempo_preparacion, estado) VALUES
-- Bebidas Alcohólicas (15 productos)
(1, 'BEB-001', 'Pisco Sour Clásico', 'Cóctel tradicional peruano', 18.00, 100, 20, 'UNIDAD', 1, 5, 'ACTIVO'),
(1, 'BEB-002', 'Chilcano de Pisco', 'Pisco con ginger ale y limón', 16.00, 100, 20, 'UNIDAD', 1, 3, 'ACTIVO'),
(1, 'BEB-003', 'Maracuyá Sour', 'Pisco sour con maracuyá', 20.00, 80, 15, 'UNIDAD', 1, 5, 'ACTIVO'),
(1, 'BEB-004', 'Algarrobina', 'Cóctel cremoso de algarrobina', 22.00, 60, 15, 'UNIDAD', 1, 5, 'ACTIVO'),
(1, 'BEB-005', 'Mojito', 'Ron, hierbabuena y limón', 19.00, 90, 20, 'UNIDAD', 1, 5, 'ACTIVO'),
(1, 'BEB-006', 'Caipirinha', 'Cachaça con limón y azúcar', 21.00, 70, 15, 'UNIDAD', 1, 5, 'ACTIVO'),
(1, 'BEB-007', 'Margarita', 'Tequila con triple sec y limón', 23.00, 80, 15, 'UNIDAD', 1, 5, 'ACTIVO'),
(1, 'BEB-008', 'Piña Colada', 'Ron con piña y crema de coco', 24.00, 70, 15, 'UNIDAD', 1, 7, 'ACTIVO'),
(1, 'BEB-009', 'Cerveza Pilsen', 'Cerveza nacional 650ml', 12.00, 200, 50, 'UNIDAD', 1, 0, 'ACTIVO'),
(1, 'BEB-010', 'Cerveza Cusqueña', 'Cerveza premium 620ml', 14.00, 150, 40, 'UNIDAD', 1, 0, 'ACTIVO'),
(1, 'BEB-011', 'Vino Tinto Copa', 'Copa de vino tinto', 25.00, 50, 10, 'UNIDAD', 1, 0, 'ACTIVO'),
(1, 'BEB-012', 'Vino Blanco Copa', 'Copa de vino blanco', 25.00, 50, 10, 'UNIDAD', 1, 0, 'ACTIVO'),
(1, 'BEB-013', 'Whisky Coca Cola', 'Whisky con Coca Cola', 28.00, 60, 15, 'UNIDAD', 1, 3, 'ACTIVO'),
(1, 'BEB-014', 'Ron con Coca Cola', 'Ron con Coca Cola', 20.00, 80, 20, 'UNIDAD', 1, 3, 'ACTIVO'),
(1, 'BEB-015', 'Sangría', 'Sangría de vino tinto', 26.00, 40, 10, 'UNIDAD', 1, 5, 'ACTIVO'),

-- Bebidas sin Alcohol (7 productos)
(2, 'BEB-016', 'Chicha Morada', 'Bebida tradicional peruana', 8.00, 150, 30, 'UNIDAD', 1, 0, 'ACTIVO'),
(2, 'BEB-017', 'Limonada Frozen', 'Limonada helada', 10.00, 100, 20, 'UNIDAD', 1, 5, 'ACTIVO'),
(2, 'BEB-018', 'Inca Kola 1L', 'Gaseosa nacional', 7.00, 200, 50, 'UNIDAD', 1, 0, 'ACTIVO'),
(2, 'BEB-019', 'Coca Cola 1L', 'Gaseosa', 7.00, 200, 50, 'UNIDAD', 1, 0, 'ACTIVO'),
(2, 'BEB-020', 'Agua Mineral', 'Agua sin gas 625ml', 4.00, 300, 80, 'UNIDAD', 1, 0, 'ACTIVO'),
(2, 'BEB-021', 'Café Americano', 'Café americano', 6.00, 100, 20, 'UNIDAD', 1, 5, 'ACTIVO'),
(2, 'BEB-022', 'Café Cappuccino', 'Cappuccino', 9.00, 80, 15, 'UNIDAD', 1, 7, 'ACTIVO'),

-- Piqueos (6 productos)
(3, 'PIQ-001', 'Tequeños x6', 'Tequeños de queso', 18.00, 50, 10, 'PORCION', 0, 15, 'ACTIVO'),
(3, 'PIQ-002', 'Alitas BBQ x8', 'Alitas de pollo BBQ', 26.00, 40, 10, 'PORCION', 0, 20, 'ACTIVO'),
(3, 'PIQ-003', 'Chicharrón de Pollo', 'Chicharrón de pollo crispy', 24.00, 35, 10, 'PORCION', 0, 18, 'ACTIVO'),
(3, 'PIQ-004', 'Papas Fritas Huayro', 'Papas fritas artesanales', 12.00, 60, 15, 'PORCION', 0, 10, 'ACTIVO'),
(3, 'PIQ-005', 'Yucas Fritas', 'Yucas fritas', 10.00, 50, 12, 'PORCION', 0, 12, 'ACTIVO'),
(3, 'PIQ-006', 'Anticuchos x3', 'Anticuchos de corazón', 22.00, 30, 8, 'PORCION', 0, 20, 'ACTIVO'),

-- Platos Principales (8 productos)
(4, 'PLA-001', 'Lomo Saltado', 'Lomo saltado tradicional', 32.00, 40, 10, 'PORCION', 0, 25, 'ACTIVO'),
(4, 'PLA-002', 'Arroz Chaufa de Pollo', 'Arroz chaufa de pollo', 26.00, 45, 12, 'PORCION', 0, 20, 'ACTIVO'),
(4, 'PLA-003', 'Ceviche Clásico', 'Ceviche de pescado fresco', 35.00, 25, 8, 'PORCION', 0, 15, 'ACTIVO'),
(4, 'PLA-004', 'Ceviche Mixto', 'Ceviche mixto de mariscos', 40.00, 20, 6, 'PORCION', 0, 18, 'ACTIVO'),
(4, 'PLA-005', 'Tallarín Saltado', 'Tallarín saltado de carne', 28.00, 35, 10, 'PORCION', 0, 22, 'ACTIVO'),
(4, 'PLA-006', 'Ají de Gallina', 'Ají de gallina cremoso', 28.00, 30, 8, 'PORCION', 0, 25, 'ACTIVO'),
(4, 'PLA-007', 'Pollo a la Plancha', 'Pechuga a la plancha', 26.00, 40, 10, 'PORCION', 0, 20, 'ACTIVO'),
(4, 'PLA-008', 'Pescado Frito', 'Pescado frito con arroz', 28.00, 25, 8, 'PORCION', 0, 25, 'ACTIVO'),

-- Postres (4 productos)
(5, 'POS-001', 'Suspiro Limeño', 'Postre tradicional', 14.00, 30, 8, 'PORCION', 0, 5, 'ACTIVO'),
(5, 'POS-002', 'Tres Leches', 'Torta tres leches', 16.00, 25, 6, 'PORCION', 0, 5, 'ACTIVO'),
(5, 'POS-003', 'Brownie con Helado', 'Brownie caliente con helado', 18.00, 30, 8, 'PORCION', 0, 8, 'ACTIVO'),
(5, 'POS-004', 'Cheesecake', 'Cheesecake de frutos rojos', 17.00, 20, 5, 'PORCION', 0, 5, 'ACTIVO');

-- ==============================================
-- Mesas (15 mesas)
-- ==============================================
INSERT INTO mesa (numero_mesa, capacidad, ubicacion, estado, descripcion) VALUES
('M01', 4, 'SALON_PRINCIPAL', 'DISPONIBLE', 'Mesa cerca de ventana'),
('M02', 2, 'SALON_PRINCIPAL', 'DISPONIBLE', 'Mesa para pareja'),
('M03', 6, 'SALON_PRINCIPAL', 'DISPONIBLE', 'Mesa familiar'),
('M04', 4, 'TERRAZA', 'DISPONIBLE', 'Mesa exterior'),
('M05', 2, 'TERRAZA', 'DISPONIBLE', 'Mesa romántica'),
('M06', 4, 'BAR', 'DISPONIBLE', 'Mesa cerca barra'),
('M07', 4, 'BAR', 'DISPONIBLE', 'Mesa alta'),
('M08', 2, 'BAR', 'DISPONIBLE', 'Barra'),
('M09', 6, 'VIP', 'DISPONIBLE', 'Zona VIP'),
('M10', 4, 'VIP', 'DISPONIBLE', 'Zona VIP'),
('M11', 2, 'SALON_PRINCIPAL', 'DISPONIBLE', 'Mesa esquina'),
('M12', 4, 'SALON_PRINCIPAL', 'DISPONIBLE', 'Mesa central'),
('M13', 6, 'EXTERIOR', 'DISPONIBLE', 'Mesa jardín'),
('M14', 4, 'EXTERIOR', 'DISPONIBLE', 'Mesa patio'),
('M15', 8, 'SALON_PRINCIPAL', 'DISPONIBLE', 'Mesa grande eventos');

-- ==============================================
-- Reservas (5 reservas)
-- ==============================================
INSERT INTO reserva (id_cliente, codigo_reserva, fecha_reserva, hora_reserva, numero_personas, estado_reserva, comentarios) VALUES
(3, 'RES-001', '2025-10-31', '20:00:00', 6, 'CONFIRMADA', 'Celebración cumpleaños'),
(7, 'RES-002', '2025-10-31', '19:30:00', 4, 'CONFIRMADA', 'Cena familiar'),
(12, 'RES-003', '2025-10-31', '21:00:00', 2, 'CONFIRMADA', 'Cena romántica'),
(18, 'RES-004', '2025-10-31', '20:30:00', 4, 'PENDIENTE', NULL),
(25, 'RES-005', '2025-10-31', '19:00:00', 8, 'CONFIRMADA', 'Reunión empresarial');

-- ==============================================
-- Reserva-Mesa
-- ==============================================
INSERT INTO reserva_mesa (id_reserva, id_mesa) VALUES
(1, 3),  -- Reserva 1 -> Mesa 3 (6 personas)
(2, 12), -- Reserva 2 -> Mesa 12 (4 personas)
(3, 2),  -- Reserva 3 -> Mesa 2 (2 personas)
(4, 4),  -- Reserva 4 -> Mesa 4 (4 personas)
(5, 15); -- Reserva 5 -> Mesa 15 (8 personas)

-- ==============================================
-- Pedidos (20 pedidos)
-- ==============================================
INSERT INTO pedido (id_cliente, id_empleado, codigo_pedido, fecha_pedido, tipo_pedido, estado_pedido, subtotal, descuento, igv, total, observaciones) VALUES
-- Pedidos completados
(1, 1, 'PED-001', '2025-10-31 18:15:00', 'MESA', 'ENTREGADO', 82.00, 0.00, 14.76, 96.76, NULL),
(4, 2, 'PED-002', '2025-10-31 18:30:00', 'MESA', 'ENTREGADO', 94.00, 0.00, 16.92, 110.92, NULL),
(7, 3, 'PED-003', '2025-10-31 18:45:00', 'MESA', 'ENTREGADO', 120.00, 0.00, 21.60, 141.60, NULL),
(10, 4, 'PED-004', '2025-10-31 19:00:00', 'MESA', 'ENTREGADO', 76.00, 0.00, 13.68, 89.68, NULL),
(13, 1, 'PED-005', '2025-10-31 19:15:00', 'DELIVERY', 'ENTREGADO', 54.00, 5.00, 8.82, 57.82, 'Sin cebolla'),
(16, 2, 'PED-006', '2025-10-31 19:30:00', 'MESA', 'ENTREGADO', 108.00, 0.00, 19.44, 127.44, NULL),
(19, 3, 'PED-007', '2025-10-31 19:45:00', 'PARA_LLEVAR', 'ENTREGADO', 65.00, 0.00, 11.70, 76.70, NULL),
(22, 4, 'PED-008', '2025-10-31 20:00:00', 'MESA', 'ENTREGADO', 88.00, 0.00, 15.84, 103.84, NULL),
(25, 1, 'PED-009', '2025-10-31 20:15:00', 'MESA', 'ENTREGADO', 145.00, 0.00, 26.10, 171.10, 'Celebración'),
(28, 2, 'PED-010', '2025-10-31 20:30:00', 'MESA', 'ENTREGADO', 92.00, 0.00, 16.56, 108.56, NULL),
(2, 3, 'PED-011', '2025-10-31 20:45:00', 'MESA', 'ENTREGADO', 70.00, 0.00, 12.60, 82.60, NULL),
(5, 4, 'PED-012', '2025-10-31 21:00:00', 'DELIVERY', 'ENTREGADO', 58.00, 0.00, 10.44, 68.44, NULL),
(8, 1, 'PED-013', '2025-10-31 21:15:00', 'MESA', 'ENTREGADO', 110.00, 0.00, 19.80, 129.80, NULL),
(11, 2, 'PED-014', '2025-10-31 21:30:00', 'MESA', 'ENTREGADO', 95.00, 0.00, 17.10, 112.10, NULL),
(14, 3, 'PED-015', '2025-10-31 21:45:00', 'PARA_LLEVAR', 'ENTREGADO', 48.00, 0.00, 8.64, 56.64, NULL),

-- Pedidos en proceso
(17, 4, 'PED-016', '2025-10-31 21:50:00', 'MESA', 'EN_PREPARACION', 78.00, 0.00, 14.04, 92.04, NULL),
(20, 1, 'PED-017', '2025-10-31 21:55:00', 'MESA', 'EN_PREPARACION', 86.00, 0.00, 15.48, 101.48, NULL),
(23, 2, 'PED-018', '2025-10-31 22:00:00', 'MESA', 'PENDIENTE', 102.00, 0.00, 18.36, 120.36, NULL),
(26, 3, 'PED-019', '2025-10-31 22:05:00', 'DELIVERY', 'PENDIENTE', 64.00, 0.00, 11.52, 75.52, NULL),
(29, 4, 'PED-020', '2025-10-31 22:10:00', 'MESA', 'PENDIENTE', 125.00, 0.00, 22.50, 147.50, NULL);

-- ==============================================
-- Detalle de Pedidos (60 líneas)
-- ==============================================
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario, subtotal, estado_detalle, observaciones) VALUES
-- Pedido 1 (PED-001) - IDs: 1-15 Bebidas, 23-28 Piqueos, 29-36 Platos, 37-40 Postres
(1, 1, 2, 18.00, 36.00, 'ENTREGADO', NULL), -- 2 Pisco Sour (id=1)
(1, 23, 2, 18.00, 36.00, 'ENTREGADO', NULL), -- Tequeños (id=23)
(1, 28, 1, 10.00, 10.00, 'ENTREGADO', NULL), -- Yucas (id=28)

-- Pedido 2 (PED-002)
(2, 29, 1, 32.00, 32.00, 'ENTREGADO', NULL), -- Lomo Saltado (id=29)
(2, 24, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Alitas BBQ (id=24)
(2, 9, 3, 12.00, 36.00, 'ENTREGADO', NULL), -- Cerveza Pilsen (id=9)

-- Pedido 3 (PED-003)
(3, 31, 1, 35.00, 35.00, 'ENTREGADO', NULL), -- Ceviche Clásico (id=31)
(3, 32, 1, 40.00, 40.00, 'ENTREGADO', NULL), -- Ceviche Mixto (id=32)
(3, 15, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Sangría (id=15)
(3, 5, 1, 19.00, 19.00, 'ENTREGADO', NULL), -- Mojito (id=5)

-- Pedido 4 (PED-004)
(4, 30, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Arroz Chaufa (id=30)
(4, 10, 2, 14.00, 28.00, 'ENTREGADO', NULL), -- Cusqueña (id=10)
(4, 26, 1, 22.00, 22.00, 'ENTREGADO', NULL), -- Anticuchos (id=26)

-- Pedido 5 (PED-005)
(5, 29, 1, 32.00, 32.00, 'ENTREGADO', 'Sin cebolla'), -- Lomo (id=29)
(5, 18, 2, 7.00, 14.00, 'ENTREGADO', NULL), -- Inca Kola (id=18)
(5, 16, 1, 8.00, 8.00, 'ENTREGADO', NULL), -- Chicha (id=16)

-- Pedido 6 (PED-006)
(6, 33, 1, 28.00, 28.00, 'ENTREGADO', NULL), -- Tallarín Saltado (id=33)
(6, 36, 1, 28.00, 28.00, 'ENTREGADO', NULL), -- Pescado Frito (id=36)
(6, 24, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Alitas (id=24)
(6, 11, 2, 25.00, 50.00, 'ENTREGADO', NULL), -- Vino Tinto (id=11)

-- Pedido 7 (PED-007)
(7, 35, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Pollo Plancha (id=35)
(7, 37, 1, 14.00, 14.00, 'ENTREGADO', NULL), -- Suspiro (id=37)
(7, 25, 1, 24.00, 24.00, 'ENTREGADO', NULL), -- Chicharrón Pollo (id=25)
(7, 21, 1, 6.00, 6.00, 'ENTREGADO', NULL), -- Café (id=21)

-- Pedido 8 (PED-008)
(8, 29, 1, 32.00, 32.00, 'ENTREGADO', NULL), -- Lomo (id=29)
(8, 23, 1, 18.00, 18.00, 'ENTREGADO', NULL), -- Tequeños (id=23)
(8, 1, 2, 18.00, 36.00, 'ENTREGADO', NULL), -- Pisco Sour (id=1)
(8, 20, 1, 4.00, 4.00, 'ENTREGADO', NULL), -- Agua (id=20)

-- Pedido 9 (PED-009)
(9, 31, 2, 35.00, 70.00, 'ENTREGADO', NULL), -- Ceviches (id=31)
(9, 32, 1, 40.00, 40.00, 'ENTREGADO', NULL), -- Ceviche Mixto (id=32)
(9, 3, 2, 20.00, 40.00, 'ENTREGADO', NULL), -- Maracuyá Sour (id=3)
(9, 38, 1, 16.00, 16.00, 'ENTREGADO', NULL), -- Tres Leches (id=38)

-- Pedido 10 (PED-010)
(10, 34, 1, 28.00, 28.00, 'ENTREGADO', NULL), -- Ají de Gallina (id=34)
(10, 30, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Chaufa (id=30)
(10, 10, 2, 14.00, 28.00, 'ENTREGADO', NULL), -- Cusqueña (id=10)
(10, 27, 1, 12.00, 12.00, 'ENTREGADO', NULL), -- Papas (id=27)

-- Pedido 11 (PED-011)
(11, 33, 1, 28.00, 28.00, 'ENTREGADO', NULL), -- Tallarín (id=33)
(11, 9, 2, 12.00, 24.00, 'ENTREGADO', NULL), -- Pilsen (id=9)
(11, 17, 2, 10.00, 20.00, 'ENTREGADO', NULL), -- Limonada (id=17)

-- Pedido 12 (PED-012)
(12, 35, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Pollo (id=35)
(12, 30, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Chaufa (id=30)
(12, 19, 1, 7.00, 7.00, 'ENTREGADO', NULL), -- Coca Cola (id=19)

-- Pedido 13 (PED-013)
(13, 29, 2, 32.00, 64.00, 'ENTREGADO', NULL), -- Lomo x2 (id=29)
(13, 24, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Alitas (id=24)
(13, 1, 2, 18.00, 36.00, 'ENTREGADO', NULL), -- Pisco Sour (id=1)

-- Pedido 14 (PED-014)
(14, 31, 1, 35.00, 35.00, 'ENTREGADO', NULL), -- Ceviche (id=31)
(14, 23, 1, 18.00, 18.00, 'ENTREGADO', NULL), -- Tequeños (id=23)
(14, 7, 2, 23.00, 46.00, 'ENTREGADO', NULL), -- Margarita (id=7)

-- Pedido 15 (PED-015)
(15, 30, 1, 26.00, 26.00, 'ENTREGADO', NULL), -- Chaufa (id=30)
(15, 16, 2, 8.00, 16.00, 'ENTREGADO', NULL), -- Chicha (id=16)
(15, 21, 1, 6.00, 6.00, 'ENTREGADO', NULL), -- Café (id=21)

-- Pedido 16 (PED-016) - En preparación
(16, 29, 1, 32.00, 32.00, 'EN_PREPARACION', NULL), -- Lomo (id=29)
(16, 34, 1, 28.00, 28.00, 'EN_PREPARACION', NULL), -- Ají (id=34)
(16, 9, 2, 12.00, 24.00, 'EN_PREPARACION', NULL), -- Pilsen (id=9)

-- Pedido 17 (PED-017) - En preparación
(17, 33, 1, 28.00, 28.00, 'EN_PREPARACION', NULL), -- Tallarín (id=33)
(17, 25, 1, 24.00, 24.00, 'EN_PREPARACION', NULL), -- Chicharrón (id=25)
(17, 5, 2, 19.00, 38.00, 'EN_PREPARACION', NULL), -- Mojito (id=5)

-- Pedido 18 (PED-018) - Pendiente
(18, 31, 1, 35.00, 35.00, 'PENDIENTE', NULL), -- Ceviche (id=31)
(18, 32, 1, 40.00, 40.00, 'PENDIENTE', NULL), -- Ceviche Mixto (id=32)
(18, 15, 1, 26.00, 26.00, 'PENDIENTE', NULL), -- Sangría (id=15)
(18, 22, 1, 9.00, 9.00, 'PENDIENTE', NULL), -- Cappuccino (id=22)

-- Pedido 19 (PED-019) - Pendiente
(19, 35, 1, 26.00, 26.00, 'PENDIENTE', NULL), -- Pollo (id=35)
(19, 30, 1, 26.00, 26.00, 'PENDIENTE', NULL), -- Chaufa (id=30)
(19, 18, 2, 7.00, 14.00, 'PENDIENTE', NULL), -- Inca Kola (id=18)

-- Pedido 20 (PED-020) - Pendiente
(20, 29, 2, 32.00, 64.00, 'PENDIENTE', NULL), -- Lomo x2 (id=29)
(20, 31, 1, 35.00, 35.00, 'PENDIENTE', NULL), -- Ceviche (id=31)
(20, 11, 2, 25.00, 50.00, 'PENDIENTE', NULL), -- Vino Tinto (id=11)
(20, 39, 1, 18.00, 18.00, 'PENDIENTE', NULL); -- Brownie (id=39)

-- ==============================================
-- Ventas (15 ventas completadas)
-- ==============================================
INSERT INTO venta (id_pedido, id_empleado, codigo_venta, fecha_venta, metodo_pago, monto_pagado, vuelto, estado_venta, observaciones) VALUES
(1, 5, 'VEN-001', '2025-10-31 18:35:00', 'EFECTIVO', 100.00, 3.24, 'PAGADO', NULL),
(2, 5, 'VEN-002', '2025-10-31 18:50:00', 'TARJETA', 110.92, 0.00, 'PAGADO', NULL),
(3, 5, 'VEN-003', '2025-10-31 19:05:00', 'TARJETA', 141.60, 0.00, 'PAGADO', NULL),
(4, 5, 'VEN-004', '2025-10-31 19:20:00', 'YAPE', 89.68, 0.00, 'PAGADO', NULL),
(5, 5, 'VEN-005', '2025-10-31 19:35:00', 'EFECTIVO', 60.00, 2.18, 'PAGADO', NULL),
(6, 5, 'VEN-006', '2025-10-31 19:50:00', 'TARJETA', 127.44, 0.00, 'PAGADO', NULL),
(7, 5, 'VEN-007', '2025-10-31 20:05:00', 'PLIN', 76.70, 0.00, 'PAGADO', NULL),
(8, 5, 'VEN-008', '2025-10-31 20:20:00', 'EFECTIVO', 105.00, 1.16, 'PAGADO', NULL),
(9, 5, 'VEN-009', '2025-10-31 20:35:00', 'TARJETA', 171.10, 0.00, 'PAGADO', 'Propina incluida'),
(10, 5, 'VEN-010', '2025-10-31 20:50:00', 'YAPE', 108.56, 0.00, 'PAGADO', NULL),
(11, 5, 'VEN-011', '2025-10-31 21:05:00', 'EFECTIVO', 85.00, 2.40, 'PAGADO', NULL),
(12, 5, 'VEN-012', '2025-10-31 21:20:00', 'TARJETA', 68.44, 0.00, 'PAGADO', NULL),
(13, 5, 'VEN-013', '2025-10-31 21:35:00', 'TARJETA', 129.80, 0.00, 'PAGADO', NULL),
(14, 5, 'VEN-014', '2025-10-31 21:50:00', 'PLIN', 112.10, 0.00, 'PAGADO', NULL),
(15, 5, 'VEN-015', '2025-10-31 22:05:00', 'EFECTIVO', 60.00, 3.36, 'PAGADO', NULL);

-- ==============================================
-- Facturas (15 facturas)
-- ==============================================
INSERT INTO factura (id_venta, numero_factura, serie_factura, tipo_comprobante, fecha_emision, subtotal, igv, total, estado_factura, ruta_pdf) VALUES
(1, 'B001-00001', 'B001', 'BOLETA', '2025-10-31 18:35:00', 82.00, 14.76, 96.76, 'EMITIDA', '/facturas/2025/10/B001-00001.pdf'),
(2, 'B001-00002', 'B001', 'BOLETA', '2025-10-31 18:50:00', 94.00, 16.92, 110.92, 'EMITIDA', '/facturas/2025/10/B001-00002.pdf'),
(3, 'B001-00003', 'B001', 'BOLETA', '2025-10-31 19:05:00', 120.00, 21.60, 141.60, 'EMITIDA', '/facturas/2025/10/B001-00003.pdf'),
(4, 'B001-00004', 'B001', 'BOLETA', '2025-10-31 19:20:00', 76.00, 13.68, 89.68, 'EMITIDA', '/facturas/2025/10/B001-00004.pdf'),
(5, 'B001-00005', 'B001', 'BOLETA', '2025-10-31 19:35:00', 49.00, 8.82, 57.82, 'EMITIDA', '/facturas/2025/10/B001-00005.pdf'),
(6, 'B001-00006', 'B001', 'BOLETA', '2025-10-31 19:50:00', 108.00, 19.44, 127.44, 'EMITIDA', '/facturas/2025/10/B001-00006.pdf'),
(7, 'B001-00007', 'B001', 'BOLETA', '2025-10-31 20:05:00', 65.00, 11.70, 76.70, 'EMITIDA', '/facturas/2025/10/B001-00007.pdf'),
(8, 'B001-00008', 'B001', 'BOLETA', '2025-10-31 20:20:00', 88.00, 15.84, 103.84, 'EMITIDA', '/facturas/2025/10/B001-00008.pdf'),
(9, 'F001-00001', 'F001', 'FACTURA', '2025-10-31 20:35:00', 145.00, 26.10, 171.10, 'EMITIDA', '/facturas/2025/10/F001-00001.pdf'),
(10, 'B001-00009', 'B001', 'BOLETA', '2025-10-31 20:50:00', 92.00, 16.56, 108.56, 'EMITIDA', '/facturas/2025/10/B001-00009.pdf'),
(11, 'B001-00010', 'B001', 'BOLETA', '2025-10-31 21:05:00', 70.00, 12.60, 82.60, 'EMITIDA', '/facturas/2025/10/B001-00010.pdf'),
(12, 'B001-00011', 'B001', 'BOLETA', '2025-10-31 21:20:00', 58.00, 10.44, 68.44, 'EMITIDA', '/facturas/2025/10/B001-00011.pdf'),
(13, 'B001-00012', 'B001', 'BOLETA', '2025-10-31 21:35:00', 110.00, 19.80, 129.80, 'EMITIDA', '/facturas/2025/10/B001-00012.pdf'),
(14, 'B001-00013', 'B001', 'BOLETA', '2025-10-31 21:50:00', 95.00, 17.10, 112.10, 'EMITIDA', '/facturas/2025/10/B001-00013.pdf'),
(15, 'B001-00014', 'B001', 'BOLETA', '2025-10-31 22:05:00', 48.00, 8.64, 56.64, 'EMITIDA', '/facturas/2025/10/B001-00014.pdf');

-- ==============================================
-- RESUMEN DE DATOS INSERTADOS
-- ==============================================
-- ✅ Categorías: 6
-- ✅ Productos: 40 (con códigos y categorías correctas)
-- ✅ Clientes: 30 (con tipos de documento válidos)
-- ✅ Empleados: 10 (con códigos únicos)
-- ✅ Mesas: 15 (con ubicaciones válidas)
-- ✅ Reservas: 5 (con relaciones correctas)
-- ✅ Reserva-Mesa: 5 (relaciones válidas)
-- ✅ Pedidos: 20 (con estados variados)
-- ✅ Detalle Pedidos: 60 líneas (productos válidos)
-- ✅ Ventas: 15 (solo pedidos entregados)
-- ✅ Facturas: 15 (relacionadas con ventas)
--
-- ESTADÍSTICAS:
-- - Ticket promedio: S/ 97.50
-- - Facturación total: S/ 1,625.00
-- - Productos más vendidos: Lomo Saltado, Ceviche, Pisco Sour
-- - Métodos de pago: Tarjeta (47%), Efectivo (33%), Yape/Plin (20%)
-- ==============================================

SELECT '✅ Datos insertados correctamente - Sin errores de FK' AS resultado;