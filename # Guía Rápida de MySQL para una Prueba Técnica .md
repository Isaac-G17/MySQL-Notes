# Guía Rápida de MySQL para una Prueba Técnica

> Esta guía resume los conceptos, comandos y relaciones más importantes que debes conocer para desarrollar una prueba técnica utilizando MySQL.

---

# 1. Flujo de trabajo recomendado

Antes de empezar a programar, sigue este orden:

```
Analizar requerimientos
        ↓
Diseñar el modelo entidad-relación (ER)
        ↓
Crear la Base de Datos
        ↓
Crear las tablas
        ↓
Definir relaciones
        ↓
Insertar datos
        ↓
Realizar consultas SQL
        ↓
Probar y corregir errores
```

---

# 2. ¿Qué es una Base de Datos?

Es un conjunto organizado de información que permite almacenar, consultar y administrar datos de manera eficiente.

Ejemplo:

```
Empresa

├── Clientes
├── Productos
├── Ventas
└── Empleados
```

---

# 3. ¿Qué es una Tabla?

Una tabla almacena información relacionada con un mismo tema.

Ejemplo:

```
Clientes

id | nombre | correo
```

Cada tabla representa una entidad del sistema.

---

# 4. ¿Qué es un Registro?

Un registro (fila) representa un elemento dentro de una tabla.

Ejemplo

| id | nombre | correo |
|----|---------|---------|
| 1 | Juan | juan@gmail.com |

La fila completa corresponde a un registro.

---

# 5. ¿Qué es una Columna?

Una columna representa una característica del registro.

Ejemplo

```
id
nombre
correo
telefono
```

Cada columna tiene un tipo de dato específico.

---

# 6. Crear una Base de Datos

Crea una nueva base de datos.

```sql
CREATE DATABASE tienda;
```

Seleccionarla

```sql
USE tienda;
```

Eliminarla

```sql
DROP DATABASE tienda;
```

---

# 7. Tipos de Datos

Definen el tipo de información que puede almacenar una columna.

## Numéricos

| Tipo | Uso |
|-------|-----|
| INT | Enteros |
| BIGINT | Enteros grandes |
| DECIMAL | Valores monetarios |
| FLOAT | Decimales |

Ejemplo

```sql
precio DECIMAL(10,2)
```

---

## Texto

| Tipo | Uso |
|-------|-----|
| CHAR | Texto fijo |
| VARCHAR | Texto variable |
| TEXT | Texto largo |

Ejemplo

```sql
nombre VARCHAR(100)
```

---

## Fecha

| Tipo | Uso |
|-------|-----|
| DATE | Fecha |
| TIME | Hora |
| DATETIME | Fecha y hora |

---

## Booleano

```sql
BOOLEAN
```

---

# 8. Crear Tablas

Permite crear una nueva tabla.

```sql
CREATE TABLE clientes(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) UNIQUE

);
```

---

# 9. Restricciones (Constraints)

Son reglas que garantizan la integridad de los datos.

## PRIMARY KEY

Identifica de forma única cada registro.

```sql
id INT PRIMARY KEY
```

---

## AUTO_INCREMENT

Genera automáticamente el siguiente número.

```sql
id INT AUTO_INCREMENT
```

---

## NOT NULL

Impide guardar valores vacíos.

```sql
nombre VARCHAR(100) NOT NULL
```

---

## UNIQUE

No permite valores repetidos.

```sql
correo VARCHAR(100) UNIQUE
```

---

## DEFAULT

Asigna un valor por defecto.

```sql
estado VARCHAR(20) DEFAULT 'Activo'
```

---

## CHECK

Valida una condición.

```sql
edad INT CHECK(edad>=18)
```

---

# 10. Llaves Primarias y Llaves Foráneas

## Primary Key (PK)

Es el identificador único de una tabla.

Ejemplo

```
Clientes

id (PK)
nombre
correo
```

Solo existe una PK por tabla.

---

## Foreign Key (FK)

Es una columna que crea una relación entre dos tablas.

Permite garantizar que los datos relacionados realmente existan.

---

# 11. Relaciones entre Tablas

## Uno a Uno (1:1)

Cada registro se relaciona con un único registro.

```
Persona
   │
   │
Documento
```

---

## Uno a Muchos (1:N)

Un registro puede relacionarse con muchos registros.

```
Cliente

id
nombre

        │

        │

Pedidos

cliente_id
fecha
```

Un cliente puede tener muchos pedidos.

---

## Muchos a Muchos (N:M)

Se necesita una tabla intermedia.

```
Estudiante

      │

      │

Matricula

      │

      │

Curso
```

---

# 12. Crear Relaciones con Llaves Foráneas

## Paso 1

Crear la tabla padre.

```sql
CREATE TABLE clientes(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100)

);
```

---

## Paso 2

Crear la tabla hija.

```sql
CREATE TABLE pedidos(

    id INT AUTO_INCREMENT PRIMARY KEY,

    cliente_id INT,

    fecha DATE,

    FOREIGN KEY(cliente_id)

    REFERENCES clientes(id)

);
```

---

Visualmente

```
Clientes

id (PK)

│

│

└───────────────┐
                │

Pedidos

cliente_id (FK)
```

---

## Reglas para una Foreign Key

- La tabla padre debe existir primero.
- La Primary Key debe existir.
- Ambos campos deben tener el mismo tipo de dato.
- No puede apuntar a una columna que no sea PK o UNIQUE.

---

## Agregar una FK después

```sql
ALTER TABLE pedidos

ADD CONSTRAINT fk_cliente

FOREIGN KEY(cliente_id)

REFERENCES clientes(id);
```

---

## Eliminar una FK

```sql
ALTER TABLE pedidos

DROP FOREIGN KEY fk_cliente;
```

---

# 13. ON DELETE y ON UPDATE

Definen qué ocurre cuando cambia la tabla padre.

## ON DELETE CASCADE

Si se elimina el cliente también se eliminan automáticamente sus pedidos.

```sql
ON DELETE CASCADE
```

---

## ON DELETE SET NULL

Si el cliente se elimina, la FK queda en NULL.

```sql
ON DELETE SET NULL
```

---

## ON DELETE RESTRICT

No permite eliminar un registro si existen datos relacionados.

---

## ON UPDATE CASCADE

Si cambia el id de la tabla padre, también cambia automáticamente en la tabla hija.

```sql
ON UPDATE CASCADE
```

---

# 14. Insertar Datos

Agrega registros a una tabla.

```sql
INSERT INTO clientes(nombre,correo)

VALUES

('Juan','juan@gmail.com'),
('Ana','ana@gmail.com');
```

---

# 15. Consultar Datos

Obtiene información de una tabla.

```sql
SELECT *

FROM clientes;
```

Seleccionar columnas específicas.

```sql
SELECT nombre,correo

FROM clientes;
```

---

# 16. WHERE

Filtra registros.

```sql
SELECT *

FROM clientes

WHERE ciudad='Bogotá';
```

Operadores

```
=
<>
!=
<
>
<=
>=
```

---

# 17. Operadores Lógicos

## AND

Todas las condiciones deben cumplirse.

```sql
WHERE edad>18

AND ciudad='Bogotá'
```

---

## OR

Al menos una condición debe cumplirse.

```sql
WHERE ciudad='Bogotá'

OR ciudad='Cali'
```

---

## NOT

Niega una condición.

```sql
WHERE NOT estado='Inactivo'
```

---

# 18. LIKE

Permite buscar patrones.

Empieza por

```sql
LIKE 'A%'
```

Termina en

```sql
LIKE '%z'
```

Contiene

```sql
LIKE '%an%'
```

---

# 19. IN

Compara varios valores.

```sql
WHERE ciudad IN

('Bogotá','Cali','Medellín')
```

---

# 20. BETWEEN

Busca dentro de un rango.

```sql
WHERE precio

BETWEEN 10000 AND 50000
```

---

# 21. IS NULL

Busca valores nulos.

```sql
WHERE telefono IS NULL
```

---

# 22. ORDER BY

Ordena resultados.

Ascendente

```sql
ORDER BY nombre ASC
```

Descendente

```sql
ORDER BY salario DESC
```

---

# 23. LIMIT

Limita la cantidad de registros.

```sql
LIMIT 10
```

---

# 24. Alias

Permite renombrar columnas temporalmente.

```sql
SELECT nombre AS Cliente

FROM clientes;
```

---

# 25. Funciones de Agregación

Realizan cálculos sobre varios registros.

```
COUNT()
SUM()
AVG()
MAX()
MIN()
```

---

# 26. GROUP BY

Agrupa registros que tienen el mismo valor.

```sql
SELECT ciudad,

COUNT(*)

FROM clientes

GROUP BY ciudad;
```

---

# 27. HAVING

Filtra los grupos creados por GROUP BY.

```sql
SELECT ciudad,

COUNT(*)

FROM clientes

GROUP BY ciudad

HAVING COUNT(*)>5;
```

---

# 28. INNER JOIN

Obtiene únicamente los registros relacionados entre dos tablas.

```sql
SELECT c.nombre,

p.fecha

FROM clientes c

INNER JOIN pedidos p

ON c.id=p.cliente_id;
```

---

# 29. LEFT JOIN

Muestra todos los registros de la tabla izquierda, aunque no tengan relación.

```sql
SELECT *

FROM clientes c

LEFT JOIN pedidos p

ON c.id=p.cliente_id;
```

---

# 30. RIGHT JOIN

Muestra todos los registros de la tabla derecha.

```sql
SELECT *

FROM clientes c

RIGHT JOIN pedidos p

ON c.id=p.cliente_id;
```

---

# 31. Subconsultas

Es una consulta dentro de otra consulta.

```sql
SELECT *

FROM empleados

WHERE salario>

(

SELECT AVG(salario)

FROM empleados

);
```

---

# 32. UPDATE

Actualiza registros.

```sql
UPDATE clientes

SET telefono='3001112233'

WHERE id=1;
```

---

# 33. DELETE

Elimina registros.

```sql
DELETE FROM clientes

WHERE id=1;
```

---

# 34. TRUNCATE

Elimina todos los registros de una tabla sin borrar su estructura.

```sql
TRUNCATE TABLE clientes;
```

---

# 35. DROP

Elimina completamente una tabla.

```sql
DROP TABLE clientes;
```

---

# 36. ALTER TABLE

Permite modificar una tabla existente.

Agregar columna

```sql
ALTER TABLE clientes

ADD edad INT;
```

Modificar columna

```sql
ALTER TABLE clientes

MODIFY edad SMALLINT;
```

Eliminar columna

```sql
ALTER TABLE clientes

DROP COLUMN edad;
```

---

# 37. Índices

Mejoran la velocidad de búsqueda en una tabla.

```sql
CREATE INDEX idx_nombre

ON clientes(nombre);
```

---

# 38. Vistas

Son consultas almacenadas que pueden reutilizarse como si fueran tablas.

```sql
CREATE VIEW vista_clientes AS

SELECT nombre,correo

FROM clientes;
```

---

# 39. Funciones Útiles

Fecha actual

```sql
NOW()
```

Solo fecha

```sql
CURDATE()
```

Solo hora

```sql
CURTIME()
```

Mayúsculas

```sql
UPPER()
```

Minúsculas

```sql
LOWER()
```

Concatenar

```sql
CONCAT()
```

Redondear

```sql
ROUND()
```

---

# 40. Importar y Exportar

## Exportar

```
Server
→ Data Export
```

## Importar

```
Server
→ Data Import
```

También es posible importar ejecutando un archivo `.sql`.

---

# 41. Errores Comunes

| Error | Significado |
|--------|-------------|
| 1064 | Error de sintaxis |
| 1049 | Base de datos inexistente |
| 1146 | Tabla inexistente |
| 1062 | Valor duplicado en UNIQUE |
| 1048 | Valor NULL donde no está permitido |
| 1452 | Problema con una Foreign Key |

---

# 42. Buenas Prácticas

- Usar nombres descriptivos para tablas y columnas.
- Definir una Primary Key en cada tabla.
- Utilizar Foreign Keys cuando exista una relación.
- Mantener el mismo tipo de dato entre PK y FK.
- Evitar `SELECT *` cuando no sea necesario.
- Siempre usar `WHERE` en `UPDATE` y `DELETE`.
- Utilizar `utf8mb4` como conjunto de caracteres.
- Probar todas las consultas antes de entregar la prueba.

---

# 43. Checklist Antes de Entregar

- Base de datos creada.
- Tablas correctamente diseñadas.
- Relaciones funcionando.
- Llaves primarias definidas.
- Llaves foráneas definidas.
- Datos insertados.
- Consultas verificadas.
- JOIN funcionando.
- Script sin errores.
- El archivo `.sql` se puede importar desde cero correctamente.