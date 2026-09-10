-- =========================================================
-- RetailPro - Módulo 5
-- Pre-entrega: Consultas con JOINs para el proyecto
-- Archivo: m5_consultas_joins.sql
--Autor: Delfina Godoy
-- =========================================================

-- CONSULTA 1 - VISTA BASE DEL PROYECTO
-- INNER JOIN
-- =========================================================
-- Objetivo:Crear una vista enriquecida de cada venta combinando
-- información de clientes, productos, categorías,
-- territorios, canales y vendedores.
-- Esta consulta podrá utilizarse luego como fuente en Power BI.

USE Ventas_Tech_DB;

SELECT
    v.id_venta,
    v.fecha_venta,

    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email AS email_cliente,
    c.ciudad AS ciudad_cliente,

    p.id_producto,
    p.nombre_producto,

    cat.nombre_categoria AS categoria,

    t.region,
    t.ciudad_zona,

    ca.nombre_canal,

    ve.nombre_vendedor,
    ve.equipo_sucursal,

    v.cantidad,
    v.precio_unitario,

    v.cantidad * v.precio_unitario AS total_venta

FROM ventas AS v

INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente

INNER JOIN productos AS p
    ON v.id_producto = p.id_producto

INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria

INNER JOIN territorios AS t
    ON v.id_territorio = t.id_territorio

INNER JOIN canales AS ca
    ON v.id_canal = ca.id_canal

INNER JOIN vendedores AS ve
    ON v.id_vendedor = ve.id_vendedor;

    -- =========================================================
-- CONSULTA 2 - CLIENTES SIN VENTAS
-- LEFT JOIN + IS NULL
-- =========================================================
-- Objetivo: Identificar clientes registrados que todavía no realizaron ninguna compra.


SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- =========================================================
-- CONSULTA 3 - PRODUCTOS SIN VENTAS
-- LEFT JOIN + IS NULL
-- =========================================================
-- Objetivo:
-- Identificar productos del catálogo que todavía
-- no registran ninguna venta.


SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio

FROM productos AS p

INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria

LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto

WHERE v.id_venta IS NULL;

-- CONSULTA 4: CONSOLIDADO POR CANAL / ORIGEN
-- Utilice UNION ALL para conservar todas las ventas.
-- Separe las ventas en dos períodos (primera y segunda mitad de marzo) y cree manualmente la columna "canal"

SELECT
    canal,
    SUM(total) AS total_ventas
FROM (
    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Primera mitad de marzo' AS canal
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Segunda mitad de marzo' AS canal
    FROM ventas
    WHERE fecha_venta > '2024-03-10'
) AS ventas_consolidadas
GROUP BY canal;