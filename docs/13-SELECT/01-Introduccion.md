# SELECT - Introducción

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué hace la instrucción SELECT.
- Consultar información almacenada en una tabla.
- Diferenciar entre recuperar todas las columnas y solo las necesarias.
- Comprender cómo MySQL procesa una consulta.

---

# ¿Qué es SELECT?

Hasta ahora hemos aprendido a:

- Crear bases de datos.
- Crear tablas.
- Insertar información.

Ahora necesitamos recuperar esos datos.

Para ello existe la instrucción más utilizada en SQL:

```sql
SELECT
```

Si `INSERT` agrega datos, `SELECT` los consulta.

---

# Ejemplo

Supongamos la tabla:

Clientes

| id | nombre | ciudad |
|----|---------|---------|
|1|Juan|Bogotá|
|2|María|Medellín|
|3|Carlos|Cali|

Si ejecutamos:

```sql
SELECT *
FROM clientes;
```

Obtendremos:

| id | nombre | ciudad |
|----|---------|---------|
|1|Juan|Bogotá|
|2|María|Medellín|
|3|Carlos|Cali|

No se modifica ningún dato.

Solo se consulta.

---

# ¿Qué significa el *?

El asterisco significa:

> "Traer todas las columnas."

Es decir:

```sql
SELECT *
```

equivale a decir:

```sql
SELECT

id,

nombre,

ciudad
```

aunque escribir explícitamente las columnas suele ser una mejor práctica.

---

# ¿Qué puede hacer SELECT?

SELECT es mucho más poderoso de lo que parece.

Con él podrás:

- Consultar registros.
- Filtrar información.
- Ordenar resultados.
- Agrupar datos.
- Hacer cálculos.
- Unir tablas.
- Contar registros.
- Obtener promedios.
- Buscar máximos y mínimos.
- Crear reportes.

La mayoría de las consultas que escribirás en proyectos reales utilizarán `SELECT`.

---

# Flujo de una Consulta

```text
Usuario

↓

SELECT

↓

Servidor MySQL

↓

Busca los datos

↓

Devuelve el resultado
```

A diferencia de `INSERT`, `UPDATE` o `DELETE`, `SELECT` no modifica la información.

---

# Sintaxis Básica

```sql
SELECT columnas

FROM tabla;
```

Ejemplo:

```sql
SELECT nombre

FROM clientes;
```

Resultado:

| nombre |
|----------|
|Juan|
|María|
|Carlos|

---

# SELECT no modifica datos

La consulta:

```sql
SELECT *

FROM clientes;
```

No elimina.

No actualiza.

No inserta.

Solo lee la información.

Por eso se considera una operación segura.

---

# Resumen

- `SELECT` recupera datos.
- No modifica la información.
- Es la instrucción más utilizada en SQL.
- Permite consultar una o varias columnas.
- Es la base para consultas más avanzadas.