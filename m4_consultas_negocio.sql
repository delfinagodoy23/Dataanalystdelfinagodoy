-- ============================================================
-- TechStore - M4 Consultas de Negocio
-- Base de datos: Ventas_Tech_DB
-- Autor: Delfina Godoy
--Fecha: 01/09/2026
-- ============================================================


USE Ventas_Tech_DB;

-- CONSULTA 1 — RESUMEN EJECUTIVO MENSUAL

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;



-- CONSULTA 2 — RANKING DE PRODUCTOS

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- CONSULTA 3 — CLIENTES RECURRENTES

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


-- CONSULTA 4 — MESES POR ENCIMA/POR DEBAJO DEL PROMEDIO

WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
  CASE
  WHEN total_facturado >
  (SELECT AVG(total_facturado)
    FROM facturacion_mensual)
   THEN 'Por encima'

  WHEN total_facturado <
             (SELECT AVG(total_facturado)
              FROM facturacion_mensual)
        THEN 'Por debajo'

        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;


-- ============================================================
-- HALLAZGOS
-- ============================================================

-- 1. En marzo se realizaron 10 pedidos y se facturaron
--    $6.444 en total, con un ticket promedio de $644,40.

-- 2. El id_producto = 1 fue el producto con mayor facturación,
--    generando $3.600 con 3 unidades vendidas.

-- 3. Todos los clientes realizaron más de un pedido. 2 cada uno.