-- 1. Crear un nuevo esquema llamado KeepCoding_Flota
CREATE SCHEMA IF NOT EXISTS KeepCoding_Flota;

-- 2. Crear las tablas
-- Tabla Grupo
CREATE TABLE Grupo (
    ID_Grupo SERIAL PRIMARY KEY,
    Nombre_Grupo VARCHAR(50) NOT NULL
);

-- Tabla Marca
CREATE TABLE Marca (
    ID_Marca SERIAL PRIMARY KEY,
    Nombre_Marca VARCHAR(50) NOT NULL,
    ID_Grupo INT REFERENCES Grupo(ID_Grupo)
);

-- Tabla Aseguradora
CREATE TABLE Aseguradora (
    ID_Aseguradora SERIAL PRIMARY KEY,
    Nombre_Aseguradora VARCHAR(50) NOT NULL
);

-- Tabla Coche
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

-- Tabla Revision
CREATE TABLE Revision (
    ID_Revision SERIAL PRIMARY KEY,
    ID_Coche INT REFERENCES Coche(ID_Coche),
    Kilometros_Revision INT,
    Fecha_Revision DATE,
    Importe FLOAT,
    Moneda VARCHAR(10)
);

-- 3. Insertar datos en las tablas
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

-- Insertar 20 registros en Coche
-- Insertar registros en la tabla Coche

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

-- 4. Consulta SQL para obtener el listado de coches activos en KeepCoding_Flota
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
