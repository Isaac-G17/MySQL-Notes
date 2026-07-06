# Primeros Pasos con MySQL

## Objetivos

Al finalizar este capítulo serás capaz de:

- Conectarte al servidor MySQL.
- Entender qué es un servidor MySQL.
- Crear una base de datos.
- Seleccionar una base de datos.
- Ver las bases de datos existentes.
- Eliminar una base de datos.
- Comprender qué es un Schema.

---

# ¿Qué necesitamos?

Antes de comenzar debes tener instalado:

✅ MySQL Server

✅ MySQL Workbench

Si ya puedes abrir Workbench y conectarte al servidor, estás listo.

---

# Nuestro Proyecto

Durante toda esta guía construiremos una base de datos para una tienda.

La llamaremos:

```text
tienda_db
```

Dentro de ella iremos agregando tablas como:

- clientes
- productos
- categorías
- proveedores
- pedidos
- detalle_pedidos
- empleados
- pagos

Cada nuevo tema de la guía ampliará esta base de datos.

---

# ¿Qué es una Base de Datos?

Una base de datos es un contenedor donde se almacenan tablas relacionadas.

Ejemplo:

```text
tienda_db

│

├── clientes

├── productos

├── pedidos

├── categorias

└── empleados
```

Cada base de datos puede contener una o muchas tablas.

---

# ¿Qué es un Schema?

En MySQL, los términos **Database** y **Schema** se utilizan prácticamente como sinónimos.

Cuando en Workbench ves:

```
SCHEMAS
```

En realidad estás viendo las bases de datos disponibles.

Por eso, estas dos instrucciones hacen referencia a lo mismo:

```sql
CREATE DATABASE tienda_db;
```

y

```sql
CREATE SCHEMA tienda_db;
```

Ambas crean una nueva base de datos.

---

# Ver las Bases de Datos

Para listar todas las bases de datos del servidor utilizamos:

```sql
SHOW DATABASES;
```

Resultado de ejemplo:

```text
information_schema

mysql

performance_schema

sys
```

Estas bases de datos son creadas automáticamente por MySQL.

No debes modificarlas si no sabes exactamente lo que haces.

---

# Crear una Base de Datos

Sintaxis:

```sql
CREATE DATABASE nombre_base;
```

Ejemplo:

```sql
CREATE DATABASE tienda_db;
```

Si todo salió bien, MySQL responderá:

```text
Query OK
```

---

# Verificar que se creó

Ejecuta nuevamente:

```sql
SHOW DATABASES;
```

Ahora deberías ver:

```text
information_schema

mysql

performance_schema

sys

tienda_db
```

---

# Seleccionar una Base de Datos

Antes de crear tablas debes indicar en qué base de datos trabajarás.

Para ello se utiliza:

```sql
USE tienda_db;
```

A partir de ese momento todas las consultas se ejecutarán sobre esa base de datos.

---

# ¿Cómo saber qué base de datos estás usando?

Ejecuta:

```sql
SELECT DATABASE();
```

Resultado:

```text
tienda_db
```

Si aparece `NULL`, significa que no has seleccionado ninguna base de datos.

---

# Crear una Base de Datos solo si no existe

Si intentas crear una base de datos que ya existe, obtendrás un error.

Para evitarlo:

```sql
CREATE DATABASE IF NOT EXISTS tienda_db;
```

Esta es la forma recomendada en scripts.

---

# Eliminar una Base de Datos

⚠️ **Advertencia**

Eliminar una base de datos borra todas sus tablas y datos de forma permanente.

Sintaxis:

```sql
DROP DATABASE tienda_db;
```

---

# Eliminar solo si existe

```sql
DROP DATABASE IF EXISTS tienda_db;
```

Esto evita errores si la base de datos ya fue eliminada.

---

# Flujo típico de trabajo

```sql
SHOW DATABASES;

CREATE DATABASE tienda_db;

USE tienda_db;

SHOW TABLES;
```

---

# ¿Qué hace SHOW TABLES?

Lista todas las tablas de la base de datos seleccionada.

Como todavía no hemos creado ninguna:

```sql
SHOW TABLES;
```

Resultado:

```text
Empty set
```

Esto es completamente normal.

---

# Comentarios en SQL

Puedes agregar comentarios para documentar tu código.

Comentario de una línea:

```sql
-- Crear la base de datos

CREATE DATABASE tienda_db;
```

También puedes usar:

```sql
# Crear la base de datos

CREATE DATABASE tienda_db;
```

Comentarios de varias líneas:

```sql
/*

Este script

crea la base de datos principal

*/

CREATE DATABASE tienda_db;
```

Comentar el código es una buena práctica, especialmente en proyectos grandes.

---

# Script Completo

```sql
-- Crear la base de datos

CREATE DATABASE IF NOT EXISTS tienda_db;

-- Seleccionarla

USE tienda_db;

-- Verificar la base de datos activa

SELECT DATABASE();

-- Mostrar las tablas

SHOW TABLES;
```

---

# Errores Comunes

## Error 1

```text
Unknown database 'tienda_db'
```

Causa:

La base de datos no existe.

Solución:

```sql
SHOW DATABASES;
```

Verifica el nombre o créala.

---

## Error 2

```text
No database selected
```

Causa:

Olvidaste ejecutar:

```sql
USE tienda_db;
```

---

## Error 3

```text
Can't create database; database exists
```

Solución:

```sql
CREATE DATABASE IF NOT EXISTS tienda_db;
```

---

# Buenas Prácticas

- Usa nombres descriptivos para las bases de datos.
- Evita espacios en los nombres.
- Usa minúsculas para mantener consistencia.
- Utiliza `IF NOT EXISTS` en scripts.
- Nunca elimines una base de datos sin estar seguro.

---

# Resumen

- `SHOW DATABASES;` lista las bases de datos.
- `CREATE DATABASE` crea una base de datos.
- `USE` selecciona la base de datos activa.
- `SHOW TABLES;` muestra las tablas.
- `SELECT DATABASE();` indica la base de datos en uso.
- `DROP DATABASE` elimina una base de datos.