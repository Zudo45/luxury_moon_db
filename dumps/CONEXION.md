# Conexión al contenedor MySQL - Luxury Moon

Este documento explica cómo conectarse al contenedor Docker de MySQL para el proyecto Luxury Moon y cómo empezar a trabajar con la base de datos `luxury_moon_db`.

---

## Parámetros de Conexión

- **Host:** localhost  
- **Puerto:** 3307  
- **Usuario:** root  
- **Contraseña:** root123  
- **Base de datos:** luxury_moon_db  

> Nota: El puerto 3307 es el que mapea tu máquina al contenedor. Internamente MySQL sigue usando el puerto 3306.

---

## Levantar el Contenedor Docker

1. Clonar el repositorio:

```bash
git clone <URL_DEL_REPO>
cd <CARPETA_DEL_REPO>
