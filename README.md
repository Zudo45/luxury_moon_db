# Luxury Moon DB

📍 **Proyecto:** Base de datos del Restobar Luxury Moon  
📍 **Ubicación:** La Libertad 998  
📍 **Objetivo:** Gestionar ventas, pedidos, reservas y empleados de manera automatizada y eficiente.

---

## 📂 Estructura del proyecto

tree 


- `docker-compose.yml` → Configuración del contenedor MySQL.
- `mysql/my.cnf` → Configuración personalizada del servidor MySQL.
- `mysql/initdb/` → Scripts SQL para inicializar la base de datos:
  1. `01_create_database.sql` → Crea la base de datos.
  2. `02_create_tables.sql` → Crea las tablas.
  3. `03_constraints.sql` → Aplica restricciones y llaves foráneas.
  4. `04_indexes.sql` → Crea índices para optimización.
  5. `05_seed_data.sql` → Inserta datos iniciales.
  6. `06_views_procedures.sql` → Crea vistas y procedimientos almacenados.

---

## 🚀 Levantar el proyecto con Docker

1. Construir y levantar contenedores:

```bash
docker-compose up -d
