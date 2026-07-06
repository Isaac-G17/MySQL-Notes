# Seleccionar Columnas Específicas

## Objetivos

Al finalizar este capítulo serás capaz de:

- Seleccionar una o varias columnas de una tabla.
- Cambiar el orden de las columnas en el resultado.
- Repetir columnas si es necesario.
- Combinar columnas con expresiones simples.
- Escribir consultas más eficientes y legibles.
- Comprender por qué seleccionar solo las columnas necesarias mejora el rendimiento.

---

# ¿Por qué seleccionar columnas específicas?

En la mayoría de los casos, una aplicación **no necesita toda la información de una tabla**.

Por ejemplo, en un listado de clientes quizá solo sea necesario mostrar:

- Nombre
- Correo electrónico
- Ciudad

No hace falta recuperar información como:

- Fecha de nacimiento
- Teléfono
- Dirección
- Estado del cliente

Cuantos menos datos recupere la consulta, más eficiente será.

---

# Sintaxis

```sql
SELECT columna1, columna2, columna3
FROM nombre_tabla;
```

Ejemplo:

```sql
SELECT nombre, apellido
FROM clientes;
```

Resultado:

| nombre | apellido |
|---------|-----------|
|Juan|Pérez|
|María|López|
|Carlos|Ruiz|

---

# Seleccionar una sola columna

Consulta:

```sql
SELECT nombre
FROM clientes;
```

Resultado:

| nombre |
|---------|
|Juan|
|María|
|Carlos|
|Ana|

---

# Seleccionar varias columnas

```sql
SELECT nombre, email
FROM clientes;
```

Resultado:

| nombre | email |
|---------|-------------------|
|Juan|juan@email.com|
|María|maria@email.com|
|Carlos|carlos@email.com|

---

# El orden lo decides tú

El orden de las columnas en el resultado **no depende del orden en la tabla**, sino del orden en la consulta.

Ejemplo:

```sql
SELECT email, nombre
FROM clientes;
```

Resultado:

| email | nombre |
|--------|---------|
|juan@email.com|Juan|
|maria@email.com|María|

---

# Seleccionar la misma columna varias veces

Aunque no es habitual, es completamente válido.

```sql
SELECT nombre, nombre
FROM clientes;
```

Resultado:

| nombre | nombre |
|---------|---------|
|Juan|Juan|
|María|María|

Esto suele utilizarse cuando una de las columnas será transformada mediante una función o una expresión.

---

# Combinar columnas con expresiones

Puedes construir nuevas columnas directamente en la consulta.

Ejemplo:

```sql
SELECT
    nombre,
    apellido,
    CONCAT(nombre, ' ', apellido)
FROM clientes;
```

Resultado:

| nombre | apellido | CONCAT(...) |
|---------|-----------|----------------|
|Juan|Pérez|Juan Pérez|
|María|López|María López|

Más adelante aprenderemos funciones como `CONCAT()` en profundidad.

---

# Realizar operaciones matemáticas

Supongamos una tabla `productos`:

| nombre | precio |
|---------|--------:|
|Mouse|50.00|
|Teclado|120.00|

Consulta:

```sql
SELECT
    nombre,
    precio,
    precio * 1.19
FROM productos;
```

Resultado:

| nombre | precio | precio * 1.19 |
|---------|--------:|--------------:|
|Mouse|50.00|59.50|
|Teclado|120.00|142.80|

Esto es útil para calcular impuestos, descuentos o márgenes de ganancia.

---

# Consultar columnas de diferentes tipos

No importa si una columna es texto, número o fecha.

```sql
SELECT
    nombre,
    fecha_nacimiento,
    activo
FROM clientes;
```

---

# ¿Qué pasa si escribes una columna que no existe?

Ejemplo:

```sql
SELECT salario
FROM clientes;
```

MySQL responderá con un error similar a:

```text
ERROR 1054 (42S22):
Unknown column 'salario' in 'field list'
```

Esto significa que la columna no existe en la tabla.

---

# Formato recomendado

En consultas con muchas columnas, escribe una por línea.

En lugar de:

```sql
SELECT id, nombre, apellido, email, telefono
FROM clientes;
```

Es preferible:

```sql
SELECT
    id,
    nombre,
    apellido,
    email,
    telefono
FROM clientes;
```

Es mucho más fácil de leer y mantener.

---

# Consultas sobre la tabla productos

Ejemplo 1:

```sql
SELECT
    nombre,
    precio
FROM productos;
```

Ejemplo 2:

```sql
SELECT
    nombre,
    stock
FROM productos;
```

Ejemplo 3:

```sql
SELECT
    nombre,
    precio,
    stock
FROM productos;
```

Cada consulta recupera únicamente la información necesaria.

---

# Ventajas

Seleccionar solo las columnas necesarias:

- Reduce el tráfico entre el servidor y la aplicación.
- Consume menos memoria.
- Hace las consultas más rápidas.
- Mejora la legibilidad del código.
- Facilita el mantenimiento.

---

# Errores Comunes

## Escribir mal el nombre de una columna

```sql
SELECT nombe
FROM clientes;
```

Resultado:

```text
Unknown column 'nombe'
```

---

## Olvidar la coma

Incorrecto:

```sql
SELECT
    nombre
    apellido
FROM clientes;
```

Correcto:

```sql
SELECT
    nombre,
    apellido
FROM clientes;
```

---

## Seleccionar columnas innecesarias

Evita hacer esto:

```sql
SELECT
    id,
    nombre,
    apellido,
    email,
    telefono,
    direccion,
    ciudad,
    fecha_nacimiento,
    activo,
    fecha_registro
FROM clientes;
```

Si la aplicación solo necesita:

```sql
SELECT
    nombre,
    email
FROM clientes;
```

---

# Buenas Prácticas

- Recupera únicamente las columnas necesarias.
- Utiliza una columna por línea cuando la consulta sea larga.
- Mantén un orden lógico (por ejemplo: identificador, nombre, datos de contacto).
- Evita abreviaturas poco claras.
- Revisa la ortografía de los nombres de las columnas.

---

# Resumen

- Puedes seleccionar una o varias columnas.
- El orden del resultado depende de la consulta.
- Es posible usar expresiones y operaciones directamente en `SELECT`.
- Recuperar menos columnas mejora el rendimiento.
- Una consulta clara es más fácil de mantener.