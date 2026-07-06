# Tipos de Bases de Datos

## Introducción

No todas las bases de datos funcionan de la misma manera. Dependiendo del tipo de información que se almacene y de las necesidades del proyecto, existen diferentes modelos de bases de datos.

Elegir el tipo correcto es una decisión importante en el desarrollo de software, ya que influye en el rendimiento, la escalabilidad y la facilidad de mantenimiento.

---

# Clasificación de las Bases de Datos

Las bases de datos pueden clasificarse de varias formas, pero las más utilizadas son:

- Relacionales (SQL)
- No Relacionales (NoSQL)

Dentro de estas categorías existen diferentes tipos.

---

# 1. Bases de Datos Relacionales (SQL)

Las bases de datos relacionales almacenan la información en **tablas**.

Cada tabla está formada por:

- Filas (Registros)
- Columnas (Campos)

Ejemplo:

## Tabla Clientes

| id | nombre | ciudad |
|----|---------|---------|
|1|Juan|Bogotá|
|2|María|Medellín|
|3|Carlos|Cali|

Cada fila representa un cliente.

Cada columna representa una característica del cliente.

---

## Características

- Los datos se organizan en tablas.
- Las tablas pueden relacionarse entre sí.
- Utilizan SQL.
- Mantienen la integridad de los datos.
- Son ideales para aplicaciones empresariales.

---

## Ejemplos

- MySQL
- PostgreSQL
- SQL Server
- Oracle Database
- MariaDB
- SQLite

---

# Ejemplo de Relación

## Clientes

| id | nombre |
|----|---------|
|1|Juan|
|2|María|

## Pedidos

| id | cliente_id | total |
|----|-------------|-------|
|1|1|250|
|2|2|100|
|3|1|80|

Observa que **cliente_id** hace referencia al cliente que realizó el pedido.

Gracias a esto es posible relacionar ambas tablas.

---

# Ventajas

✅ Muy organizadas.

✅ Fácil consultar información.

✅ Evitan datos duplicados.

✅ Gran seguridad.

✅ Soportan transacciones.

✅ Mantienen la consistencia de los datos.

---

# Desventajas

❌ Diseñar la base de datos requiere planificación.

❌ Cambiar la estructura puede ser complejo.

❌ Escalar horizontalmente suele ser más difícil.

---

# 2. Bases de Datos NoSQL

Las bases de datos NoSQL fueron creadas para manejar enormes cantidades de información de manera flexible y escalable.

No utilizan necesariamente tablas.

Dependiendo del motor pueden almacenar información como:

- Documentos
- Clave-Valor
- Grafos
- Columnas

---

# Bases de Datos de Documentos

Guardan la información como documentos JSON.

Ejemplo:

```json
{
    "nombre": "Juan",
    "edad": 25,
    "ciudad": "Bogotá"
}
```

Ejemplos:

- MongoDB
- CouchDB

---

# Bases de Datos Clave-Valor

La información se guarda mediante una clave y un valor.

Ejemplo:

```
usuario_15 → Juan Pérez

usuario_16 → María López

usuario_17 → Carlos Ruiz
```

Ejemplos:

- Redis
- DynamoDB

---

# Bases de Datos Orientadas a Columnas

Almacenan grandes cantidades de datos organizados por columnas.

Son muy utilizadas en Big Data.

Ejemplos:

- Cassandra
- HBase

---

# Bases de Datos de Grafos

Se utilizan para representar relaciones complejas.

Ejemplos:

- Redes sociales.
- Mapas.
- Sistemas de recomendación.

Ejemplos de motores:

- Neo4j
- Amazon Neptune

---

# SQL vs NoSQL

| SQL | NoSQL |
|------|--------|
| Tablas | Documentos, Grafos, Clave-Valor |
| Esquema fijo | Esquema flexible |
| Muy consistente | Muy escalable |
| Relaciones complejas | Relaciones simples |
| SQL | Cada motor tiene su propio lenguaje |

---

# ¿Cuándo usar MySQL?

MySQL es una excelente opción cuando trabajas con:

- Tiendas virtuales
- Sistemas de inventario
- Bancos
- Hospitales
- Universidades
- Sistemas administrativos
- Facturación
- Gestión de empleados
- CRM
- ERP

En general, cualquier aplicación donde la consistencia de los datos sea importante.

---

# ¿Cuándo usar MongoDB?

MongoDB suele ser una buena opción cuando:

- Los datos cambian constantemente.
- El esquema no está completamente definido.
- Se manejan grandes volúmenes de información.
- Se requiere escalar rápidamente.

---

# Comparación

| Característica | MySQL | MongoDB |
|---------------|--------|----------|
| Tablas | ✅ | ❌ |
| Documentos JSON | ❌ | ✅ |
| Relaciones | Excelente | Limitadas |
| Transacciones | Excelente | Buenas |
| Escalabilidad Horizontal | Buena | Excelente |
| Aprendizaje | Fácil | Fácil |

---

# Ejemplos Reales

## Banco

Un banco necesita garantizar que una transferencia se complete correctamente.

👉 Se recomienda MySQL.

---

## Red Social

Una red social genera millones de publicaciones diarias.

👉 MongoDB puede ser una buena opción para almacenar publicaciones.

---

## Tienda Online

Una tienda necesita controlar:

- Clientes
- Productos
- Facturas
- Inventario
- Pagos

👉 MySQL.

---

## Sistema de Chat

Una aplicación de chat genera millones de mensajes.

👉 MongoDB o Cassandra.

---

# Resumen

- Existen bases de datos SQL y NoSQL.
- MySQL pertenece a las bases de datos relacionales.
- Las bases de datos relacionales utilizan tablas.
- Las NoSQL utilizan documentos, grafos, columnas o clave-valor.
- No existe una base de datos "mejor"; depende del problema que se quiera resolver.
- MySQL destaca cuando la consistencia, las relaciones y la integridad de los datos son fundamentales.