-- Este es un comentario de SQL

-- DDL (Data Definition Language) Sirve para definir la estructura de la BD

-- Crear una base de datos
CREATE DATABASE ConsultorioDentalCH31;

-- Seleccionar nuestra base de datos
USE ConsultorioDentalCH31;


-- Crear la tabla de Dentistas
CREATE TABLE Dentista (
id INT AUTO_INCREMENT PRIMARY KEY, -- Cada que genere un dentista, se le de un nuevo de id
nombre VARCHAR(255) NOT NULL, -- Almacenar una cadena de texto de maximo 255 caracteres, no quede vacio
apellido VARCHAR(255) NOT NULL,
edad TINYINT NOT NULL,
telefono VARCHAR(15) NOT NULL,
email VARCHAR (255) NOT NULL,
especialidad VARCHAR(255) NOT NULL,
cedula VARCHAR(10) NOT NULL,
consultorioAsignado VARCHAR(255) NOT NULL,
experiencia VARCHAR(255) NOT NULL,
turno VARCHAR(20),
salario INT NOT NULL
);

-- Borrar tablas de mi base de datos
-- DROP TABLE paciente;

-- Borrar base de datos completa
-- DROP DATABASE consultoriodentalch31;