CREATE DATABASE proyecto_StoreGame;

USE  proyecto_StoreGame;

CREATE TABLE  Usuario(
	id_usuario INT PRIMARY KEY NOT NULL,
    correo VARCHAR(50) UNIQUE NOT NULL,
    contraseña VARCHAR(15) NOT NULL
);

CREATE TABLE Factura(
	id_factura INT PRIMARY KEY NOT NULL,
    fecha DATE NOT NULL,
    nombre_empresa VARCHAR(50) NOT NULL, 
    nit VARCHAR(20) NOT NULL,
    cod_usuario INT,
    rec_correo VARCHAR(50),
	FOREIGN KEY(cod_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY(rec_correo) REFERENCES Usuario(correo)
);

CREATE TABLE TipoJuego(
	id_categoria INT PRIMARY KEY NOT NULL,
	categoria VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Juego (
	nombre VARCHAR(50) PRIMARY KEY NOT NULL, 
    desarrollador VARCHAR(50) NOT NULL,
    tamaño FLOAT NOT NULL,
    precio FLOAT NOT NULL,
    unidades_disponibles SMALLINT NOT NULL,
    unudades_vendidas SMALLINT NOT NULL,
    fecha_de_lanzamiento DATE NOT NULL,
    gam_categoria VARCHAR (20),
    FOREIGN KEY (gam_categoria) REFERENCES TipoJuego(categoria)
);

SELECT*FROM Juego;