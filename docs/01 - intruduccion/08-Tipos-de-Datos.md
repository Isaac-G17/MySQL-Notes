# Tipos de Datos en MySQL

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué son los tipos de datos.
- Elegir el tipo adecuado para cada columna.
- Diferenciar entre datos numéricos, texto, fechas y datos especiales.
- Conocer las ventajas y limitaciones de cada tipo.
- Evitar errores comunes de diseño.

---

# ¿Qué es un Tipo de Dato?

Un tipo de dato define **qué clase de información puede almacenarse en una columna**.

Por ejemplo:

```text
Nombre → Texto

Edad → Número entero

Precio → Número decimal

Fecha de nacimiento → Fecha

Activo → Verdadero o Falso
```

Cada columna debe tener un tipo de dato específico.

---

# ¿Por qué es importante elegir el tipo correcto?

Porque afecta:

- El espacio ocupado en disco.
- El rendimiento de las consultas.
- La validación de los datos.
- La integridad de la información.

Ejemplo:

No tendría sentido guardar un precio usando `VARCHAR`, ya que impediría hacer cálculos fácilmente.

---

# Clasificación de los Tipos de Datos

MySQL agrupa los tipos de datos en las siguientes categorías:

- Numéricos
- Texto
- Fecha y Hora
- Booleanos
- Binarios
- JSON
- Espaciales (avanzado)

---

# Tipos Numéricos Enteros

Se utilizan para almacenar números sin decimales.

| Tipo | Tamaño | Rango aproximado (con signo) |
|------|--------|------------------------------:|
| TINYINT | 1 byte | -128 a 127 |
| SMALLINT | 2 bytes | -32,768 a 32,767 |
| MEDIUMINT | 3 bytes | -8 millones a 8 millones |
| INT | 4 bytes | -2,147,483,648 a 2,147,483,647 |
| BIGINT | 8 bytes | ±9 quintillones |

---

## ¿Cuándo usar cada uno?

### TINYINT

Ideal para:

- Edad
- Estados
- Calificaciones
- Valores pequeños

Ejemplo:

```sql
edad TINYINT
```

---

### SMALLINT

Ideal para:

- Número de estudiantes.
- Cantidad de productos.
- Valores medianos.

---

### INT

Es el tipo más utilizado.

Ideal para:

- IDs
- Cantidades
- Inventario
- Pedidos

Ejemplo:

```sql
id INT
```

---

### BIGINT

Cuando un `INT` no es suficiente.

Ejemplo:

- Redes sociales.
- Grandes bancos.
- Plataformas con miles de millones de registros.

---

# UNSIGNED

Todos los enteros pueden declararse como **UNSIGNED**.

Significa que **no permiten números negativos**.

Ejemplo:

```sql
edad TINYINT UNSIGNED
```

Ahora el rango será:

```
0 → 255
```

Muy útil para:

- Edad
- Stock
- Cantidad
- IDs

---

# AUTO_INCREMENT

Permite generar números automáticamente.

Ejemplo:

```sql
id INT AUTO_INCREMENT
```

Resultado:

```
1

2

3

4

5
```

Es la opción más utilizada para claves primarias.

---

# Tipos Decimales

Cuando necesitamos decimales tenemos varias opciones.

---

## FLOAT

Precisión aproximada.

Ejemplo:

```text
Peso

Temperatura

Coordenadas aproximadas
```

---

## DOUBLE

Mayor precisión que FLOAT.

Se utiliza cuando los cálculos requieren más exactitud.

---

## DECIMAL

Es el más recomendado para dinero.

Ejemplo:

```sql
precio DECIMAL(10,2)
```

Significa:

```
99999999.99
```

Los dos últimos dígitos son los decimales.

---

## ¿Por qué no usar FLOAT para dinero?

FLOAT almacena valores aproximados.

Ejemplo:

```
0.1 + 0.2

Puede resultar:

0.30000000004
```

DECIMAL almacena el valor exacto.

---

# Tipos de Texto

---

## CHAR

Longitud fija.

Ejemplo:

```sql
codigo CHAR(5)
```

Si almacenas:

```
ABC
```

MySQL reserva espacio para:

```
ABC__
```

Siempre ocupará cinco caracteres.

Ideal para:

- Códigos
- Países
- Género
- Siglas

---

## VARCHAR

Longitud variable.

Ejemplo:

```sql
nombre VARCHAR(100)
```

Si escribes:

```
Juan
```

Solo ocupa espacio para "Juan".

Es el tipo más utilizado para texto corto.

---

## TEXT

Se utiliza para textos largos.

Ejemplos:

- Comentarios.
- Descripciones.
- Artículos.
- Biografías.

---

# Comparación

| Tipo | Uso recomendado |
|------|-----------------|
| CHAR | Longitud fija |
| VARCHAR | Longitud variable |
| TEXT | Textos largos |

---

# Tipos de Fecha

---

## DATE

Solo almacena la fecha.

Formato:

```text
AAAA-MM-DD
```

Ejemplo:

```text
2026-07-06
```

---

## TIME

Solo almacena la hora.

```text
14:30:15
```

---

## DATETIME

Fecha y hora.

```text
2026-07-06 14:30:15
```

---

## TIMESTAMP

También almacena fecha y hora, pero suele utilizarse para registrar eventos como:

- Fecha de creación.
- Fecha de modificación.
- Último acceso.

Puede actualizarse automáticamente.

---

# YEAR

Almacena únicamente el año.

Ejemplo:

```
2026
```

No es muy común, pero existe.

---

# Booleanos

MySQL realmente usa `TINYINT(1)` para representar valores booleanos.

Ejemplo:

```sql
activo BOOLEAN
```

Equivale a:

```
0 = FALSE

1 = TRUE
```

---

# ENUM

Permite limitar los valores posibles.

Ejemplo:

```sql
estado ENUM('Pendiente','Enviado','Entregado')
```

No será posible insertar otro valor distinto.

---

# JSON

Permite almacenar documentos JSON.

Ejemplo:

```json
{
  "color": "rojo",
  "talla": "M"
}
```

Muy útil para información flexible.

---

# BLOB

Se utiliza para datos binarios.

Ejemplos:

- Imágenes
- Archivos
- Audio
- Videos

En la práctica, normalmente es mejor almacenar los archivos en un sistema de archivos o en la nube y guardar en la base de datos solo la ruta o URL.

---

# ¿Qué tipo usar?

| Información | Tipo recomendado |
|-------------|------------------|
| id | INT UNSIGNED AUTO_INCREMENT |
| nombre | VARCHAR(100) |
| apellido | VARCHAR(100) |
| correo | VARCHAR(255) |
| contraseña (hash) | VARCHAR(255) |
| edad | TINYINT UNSIGNED |
| salario | DECIMAL(10,2) |
| precio | DECIMAL(10,2) |
| cantidad | INT UNSIGNED |
| descripción | TEXT |
| fecha_nacimiento | DATE |
| fecha_creación | TIMESTAMP |
| activo | BOOLEAN |
| estado | ENUM(...) |

---

# Errores Comunes

## Guardar precios con FLOAT

❌ Incorrecto:

```sql
precio FLOAT
```

✅ Correcto:

```sql
precio DECIMAL(10,2)
```

---

## Guardar teléfonos como INT

❌ Incorrecto:

```sql
telefono INT
```

Problemas:

- Un teléfono no se utiliza para hacer operaciones matemáticas.
- Puede comenzar con cero.
- Puede incluir el prefijo `+`.

✅ Correcto:

```sql
telefono VARCHAR(20)
```

---

## Usar TEXT para nombres

❌ Incorrecto:

```sql
nombre TEXT
```

✅ Correcto:

```sql
nombre VARCHAR(100)
```

---

# Buenas Prácticas

- Usa `INT UNSIGNED AUTO_INCREMENT` para identificadores.
- Usa `DECIMAL` para valores monetarios.
- Usa `VARCHAR` para texto corto.
- Usa `TEXT` solo cuando realmente necesites almacenar textos largos.
- Usa `DATE` o `DATETIME` según el caso.
- Evita usar tipos más grandes de lo necesario.

---

# Resumen

- Los tipos de datos definen qué información puede almacenarse en una columna.
- Elegir el tipo correcto mejora el rendimiento y el uso del espacio.
- `VARCHAR` es el tipo más usado para texto.
- `DECIMAL` es la mejor opción para dinero.
- `INT UNSIGNED AUTO_INCREMENT` es la opción habitual para claves primarias.
- `DATE`, `DATETIME` y `TIMESTAMP` tienen usos diferentes y deben elegirse según el contexto.