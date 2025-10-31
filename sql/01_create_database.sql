-- ==============================================
-- Archivo: 01_create_schema.sql
-- Descripción: Crea la base de datos luxury_moon_db

-- ==============================================

-- Elimina la base si ya existe (solo para entornos de desarrollo)
DROP DATABASE IF EXISTS luxury_moon_db;

-- Crea la base de datos con el juego de caracteres adecuado
CREATE DATABASE luxury_moon_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

-- Selecciona el esquema para usarlo en los siguientes scripts
USE luxury_moon_db;

-- ==============================================
-- Confirmación final
-- ==============================================
-- 01_create_database.sql
SELECT '✅ Base de datos luxury_moon_db creada exitosamente' AS resultado;
