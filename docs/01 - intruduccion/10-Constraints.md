# Constraints (Restricciones) en MySQL

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué son las restricciones.
- Aplicar reglas para mantener la integridad de los datos.
- Utilizar `NOT NULL`, `UNIQUE`, `DEFAULT`, `PRIMARY KEY`, `FOREIGN KEY` y `CHECK`.
- Diseñar tablas más seguras y confiables.
- Evitar errores comunes de integridad.

---

# ¿Qué es una Constraint?

Una **Constraint** (restricción) es una regla que MySQL aplica automáticamente sobre una columna o tabla.

Su objetivo es garantizar que los datos almacenados sean válidos.

Por ejemplo:

- Un correo no debe repetirse.
- Un producto no puede tener un precio negativo.
- Un pedido no puede pertenecer a un cliente inexistente.
- Un usuario debe tener un identificador único.

Las restricciones ayudan a mantener la consistencia de la base de datos.

---

# Tipos de Constraints

Las principales restricciones en MySQL son:

- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- DEFAULT
- CHECK

Las veremos una por una.

---

# NOT NULL

## ¿Qué hace?

Impide que una columna almacene valores `NULL`.

### Sin NOT NULL

```sql
CREATE TABLE clientes (

    id INT,

    nombre VARCHAR(100)

);
```

Podríamos insertar:

| id | nombre |
|----|---------|
|1|NULL|

Esto puede ser un problema.

---

## Con NOT NULL

```sql
CREATE TABLE clientes (

    id INT,

    nombre VARCHAR(100) NOT NULL

);
```

Ahora MySQL rechazará:

```sql
INSERT INTO clientes (id)

VALUES (1);
```

Error:

```text
Column 'nombre' cannot be null
```

---

## ¿Cuándo usar NOT NULL?

En información obligatoria.

Ejemplos:

- Nombre
- Apellido
- Precio
- Fecha
- Stock

No es recomendable permitir valores nulos si el dato es indispensable.

---

# UNIQUE

## ¿Qué hace?

Impide valores duplicados.

Ejemplo:

```sql
correo VARCHAR(255) UNIQUE
```

Ahora podemos insertar:

| correo |
|-------------------|
|juan@email.com|

Pero si intentamos insertar nuevamente:

```text
juan@email.com
```

MySQL mostrará un error.

---

## ¿Cuándo usar UNIQUE?

Muy útil para:

- Correos electrónicos
- Documento de identidad
- Usuario
- Código de barras
- Número de serie

---

# PRIMARY KEY

Ya la conocemos, pero ahora veremos su comportamiento.

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

Una clave primaria:

- No admite NULL.
- No admite duplicados.
- Identifica un registro de forma única.

Toda tabla debería tener una.

---

# FOREIGN KEY

Es una de las restricciones más importantes.

Permite relacionar tablas.

Ejemplo:

## Tabla Clientes

```sql
CREATE TABLE clientes (

    id INT PRIMARY KEY,

    nombre VARCHAR(100)

);
```

---

## Tabla Pedidos

```sql
CREATE TABLE pedidos (

    id INT PRIMARY KEY,

    cliente_id INT,

    FOREIGN KEY (cliente_id)

        REFERENCES clientes(id)

);
```

Ahora:

```
cliente_id = 1
```

Solo será válido si existe un cliente con `id = 1`.

---

# Integridad Referencial

Supongamos:

Clientes

| id |
|----|
|1|
|2|

Intentamos insertar:

Pedidos

| cliente_id |
|------------|
|8|

MySQL responderá con un error porque el cliente 8 no existe.

Esto evita datos "huérfanos".

---

# DEFAULT

Permite asignar un valor por defecto.

Ejemplo:

```sql
activo BOOLEAN DEFAULT TRUE
```

Si insertamos:

```sql
INSERT INTO clientes(nombre)

VALUES('Juan');
```

El valor de `activo` será automáticamente:

```
TRUE
```

---

Otro ejemplo:

```sql
stock INT DEFAULT 0
```

Si no indicamos el stock, comenzará en cero.

---

# CHECK

Permite validar una condición.

Ejemplo:

```sql
edad INT

CHECK (edad >= 18)
```

Intentar insertar:

```
edad = 15
```

Generará un error.

---

Otro ejemplo:

```sql
precio DECIMAL(10,2)

CHECK(precio > 0)
```

No permitirá precios negativos ni iguales a cero.

> **Nota:** En versiones modernas de MySQL (8.0.16 o superiores), `CHECK` se aplica realmente. En versiones antiguas la sintaxis era aceptada, pero la restricción no se hacía cumplir.

---

# Crear una Tabla Completa

```sql
CREATE TABLE clientes (

    id INT UNSIGNED AUTO_INCREMENT,

    nombre VARCHAR(100) NOT NULL,

    apellido VARCHAR(100) NOT NULL,

    correo VARCHAR(255) UNIQUE,

    telefono VARCHAR(20),

    fecha_nacimiento DATE,

    activo BOOLEAN DEFAULT TRUE,

    PRIMARY KEY(id)

);
```

Esta tabla ya incorpora varias buenas prácticas.

---

# Constraints a Nivel de Tabla

También puedes declarar restricciones al final de la definición.

```sql
CREATE TABLE productos (

    id INT AUTO_INCREMENT,

    nombre VARCHAR(100),

    precio DECIMAL(10,2),

    PRIMARY KEY(id),

    CHECK(precio > 0)

);
```

---

# Nombrar las Constraints

En proyectos grandes es recomendable asignarles un nombre.

Ejemplo:

```sql
CONSTRAINT fk_pedido_cliente

FOREIGN KEY(cliente_id)

REFERENCES clientes(id)
```

Así, si ocurre un error, el nombre de la restricción facilita identificar el problema.

---

# ¿Qué pasa si elimino un cliente con pedidos?

Supongamos:

Cliente

```
Juan
```

Tiene:

5 pedidos.

Intentamos:

```sql
DELETE FROM clientes

WHERE id = 1;
```

MySQL normalmente responderá con un error porque existen pedidos relacionados.

Más adelante estudiaremos opciones como:

- `CASCADE`
- `SET NULL`
- `RESTRICT`
- `NO ACTION`

para controlar este comportamiento.

---

# Errores Comunes

## Permitir NULL donde no debería

❌ Incorrecto

```sql
nombre VARCHAR(100)
```

Si el nombre es obligatorio.

✅ Correcto

```sql
nombre VARCHAR(100) NOT NULL
```

---

## No usar UNIQUE en el correo

Esto permitiría varios usuarios con el mismo email.

---

## No definir una PRIMARY KEY

Dificulta la identificación de registros y las relaciones entre tablas.

---

## Usar CHECK para todo

`CHECK` es útil, pero algunas validaciones complejas deben hacerse también desde la aplicación.

---

# Buenas Prácticas

- Todas las tablas deben tener una clave primaria.
- Usa `NOT NULL` para campos obligatorios.
- Usa `UNIQUE` para datos que no deben repetirse.
- Usa `DEFAULT` para valores iniciales.
- Usa `CHECK` para validar reglas simples.
- Nombra las restricciones en proyectos grandes.

---

# Resumen

- Las constraints protegen la calidad de los datos.
- `NOT NULL` obliga a que un campo tenga un valor.
- `UNIQUE` evita duplicados.
- `PRIMARY KEY` identifica registros de forma única.
- `FOREIGN KEY` mantiene relaciones válidas entre tablas.
- `DEFAULT` asigna un valor automático.
- `CHECK` valida condiciones sobre los datos.