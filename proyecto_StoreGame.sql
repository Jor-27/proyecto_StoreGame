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


ALTER TABLE TipoJuego ADD INDEX buscar_categoria(categoria);
ALTER TABLE Juego ADD INDEX buscar_por_precio(precio);
 RENAME TABLE Factura TO Recibo; 
 
INSERT INTO Usuario (id_usuario, correo, contraseña)
VALUES (2, 'usariozz2m@uan.edu.co', 45783), (3, 'dguayara32@uan.edu.co', 89890), (4, 'jcardoso44@uan.edu.co', 23451), (5, 'dzartha33@uan.edu.co', 90911), (6, 'arueda33@uan.edu.co', 31456), (7, 'mreyes22@uan.edu.co', 11111);

ALTER TABLE Juego
CHANGE unudades_vendidas unidades_vendidas INT;

INSERT INTO Juego (nombre, desarrollador, tamaño, precio, unidades_disponibles, unidades_vendidas, fecha_de_lanzamiento)
Values ('The adventure of Zelda', 'Nintendo', 8.5, 30, 5, 30, '2017-03-3');


CREATE USER 'DavidZartha'@'3306' IDENTIFIED BY 'My.Territory/SQL'; 
GRANT SELECT, INSERT ON proyecto_storegame.Usuario TO 'DavidZartha'@'3306';
GRANT SELECT, INSERT ON proyecto_storegame.Juego TO 'DavidZartha'@'3306';
REVOKE SELECT, INSERT ON proyecto_storegame.Juego FROM 'DavidZartha'@'3306';

SHOW GRANTS FOR 'DavidZartha'@'3306';

CREATE VIEW Usuario_VISION AS
SELECT id_usuario, correo
FROM Usuario
WHERE id_usuario >= 4 and id_usuario <= 6;

SELECT*FROM Usuario_VISION; 
