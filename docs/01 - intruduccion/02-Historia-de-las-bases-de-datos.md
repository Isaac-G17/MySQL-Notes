# Historia de las Bases de Datos

## Introducción

Antes de existir las bases de datos modernas, las empresas almacenaban la información en documentos físicos o archivos planos. A medida que la cantidad de datos aumentó, surgió la necesidad de sistemas más rápidos, seguros y organizados.

Las bases de datos han evolucionado durante décadas hasta convertirse en una parte fundamental de prácticamente todas las aplicaciones que utilizamos hoy.

---

# Antes de las Bases de Datos

En los años 50 y 60 la información se almacenaba en:

- Papel
- Tarjetas perforadas
- Cintas magnéticas
- Archivos de texto

Por ejemplo, una empresa podía tener un archivo llamado:

Clientes.txt

```text
Juan Pérez
Medellín

María López
Bogotá

Carlos Ruiz
Cali
```

Cada vez que se necesitaba buscar un cliente, era necesario recorrer todo el archivo.

Este método era lento, propenso a errores y difícil de mantener.

---

# Sistemas Jerárquicos

A finales de los años 60 aparecieron las primeras bases de datos jerárquicas.

La información se organizaba como un árbol.

Ejemplo:

Empresa

├── Ventas

│   ├── Cliente 1

│   ├── Cliente 2

│   └── Cliente 3

└── Recursos Humanos

    ├── Empleado 1

    └── Empleado 2

### Ventajas

- Muy rápidas.
- Fáciles de recorrer.

### Desventajas

- Muy rígidas.
- Difíciles de modificar.
- No permitían relaciones complejas.

---

# Sistemas en Red

Posteriormente aparecieron las bases de datos en red.

Ahora un registro podía tener múltiples relaciones.

Aunque eran más flexibles, seguían siendo difíciles de administrar.

---

# El Modelo Relacional

En 1970 el científico británico **Edgar F. Codd** publicó un artículo que cambiaría por completo la informática.

Propuso almacenar la información utilizando **tablas relacionadas entre sí**.

Esta idea dio origen al **Modelo Relacional**, que sigue siendo el más utilizado actualmente.

Sus principales ventajas fueron:

- Simplicidad.
- Organización.
- Integridad de los datos.
- Facilidad para consultar información.

---

# Nace SQL

Pocos años después apareció SQL (Structured Query Language).

SQL permite comunicarse con una base de datos mediante instrucciones sencillas.

Ejemplo:

```sql
SELECT *
FROM clientes;
```

Con una sola consulta podemos obtener miles de registros.

---

# Aparición de MySQL

En 1995 nació MySQL.

Fue desarrollado por la empresa sueca MySQL AB.

Su objetivo era ofrecer un gestor de bases de datos:

- Rápido.
- Gratuito.
- Fácil de utilizar.

Con el tiempo se convirtió en uno de los motores de bases de datos más utilizados del mundo.

Actualmente pertenece a Oracle Corporation.

---

# Bases de Datos Actuales

Hoy existen diferentes tipos de bases de datos.

Algunas de las más conocidas son:

| Base de Datos | Tipo |
|--------------|------|
| MySQL | Relacional |
| PostgreSQL | Relacional |
| SQL Server | Relacional |
| Oracle Database | Relacional |
| SQLite | Relacional |
| MongoDB | NoSQL |
| Redis | NoSQL |
| Cassandra | NoSQL |

Cada una está diseñada para resolver diferentes necesidades.

---

# Línea del Tiempo

```text
1950  → Archivos físicos

1960  → Bases de datos jerárquicas

1970  → Modelo Relacional (Edgar F. Codd)

1974  → SQL

1995  → MySQL

2008  → Oracle compra MySQL AB

Actualidad → Bases de datos relacionales y NoSQL
```

---

# ¿Por qué es importante conocer esta historia?

Comprender la evolución de las bases de datos ayuda a entender por qué MySQL funciona de la manera en que lo hace.

Muchas de sus características actuales fueron creadas para solucionar problemas que existían hace décadas.

---

# Resumen

- Al principio los datos se almacenaban en papel y archivos de texto.
- Luego aparecieron las bases de datos jerárquicas y en red.
- En 1970 Edgar F. Codd creó el Modelo Relacional.
- SQL nació para consultar bases de datos relacionales.
- MySQL apareció en 1995 y se convirtió en uno de los sistemas gestores de bases de datos más populares del mundo.