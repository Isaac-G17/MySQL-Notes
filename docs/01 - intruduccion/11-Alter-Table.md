# ALTER TABLE - Modificar Tablas

## Objetivos

Al finalizar este capítulo serás capaz de:

- Modificar la estructura de una tabla existente.
- Agregar columnas.
- Eliminar columnas.
- Cambiar el tipo de dato de una columna.
- Renombrar columnas.
- Renombrar tablas.
- Agregar y eliminar restricciones.
- Comprender el impacto de estos cambios en una base de datos con información.

---

# ¿Qué es ALTER TABLE?

`ALTER TABLE` es una instrucción de MySQL que permite modificar la estructura de una tabla ya existente **sin eliminar los datos**.

Es una de las sentencias más utilizadas durante el desarrollo y mantenimiento de aplicaciones.

---

# Sintaxis General

```sql
ALTER TABLE nombre_tabla
acción;
```

La acción puede ser:

- Agregar columnas.
- Eliminar columnas.
- Cambiar nombres.
- Modificar tipos de datos.
- Agregar restricciones.
- Eliminar restricciones.

---

# Nuestra Tabla Inicial

Supongamos que tenemos la siguiente tabla:

```sql
CREATE TABLE clientes (

    id INT UNSIGNED AUTO_INCREMENT,

    nombre VARCHAR(100) NOT NULL,

    apellido VARCHAR(100) NOT NULL,

    correo VARCHAR(255) UNIQUE,

    PRIMARY KEY(id)

);
```

---

# Agregar una Columna

Sintaxis:

```sql
ALTER TABLE clientes

ADD COLUMN telefono VARCHAR(20);
```

La nueva estructura será:

| id | nombre | apellido | correo | telefono |

Los registros existentes conservarán sus datos y el nuevo campo tendrá `NULL` (o el valor por defecto si se define uno).

---

# Agregar Varias Columnas

```sql
ALTER TABLE clientes

ADD COLUMN direccion VARCHAR(255),

ADD COLUMN ciudad VARCHAR(100),

ADD COLUMN fecha_nacimiento DATE;
```

Puedes añadir varias columnas en una sola instrucción.

---

# Posicionar una Columna

Por defecto, MySQL agrega la columna al final.

Si deseas ubicarla en otra posición:

```sql
ALTER TABLE clientes

ADD COLUMN telefono VARCHAR(20)

AFTER correo;
```

Resultado:

| id | nombre | apellido | correo | telefono | ...

---

# Agregar al Inicio

```sql
ALTER TABLE clientes

ADD COLUMN codigo VARCHAR(10)

FIRST;
```

La columna será la primera de la tabla.

---

# Eliminar una Columna

```sql
ALTER TABLE clientes

DROP COLUMN telefono;
```

⚠️ Todos los datos almacenados en esa columna se perderán.

---

# Cambiar el Tipo de Dato

Ejemplo:

```sql
ALTER TABLE clientes

MODIFY COLUMN nombre VARCHAR(150);
```

Ahora el nombre podrá almacenar hasta 150 caracteres.

---

# Agregar una Restricción NOT NULL

```sql
ALTER TABLE clientes

MODIFY COLUMN telefono VARCHAR(20) NOT NULL;
```

Antes de hacer este cambio, asegúrate de que ninguna fila tenga `NULL` en esa columna, o la operación fallará.

---

# Cambiar el Tipo de una Columna

Supongamos:

```sql
precio INT
```

Después:

```sql
ALTER TABLE productos

MODIFY COLUMN precio DECIMAL(10,2);
```

Esto permite almacenar valores como:

```
29.99

150.50
```

---

# Renombrar una Columna

En MySQL 8 puedes usar:

```sql
ALTER TABLE clientes

RENAME COLUMN correo TO email;
```

La columna `correo` pasará a llamarse `email`.

---

# Cambiar Nombre y Tipo

Si necesitas cambiar el nombre **y** la definición, puedes usar:

```sql
ALTER TABLE clientes

CHANGE COLUMN correo email VARCHAR(255) NOT NULL;
```

Observa que con `CHANGE COLUMN` debes indicar el nombre antiguo, el nuevo y la definición completa.

---

# Renombrar una Tabla

```sql
ALTER TABLE clientes

RENAME TO usuarios;
```

Ahora la tabla se llamará `usuarios`.

---

# Agregar una Clave Primaria

Si la tabla no tiene una:

```sql
ALTER TABLE productos

ADD PRIMARY KEY(id);
```

La columna debe contener valores únicos y no nulos.

---

# Agregar una Restricción UNIQUE

```sql
ALTER TABLE clientes

ADD CONSTRAINT uk_clientes_email

UNIQUE(email);
```

---

# Eliminar una Restricción UNIQUE

```sql
ALTER TABLE clientes

DROP INDEX uk_clientes_email;
```

En MySQL, las restricciones `UNIQUE` se implementan mediante índices.

---

# Agregar una Clave Foránea

```sql
ALTER TABLE pedidos

ADD CONSTRAINT fk_pedidos_clientes

FOREIGN KEY(cliente_id)

REFERENCES clientes(id);
```

Ahora MySQL verificará que cada `cliente_id` exista en la tabla `clientes`.

---

# Eliminar una Clave Foránea

Primero identifica su nombre:

```sql
SHOW CREATE TABLE pedidos;
```

Luego:

```sql
ALTER TABLE pedidos

DROP FOREIGN KEY fk_pedidos_clientes;
```

---

# Ver la Estructura Actual

```sql
DESCRIBE clientes;
```

o

```sql
SHOW CREATE TABLE clientes;
```

Estas instrucciones te ayudarán a comprobar los cambios realizados.

---

# Ejemplo Completo

```sql
ALTER TABLE clientes

ADD COLUMN telefono VARCHAR(20),

ADD COLUMN ciudad VARCHAR(100),

MODIFY COLUMN nombre VARCHAR(150),

RENAME COLUMN correo TO email;
```

Con una sola instrucción puedes realizar varias modificaciones.

---

# Errores Comunes

## Eliminar una Columna por Accidente

```sql
DROP COLUMN telefono;
```

Recuerda que se perderán todos los datos de esa columna.

---

## Reducir el Tamaño de un VARCHAR

Si cambias:

```sql
VARCHAR(255)
```

a

```sql
VARCHAR(20)
```

y existen valores mayores de 20 caracteres, la operación puede fallar o provocar truncamiento (según la configuración del servidor).

---

## Cambiar un Tipo Incompatible

Ejemplo:

```sql
VARCHAR

↓

DATE
```

Si los datos existentes no tienen un formato de fecha válido, MySQL generará un error.

---

# Buenas Prácticas

- Haz una copia de seguridad antes de modificar tablas en producción.
- Revisa la información existente antes de cambiar tipos de datos.
- Usa nombres descriptivos para las restricciones.
- Agrupa varios cambios en una sola instrucción cuando tenga sentido.
- Verifica la estructura con `SHOW CREATE TABLE`.

---

# Resumen

- `ALTER TABLE` modifica tablas existentes.
- `ADD COLUMN` agrega columnas.
- `DROP COLUMN` elimina columnas.
- `MODIFY COLUMN` cambia el tipo o atributos de una columna.
- `RENAME COLUMN` cambia el nombre de una columna.
- `CHANGE COLUMN` cambia el nombre y la definición de una columna.
- `RENAME TO` cambia el nombre de la tabla.
- También permite agregar o eliminar restricciones.