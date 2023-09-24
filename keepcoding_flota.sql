-- Create Schema
CREATE SCHEMA IF NOT EXISTS KeepCoding;

-- Set the search path to the new schema
SET search_path TO KeepCoding;

-- Create Grupo table
CREATE TABLE IF NOT EXISTS Grupo (
    ID_Grupo SERIAL PRIMARY KEY,
    Nombre_Grupo VARCHAR(50) NOT NULL
);

-- Create Marca table
CREATE TABLE IF NOT EXISTS Marca (
    ID_Marca SERIAL PRIMARY KEY,
    Nombre_Marca VARCHAR(50) NOT NULL,
    ID_Grupo INT REFERENCES Grupo(ID_Grupo)
);

-- Create Modelo table
CREATE TABLE IF NOT EXISTS Modelo (
    ID_Modelo SERIAL PRIMARY KEY,
    Nombre_Modelo VARCHAR(50) NOT NULL,
    ID_Marca INT REFERENCES Marca(ID_Marca)
);

-- Create Aseguradora table
CREATE TABLE IF NOT EXISTS Aseguradora (
    ID_Aseguradora SERIAL PRIMARY KEY,
    Nombre_Aseguradora VARCHAR(50) NOT NULL
);

-- Create Poliza table
CREATE TABLE IF NOT EXISTS Poliza (
    ID_Poliza SERIAL PRIMARY KEY,
    ID_Aseguradora INT REFERENCES Aseguradora(ID_Aseguradora),
    Tipo_Poliza VARCHAR(50) NOT NULL,
    Fecha_Inicio DATE,
    Fecha_Expiracion DATE,
    Cobertura TEXT
);

-- Create Divisa table
CREATE TABLE IF NOT EXISTS Divisa (
    ID_Divisa SERIAL PRIMARY KEY,
    Nombre_Divisa VARCHAR(10) NOT NULL
);

-- Create Color table
CREATE TABLE IF NOT EXISTS Color (
    ID_Color SERIAL PRIMARY KEY,
    Nombre_Color VARCHAR(20) NOT NULL
);

-- Create Coche table
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

-- Create Revision table
CREATE TABLE IF NOT EXISTS Revision (
    ID_Revision SERIAL PRIMARY KEY,
    ID_Coche INT REFERENCES Coche(ID_Coche),
    Kilometros_Revision INT,
    Fecha_Revision DATE,
    Importe FLOAT,
    ID_Divisa INT REFERENCES Divisa(ID_Divisa)
);


-- 3. Insertar datos muestra en las tablas
-- Insertar 5 registros en Grupo
INSERT INTO Grupo (Nombre_Grupo) VALUES
    ('Grupo A'), 
    ('Grupo B'), 
    ('Grupo C'), 
    ('Grupo D'), 
    ('Grupo E');

-- Insertar 10 registros en Marca
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

-- Insertar 10 registros en Modelo
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

-- Insertar 10 registros en Aseguradora
INSERT INTO Aseguradora (Nombre_Aseguradora) VALUES
	('CoberturaTotal'), 
    ('Seguros XYZ'), 
    ('SeguroFácil'), 
    ('AseguraTodo'),
    ('ProtegeYa'), 
    ('SeguroMax'), 
    ('Confiaseguro'), 
    ('SeguroClaro'), 
    ('AseguraYA'), 
    ('SeguroTOP');

-- Insertar 20 registros en la tabla Poliza
INSERT INTO Poliza (ID_Aseguradora, Tipo_Poliza, Fecha_Inicio, Fecha_Expiracion, Cobertura) VALUES  
    (1, 'Responsabilidad Civil', '2021-01-01', '2022-01-01', 'Daño a terceros hasta $10,000'),
    (2, 'Todo Riesgo', '2021-02-01', '2022-02-01', 'Cobertura completa, incluido robo y daño natural'),
    (3, 'Responsabilidad Civil', '2021-03-01', '2022-03-01', 'Daño a terceros hasta $15,000'),
    (4, 'Todo Riesgo', '2021-04-01', '2022-04-01', 'Cobertura completa, incluido robo y daño natural'),
    (5, 'Responsabilidad Civil', '2021-05-01', '2022-05-01', 'Daño a terceros hasta $5,000'),
    (6, 'Todo Riesgo', '2021-06-01', '2022-06-01', 'Cobertura completa, incluido robo y daño natural'),
    (7, 'Responsabilidad Civil', '2021-07-01', '2022-07-01', 'Daño a terceros hasta $20,000'),
    (8, 'Todo Riesgo', '2021-08-01', '2022-08-01', 'Cobertura completa, incluido robo y daño natural'),
    (9, 'Responsabilidad Civil', '2021-09-01', '2022-09-01', 'Daño a terceros hasta $8,000'),
    (10, 'Todo Riesgo', '2021-10-01', '2022-10-01', 'Cobertura completa, incluido robo y daño natural'),
    (1, 'Responsabilidad Civil', '2021-11-01', '2022-11-01', 'Daño a terceros hasta $12,000'),
    (2, 'Todo Riesgo', '2021-12-01', '2022-12-01', 'Cobertura completa, incluido robo y daño natural'),
    (3, 'Responsabilidad Civil', '2022-01-01', '2023-01-01', 'Daño a terceros hasta $18,000'),
    (4, 'Todo Riesgo', '2022-02-01', '2023-02-01', 'Cobertura completa, incluido robo y daño natural'),
    (5, 'Responsabilidad Civil', '2022-03-01', '2023-03-01', 'Daño a terceros hasta $6,000'),
    (6, 'Todo Riesgo', '2022-04-01', '2023-04-01', 'Cobertura completa, incluido robo y daño natural'),
    (7, 'Responsabilidad Civil', '2022-05-01', '2023-05-01', 'Daño a terceros hasta $22,000'),
    (8, 'Todo Riesgo', '2022-06-01', '2023-06-01', 'Cobertura completa, incluido robo y daño natural'),
    (9, 'Responsabilidad Civil', '2022-07-01', '2023-07-01', 'Daño a terceros hasta $10,000'),
    (10, 'Todo Riesgo', '2022-08-01', '2023-08-01', 'Cobertura completa, incluido robo y daño natural');


-- Insertar 7 registros en Divisa
INSERT INTO Divisa (Nombre_Divisa) VALUES
    ('EURO'),
    ('DOLLAR'),
    ('YEN'),
    ('POUND'),
    ('RUPEE'),
    ('YUAN'),
    ('PESO');

-- Insertar 10 registros en Color
INSERT INTO Color (Nombre_Color) VALUES
	('Blanco'), 
    ('Verde'), 
    ('Azul'), 
    ('Rojo'), 
    ('Negro'),
    ('Gris'), 
    ('Marrón'), 
    ('Amarillo'), 
    ('Plateado'), 
    ('Violeta');
   
-- Insertar registros en la tabla Revision para simular pagos de servicios en diferentes divisas
INSERT INTO Revision (ID_Coche, Kilometros_Revision, Fecha_Revision, Importe, ID_Divisa) VALUES  
    (1, 7000, '2016-09-15', 200, 1), 
    (2, 11000, '2018-02-20', 250, 2), 
    (3, 6000, '2019-06-10', 300, 3), 
    (4, 2200, '2020-07-25', 150, 4),
    (5, 10000, '2021-01-30', 350, 5),
    (6, 7000, '2021-09-23', 200, 6),
    (7, 4200, '2022-05-05', 180, 7),
    (8, 2600, '2022-10-11', 160, 1),
    (9, 10200, '2023-04-21', 400, 2),
    (10, 5100, '2023-08-07', 300, 3);

-- Insertar 20 registros en Coche
-- Insertar registros en la tabla Coche
INSERT INTO Coche (ID_Modelo, ID_Color, Matricula, Kilometros, ID_Aseguradora, Numero_Poliza, Fecha_Compra) VALUES  
	(1, 1, 'MAT001', 6840, 1, 'POL001', '2015-08-03'),
	(2, 2, 'MAT002', 10843, 2, 'POL002', '2017-01-20'),
	(3, 3, 'MAT003', 5640, 3, 'POL003', '2018-05-12'),
	(4, 4, 'MAT004', 2130, 4, 'POL004', '2019-06-25'),
	(5, 5, 'MAT005', 9876, 5, 'POL005', '2020-01-15');

-- Extend to include 20 records for the Coche table
-- Insertar registros en la tabla Coche
INSERT INTO Coche (ID_Modelo, ID_Color, Matricula, Kilometros, ID_Aseguradora, Numero_Poliza, Fecha_Compra) VALUES  
	(1, 1, 'MAT001', 6840, 1, 'POL001', '2015-08-03'),
	(2, 2, 'MAT002', 10843, 2, 'POL002', '2017-01-20'),
	(3, 3, 'MAT003', 5640, 3, 'POL003', '2018-05-12'),
	(4, 4, 'MAT004', 2130, 4, 'POL004', '2019-06-25'),
	(5, 5, 'MAT005', 9876, 5, 'POL005', '2020-01-15'),
	(6, 6, 'MAT006', 6543, 6, 'POL006', '2020-08-23'),
	(7, 7, 'MAT007', 4123, 7, 'POL007', '2021-04-05'),
	(8, 8, 'MAT008', 2567, 8, 'POL008', '2021-09-11'),
	(9, 9, 'MAT009', 10001, 9, 'POL009', '2022-03-21'),
	(10, 10, 'MAT010', 5050, 10, 'POL010', '2022-07-02'),
	(1, 1, 'MAT011', 6000, 1, 'POL011', '2016-02-14'),
	(2, 2, 'MAT012', 12000, 2, 'POL012', '2018-11-08'),
	(3, 3, 'MAT013', 7000, 3, 'POL013', '2019-12-01'),
	(4, 4, 'MAT014', 2500, 4, 'POL014', '2020-05-09'),
	(5, 5, 'MAT015', 9999, 5, 'POL015', '2021-01-20'),
	(6, 6, 'MAT016', 6666, 6, 'POL016', '2021-08-30'),
	(7, 7, 'MAT017', 4200, 7, 'POL017', '2022-04-11'),
	(8, 8, 'MAT018', 2600, 8, 'POL018', '2022-09-19'),
	(9, 9, 'MAT019', 10050, 9, 'POL019', '2023-03-25'),
	(10, 10, 'MAT020', 5100, 10, 'POL020', '2023-07-07');


-- 4. Consulta SQL Profesional para obtener el listado completo de coches activos
-- Esta consulta se debe ejecutar después de la inserción de datos.

-- Establecer el formato para la Fecha_Compra a 'YYYY-MM-DD'
SET DATESTYLE TO ISO, MDY;

-- Iniciar la consulta
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
    COALESCE(d.Nombre_Divisa, 'Sin Información') AS "Divisa de Pago del Servicio",
    COALESCE(r.Importe, 0) AS "Costo de Revisión"
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
LEFT JOIN 
    Revision AS r ON co.ID_Coche = r.ID_Coche
LEFT JOIN 
    Divisa AS d ON r.ID_Divisa = d.ID_Divisa
-- Ordenar los resultados por Marca, Modelo, Divisa y finalmente por Fecha de Compra
ORDER BY 
    "Marca del Coche", 
    "Modelo del Coche", 
    "Divisa de Pago del Servicio",
    "Fecha de Compra" ASC;
