-- TechStore - Base de Datos Ventas_Tech_DB
-- Autor: Delfina Godoy
-- Fecha:  25/08/2026
-- CREAR BASE DE DATOS

CREATE DATABASE Ventas_Tech_DB;

-- SECCION DDL
-- DROP TABLES

USE Ventas_Tech_DB;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS territorios;
DROP TABLE IF EXISTS canales;
DROP TABLE IF EXISTS vendedores;

-- CREATE TABLE: categorias

CREATE TABLE categorias(
id_categoria INT PRIMARY KEY,
nombre_categoria VARCHAR (50) NOT NULL,
descripcion VARCHAR (200)
);

-- CREATE TABLE: clientes

CREATE TABLE clientes (
id_cliente INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
ciudad VARCHAR(50),
fecha_registro DATE NOT NULL
);

-- CREATE TABLE: productos

CREATE TABLE productos (
id_producto INT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT,
precio DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
activo TINYINT DEFAULT 1,
FOREIGN KEY (id_categoria)
REFERENCES categorias(id_categoria)
);

-- CREATE TABLE: territorios
CREATE TABLE territorios (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    ciudad_zona VARCHAR(100) NOT NULL
);


-- CREATE TABLE: canales

CREATE TABLE canales (
    id_canal INT PRIMARY KEY,
    nombre_canal VARCHAR(50) NOT NULL
);


-- CREATE TABLE: vendedores
CREATE TABLE vendedores (
    id_vendedor INT PRIMARY KEY,
    nombre_vendedor VARCHAR(100) NOT NULL,
    equipo_sucursal VARCHAR(100)
);

-- CREATE TABLE: ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    id_territorio INT,
    id_canal INT,
    id_vendedor INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),

    FOREIGN KEY (id_territorio)
        REFERENCES territorios(id_territorio),

    FOREIGN KEY (id_canal)
        REFERENCES canales(id_canal),

    FOREIGN KEY (id_vendedor)
        REFERENCES vendedores(id_vendedor)
);



-- SECCION DML

-- INSERT: territorios

INSERT INTO territorios VALUES (1, 'Centro', 'Buenos Aires');

INSERT INTO territorios VALUES (2, 'Centro', 'Córdoba');

INSERT INTO territorios VALUES (3, 'Litoral', 'Rosario');

INSERT INTO territorios VALUES (4, 'Cuyo', 'Mendoza');

INSERT INTO territorios VALUES (5, 'Norte', 'Tucumán');


-- INSERT: canales

INSERT INTO canales VALUES (1, 'Online');

INSERT INTO canales VALUES (2, 'Tienda Física');

INSERT INTO canales VALUES (3, 'Telefónico');


-- INSERT: vendedores

INSERT INTO vendedores VALUES (1, 'Sofía Martínez', 'Sucursal Buenos Aires');

INSERT INTO vendedores VALUES (2, 'Lucas Fernández', 'Sucursal Córdoba');

INSERT INTO vendedores VALUES (3, 'Valentina Gómez', 'Sucursal Rosario');

INSERT INTO vendedores VALUES (4, 'Mateo Rodríguez', 'Sucursal Mendoza');

INSERT INTO vendedores VALUES (5, 'Camila López', 'Sucursal Tucumán');

-- INSERT: categorias

INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');

INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');

INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');

INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

-- INSERT: clientes

INSERT INTO clientes VALUES (1, 'María López', 'maria@mail.com', 'Buenos Aires', '2024-01-05');

INSERT INTO clientes VALUES (2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10');

INSERT INTO clientes VALUES (3, 'Ana Gómez', 'ana@mail.com', 'Rosario', '2024-02-01');

INSERT INTO clientes VALUES (4, 'Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15');

INSERT INTO clientes VALUES (5, 'Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');

-- INSERT: productos

INSERT INTO productos VALUES (1, 'Laptop Pro 15', 1, 1200.00, 15, 1);

INSERT INTO productos VALUES (2, 'Mouse Inalámbrico', 2, 28.00, 80, 1);

INSERT INTO productos VALUES (3, 'Monitor 4K 27"', 1, 450.00, 12, 1);

INSERT INTO productos VALUES (4, 'Auriculares BT Pro', 3, 120.00, 35, 1);

INSERT INTO productos VALUES (5, 'SSD Externo 1TB', 4, 130.00, 18, 1);

INSERT INTO productos VALUES (6, 'Teclado Mecánico', 2, 95.00, 40, 1);

-- INSERT: ventas

INSERT INTO ventas VALUES (
    1, 1, 1, 1, 1, 1, 2, 1200.00, '2024-03-05'
);

INSERT INTO ventas VALUES (
    2, 2, 2, 2, 2, 2, 5, 28.00, '2024-03-06'
);

INSERT INTO ventas VALUES (
    3, 3, 3, 3, 1, 3, 1, 450.00, '2024-03-07'
);

INSERT INTO ventas VALUES (
    4, 1, 4, 1, 2, 1, 2, 120.00, '2024-03-08'
);

INSERT INTO ventas VALUES (
    5, 4, 5, 4, 3, 4, 3, 130.00, '2024-03-10'
);

INSERT INTO ventas VALUES (
    6, 2, 6, 2, 1, 2, 4, 95.00, '2024-03-11'
);

INSERT INTO ventas VALUES (
    7, 5, 1, 5, 1, 5, 1, 1200.00, '2024-03-12'
);

INSERT INTO ventas VALUES (
    8, 3, 2, 3, 2, 3, 8, 28.00, '2024-03-13'
);

INSERT INTO ventas VALUES (
    9, 4, 4, 4, 1, 4, 1, 120.00, '2024-03-14'
);

INSERT INTO ventas VALUES (
    10, 5, 3, 5, 2, 5, 2, 450.00, '2024-03-15'
);



-- VALIDACION

SELECT * FROM categorias;

SELECT * FROM clientes;

SELECT * FROM productos;

SELECT * FROM territorios;

SELECT * FROM canales;

SELECT * FROM vendedores;
