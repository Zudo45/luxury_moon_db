-- ===============================================
-- 00_master_init.sql
-- Orquestador principal del esquema luxury_moon_db
-- ===============================================

-- Crear la base de datos
SOURCE /docker-entrypoint-initdb.d/sql/01_create_database.sql;

-- Crear las tablas base
SOURCE /docker-entrypoint-initdb.d/sql/02_create_tables.sql;

-- Aplicar restricciones y claves foráneas
SOURCE /docker-entrypoint-initdb.d/sql/03_constraints.sql;

-- Crear índices y optimizaciones
SOURCE /docker-entrypoint-initdb.d/sql/04_indexes.sql;

-- Insertar datos iniciales (seed)
SOURCE /docker-entrypoint-initdb.d/sql/05_seed_data.sql;

-- Definir vistas y procedimientos almacenados
SOURCE /docker-entrypoint-initdb.d/sql/06_views_procedures.sql;

-- ✅ Finalización
SELECT 'Base de datos luxury_moon_db creada e inicializada correctamente.' AS status;
