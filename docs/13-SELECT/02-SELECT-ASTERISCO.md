# SELECT * - Seleccionar Todas las Columnas

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué hace `SELECT *`.
- Consultar todos los datos de una tabla.
- Identificar cuándo es apropiado utilizar `SELECT *`.
- Conocer sus ventajas y desventajas.
- Entender su impacto en el rendimiento.
- Aplicar buenas prácticas en proyectos reales.

---

# ¿Qué significa el asterisco (*)?

En SQL, el símbolo `*` significa:

> **"Selecciona todas las columnas de la tabla."**

Por ejemplo, si tenemos la tabla `clientes`:

| id | nombre | apellido | email | telefono | ciudad |
|----|---------|-----------|-------------------|-------------|-----------|
|1|Juan|Pérez|juan@email.com|3001111111|Bogotá|
|2|María|López|maria@email.com|3002222222|Medellín|

La consulta:

```sql
SELECT *
FROM clientes;
```

devuelve:

| id | nombre | apellido | email | telefono | ciudad |
|----|---------|-----------|-------------------|-------------|-----------|
|1|Juan|Pérez|juan@email.com|3001111111|Bogotá|
|2|María|López|maria@email.com|3002222222|Medellín|

---

# Sintaxis

```sql
SELECT *
FROM nombre_tabla;
```

Ejemplo:

```sql
SELECT *
FROM productos;
```

---

# ¿Qué ocurre internamente?

Cuando MySQL recibe:

```sql
SELECT *
FROM clientes;
```

Primero:

1. Localiza la tabla `clientes`.
2. Obtiene la definición de todas sus columnas.
3. Lee cada registro.
4. Devuelve todas las columnas para cada fila.

Visualmente:

```text
SELECT *

↓

Tabla clientes

↓

id
nombre
apellido
email
telefono
ciudad
activo
fecha_nacimiento

↓

Resultado
```

---

# Ejemplo con nuestra base de datos

Supongamos que la tabla `clientes` contiene:

| id | nombre | apellido | email | activo |
|----|---------|-----------|-------------------|--------|
|1|Juan|Pérez|juan@email.com|1|
|2|Ana|Martínez|ana@email.com|1|
|3|Carlos|Ruiz|carlos@email.com|0|

Consulta:

```sql
SELECT *
FROM clientes;
```

Resultado:

```text
+----+--------+-----------+-------------------+--------+
| id | nombre | apellido | email             | activo |
+----+--------+-----------+-------------------+--------+
| 1  | Juan   | Pérez     | juan@email.com    | 1      |
| 2  | Ana    | Martínez  | ana@email.com     | 1      |
| 3  | Carlos | Ruiz      | carlos@email.com  | 0      |
+----+--------+-----------+-------------------+--------+
```

---

# Ventajas de SELECT *

## Es rápido de escribir

```sql
SELECT *
FROM clientes;
```

En lugar de:

```sql
SELECT

id,
nombre,
apellido,
email,
telefono,
activo

FROM clientes;
```

---

## Muy útil durante el aprendizaje

Cuando estás aprendiendo SQL, `SELECT *` te permite ver rápidamente toda la información de una tabla.

---

## Ideal para depuración

Mientras desarrollas una aplicación puedes querer comprobar rápidamente qué contiene una tabla.

---

# Desventajas de SELECT *

Aunque es cómodo, **no siempre es la mejor opción**.

---

## Recupera información innecesaria

Supongamos una tabla:

```text
productos
```

Con columnas:

- id
- nombre
- precio
- descripción
- imagen
- peso
- fabricante
- fecha_creación
- fecha_actualización
- código_barras

Si solo necesitas el nombre y el precio:

```sql
SELECT *
FROM productos;
```

MySQL leerá y enviará **todas** las columnas, incluso las que no necesitas.

---

## Mayor consumo de memoria

Más columnas significan:

- Más datos leídos.
- Más datos enviados por la red.
- Más memoria utilizada por el cliente.

---

## Menor rendimiento

En tablas con millones de registros, traer columnas innecesarias aumenta el tiempo de respuesta y el uso de recursos.

---

## Hace el código menos claro

Observa:

```sql
SELECT *
FROM clientes;
```

No sabemos qué información necesita realmente la aplicación.

En cambio:

```sql
SELECT

nombre,
email

FROM clientes;
```

Es evidente que solo se utilizarán esas columnas.

---

## Puede romper aplicaciones

Imagina que una aplicación espera:

```text
id

nombre

email
```

Meses después alguien agrega una columna:

```text
foto
```

Ahora:

```sql
SELECT *
```

también devolverá `foto`.

Dependiendo de cómo esté construida la aplicación, esto puede provocar errores o comportamientos inesperados.

---

# ¿Cuándo usar SELECT *?

Es una buena opción cuando:

- Estás aprendiendo SQL.
- Exploras una tabla por primera vez.
- Depuras una consulta.
- Quieres revisar rápidamente todos los datos.
- Trabajas con tablas pequeñas.

---

# ¿Cuándo evitarlo?

Evítalo en:

- APIs.
- Sistemas empresariales.
- Consultas frecuentes.
- Reportes.
- Aplicaciones con muchos usuarios.
- Tablas con muchas columnas.
- Consultas sobre grandes volúmenes de datos.

---

# La alternativa recomendada

En lugar de:

```sql
SELECT *
FROM clientes;
```

Utiliza:

```sql
SELECT

id,
nombre,
email

FROM clientes;
```

Solo se recuperan las columnas necesarias.

---

# Comparación

## Opción 1

```sql
SELECT *
FROM clientes;
```

Trae:

- id
- nombre
- apellido
- email
- teléfono
- ciudad
- fecha_nacimiento
- activo

---

## Opción 2

```sql
SELECT

nombre,
email

FROM clientes;
```

Trae únicamente:

- nombre
- email

Esta segunda opción suele ser más eficiente.

---

# Error Común

Muchos desarrolladores dejan:

```sql
SELECT *
```

en el código de producción simplemente porque funcionó durante las pruebas.

Con el tiempo, la tabla crece, se agregan nuevas columnas y el rendimiento empeora.

---

# Buenas Prácticas

✅ Usa `SELECT *` para aprender o explorar datos.

✅ En producción, selecciona solo las columnas necesarias.

✅ Piensa en el rendimiento desde el principio.

✅ Revisa si realmente necesitas toda la información.

---

# Curiosidad

Muchos motores de bases de datos modernos pueden optimizar algunas consultas con `SELECT *`, pero **ninguno puede evitar enviar columnas que no solicitaste explícitamente**.

Por eso, seleccionar únicamente las columnas necesarias sigue siendo una buena práctica.

---

# Resumen

- `SELECT *` devuelve todas las columnas de una tabla.
- Es excelente para aprendizaje y depuración.
- En aplicaciones reales es preferible seleccionar solo las columnas necesarias.
- Reducir la cantidad de datos mejora el rendimiento y hace el código más claro.