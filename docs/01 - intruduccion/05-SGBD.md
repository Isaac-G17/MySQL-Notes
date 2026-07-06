# Sistemas Gestores de Bases de Datos (SGBD)

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué es un SGBD.
- Diferenciar una base de datos de un SGBD.
- Entender la arquitectura cliente-servidor.
- Conocer los componentes principales de MySQL.
- Comprender cómo procesa MySQL una consulta SQL.

---

# ¿Qué es un SGBD?

Un Sistema Gestor de Bases de Datos (SGBD), conocido en inglés como **Database Management System (DBMS)**, es un software diseñado para crear, administrar y manipular bases de datos.

En otras palabras, el SGBD es el programa que permite trabajar con la información almacenada.

Piensa en él como un intermediario entre tú y los datos.

---

# Base de Datos vs SGBD

Es común confundir estos dos conceptos.

## Base de Datos

Es el conjunto de datos organizados.

Ejemplo:

Una base de datos llamada:

```
tienda
```

Contiene las tablas:

- clientes
- productos
- pedidos
- categorías

---

## SGBD

Es el software que administra esa base de datos.

Ejemplos:

- MySQL
- PostgreSQL
- SQL Server
- Oracle Database
- MariaDB

---

# Analogía

Imagina una biblioteca.

📚 Los libros representan los datos.

🏢 La biblioteca representa la base de datos.

👨‍💼 El bibliotecario representa el SGBD.

El bibliotecario se encarga de:

- Buscar libros.
- Registrar préstamos.
- Evitar pérdidas.
- Organizar la información.

Sin el bibliotecario sería muy difícil administrar la biblioteca.

Lo mismo ocurre con un SGBD.

---

# Funciones de un SGBD

Un SGBD permite:

- Crear bases de datos.
- Crear tablas.
- Insertar información.
- Consultar datos.
- Modificar registros.
- Eliminar registros.
- Controlar usuarios.
- Administrar permisos.
- Realizar copias de seguridad.
- Recuperar información.
- Optimizar consultas.
- Mantener la integridad de los datos.

---

# Ejemplo

Cuando escribes:

```sql
SELECT *
FROM clientes;
```

No estás consultando directamente el disco duro.

La consulta llega al SGBD.

Él se encarga de:

1. Leer la consulta.
2. Verificar que sea válida.
3. Comprobar que el usuario tenga permisos.
4. Buscar los datos.
5. Devolver el resultado.

Todo esto ocurre en milisegundos.

---

# Arquitectura Cliente-Servidor

MySQL funciona mediante una arquitectura cliente-servidor.

```text
              Usuario

                 │

                 ▼

        MySQL Workbench

                 │

                 ▼

          Servidor MySQL

                 │

                 ▼

        Base de Datos (Disco)
```

---

## Cliente

El cliente es el programa desde donde el usuario envía consultas.

Ejemplos:

- MySQL Workbench
- DBeaver
- phpMyAdmin
- Línea de comandos (`mysql`)
- Aplicaciones desarrolladas en Java, Python, PHP, Node.js, etc.

El cliente **no almacena los datos**. Solo envía instrucciones al servidor.

---

## Servidor

El servidor es el corazón de MySQL.

Se encarga de:

- Recibir consultas.
- Procesarlas.
- Leer datos.
- Escribir datos.
- Gestionar conexiones.
- Controlar la seguridad.
- Administrar transacciones.

El servidor es el que realmente trabaja con la base de datos.

---

## Base de Datos

La base de datos está formada por archivos físicos almacenados en el disco.

El servidor es quien accede a ellos.

---

# ¿Qué sucede cuando ejecutas un SELECT?

Supongamos la siguiente consulta:

```sql
SELECT nombre
FROM clientes
WHERE id = 5;
```

El proceso es:

```text
Usuario

↓

Workbench

↓

Servidor MySQL

↓

Valida la consulta

↓

Verifica permisos

↓

Busca la información

↓

Obtiene el registro

↓

Devuelve el resultado

↓

Workbench muestra la respuesta
```

Todo este proceso suele tardar solo unos milisegundos.

---

# Componentes Principales de MySQL

## 1. Servidor MySQL

Es el programa principal que ejecuta todas las operaciones.

---

## 2. Cliente

Permite conectarse al servidor.

Ejemplos:

- Workbench
- DBeaver
- Terminal
- Aplicaciones web

---

## 3. Motor de Almacenamiento (Storage Engine)

Es el componente encargado de guardar físicamente los datos.

MySQL soporta varios motores.

Los más conocidos son:

- InnoDB
- MyISAM
- MEMORY
- CSV
- ARCHIVE

En la actualidad, **InnoDB** es el motor predeterminado.

---

## ¿Qué hace un Storage Engine?

Se encarga de:

- Guardar datos.
- Leer datos.
- Crear índices.
- Gestionar bloqueos.
- Manejar transacciones (según el motor).

---

# ¿Por qué existen varios motores?

Cada motor está diseñado para diferentes necesidades.

Por ejemplo:

| Motor | Uso principal |
|--------|---------------|
| InnoDB | Aplicaciones generales, transacciones y claves foráneas |
| MyISAM | Lecturas rápidas, sin soporte para transacciones |
| MEMORY | Datos temporales almacenados en RAM |
| CSV | Exportación e intercambio de datos |
| ARCHIVE | Almacenamiento histórico con alta compresión |

---

# ¿Qué es InnoDB?

InnoDB es el motor de almacenamiento predeterminado de MySQL.

Características:

- Soporta transacciones.
- Permite claves foráneas.
- Recuperación ante fallos.
- Bloqueo por fila.
- Alta confiabilidad.

Es el motor recomendado para la mayoría de los proyectos.

---

# Comparación entre SGBD

| Característica | MySQL | PostgreSQL | SQL Server | Oracle Database |
|---------------|-------|------------|------------|-----------------|
| Gratuito | Sí (Community) | Sí | Ediciones limitadas | Principalmente de pago |
| Código abierto | Sí | Sí | No | No |
| Fácil de aprender | Sí | Sí | Intermedio | Avanzado |
| Ideal para web | Excelente | Excelente | Muy bueno | Muy bueno |
| Popularidad | Muy alta | Muy alta | Alta | Alta |

---

# Buenas Prácticas

- Mantén el servidor actualizado.
- Usa InnoDB salvo que tengas una razón específica para elegir otro motor.
- No confundas MySQL con la base de datos que administra.
- Configura usuarios con permisos mínimos necesarios.
- Realiza copias de seguridad periódicas.

---

# Errores Comunes

## Error 1

Pensar que MySQL es una base de datos.

**Correcto:** MySQL es un SGBD que administra bases de datos.

---

## Error 2

Creer que MySQL Workbench almacena los datos.

**Correcto:** Workbench es solo un cliente gráfico.

Los datos se almacenan en el servidor MySQL.

---

## Error 3

Eliminar MySQL Workbench esperando borrar las bases de datos.

**Correcto:** Desinstalar Workbench no elimina las bases de datos. Estas permanecen en el servidor hasta que se eliminen explícitamente.

---

# Resumen

- Un SGBD es un software para administrar bases de datos.
- MySQL es un SGBD, no una base de datos.
- MySQL funciona con una arquitectura cliente-servidor.
- El servidor procesa todas las consultas SQL.
- Workbench es un cliente que permite interactuar con el servidor.
- InnoDB es el motor de almacenamiento recomendado para la mayoría de los proyectos.