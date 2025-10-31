# Configuración SSL/TLS para MySQL — Luxury Moon

## 1) Generar certificados (en la raíz del repo)
```bash
mkdir -p docker/mysql/certs
cd docker/mysql/certs
openssl genrsa 2048 > ca-key.pem
openssl req -new -x509 -nodes -days 3650 -key ca-key.pem -out ca.pem
openssl req -newkey rsa:2048 -days 3650 -nodes -keyout server-key.pem -out server-req.pem
openssl x509 -req -in server-req.pem -days 3650 -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem
