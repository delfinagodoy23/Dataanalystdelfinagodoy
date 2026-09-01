
1. ¿Cuántas filas devuelve cada consulta y por qué son distintas?
La consulta con UNION devuelve 11 filas, mientras que la consulta con UNION ALL devuelve 14 filas.
La diferencia se debe a que UNION elimina las filas que son completamente duplicadas entre ambas consultas, mientras que UNION ALL conserva todos los registros.
En total hay 7 registros en la sucursal Norte y 7 registros en la sucursal Sur, por lo tanto UNION ALL devuelve: 7 + 7 = 14 filas
En cambio, en la consulta con UNION se seleccionan las columnas id_producto, nombre_producto y categoria. Existen tres productos que aparecen con exactamente los mismos valores en ambas sucursales:
•	Producto 103 — Monitor 4K 27"
•	Producto 104 — Teclado Mecánico
•	Producto 106 — SSD Externo 1TB
Como esas tres filas están duplicadas, UNION las muestra una sola vez.
Por eso el resultado final es:
14 - 3 = 11 filas
Un caso interesante es el producto Webcam HD 1080p. Aparece en ambas sucursales, pero tiene distinto id_producto: 107 en Norte y 111 en Sur. Por esa razón SQL no las considera filas completamente iguales y ambas permanecen en el resultado.

2. ¿Por qué UNION ALL es más eficiente que UNION?
UNION ALL suele ser más eficiente porque simplemente combina los resultados de ambas consultas y conserva todas las filas.
En cambio, UNION debe realizar una operación adicional para detectar y eliminar los registros duplicados.
Para lograrlo, el motor de base de datos necesita comparar las filas resultantes. Dependiendo del motor y del plan de ejecución, esto puede implicar operaciones de ordenamiento o mecanismos para identificar valores repetidos.
Ese procesamiento adicional consume más recursos de CPU y memoria.
Por lo tanto, si el objetivo del análisis no requiere eliminar duplicados, conviene utilizar UNION ALL.
3. ¿En qué casos de negocio usarías cada uno?
Usaría UNION cuando necesito obtener un listado único, sin registros repetidos.
Un ejemplo podría ser una empresa que tiene una lista de clientes registrados en dos sistemas distintos y quiere generar una lista consolidada de clientes sin duplicados.
Otro ejemplo sería combinar listas de proveedores de distintas áreas de una empresa para obtener un catálogo único de proveedores.
Usaría UNION ALL cuando necesito conservar todos los registros originales, incluso si algunos se repiten.
Por ejemplo, podría utilizarse para combinar transacciones de ventas provenientes de distintas sucursales, porque cada operación debe conservarse para poder calcular correctamente la facturación total.
Otro caso sería consolidar registros de acceso de distintos servidores. Aunque dos registros tengan valores similares, es importante mantenerlos porque representan eventos diferentes.
4. ¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo?
Para utilizar UNION o UNION ALL, las consultas deben devolver la misma cantidad de columnas.
Además, las columnas que ocupan la misma posición deben tener tipos de datos compatibles.
Por ejemplo, esto sería incorrecto porque cada SELECT devuelve una cantidad distinta de columnas:
SELECT id_producto, nombre_producto
FROM inventario_sucursal_norte

UNION

SELECT id_producto, nombre_producto, categoria
FROM inventario_sucursal_sur;
SQL genera un error porque no puede combinar una consulta de dos columnas con otra de tres columnas.
También pueden generarse errores si las columnas correspondientes tienen tipos de datos incompatibles.
Por ejemplo, si una consulta devuelve un número entero en una posición y la otra devuelve un valor de texto que no puede convertirse al tipo requerido, el motor puede generar un error de conversión.
Por eso, para trabajar correctamente con UNION y UNION ALL, hay que verificar que ambas consultas tengan la misma estructura y tipos de datos compatibles.
