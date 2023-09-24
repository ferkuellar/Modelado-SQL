-- Crear el esquema
CREATE SCHEMA IF NOT EXISTS KeepCoding;

-- Establecer el esquema de búsqueda en el nuevo esquema
SET search_path TO KeepCoding;

-- Crear las tablas

-- Crear tabla Grupo
CREATE TABLE IF NOT EXISTS Grupo (
    ID_Grupo SERIAL PRIMARY KEY,
    Nombre_Grupo VARCHAR(50) NOT NULL
);

-- Crear tabla Marca
CREATE TABLE IF NOT EXISTS Marca (
    ID_Marca SERIAL PRIMARY KEY,
    Nombre_Marca VARCHAR(50) NOT NULL,
    ID_Grupo INT REFERENCES Grupo(ID_Grupo)
);

-- Crear tabla Modelo
CREATE TABLE IF NOT EXISTS Modelo (
    ID_Modelo SERIAL PRIMARY KEY,
    Nombre_Modelo VARCHAR(50) NOT NULL,
    ID_Marca INT REFERENCES Marca(ID_Marca)
);

-- Crear tabla Aseguradora
CREATE TABLE IF NOT EXISTS Aseguradora (
    ID_Aseguradora SERIAL PRIMARY KEY,
    Nombre_Aseguradora VARCHAR(50) NOT NULL
);

-- Crear tabla Poliza
CREATE TABLE IF NOT EXISTS Poliza (
    ID_Poliza SERIAL PRIMARY KEY,
    ID_Aseguradora INT REFERENCES Aseguradora(ID_Aseguradora),
    Tipo_Poliza VARCHAR(50) NOT NULL,
    Fecha_Inicio DATE,
    Fecha_Expiracion DATE,
    Cobertura TEXT
);

-- Crear tabla Divisa
CREATE TABLE IF NOT EXISTS Divisa (
    ID_Divisa SERIAL PRIMARY KEY,
    Nombre_Divisa VARCHAR(10) NOT NULL
);

-- Crear tabla Color
CREATE TABLE IF NOT EXISTS Color (
    ID_Color SERIAL PRIMARY KEY,
    Nombre_Color VARCHAR(20) NOT NULL
);

-- Crear tabla Coche
CREATE TABLE IF NOT EXISTS Coche (
    ID_Coche SERIAL PRIMARY KEY,
    ID_Modelo INT REFERENCES Modelo(ID_Modelo),
    ID_Color INT REFERENCES Color(ID_Color),
    Matricula VARCHAR(10) NOT NULL,
    Kilometros INT,
    ID_Aseguradora INT REFERENCES Aseguradora(ID_Aseguradora),
    Numero_Poliza VARCHAR(20),
    Fecha_Compra DATE
);

-- Crear tabla Revision
CREATE TABLE IF NOT EXISTS Revision (
    ID_Revision SERIAL PRIMARY KEY,
    ID_Coche INT REFERENCES Coche(ID_Coche),
    Kilometros_Revision INT,
    Fecha_Revision DATE,
    Importe FLOAT,
    ID_Divisa INT REFERENCES Divisa(ID_Divisa)
);

-- Insertar registros de muestra en las tablas

-- Insertar registros en Grupo
INSERT INTO Grupo (Nombre_Grupo) VALUES
    ('Grupo A'), 
    ('Grupo B'), 
    ('Grupo C'), 
    ('Grupo D'), 
    ('Grupo E');

-- Insertar registros en Marca
INSERT INTO Marca (Nombre_Marca, ID_Grupo) VALUES
    ('Toyota', 1), 
    ('Honda', 2), 
    ('Ford', 3), 
    ('Chevrolet', 4), 
    ('Nissan', 5),
    ('Volkswagen', 1), 
    ('Hyundai', 2), 
    ('Subaru', 3), 
    ('Kia', 4), 
    ('Jeep', 5);

-- Insertar registros en Modelo
INSERT INTO Modelo (Nombre_Modelo, ID_Marca) VALUES
    ('Modelo 1', 1),
    ('Modelo 2', 2),
    ('Modelo 3', 3),
    ('Modelo 4', 4),
    ('Modelo 5', 5),
    ('Modelo 6', 6),
    ('Modelo 7', 7),
    ('Modelo 8', 8),
    ('Modelo 9', 9),
    ('Modelo 10', 10);

-- Insertar registros en Aseguradora
INSERT INTO Aseguradora (Nombre_Aseguradora) VALUES
	('CoberturaTotal'), 
    ('Seguros XYZ'), 
    ('SeguroFácil'), 
    ('AseguraTodo'),
    ('ProtegeYa'); 

-- Insertar registros en Poliza (Asegúrate de que estos se inserten antes de la tabla Coche)
INSERT INTO Poliza (ID_Aseguradora, Tipo_Poliza, Fecha_Inicio, Fecha_Expiracion, Cobertura) VALUES  
    (1, 'Responsabilidad Civil', '2021-01-01', '2022-01-01', 'Daño a terceros hasta $10,000'),
    (2, 'Todo Riesgo', '2021-02-01', '2022-02-01', 'Cobertura completa, incluido robo y daño natural'),
    (3, 'Responsabilidad Civil', '2021-03-01', '2022-03-01', 'Daño a terceros hasta $15,000'),
    (4, 'Todo Riesgo', '2021-04-01', '2022-04-01', 'Cobertura completa, incluido robo y daño natural'),
    (5, 'Responsabilidad Civil', '2021-05-01', '2022-05-01', 'Daño a terceros hasta $5,000');

-- Insertar 5 registros en Coche (Asegúrate de que estos se inserten antes de la tabla Revision)
INSERT INTO Coche (ID_Modelo, ID_Color, Matricula, Kilometros, ID_Aseguradora, Numero_Poliza, Fecha_Compra) VALUES  
    (1, 1, 'MAT001', 6840, 1, 'POL001', '2015-08-03'),
    (2, 2, 'MAT002', 10843, 2, 'POL002', '2017-01-20'),
    (3, 3, 'MAT003', 5640, 3, 'POL003', '2018-05-12'),
    (4, 4, 'MAT004', 2130, 4, 'POL004', '2019-06-25'),
    (5, 5, 'MAT005', 9876, 5, 'POL005', '2020-01-15');

-- Insertar registros en la tabla Revision (Asegúrate de que los ID_Coche existen en la tabla Coche)
INSERT INTO Revision (ID_Coche, Kilometros_Revision, Fecha_Revision, Importe, ID_Divisa) VALUES  
    (1, 7000, '2016-09-15', 200, 1), 
    (2, 11000, '2018-02-20', 250, 2), 
    (3, 6000, '2019-06-10', 300, 3),
    (4, 2200, '2020-07-25', 150, 4),
    (5, 10000, '2021-01-30', 350, 5);

-- Establecer el formato para las fechas a 'YYYY-MM-DD'
SET DATESTYLE TO ISO, MDY;

-- Consulta SQL Profesional para obtener el listado completo de coches activos
SELECT 
    co.ID_Coche AS "ID del Coche", 
    mo.Nombre_Modelo AS "Modelo del Coche", 
    ma.Nombre_Marca AS "Marca del Coche", 
    g.Nombre_Grupo AS "Grupo Empresarial",
    TO_CHAR(co.Fecha_Compra, 'YYYY-MM-DD') AS "Fecha de Compra",
    co.Matricula AS "Matrícula",
    col.Nombre_Color AS "Color del Coche",
    co.Kilometros AS "Kilómetros Recorridos",
    a.Nombre_Aseguradora AS "Aseguradora",
    co.Numero_Poliza AS "Número de Póliza",
    p.Tipo_Poliza AS "Tipo de Póliza",
    TO_CHAR(p.Fecha_Inicio, 'YYYY-MM-DD') AS "Fecha de Inicio de Póliza",
    TO_CHAR(p.Fecha_Expiracion, 'YYYY-MM-DD') AS "Fecha de Expiración de Póliza",
    (SELECT Nombre_Divisa FROM Divisa WHERE ID_Divisa = (SELECT ID_Divisa FROM Revision WHERE ID_Coche = co.ID_Coche LIMIT 1)) AS "Divisa de Pago del Servicio",
    (SELECT Importe FROM Revision WHERE ID_Coche = co.ID_Coche LIMIT 1) AS "Costo de Revisión"
FROM 
    Coche AS co
JOIN 
    Modelo AS mo ON co.ID_Modelo = mo.ID_Modelo
JOIN 
    Marca AS ma ON mo.ID_Marca = ma.ID_Marca
JOIN 
    Grupo AS g ON ma.ID_Grupo = g.ID_Grupo
JOIN 
    Color AS col ON co.ID_Color = col.ID_Color
JOIN 
    Aseguradora AS a ON co.ID_Aseguradora = a.ID_Aseguradora
JOIN 
    Poliza AS p ON a.ID_Aseguradora = p.ID_Aseguradora
ORDER BY 
    "Marca del Coche", 
    "Modelo del Coche", 
    "Fecha de Compra" ASC;
