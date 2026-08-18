-- Elimina la tabla si ya existe para poder ejecutar nuevamente el script sin errores.
DROP TABLE IF EXISTS inventario;
-- Creamos la tabla inventario.
CREATE TABLE inventario (
-- INT porque el identificador es un número entero.
-- PRIMARY KEY garantiza que cada producto tenga un ID único.
id_producto INT PRIMARY KEY,
-- VARCHAR(100) porque el nombre del producto es texto y puede contener hasta 100 caracteres.
nombre_producto VARCHAR(100),
-- VARCHAR(50) porque la categoría es un texto corto.
categoria VARCHAR(50),
-- DECIMAL(10,2) porque los precios necesitan precisión.
precio_unitario DECIMAL(10,2),
-- INT porque el stock representa unidades enteras.
stock_actual INT,
-- INT porque el stock mínimo también representa una cantidad de unidades enteras.
stock_minimo INT,
 -- DATE porque solo necesitamos guardar la fecha de ingreso y no la hora.
fecha_ingreso DATE,
 -- TINYINT permite representar el estado: 1 = disponible y 0 = descontinuado.
activo TINYINT
);
INSERT INTO inventario (
id_producto,
nombre_producto,
categoria,
precio_unitario,
stock_actual,
stock_minimo,
fecha_ingreso,
activo
)
VALUES
(1, 'Laptop Pro 15', 'Computacion', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalambrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computacion', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computacion', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);
-- Se vendieron 3 unidades de Laptop Pro 15.
UPDATE inventario SET stock_actual= stock_actual -3
WHERE id_producto=1
-- Se vendieron 12 unidades de Mouse Inalámbrico.
UPDATE inventario SET stock_actual= stock_actual -12
WHERE id_producto=2
-- Se vendieron 5 unidades de Auriculares BT Pro.
UPDATE inventario SET stock_actual= stock_actual -5
WHERE id_producto=6
-- La Webcam HD 1080p fue descontinuada.
UPDATE inventario SET activo = 0
WHERE id_producto=8
-- Ver la tabla completa para confirmar que los datos se cargaron y actualizaron.
SELECT * FROM inventario;

