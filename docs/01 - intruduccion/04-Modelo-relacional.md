# Modelo Relacional

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué es el modelo relacional.
- Entender cómo se organiza la información en MySQL.
- Identificar tablas, filas y columnas.
- Diferenciar entre claves primarias y foráneas.
- Comprender cómo se relacionan las tablas.
- Diseñar una base de datos sencilla.

---

# ¿Qué es el Modelo Relacional?

El modelo relacional es una forma de organizar la información utilizando **tablas**.

Cada tabla representa una entidad del mundo real.

Por ejemplo, en una tienda podríamos tener:

- Clientes
- Productos
- Pedidos
- Categorías
- Proveedores

Cada una de estas entidades se almacena en una tabla independiente.

---

# ¿Qué es una Tabla?

Una tabla es una estructura donde se almacenan datos relacionados.

Ejemplo:

## Tabla Clientes

| id | nombre | correo | ciudad |
|----|---------|-------------------|-----------|
|1|Juan Pérez|juan@email.com|Bogotá|
|2|María López|maria@email.com|Medellín|
|3|Carlos Ruiz|carlos@email.com|Cali|

Cada tabla tiene un propósito específico.

---

# Componentes de una Tabla

Una tabla está formada por:

- Columnas
- Filas

---

# Columnas

Las columnas representan las características de una entidad.

Ejemplo:

| Columna | Significado |
|----------|-------------|
| id | Identificador único |
| nombre | Nombre del cliente |
| correo | Correo electrónico |
| ciudad | Ciudad de residencia |

También se conocen como:

- Campos
- Atributos

---

# Filas

Las filas contienen los datos reales.

Ejemplo:

| id | nombre | correo |
|----|---------|----------------|
|1|Juan|juan@email.com|

Cada fila representa un registro único.

También se llaman:

- Registros
- Tuplas

---

# Ejemplo Visual

Tabla Productos

| id | nombre | precio |
|----|----------|--------|
|1|Laptop|3500|
|2|Mouse|80|
|3|Teclado|150|

Aquí podemos identificar:

Columnas

- id
- nombre
- precio

Filas

- Laptop
- Mouse
- Teclado

---

# ¿Qué es una Clave Primaria (Primary Key)?

Una clave primaria identifica de forma única cada registro de una tabla.

Ejemplo:

| id | nombre |
|----|---------|
|1|Juan|
|2|María|
|3|Carlos|

La columna **id** es la clave primaria.

Nunca pueden existir dos registros con el mismo valor de la clave primaria.

Incorrecto:

| id | nombre |
|----|---------|
|1|Juan|
|1|María|

Esto produciría un error.

---

# Características de una Primary Key

Una clave primaria:

- Es única.
- No puede ser NULL.
- Identifica un registro.
- Solo puede existir una por tabla.

---

# ¿Qué es una Clave Foránea (Foreign Key)?

Una clave foránea conecta una tabla con otra.

Gracias a ella podemos relacionar información.

---

## Tabla Clientes

| id | nombre |
|----|---------|
|1|Juan|
|2|María|

---

## Tabla Pedidos

| id | cliente_id | total |
|----|------------|-------|
|1|1|250|
|2|2|100|
|3|1|80|

Observa la columna **cliente_id**.

Su valor hace referencia al **id** de la tabla Clientes.

Así sabemos qué cliente realizó cada pedido.

---

# Relación Visual

```text
Clientes

id
1 Juan
2 María

      │

      │

cliente_id

Pedidos

1  → Juan

2  → María

1  → Juan
```

Una sola tabla no almacena toda la información; las tablas colaboran entre sí mediante relaciones.

---

# ¿Por qué Relacionar Tablas?

Imagina que cada pedido guardara también el nombre del cliente.

| pedido | cliente |
|---------|----------|
|1|Juan|
|2|Juan|
|3|Juan|
|4|Juan|

El nombre "Juan" estaría repetido muchas veces.

Esto provoca:

- Desperdicio de espacio.
- Mayor posibilidad de errores.
- Dificultad para actualizar datos.

Con relaciones basta guardar el identificador del cliente.

---

# Tipos de Relaciones

Existen tres relaciones principales.

---

## Uno a Uno (1:1)

Cada registro de una tabla se relaciona con un único registro de otra tabla.

Ejemplo:

Persona

↓

Pasaporte

Cada persona tiene un solo pasaporte.

Cada pasaporte pertenece a una sola persona.

---

## Uno a Muchos (1:N)

Es la relación más utilizada.

Ejemplo:

Cliente

↓

Pedidos

Un cliente puede tener muchos pedidos.

Cada pedido pertenece a un solo cliente.

---

## Muchos a Muchos (N:M)

Muchos registros de una tabla pueden relacionarse con muchos registros de otra.

Ejemplo:

Estudiantes

↓

Cursos

Un estudiante puede estar inscrito en varios cursos.

Un curso puede tener muchos estudiantes.

Para representar esta relación se utiliza una **tabla intermedia**.

---

## Ejemplo

Tabla Estudiantes

| id | nombre |
|----|---------|
|1|Ana|
|2|Luis|

---

Tabla Cursos

| id | nombre |
|----|---------|
|1|MySQL|
|2|Python|

---

Tabla Inscripciones

| estudiante_id | curso_id |
|---------------|-----------|
|1|1|
|1|2|
|2|1|

Esta tabla conecta ambas entidades.

---

# Integridad Referencial

La integridad referencial garantiza que las relaciones entre tablas sean válidas.

Ejemplo:

Clientes

| id |
|----|
|1|
|2|

Pedidos

| cliente_id |
|------------|
|3|

Esto es incorrecto.

No existe un cliente con id = 3.

MySQL impedirá esta operación si existe una clave foránea.

---

# Ventajas del Modelo Relacional

- Organización clara.
- Evita duplicación de datos.
- Facilita las consultas.
- Mayor seguridad.
- Mejor mantenimiento.
- Integridad de la información.
- Escalabilidad.

---

# Ejemplo Completo

Sistema de Tienda

```text
Clientes

id
nombre

        │

        ▼

Pedidos

id
cliente_id
fecha

        │

        ▼

Detalle_Pedido

pedido_id
producto_id
cantidad

        ▲

        │

Productos

id
nombre
precio
```

Cada tabla tiene una responsabilidad específica.

Las relaciones permiten reconstruir toda la información cuando sea necesario.

---

# Buenas Prácticas

- Utilizar una clave primaria en todas las tablas.
- Evitar almacenar información duplicada.
- Usar claves foráneas para mantener la integridad.
- Nombrar las tablas en singular o plural de forma consistente.
- Elegir nombres descriptivos para columnas y tablas.

---

# Resumen

- El modelo relacional organiza los datos en tablas.
- Las tablas están formadas por filas y columnas.
- Cada tabla representa una entidad.
- La clave primaria identifica de forma única un registro.
- La clave foránea conecta tablas entre sí.
- Existen relaciones 1:1, 1:N y N:M.
- La integridad referencial evita relaciones inválidas.