-- Instrucción para crear la base de datos (DDL)
CREATE DATABASE consultorioDental;

-- Instrucción para usar la base de datos (DDL)
USE consultorioDental;


-- Instruccion para crear la tabla Dentistas
CREATE TABLE Dentista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    edad TINYINT NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(255),
    especialidad VARCHAR(255) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    consultorioAsignado VARCHAR(255) NOT NULL,
    experiencia VARCHAR(255) NOT NULL,
    turno VARCHAR(50) NOT NULL,
    salario INT NOT NULL
);

-- Instruccion para crear la tabla Paciente
CREATE TABLE Paciente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    edad TINYINT NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(255),
    numeroSeguroSocial VARCHAR(20) NOT NULL,
    tipoSangre VARCHAR(5) NOT NULL,
    expediente BOOLEAN NOT NULL,
    seguroGastosMedicos BOOLEAN NOT NULL,
    cita DATETIME NOT NULL,
    alergias BOOLEAN NOT NULL
);


/* 
La instrucción o query INSERT nos permite agregar/insertar registros (filas) en nuestra tabla
INSERT INTO nombreTabla (parámetros) VALUES (valores);
*/
INSERT INTO dentista (nombre, apellido, edad, telefono, email, especialidad, cedula, consultorioAsignado, experiencia, turno, salario)
	VALUES
		('Simi', 'Lares', 35, '55123456789', 'simi@lares.com', 'Odontología', '123456789', 'consultorio 505', 'Avanzado', 'Matutino', 5000),
        ('Kratos', 'Stitch', 25, '44212345678', 'kratos@mail.com', 'Maxilofacial', '987654321', 'consultorio 600', 'Intermedio', 'Vespertino', 3000),
        ('Otto ', 'Octavius ', 40, '951362847', 'octopus@mail.com', 'Ortodoncista', '543261879', 'consultorio 1610', 'Avanzado', 'Mixto', 10000);


/*
La instrucción o query SELECT nos permite recuperar datos de una base de datos. Es una de las operaciones más comunes.
SELECT datosABuscar FROM dondeVoyABuscar WHERE condicion/filtroEspecial
SELECT columna FROM nombreTabla WHERE condiciones;
*/
-- Consulta SELECT para mostrar todos los nombres de la tabla Dentista
SELECT nombre FROM dentista;

-- Consulta SELECT para mostrar todos los apellidos de la tabla Dentista
SELECT apellido FROM dentista;

-- Consulta SELECT para mostrar multiples datos de la tabla Dentista (separar por comas)
SELECT id, nombre, apellido, especialidad FROM dentista;

-- Consulta SELECT para mostrar todos los dentistas con nombre y apellido que ganen mas de $4000
SELECT nombre, apellido, especialidad, salario FROM dentista WHERE salario > 4000;

/*
DELETE se utiliza para borrar uno o varios registros de la tabla
DELETE FROM dondeQuieroBorrar WHERE filtro/clausula
*/
