
##  Vistas (Views)

- **vw_catalogo_productos**: Catálogo de productos con precios y estado.
- **vw_pedidos_detallados**: Pedidos con información de cliente y mesero.
- **vw_detalle_pedidos_expandido**: Detalle completo de cada pedido.
- **vw_ventas_completas**: Ventas con información de facturación y empleado.
- **vw_estado_mesas**: Estado actual de todas las mesas.
- **vw_reservas_activas**: Reservas futuras con detalles de contacto.
- **vw_productos_mas_vendidos**: Ranking de productos por ventas.
- **vw_rendimiento_empleados**: Desempeño de meseros.
- **vw_reporte_ventas_diarias**: Reporte diario de ventas.
- **vw_clientes_frecuentes**: Top clientes y análisis de lealtad.

---

## ⚙️ Procedimientos Almacenados (Stored Procedures)

- **sp_registrar_pedido**: Crea un pedido con validaciones.
- **sp_agregar_detalle_pedido**: Agrega productos automáticamente a un pedido.
- **sp_procesar_venta**: Procesa una venta y genera factura opcional.
- **sp_crear_reserva**: Crea una reserva y asigna mesa.
- **sp_cambiar_estado_mesa**: Gestiona el estado de las mesas.
- **sp_actualizar_estado_pedido**: Controla el flujo de pedidos.
- **sp_reporte_ventas_rango**: Genera reportes de ventas por fecha.
- **sp_productos_por_categoria**: Filtra productos por categoría.
- **sp_cancelar_reserva**: Cancela una reserva y libera mesas.
- **sp_dashboard_diario**: Genera un dashboard con métricas del día.

---

> 🔹 Nota: Todos los procedimientos incluyen manejo de transacciones y validaciones robustas.  
> 🔹 Las vistas están optimizadas para reportes y consultas frecuentes del negocio.
