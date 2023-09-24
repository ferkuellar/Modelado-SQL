# Resumen del Proyecto de Gestión de Flota de Vehículo.

Este proyecto se centra en la gestión eficiente de la flota de vehículos. Mediante la implementación de un sistema de base de datos en PostgreSQL, se busca tener un control completo sobre diversos aspectos de la flota, como modelos de vehículos, marcas, grupos empresariales y más. Además, se abarcan detalles como el color del coche, matrícula, kilómetros recorridos y datos de la aseguradora. Un aspecto clave es el seguimiento de las revisiones de cada vehículo, incluyendo la fecha, kilómetros al momento y costos. El proyecto incluye un script SQL autónomo para crear y poblar la base de datos, así como archivos CSV de ejemplo para pruebas.

## Componentes Clave

1. **Modelo Entidad-Relación (ER)**  
   Identificación de entidades, relaciones y atributos relevantes.

2. **Script SQL Autónomo**  
   Creación de esquemas, tablas y relaciones entre ellas.

3. **Consulta SQL**  
   Listado de coches activos con diversos detalles.

# Gestión de Flota de Vehículos.

La tarea tiene varios componentes clave que se deben abordar para una solución completa. Estos componentes son:

## 1. Modelo Entidad-Relación (ER)

El primer paso es crear un modelo Entidad-Relación (ER) normalizado. Este modelo servirá como la estructura subyacente para la base de datos. Se deben identificar las entidades relevantes, como `Coche`, `Marca`, `Grupo` y `Aseguradora`, así como sus relaciones y atributos.

## 2. Script SQL Autónomo

El segundo componente es un script SQL que es 100% autónomo. Esto significa que el script, cuando se ejecuta, debe:

- Crear todas las tablas necesarias según el modelo ER.
- Definir las claves primarias y claves foráneas para establecer las relaciones entre las tablas.
- Insertar algunos datos de muestra en las tablas.

Este script debe ser ejecutable en una base de datos PostgreSQL y debe crear un nuevo esquema (también conocido como espacio de trabajo) para alojar todas las tablas. No se debe utilizar el esquema `public` por defecto.

## 3. Consulta SQL

El tercer componente es una consulta SQL que pueda listar todos los coches activos en KeepCoding. Esta consulta debería ser capaz de mostrar:

- Modelo del coche
- Marca del coche
- Grupo al que pertenece la marca
- Fecha de compra del coche
- Matrícula del coche
- Color del coche
- Kilometraje total del coche
- Nombre de la empresa aseguradora
- Número de póliza de seguro

## Adaptación del Modelo Entidad-Relación y SQL.

Esta tarea implica la creación de un modelo Entidad-Relación (ER) y un script SQL que se ajusten a los requisitos específicos de la tarea. A continuación, se describen los componentes clave.

### Modelo Entidad-Relación Descriptivo para la Tarea

### Entidades y Atributos

#### 1. Grupo

- **ID_Grupo (PK)**
- Nombre_Grupo

#### 2. Marca
- **ID_Marca (PK)**
- Nombre_Marca
- ID_Grupo (FK)
  
#### 3. Modelo
- **ID_Modelo (PK)**
- Nombre_Modelo
- ID_Marca (FK)

#### 4. Aseguradora
- **ID_Aseguradora (PK)**
- Nombre_Aseguradora

#### 5. Divisa
- **ID_Divisa (PK)**
- Nombre_Divisa

#### 6. Color
- **ID_Color (PK)**
- Nombre_Color

#### 7. Coche
- **ID_Coche (PK)**
- ID_Modelo (FK)
- ID_Color (FK)
- Matricula
- Kilometros
- ID_Aseguradora (FK)
- Numero_Poliza
- Fecha_Compra

#### 8. Revision
- **ID_Revision (PK)**
- ID_Coche (FK)
- Kilometros_Revision
- Fecha_Revision
- Importe
- ID_Divisa (FK)

### Relaciones

1. **Marca - Grupo**: Una Marca pertenece a un Grupo, y un Grupo puede tener múltiples Marcas. (1:N)
2. **Modelo - Marca**: Un Modelo pertenece a una Marca, y una Marca puede tener múltiples Modelos. (1:N)
3. **Coche - Modelo**: Un Coche tiene un Modelo, y un Modelo puede estar asociado con múltiples Coches. (1:N)
4. **Coche - Color**: Un Coche tiene un Color, y un Color puede estar asociado con múltiples Coches. (1:N)
5. **Coche - Aseguradora**: Un Coche está asegurado por una Aseguradora, y una Aseguradora puede asegurar múltiples Coches. (1:N)
6. **Revision - Coche**: Una Revisión se realiza en un Coche, y un Coche puede tener múltiples Revisiones. (1:N)
7. **Revision - Divisa**: Una Revisión está en una Divisa específica (EURO, DÓLAR, etc.). (1:1)

![Diagrama ER](Modelado_keepcoding-Fleet.png)

![Diagrama ER](pheazxme-keepcoding_flota.png)

## Script SQL Adaptado

El segundo componente es un script SQL que es 100% autónomo. Este script debe:

- Crear todas las tablas necesarias según el modelo ER.
- Definir las claves primarias y claves foráneas para establecer las relaciones entre las tablas.
- [Aquí el enlace al script SQL](keepcoding_flota.sql)

# Consulta SQL para Obtener la Lista de Coches Activos

La consulta SQL al final del script tiene el propósito de obtener una lista de coches activos en KeepCoding, mostrando varios detalles de cada coche. A continuación, se explica cada parte de la consulta.

## Script SQL para la Gestión de la Flota de Coches

El siguiente script SQL crea un nuevo esquema y varias tablas en PostgreSQL para gestionar una flota de coches. Además, incluye una consulta para obtener una lista de coches activos. A continuación, se detalla cada sección del script.

## Creación del Esquema

```sql
-- Crear un nuevo esquema llamado KeepCoding_Flota
CREATE SCHEMA IF NOT EXISTS KeepCoding_Flota;

-- Cambiar al nuevo esquema
SET search_path TO KeepCoding_Flota;
```

Esta sección crea un nuevo esquema llamado `KeepCoding_Flota` y cambia el esquema de búsqueda al recién creado.

## Creación de Tablas

### Tabla Grupo

```sql
-- Crear la tabla Grupo
CREATE TABLE Grupo (
    ID_Grupo SERIAL PRIMARY KEY,
    Nombre_Grupo VARCHAR(50) NOT NULL
);
```
Esta tabla guarda la información sobre los diferentes grupos empresariales a los que pertenecen las marcas de coches.

### Tabla Marca

```sql
-- Crear la tabla Marca
CREATE TABLE Marca (
    ID_Marca SERIAL PRIMARY KEY,
    Nombre_Marca VARCHAR(50) NOT NULL,
    ID_Grupo INT REFERENCES Grupo(ID_Grupo)
);
```

Esta tabla guarda la información sobre las diferentes marcas de coches y se relaciona con la tabla Grupo.

### Tabla Aseguradora

```sql
-- Crear la tabla Aseguradora
CREATE TABLE Aseguradora (
    ID_Aseguradora SERIAL PRIMARY KEY,
    Nombre_Aseguradora VARCHAR(50) NOT NULL
);
```

Esta tabla guarda la información sobre las diferentes compañías de seguros.

### Tabla Coche

```sql
-- Crear la tabla Coche
CREATE TABLE Coche (
    ID_Coche SERIAL PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULL,
    ID_Marca INT REFERENCES Marca(ID_Marca),
    Color VARCHAR(20),
    Matricula VARCHAR(20),
    Kilometros INT,
    ID_Aseguradora INT REFERENCES Aseguradora(ID_Aseguradora),
    Numero_Poliza VARCHAR(20),
    Fecha_Compra DATE NOT NULL
);
```

Esta tabla guarda la información sobre los diferentes coches en la flota.

### Tabla Revision

```sql
-- Crear la tabla Revision
CREATE TABLE Revision (
    ID_Revision SERIAL PRIMARY KEY,
    ID_Coche INT REFERENCES Coche(ID_Coche),
    Kilometros_Revision INT,
    Fecha_Revision DATE,
    Importe FLOAT,
    Moneda VARCHAR(10)
);
```

Esta tabla guarda la información sobre las revisiones realizadas a cada coche.

## Inserción de Datos de Muestra

Esta sección se encarga de insertar datos de muestra en las tablas. Los datos de muestra son cruciales para probar la eficacia del modelo de base de datos y las consultas asociadas.

### Insertar Datos en la Tabla Coche

```sql
-- Insertar 20 registros en la tabla Coche
INSERT INTO Coche (Modelo, ID_Marca, Color, Matricula, Kilometros, ID_Aseguradora, Numero_Poliza, Fecha_Compra) VALUES  
('Modelo 1', 1, 'Blanco', 'MAT001', 6840, 1, 'POL001', '2015-08-03'),
('Modelo 2', 2, 'Verde', 'MAT002', 10843, 2, 'POL002', '2017-01-20'),
('Modelo 3', 3, 'Azul', 'MAT003', 5640, 3, 'POL003', '2018-05-12'),
('Modelo 4', 4, 'Rojo', 'MAT004', 2130, 4, 'POL004', '2019-06-25'),
('Modelo 5', 5, 'Negro', 'MAT005', 9876, 5, 'POL005', '2020-01-15'),
('Modelo 6', 6, 'Gris', 'MAT006', 6543, 6, 'POL006', '2020-08-23'),
('Modelo 7', 7, 'Marrón', 'MAT007', 4123, 7, 'POL007', '2021-04-05'),
('Modelo 8', 8, 'Amarillo', 'MAT008', 2567, 8, 'POL008', '2021-09-11'),
('Modelo 9', 9, 'Plateado', 'MAT009', 10001, 9, 'POL009', '2022-03-21'),
('Modelo 10', 10, 'Violeta', 'MAT010', 5050, 10, 'POL010', '2022-07-02'),
('Modelo 11', 1, 'Blanco', 'MAT011', 6000, 1, 'POL011', '2016-02-14'),
('Modelo 12', 2, 'Verde', 'MAT012', 12000, 2, 'POL012', '2018-11-08'),
('Modelo 13', 3, 'Azul', 'MAT013', 7000, 3, 'POL013', '2019-12-01'),
('Modelo 14', 4, 'Rojo', 'MAT014', 2500, 4, 'POL014', '2020-05-09'),
('Modelo 15', 5, 'Negro', 'MAT015', 9999, 5, 'POL015', '2021-01-20'),
('Modelo 16', 6, 'Gris', 'MAT016', 6666, 6, 'POL016', '2021-08-30'),
('Modelo 17', 7, 'Marrón', 'MAT017', 4200, 7, 'POL017', '2022-04-11'),
('Modelo 18', 8, 'Amarillo', 'MAT018', 2600, 8, 'POL018', '2022-09-19'),
('Modelo 19', 9, 'Plateado', 'MAT019', 10050, 9, 'POL019', '2023-03-25'),
('Modelo 20', 10, 'Violeta', 'MAT020', 5100, 10, 'POL020', '2023-07-07');
```

## Consulta para Listar Coches Activos

Esta sección contiene una consulta SQL para listar los coches activos en KeepCoding. La consulta se relaciona con varias tablas para proporcionar una vista completa de cada coche.

```sql
-- Consulta para obtener el listado de coches activos en KeepCoding
-- Esta consulta se debe ejecutar después de la inserción de datos
SELECT 
    c.Modelo, 
    m.Nombre_Marca, 
    g.Nombre_Grupo,
    c.Fecha_Compra,
    c.Matricula,
    c.Color,
    c.Kilometros,
    a.Nombre_Aseguradora,
    c.Numero_Poliza
FROM 
    Coche c
JOIN 
    Marca m ON c.ID_Marca = m.ID_Marca
JOIN 
    Grupo g ON m.ID_Grupo = g.ID_Grupo
JOIN 
    Aseguradora a ON c.ID_Aseguradora = a.ID_Aseguradora;
```

Nota: Esta consulta solo tiene sentido después de haber insertado datos en las tablas.

### Descripción de las partes de la consulta

- **SELECT**: Esta parte selecciona los campos que queremos mostrar en el resultado. Seleccionamos campos tanto de la tabla Coche (alias c) como de las tablas Marca (alias m), Grupo (alias g) y Aseguradora (alias a).

- **FROM Coche c**: Establece la tabla principal de la consulta, la tabla Coche, y le asigna un alias c para referirse a ella de forma más sencilla.

- **JOIN Marca m ON c.ID_Marca = m.ID_Marca**: Une la tabla Coche con la tabla Marca en el campo que las relaciona, que en este caso son ID_Marca de ambas tablas.

- **JOIN Grupo g ON m.ID_Grupo = g.ID_Grupo**: Similar al JOIN anterior, pero une la tabla Marca con la tabla Grupo.

- **JOIN Aseguradora a ON c.ID_Aseguradora = a.ID_Aseguradora**: Une la tabla Coche con la tabla Aseguradora.

El comentario "Esta consulta se debe ejecutar después de la inserción de datos" significa que esta consulta tiene sentido solo después de que hayas insertado datos en las tablas. De lo contrario, la consulta no devolverá ningún resultado porque las tablas estarán vacías.

### Pantalla Final

![Diagrama ER](pantalla_final.png)

![Diagrama ER](pantalla_final1.png)

![Diagrama ER](pantalla_final2.png)

![Diagrama ER](pantalla_final3.png)

