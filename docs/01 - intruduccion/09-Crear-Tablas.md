# Crear Tablas en MySQL

## Objetivos

Al finalizar este capítulo serás capaz de:

- Crear tablas utilizando `CREATE TABLE`.
- Definir columnas y tipos de datos.
- Crear claves primarias.
- Utilizar `AUTO_INCREMENT`.
- Aplicar restricciones básicas.
- Ver la estructura de una tabla.
- Modificar y eliminar tablas.

---

# ¿Qué es una Tabla?

Una tabla es una estructura donde se almacenan datos relacionados.

Ejemplo:

Tabla **clientes**

| id | nombre | correo |
|----|---------|--------------------|
|1|Juan|juan@email.com|
|2|María|maria@email.com|

Cada tabla representa una entidad del sistema.

---

# Sintaxis de CREATE TABLE

La sintaxis básica es:

```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato,
    columna2 tipo_dato,
    columna3 tipo_dato
);
```

Ejemplo:

```sql
CREATE TABLE prueba (
    id INT,
    nombre VARCHAR(100)
);
```

---

# Crear nuestra primera tabla

Primero seleccionamos la base de datos:

```sql
USE tienda_db;
```

Ahora crearemos la tabla `clientes`:

```sql
CREATE TABLE clientes (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(255),
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    activo BOOLEAN,
    PRIMARY KEY (id)
);
```

Si la consulta se ejecuta correctamente, MySQL mostrará:

```text
Query OK
```

---

# Analizando la tabla

```sql
id INT UNSIGNED AUTO_INCREMENT
```

- `INT`: número entero.
- `UNSIGNED`: no admite negativos.
- `AUTO_INCREMENT`: genera un valor automáticamente.

---

```sql
nombre VARCHAR(100)
```

Puede almacenar hasta 100 caracteres.

---

```sql
correo VARCHAR(255)
```

Se utiliza 255 porque es un tamaño suficiente para la mayoría de correos electrónicos.

---

```sql
fecha_nacimiento DATE
```

Almacena solo la fecha.

---

```sql
activo BOOLEAN
```

Acepta valores `TRUE` o `FALSE` (internamente `1` o `0`).

---

```sql
PRIMARY KEY (id)
```

Define la columna `id` como clave primaria.

---

# Ver las tablas

```sql
SHOW TABLES;
```

Resultado:

```text
clientes
```

---

# Ver la estructura de una tabla

Puedes usar cualquiera de estas instrucciones:

```sql
DESCRIBE clientes;
```

o

```sql
DESC clientes;
```

Resultado aproximado:

| Field | Type | Null | Key | Default | Extra |
|------|------|------|-----|---------|------|
| id | int unsigned | NO | PRI | NULL | auto_increment |
| nombre | varchar(100) | YES | | NULL | |
| apellido | varchar(100) | YES | | NULL | |
| correo | varchar(255) | YES | | NULL | |
| telefono | varchar(20) | YES | | NULL | |
| fecha_nacimiento | date | YES | | NULL | |
| activo | tinyint(1) | YES | | NULL | |

---

# SHOW CREATE TABLE

Si quieres ver la sentencia SQL completa que creó una tabla:

```sql
SHOW CREATE TABLE clientes;
```

MySQL devolverá el código completo con el que fue creada.

Esta instrucción es muy útil cuando trabajas con proyectos existentes.

---

# Crear varias tablas

```sql
CREATE TABLE categorias (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE proveedores (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    PRIMARY KEY (id)
);
```

Ahora:

```sql
SHOW TABLES;
```

Resultado:

```text
categorias

clientes

proveedores
```

---

# Renombrar una tabla

```sql
RENAME TABLE proveedores TO proveedores_locales;
```

Resultado:

```text
proveedores_locales
```

---

# Eliminar una tabla

```sql
DROP TABLE proveedores_locales;
```

La tabla desaparecerá completamente.

⚠️ Todos los datos almacenados se perderán.

---

# Eliminar solo si existe

```sql
DROP TABLE IF EXISTS proveedores_locales;
```

Así evitarás errores si la tabla ya fue eliminada.

---

# Verificar la estructura de toda la base de datos

```sql
SHOW TABLES;
```

Luego:

```sql
DESCRIBE clientes;
```

---

# Comentar el código

```sql
-- Crear tabla de clientes

CREATE TABLE clientes (

    id INT UNSIGNED AUTO_INCREMENT,

    nombre VARCHAR(100),

    PRIMARY KEY(id)

);
```

Documentar tus scripts facilita el mantenimiento.

---

# Errores Comunes

## Error 1

```text
Table 'clientes' already exists
```

**Causa:** Intentas crear una tabla con un nombre que ya existe.

**Solución:**

```sql
DROP TABLE clientes;
```

o utiliza otro nombre.

---

## Error 2

```text
No database selected
```

**Causa:** No seleccionaste la base de datos.

**Solución:**

```sql
USE tienda_db;
```

---

## Error 3

Olvidar la clave primaria.

Una tabla puede existir sin ella, pero es una mala práctica y dificultará muchas operaciones futuras.

---

# Buenas Prácticas

- Usa nombres descriptivos para las tablas.
- Mantén una convención (todo en minúsculas, por ejemplo).
- Agrega una clave primaria a cada tabla.
- Usa `AUTO_INCREMENT` para identificadores.
- Evita nombres ambiguos como `tabla1` o `datos`.

---

# Resumen

- `CREATE TABLE` crea una nueva tabla.
- `SHOW TABLES` lista las tablas de la base de datos.
- `DESCRIBE` muestra la estructura de una tabla.
- `SHOW CREATE TABLE` muestra el SQL utilizado para crearla.
- `RENAME TABLE` cambia el nombre de una tabla.
- `DROP TABLE` elimina una tabla.