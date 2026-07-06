# ¿Qué es MySQL?

## Objetivos

Al finalizar este capítulo serás capaz de:

- Comprender qué es MySQL.
- Conocer su historia.
- Identificar sus características principales.
- Diferenciar las ediciones de MySQL.
- Entender cuándo utilizar MySQL.
- Conocer su arquitectura básica.

---

# ¿Qué es MySQL?

MySQL es un **Sistema Gestor de Bases de Datos Relacional (RDBMS)** que utiliza el lenguaje SQL para almacenar, consultar y administrar información.

Es uno de los motores de bases de datos más utilizados del mundo.

Con MySQL puedes crear aplicaciones como:

- Tiendas online
- Redes sociales
- Sistemas de inventario
- Hospitales
- Bancos
- Sistemas académicos
- Blogs
- APIs
- ERP
- CRM

---

# ¿Qué significa MySQL?

El nombre MySQL tiene dos partes.

## My

Proviene del nombre de la hija de uno de sus creadores, **My Widenius**.

## SQL

Significa:

**Structured Query Language**

Es el lenguaje utilizado para trabajar con bases de datos relacionales.

---

# Historia

1995

Michael "Monty" Widenius y David Axmark crean MySQL.

2008

MySQL AB es comprada por Sun Microsystems.

2010

Oracle compra Sun Microsystems y adquiere MySQL.

Actualmente MySQL continúa siendo desarrollado por Oracle.

---

# ¿Por qué MySQL es tan popular?

Porque es:

- Gratuito (Community Edition)
- Muy rápido
- Fácil de aprender
- Compatible con múltiples sistemas operativos
- Compatible con la mayoría de los lenguajes de programación
- Muy estable
- Posee una enorme comunidad

---

# Características

## Open Source

La versión Community puede utilizarse gratuitamente.

---

## Multiplataforma

Funciona en:

- Windows
- Linux
- macOS

---

## Multiusuario

Muchos usuarios pueden conectarse simultáneamente.

---

## Cliente-Servidor

MySQL trabaja mediante un servidor al cual se conectan diferentes clientes.

---

## Seguro

Permite crear usuarios con distintos permisos.

---

## Escalable

Puede utilizarse tanto en pequeños proyectos como en aplicaciones con millones de registros.

---

# Versiones

Las versiones principales han sido:

MySQL 5.5

↓

MySQL 5.6

↓

MySQL 5.7

↓

MySQL 8.0

↓

MySQL 8.4 LTS

Las versiones LTS (Long-Term Support) reciben soporte durante más tiempo y son recomendadas para producción.

---

# Ediciones

## Community Edition

- Gratuita
- Open Source
- Ideal para estudiantes
- Ideal para pequeñas y medianas empresas

Es la versión que utilizaremos.

---

## Enterprise Edition

Incluye herramientas adicionales como:

- Auditoría
- Monitoreo avanzado
- Backups empresariales
- Soporte oficial de Oracle

Es de pago.

---

# Casos de Uso

MySQL se utiliza en:

## Comercio Electrónico

- Productos
- Pedidos
- Inventario

---

## Educación

- Estudiantes
- Profesores
- Cursos

---

## Salud

- Pacientes
- Citas
- Historial clínico

---

## Finanzas

- Cuentas
- Transacciones
- Clientes

---

## Aplicaciones Web

- Usuarios
- Publicaciones
- Comentarios
- Roles

---

# Lenguajes compatibles

MySQL puede conectarse con prácticamente cualquier lenguaje.

Ejemplos:

- Python
- Java
- JavaScript (Node.js)
- PHP
- C#
- Go
- Ruby

---

# Arquitectura General

```text
Aplicación

↓

Driver o Conector

↓

Servidor MySQL

↓

Motor de Almacenamiento (InnoDB)

↓

Archivos de la Base de Datos
```

---

# ¿Qué instala MySQL?

Cuando instalas MySQL normalmente obtienes:

## MySQL Server

El servidor que administra las bases de datos.

---

## MySQL Workbench

Interfaz gráfica para administrar MySQL.

---

## MySQL Shell

Consola moderna para trabajar con MySQL.

---

## MySQL Command Line Client

Cliente de línea de comandos.

---

## Connectors

Permiten conectar aplicaciones escritas en distintos lenguajes con MySQL.

---

# ¿Dónde se almacenan las bases de datos?

Cuando creas una base de datos, MySQL guarda la información en archivos físicos dentro de un directorio conocido como **Data Directory**.

Por ejemplo, en Windows suele encontrarse en:

```text
C:\ProgramData\MySQL\MySQL Server 8.0\Data
```

> **Nota:** La ruta puede variar según la versión y el método de instalación.

Dentro de ese directorio, cada base de datos tiene su propia carpeta con los archivos correspondientes.

---

# Ventajas de MySQL

- Fácil de aprender.
- Excelente documentación.
- Gran comunidad.
- Muy buen rendimiento.
- Compatible con múltiples plataformas.
- Integración con muchos lenguajes.
- Amplio soporte para herramientas de desarrollo.

---

# Limitaciones

- Algunas características avanzadas están disponibles en otros motores como PostgreSQL.
- La edición Enterprise incluye funciones que no están en Community.
- El rendimiento depende de un buen diseño de la base de datos y de las consultas.

---

# Buenas Prácticas

- Utiliza siempre una versión estable.
- Mantén MySQL actualizado.
- Trabaja con InnoDB como motor de almacenamiento.
- Haz copias de seguridad periódicas.
- Usa nombres claros para bases de datos y tablas.

---

# Resumen

- MySQL es un Sistema Gestor de Bases de Datos Relacional.
- Utiliza SQL para administrar la información.
- Es gratuito en su edición Community.
- Funciona con una arquitectura cliente-servidor.
- Es compatible con múltiples lenguajes y sistemas operativos.
- Es una de las herramientas más utilizadas en el desarrollo web y empresarial.