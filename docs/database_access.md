# 🔐 Acceso y credenciales de la base de datos `luxury_moon_db`

Este documento describe los usuarios, contraseñas y propósitos de acceso definidos para la base de datos del sistema **Restobar Luxury Moon** desplegada mediante **Docker Compose**.

---

## Contexto del despliegue

Durante la inicialización del contenedor `mysql` se crean automáticamente dos cuentas:

1. Un usuario **administrador (`root`)**, con todos los privilegios sobre el servidor MySQL.
2. Un usuario **de aplicación (`luxury_admin`)**, con permisos restringidos a la base de datos `luxury_moon_db`.

Estos valores se definen en el archivo [`docker-compose.yml`](../docker-compose.yml) dentro del servicio `mysql`.

---

## 👤 Usuarios configurados

| Rol / Propósito | Usuario | Contraseña | Base de datos | Privilegios | Uso recomendado |
|------------------|----------|-------------|----------------|--------------|------------------|
| **Administrador** | `root` | `LuxuryMoon2025!Root` | Todas | Total (GRANT ALL) | Administración general, ejecución de scripts SQL, mantenimiento, restauración de respaldos. |
| **Aplicación** | `luxury_admin` | `Luxury@2025Pass` | `luxury_moon_db` | Limitado (solo CRUD) | Conexión desde la aplicación o herramientas externas (phpMyAdmin, API, etc.). |

---

## Conexión desde la terminal

### Acceso como administrador:
```bash
docker exec -it luxury_moon_db mysql -u root -p
# Contraseña: LuxuryMoon2025!Root

docker exec -it luxury_moon_db mysql -u luxury_admin -p luxury_moon_db
# Contraseña: Luxury@2025Pass
