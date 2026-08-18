-- Tabla clientes: almacena la información de los clientes.
CREATE TABLE clientes (
 -- INT porque el identificador del cliente es un número entero.
id_cliente INT,
-- VARCHAR(100) porque el nombre es texto de hasta 100 caracteres.
nombre VARCHAR(100),
 -- TEXT porque la biografía puede contener texto largo.
perfil_bio TEXT,
 -- DATE porque solo necesitamos almacenar la fecha de registro.
fecha_registro DATE 
);
-- Tabla productos: almacena la información de los productos.
CREATE TABLE productos (
  -- INT porque el identificador del producto es un número entero.
id_producto INT,
  -- VARCHAR(255) porque la descripción puede tener hasta 255 caracteres.
descripción VARCHAR(255), 
-- DECIMAL(10,2) porque el precio es dinero y necesitamos almacenar los decimales con precisión.
precio DECIMAL(10,2),
-- SMALLINT porque representamos el estado con 1 = activo y 0 = inactivo.
esta_activo SMALLINT
);
