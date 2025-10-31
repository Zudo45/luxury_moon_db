-- Crear roles
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'lectura_escritura';
CREATE ROLE IF NOT EXISTS 'solo_lectura';

-- Asignar permisos a roles
GRANT ALL PRIVILEGES ON luxury_moon_db.* TO 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON luxury_moon_db.* TO 'lectura_escritura';
GRANT SELECT ON luxury_moon_db.* TO 'solo_lectura';

-- Crear usuarios y asignar roles
CREATE USER IF NOT EXISTS 'darli_admin'@'%' IDENTIFIED BY 'TuPasswordSegura1!';
GRANT 'admin' TO 'darli_admin';

CREATE USER IF NOT EXISTS 'usuario_rw'@'%' IDENTIFIED BY 'PasswordRW1!';
GRANT 'lectura_escritura' TO 'usuario_rw';

CREATE USER IF NOT EXISTS 'usuario_ro'@'%' IDENTIFIED BY 'PasswordRO1!';
GRANT 'solo_lectura' TO 'usuario_ro';

-- Aplicar cambios
FLUSH PRIVILEGES;

SELECT '✅ Roles y usuarios creados correctamente' AS resultado;
