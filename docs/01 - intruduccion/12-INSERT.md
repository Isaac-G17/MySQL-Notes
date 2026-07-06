# INSERT INTO - Agregar Datos

## Objetivos

Al finalizar este capítulo serás capaz de:

- Insertar registros en una tabla.
- Insertar uno o varios registros a la vez.
- Insertar datos en columnas específicas.
- Comprender el uso de valores por defecto.
- Insertar fechas y valores booleanos.
- Interpretar errores comunes de inserción.
- Aplicar buenas prácticas al poblar una base de datos.

---

# ¿Qué es INSERT?

`INSERT` permite agregar nuevos registros a una tabla.

Hasta ahora hemos creado la estructura de la base de datos. Ahora empezaremos a almacenar información.

Visualmente:

Antes

Clientes

| id | nombre |
|----|---------|

Después

| id | nombre |
|----|---------|
|1|Juan|

---

# Sintaxis Básica

```sql
INSERT INTO nombre_tabla

VALUES(valor1, valor2, valor3);
```

Sin embargo, esta forma no es la más recomendable.

---

# La Forma Recomendada

Siempre especifica las columnas.

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email,

    telefono,

    activo

)

VALUES (

    'Juan',

    'Pérez',

    'juan@email.com',

    '3001234567',

    TRUE

);
```

Esto hace que el código sea más claro y resistente a cambios en la estructura de la tabla.

---

# ¿Por qué no insertamos el ID?

La columna:

```sql
id INT UNSIGNED AUTO_INCREMENT
```

Se genera automáticamente.

MySQL asignará:

```
1
```

Luego:

```
2
```

Después:

```
3
```

Y así sucesivamente.

---

# Insertar Solo Algunas Columnas

No es obligatorio insertar datos en todas las columnas.

Ejemplo:

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email

)

VALUES (

    'María',

    'López',

    'maria@email.com'

);
```

Las columnas omitidas recibirán:

- `NULL`, si lo permiten.
- El valor definido en `DEFAULT`, si existe.

---

# Insertar Varios Registros

Puedes insertar varios registros con una sola instrucción.

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email,

    telefono

)

VALUES

('Juan','Pérez','juan@email.com','3001111111'),

('María','López','maria@email.com','3002222222'),

('Carlos','Ruiz','carlos@email.com','3003333333'),

('Ana','Martínez','ana@email.com','3004444444');
```

Esta forma es más rápida y eficiente que ejecutar varios `INSERT` individuales.

---

# Insertar Fechas

Las fechas deben escribirse en formato:

```text
AAAA-MM-DD
```

Ejemplo:

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email,

    fecha_nacimiento

)

VALUES (

    'Pedro',

    'Gómez',

    'pedro@email.com',

    '1998-06-15'

);
```

---

# Insertar Valores Booleanos

Puedes usar:

```sql
TRUE
```

o

```sql
FALSE
```

También funcionan:

```sql
1

0
```

Ejemplo:

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email,

    activo

)

VALUES (

    'Laura',

    'Sánchez',

    'laura@email.com',

    TRUE

);
```

---

# Uso de DEFAULT

Supongamos que la columna está definida así:

```sql
activo BOOLEAN DEFAULT TRUE
```

Entonces puedes omitirla:

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email

)

VALUES (

    'Luis',

    'Torres',

    'luis@email.com'

);
```

MySQL asignará automáticamente:

```
activo = TRUE
```

---

# Insertar Valores NULL

Si una columna lo permite, puedes insertar:

```sql
NULL
```

Ejemplo:

```sql
INSERT INTO clientes (

    nombre,

    apellido,

    email,

    telefono

)

VALUES (

    'Sara',

    'Rojas',

    'sara@email.com',

    NULL

);
```

---

# Ver los Datos Insertados

Después de insertar registros, puedes comprobarlos con:

```sql
SELECT *

FROM clientes;
```

Resultado:

| id | nombre | apellido | email |
|----|---------|-----------|------------------|
|1|Juan|Pérez|juan@email.com|
|2|María|López|maria@email.com|
|3|Carlos|Ruiz|carlos@email.com|

---

# LAST_INSERT_ID()

Permite conocer el último ID generado automáticamente.

```sql
SELECT LAST_INSERT_ID();
```

Muy útil cuando necesitas insertar un registro y luego utilizar su identificador.

---

# INSERT IGNORE

Si existe una restricción `UNIQUE` y el registro provoca un conflicto, normalmente MySQL genera un error.

Con:

```sql
INSERT IGNORE INTO clientes (

    nombre,

    email

)

VALUES (

    'Juan',

    'juan@email.com'

);
```

MySQL ignorará el registro conflictivo y continuará con los demás.

Úsalo con cuidado, ya que puede ocultar errores.

---

# INSERT ... SET

Otra sintaxis válida:

```sql
INSERT INTO clientes

SET

nombre = 'Carlos',

apellido = 'Ruiz',

email = 'carlos@email.com';
```

Aunque funciona, la sintaxis con `VALUES` es la más utilizada y recomendable.

---

# Errores Comunes

## Error 1

Intentar insertar un correo duplicado.

```text
Duplicate entry
```

Causa:

La columna tiene una restricción `UNIQUE`.

---

## Error 2

No proporcionar un valor para un campo `NOT NULL`.

```text
Column 'nombre' cannot be null
```

---

## Error 3

Intentar insertar un texto en una columna numérica.

Ejemplo:

```sql
edad = 'Hola'
```

MySQL puede generar un error o realizar una conversión no deseada, dependiendo del modo SQL configurado.

---

## Error 4

Formato de fecha incorrecto.

Incorrecto:

```text
15/06/2025
```

Correcto:

```text
2025-06-15
```

---

# Buenas Prácticas

- Especifica siempre las columnas.
- Inserta varios registros en una sola instrucción cuando sea posible.
- Aprovecha `DEFAULT` para simplificar inserciones.
- Valida la información antes de insertarla.
- No uses `INSERT IGNORE` como solución a problemas de diseño.

---

# Resumen

- `INSERT INTO` agrega registros a una tabla.
- Es recomendable indicar siempre las columnas.
- `AUTO_INCREMENT` genera los identificadores automáticamente.
- Se pueden insertar varios registros con una sola instrucción.
- `LAST_INSERT_ID()` devuelve el último ID generado.
- `DEFAULT` y `NULL` ayudan a gestionar valores opcionales.