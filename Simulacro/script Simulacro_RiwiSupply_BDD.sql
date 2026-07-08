DROP DATABASE IF EXISTS riwisupply;
CREATE DATABASE riwisupply CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE riwisupply;

-- ----------------------------------------------------------------------------
-- 1. PAISES
-- ----------------------------------------------------------------------------
CREATE TABLE paises (
    id_pais      INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pais  VARCHAR(60) NOT NULL,
    CONSTRAINT uq_paises_nombre UNIQUE (nombre_pais)
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 2. CIUDADES
-- ----------------------------------------------------------------------------
CREATE TABLE ciudades (
    id_ciudad     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ciudad VARCHAR(80) NOT NULL,
    id_pais       INT NOT NULL,
    CONSTRAINT uq_ciudades_nombre_pais UNIQUE (nombre_ciudad, id_pais),
    CONSTRAINT fk_ciudades_pais FOREIGN KEY (id_pais)
        REFERENCES paises (id_pais)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 3. PROVEEDORES
-- ----------------------------------------------------------------------------
CREATE TABLE proveedores (
    id_proveedor      INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor  VARCHAR(150) NOT NULL,
    nit_proveedor     VARCHAR(20) NOT NULL,
    telefono_proveedor VARCHAR(20),
    email_proveedor   VARCHAR(120),
    id_ciudad         INT NOT NULL,
    CONSTRAINT uq_proveedores_nit UNIQUE (nit_proveedor),
    CONSTRAINT fk_proveedores_ciudad FOREIGN KEY (id_ciudad)
        REFERENCES ciudades (id_ciudad)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 4. CATEGORIAS
-- ----------------------------------------------------------------------------
CREATE TABLE categorias (
    id_categoria     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(60) NOT NULL,
    CONSTRAINT uq_categorias_nombre UNIQUE (nombre_categoria)
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 5. SUBCATEGORIAS
-- ----------------------------------------------------------------------------
CREATE TABLE subcategorias (
    id_subcategoria     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_subcategoria VARCHAR(60) NOT NULL,
    id_categoria        INT NOT NULL,
    CONSTRAINT uq_subcat_nombre_categoria UNIQUE (nombre_subcategoria, id_categoria),
    CONSTRAINT fk_subcategorias_categoria FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 6. UNIDADES DE MEDIDA
-- ----------------------------------------------------------------------------
CREATE TABLE unidades_medida (
    id_unidad_medida INT AUTO_INCREMENT PRIMARY KEY,
    nombre_unidad    VARCHAR(40) NOT NULL,
    abreviatura      VARCHAR(10) NOT NULL,
    CONSTRAINT uq_unidad_abreviatura UNIQUE (abreviatura)
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 7. PRODUCTOS
-- ----------------------------------------------------------------------------
CREATE TABLE productos (
    id_producto           INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto        VARCHAR(150) NOT NULL,
    descripcion_producto   VARCHAR(255),
    id_subcategoria        INT NOT NULL,
    id_unidad_medida       INT NOT NULL,
    CONSTRAINT fk_productos_subcategoria FOREIGN KEY (id_subcategoria)
        REFERENCES subcategorias (id_subcategoria)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_productos_unidad FOREIGN KEY (id_unidad_medida)
        REFERENCES unidades_medida (id_unidad_medida)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 8. BODEGAS
-- ----------------------------------------------------------------------------
CREATE TABLE bodegas (
    id_bodega        INT AUTO_INCREMENT PRIMARY KEY,
    nombre_bodega    VARCHAR(100) NOT NULL,
    id_ciudad        INT NOT NULL,
    direccion_bodega VARCHAR(150),
    CONSTRAINT fk_bodegas_ciudad FOREIGN KEY (id_ciudad)
        REFERENCES ciudades (id_ciudad)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 9. EMPLEADOS (responsables de bodega)
-- ----------------------------------------------------------------------------
CREATE TABLE empleados (
    id_empleado     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(100) NOT NULL,
    id_bodega       INT NOT NULL,
    CONSTRAINT fk_empleados_bodega FOREIGN KEY (id_bodega)
        REFERENCES bodegas (id_bodega)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 10. TIPOS DE MOVIMIENTO
-- ----------------------------------------------------------------------------
CREATE TABLE tipos_movimiento (
    id_tipo_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo         VARCHAR(20) NOT NULL,
    CONSTRAINT uq_tipo_movimiento UNIQUE (nombre_tipo)
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 11. COMPRAS
-- ----------------------------------------------------------------------------
CREATE TABLE compras (
    id_compra           INT AUTO_INCREMENT PRIMARY KEY,
    fecha_compra        DATE NOT NULL,
    id_proveedor        INT NOT NULL,
    id_producto         INT NOT NULL,
    precio_unitario     DECIMAL(12,2) NOT NULL,
    cantidad_comprada   INT NOT NULL,
    valor_total_compra  DECIMAL(14,2) AS (precio_unitario * cantidad_comprada) STORED,
    CONSTRAINT fk_compras_proveedor FOREIGN KEY (id_proveedor)
        REFERENCES proveedores (id_proveedor)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_compras_producto FOREIGN KEY (id_producto)
        REFERENCES productos (id_producto)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_compras_cantidad CHECK (cantidad_comprada > 0),
    CONSTRAINT chk_compras_precio CHECK (precio_unitario >= 0)
) ENGINE=InnoDB;

-- ----------------------------------------------------------------------------
-- 12. MOVIMIENTOS_INVENTARIO
-- ----------------------------------------------------------------------------
CREATE TABLE movimientos_inventario (
    id_movimiento        INT AUTO_INCREMENT PRIMARY KEY,
    id_compra            INT NOT NULL,
    id_bodega            INT NOT NULL,
    id_tipo_movimiento   INT NOT NULL,
    id_empleado          INT NOT NULL,
    cantidad_movimiento  INT NOT NULL,
    stock_actual         INT NOT NULL,
    observaciones        VARCHAR(255),
    CONSTRAINT fk_mov_compra FOREIGN KEY (id_compra)
        REFERENCES compras (id_compra)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_mov_bodega FOREIGN KEY (id_bodega)
        REFERENCES bodegas (id_bodega)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_mov_tipo FOREIGN KEY (id_tipo_movimiento)
        REFERENCES tipos_movimiento (id_tipo_movimiento)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_mov_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleados (id_empleado)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_mov_cantidad CHECK (cantidad_movimiento > 0),
    CONSTRAINT chk_mov_stock CHECK (stock_actual >= 0)
) ENGINE=InnoDB;



INSERT INTO tipos_movimiento (nombre_tipo) VALUES ('ENTRADA'), ('SALIDA');

INSERT INTO unidades_medida (nombre_unidad, abreviatura) VALUES
 ('Unidad', 'UND'),
 ('Metro', 'MT'),
 ('Galón', 'GAL'),
 ('Bulto', 'BTO'),
 ('Metro lineal', 'ML');
 
