# Alias (AS) en MySQL

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué es un alias.
- Cambiar temporalmente el nombre de una columna.
- Asignar alias a tablas.
- Utilizar alias con espacios.
- Diferenciar entre el nombre real de una columna y su alias.
- Aplicar buenas prácticas en consultas profesionales.

---

# ¿Qué es un Alias?

Un alias es un **nombre temporal** que se asigna a una columna o a una tabla durante la ejecución de una consulta.

Es importante entender que:

- ❌ No modifica la estructura de la base de datos.
- ❌ No cambia el nombre real de la columna.
- ✅ Solo cambia cómo se muestra el resultado de la consulta.

---

# Sintaxis

Para columnas:

```sql
SELECT columna AS alias
FROM tabla;
```

Ejemplo:

```sql
SELECT
    nombre AS cliente
FROM clientes;
```

Resultado:

| cliente |
|----------|
|Juan|
|María|
|Carlos|

La columna sigue llamándose `nombre` en la base de datos, pero el resultado la muestra como `cliente`.

---

# Alias para varias columnas

```sql
SELECT
    nombre AS Nombre,
    apellido AS Apellido,
    email AS Correo
FROM clientes;
```

Resultado:

| Nombre | Apellido | Correo |
|---------|-----------|-------------------|
|Juan|Pérez|juan@email.com|
|María|López|maria@email.com|

---

# Alias con espacios

Si deseas un alias con espacios, utiliza comillas invertidas (backticks).

```sql
SELECT
    nombre AS `Nombre del Cliente`,
    email AS `Correo Electrónico`
FROM clientes;
```

Resultado:

| Nombre del Cliente | Correo Electrónico |
|--------------------|-------------------|
|Juan|juan@email.com|

> **Nota:** En MySQL también es común ver alias entre comillas simples o dobles dependiendo del modo SQL configurado, pero la forma más segura para identificadores es usar **backticks (`)**.

---

# ¿Es obligatorio escribir AS?

No.

Estas dos consultas son equivalentes:

```sql
SELECT
    nombre AS Cliente
FROM clientes;
```

```sql
SELECT
    nombre Cliente
FROM clientes;
```

Sin embargo, se recomienda escribir `AS` porque hace el código más claro y fácil de leer.

---

# Alias en expresiones

Los alias son especialmente útiles cuando una columna es el resultado de un cálculo.

Sin alias:

```sql
SELECT
    precio * 1.19
FROM productos;
```

Resultado:

| precio * 1.19 |
|---------------:|
|59.50|

Con alias:

```sql
SELECT
    precio * 1.19 AS precio_con_iva
FROM productos;
```

Resultado:

| precio_con_iva |
|----------------:|
|59.50|

Mucho más claro.

---

# Alias con CONCAT()

```sql
SELECT
    CONCAT(nombre, ' ', apellido) AS nombre_completo
FROM clientes;
```

Resultado:

| nombre_completo |
|-----------------|
|Juan Pérez|
|María López|

---

# Alias para tablas

Los alias no solo sirven para columnas.

También pueden asignarse a tablas.

```sql
SELECT
    c.nombre,
    c.email
FROM clientes AS c;
```

Aquí:

- `clientes` es el nombre real de la tabla.
- `c` es un alias temporal.

Esto es muy útil cuando una consulta involucra varias tablas.

---

# Alias sin AS en tablas

También es válido:

```sql
SELECT
    c.nombre
FROM clientes c;
```

Ambas formas funcionan.

---

# ¿Por qué usar alias en tablas?

Imagina esta consulta:

```sql
SELECT
    clientes.nombre,
    clientes.email
FROM clientes;
```

Es correcta, pero repetitiva.

Con alias:

```sql
SELECT
    c.nombre,
    c.email
FROM clientes AS c;
```

Es más corta y fácil de leer.

---

# Alias en futuras consultas con JOIN

Más adelante veremos consultas como esta:

```sql
SELECT
    c.nombre,
    p.fecha
FROM clientes AS c
JOIN pedidos AS p
    ON c.id = p.cliente_id;
```

Sin alias, esta consulta sería mucho más extensa.

---

# Nombre real vs Alias

Supongamos esta consulta:

```sql
SELECT
    nombre AS cliente
FROM clientes;
```

Después de ejecutarla:

El nombre real de la columna sigue siendo:

```text
nombre
```

No puedes hacer esto:

```sql
SELECT cliente
FROM clientes;
```

Porque `cliente` solo existe dentro del resultado de la consulta.

---

# ¿Cuándo usar alias?

Los alias son muy útiles para:

- Reportes.
- Consultas con funciones.
- Expresiones matemáticas.
- `JOIN`.
- Subconsultas.
- Consultas largas.

---

# Errores Comunes

## Creer que el alias cambia la columna

Incorrecto:

```sql
SELECT
    nombre AS cliente
FROM clientes;
```

Pensar que ahora la columna se llama `cliente`.

No es así.

---

## Alias poco descriptivos

Evita:

```sql
SELECT
    nombre AS x
FROM clientes;
```

Mejor:

```sql
SELECT
    nombre AS nombre_cliente
FROM clientes;
```

---

## Confundir alias de columnas con alias de tablas

```sql
SELECT
    c.nombre AS cliente
FROM clientes AS c;
```

Aquí:

- `c` → Alias de la tabla.
- `cliente` → Alias de la columna.

Son conceptos diferentes.

---

# Buenas Prácticas

- Usa `AS` aunque sea opcional.
- Elige alias descriptivos.
- Utiliza alias para mejorar la legibilidad de cálculos y funciones.
- Emplea alias cortos para tablas (`c`, `p`, `pr`) en consultas complejas.
- Evita abreviaturas ambiguas.

---

# Resumen

- Un alias es un nombre temporal.
- No modifica la base de datos.
- Puede aplicarse a columnas y tablas.
- Facilita la lectura de consultas.
- Es especialmente útil en expresiones, funciones y `JOIN`.