CREATE DATABASE IF NOT EXISTS CINEPOLIS;


CREATE TABLE IF NOT EXISTS roles(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	area varchar(20),
	labores varchar(20),
	horas INT(20)
);


CREATE TABLE IF NOT EXISTS estadorepublica(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30),
    capital VARCHAR(20),
    codigopostal INT(30) NOT NULL,
);



CREATE TABLE IF NOT EXISTS cines(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30),
    estado VARCHAR(30),
	municipio VARCHAR(30),
	numero_de_salas INT(10) NOT NULL,
    estado_id BIGINT NOT NULL,
    CONSTRAINT fk_cines_estadorepublica FOREIGN KEY(estado_id) REFERENCES estadorepublica(id)
);

CREATE TABLE IF NOT EXISTS peliculas(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	nombre text,
	clasificacion VARCHAR(30),
	duracion VARCHAR(10),
    cine_id BIGINT NOT NULL,
    CONSTRAINT fk_peliculas_cines FOREIGN KEY(cine_id) REFERENCES cines(id)
);



CREATE TABLE IF NOT EXISTS empleados(
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   nombre VARCHAR(15),
   apellidopaterno VARCHAR(15),
   apellidomaterno VARCHAR(15),
   rol_id BIGINT NOT NULL,
   CONSTRAINT fk_empleados_roles FOREIGN KEY(rol_id) REFERENCES roles(id)
);


CREATE TABLE IF NOT EXISTS eventos(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE NOT NULL,
        sala INT(10) NOT NULL,
        empleado_id BIGINT NOT NULL,
	CONSTRAINT fk_eventos_empleados FOREIGN KEY(empleado_id) REFERENCES empleados(id)
);



CREATE TABLE IF NOT EXISTS usuarios(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	nombre TEXT,
	apellidopaterno TEXT,
        apellidomaterno TEXT,
        fecha DATE,
	pelicula_id BIGINT,
	evento_id BIGINT,
	CONSTRAINT fk_usuarios_peliculas FOREIGN KEY(pelicula_id) REFERENCES peliculas(id),
	CONSTRAINT fk_usuarios_eventos FOREIGN KEY(evento_id) REFERENCES eventos(id)
);


CREATE TABLE IF NOT EXISTS categorias(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	categoria VARCHAR(10),
   usuario_id BIGINT,
	CONSTRAINT fk_categorias_usuarios FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);




//tabla roles

INSERT INTO roles(area, labores, horas)
VALUES
("caja", "cobrar", "5"), 
("dulceria", "vender", "8"), 
("dulceria", "vender", "8"), 
("caja", "cobrar", "8"), 
("limpieza", "aseo", "24"), 
("impieza", "aseo", "7"), 
("impieza", "aseo", "8"), 
("impieza", "aseo", "8"), 
("impieza", "aseo", "8"), 
("caja", "cobrar", "12"),
("dulceria", "vender", "8"),
("dulceria", "vender", "24"),
("caja", "cobrar", "8"),
("impieza", "aseo", "8"),
("caja", "cobrar", "8"),
("dulceria", "vender", "8"),
("caja", "cobrar", "8"), 
("dulceria", "vender", "8"), 
("dulceria", "vender", "8"), 
("caja", "cobrar", "8");




//Tabla estadorepublica

INSERT INTO estadorepublica(nombre, capital, codigopostal)
VALUES
("Mexico", "Toluca", 0001),
("Yucatan", "Merida", 0002),
("Jalisco", "Guadalajara", 0003),
("Queretaro", "Queretaro", 0004),
("Nuevo Leon", "Monterrey", 0005),
("Bajacalifornia", "mexicalli", 0006),
("baja california sur", " la paz", 0007),
("campeche", "campeche", 0008),
("coahuila", "saltillo", 0009),
("distrito federal", "ciudad de mexico", 0010),
("chiapas", "tuxtla", 0011),
("Durango", "Durango", 0012),
("Michoacan", "Morelia", 0013),
("Nayarit", "Tepic", 0014),
("Oaxaca", "Oaxaca", 0015),
("Sinaloa", "Culiacan", 0016),
("Sonora", "Hermosillo", 0017),
("Veracurz", "Xalapa", 0018),
("Zacatecas", "Zacatecas", 0019),
("Morelos", "Cuernava", 0020);




//Tabla cines

INSERT INTO cines(nombre, estado, municipio, numero_de_salas, estado_id)
VALUES
("Galeriasmetepec", "Mexico", "Metepec", 9, 1),
("Las americas merida", "Yucatan", "La isla", 8, 2),
("la alameda", "Jalisco", "San juan", 6, 3),
("cinepolis la victoria", "Queretaro", "Victoria", 5, 4),
("Pabellon campestre", "Queretaro", "campestre", 4, 4),
("El titan", "Monterrey", "Titan", 7, 6),
("Galerias campeche", "Campeche", "Campeche", 8, 7),
("Forum buenavista", "distrito federal", "Buenavista", 12, 10),
("Plaza las americas", "Chiapas", "las americas", 3, 11),
("Escala la hueart", "Michoacan", "La huerta", 7, 13),
("Plaza alacran", "Durango", "Alacran", 10, 12),
("Galerias toluca", "Mexico", "Toluca", 9, 1),
("PlazaMia", "Mexico", "Zinacantepec", 6, 1),
("Merida altabrisa", "Yucatan", "altabrisa", 4, 2),
("Tolsa", "Jalisco", "Tolsa", 3, 3),
("Grandplaza", "Mexico", "Toluca", 9, 1),
("Galerias", "Nuevo Leon", "valle oriente", 3, 5),
("VIP galerias", "Campeche", "Costa", 8, 8),
("Plaza mirador", "Chiapas", "Mirador", 7, 11);




//tabla peliculas

INSERT INTO peliculas(nombre, clasificacion, duracion,cine_id)
VALUES
("accion", "C", "2HRS", 1),
("comedia", "B", "1HR", 2),
("terror", "C", "2HRS", 3),
("accion", "C", "3HRS", 4),
("suspenso", "A", "2HRS", 5),
("suspenso", "B", "2HRS", 6),
("terror", "A", "1HR", 7),
("accion", "C", "2HRS", 8),
("amor", "A", "3HRS", 9),
("terror", "B", "1HR", 10),
("accion", "C", "1HR", 11),
("comedia", "B", "2HRS", 12),
("accion", "C", "2HRS", 13),
("terror", "B", "3HRS", 14),
("amor", "B", "3HRS", 15),
("accion", "C", "2HRS", 16),
("accion", "C", "1HRS", 17),
("comedia", "A", "2HRS", 18),
("comedia", "A", "2HRS", 19),
("amor", "C", "120MIN", 20);




//tabla empleados

INSERT INTO empleados(nombre, apellidopaterno, apellidomaterno, rol_id)
VALUES
("juan", "corrales", "tapia", 1 ),
("carlos", "tapia", "valdes", 2 ),
("andrea", "morrison", "carta",3 ),
("agustin", "mejia", "pote", 4 ),
("enrique", "mejia", "corrales", 5 ),
("ana", "arana", "ferreira", 6),
("jose", "corral", "corral", 7 ),
("pablo", "mercado", "corral", 8 ),
("mario", "alvarez", "alvarado", 9 ),
("maria", "leonardo", "alvarado", 10 ),
("ana", "alvarez", "alvarez", 11 ),
("rosa", "gonzales", "gonzales", 12 ),
("mario", "gratachia", "garnica",13 ),
("andres", "carvajal", "nieto", 14 ),
("carmen", "endañu", "nieto", 15 ),
("maria", "nieto", "carvajal", 16 ),
("anita", "marin", "vasco", 17 ),
("marcos", "matin", "martinez", 18 ),
("daniela", "xingu", "ramirez", 19 ),
("monse", "ramirez", "celos", 20 );




//categorias

INSERT INTO categorias(categoria, usuario_id)
VALUES
("gold", 1),
("gold", 2),
("bronce", 7),
("gold", 6),
("gold", 4),
("platino", 3),
("platino", 20),
("bronce", 1),
("bronce", 8),
("platino", 12),
("gold", 11),
("gold", 16),
("gold", 17),
("bronce", 15),
("gold", 19),
("gold", 18),
("gold", 5),
("bronce", 9),
("gold", 10),
("gold", 14);



//usuarios

INSERT INTO usuarios(nombre, apellidopaterno, apellidomaterno, fecha, pelicula_id, evento_id)
VALUES
("juan", "corrales", "tapia", "2019-01-01", 1, 1 ),
("juan", "corrales", "tapia", "2019-01-02", 2, 19  ),
("carlos", "tapia", "valdes", "2019-01-03", 3, 17 ),
("andrea", "morrison", "carta","2019-01-04", 4, 13 ),
("agustin", "mejia", "pote", "2019-01-05", 5, 11  ),
("enrique", "mejia", "corrales", "2019-01-06", 6, 8 ),
("ana", "arana", "ferreira", "2019-01-07",7, 9 ),
("jose", "corral", "corral", "2019-01-08", 7, 1 ),
("pablo", "mercado", "corral", "2019-01-09", 8, 7 ),
("mario", "alvarez", "alvarado", "2019-01-10", 9, 17 ),
("maria", "leonardo", "alvarado", "2019-01-11", 11, 10 ),
("ana", "alvarez", "alvarez", "2019-01-01", 12, 19 ),
("rosa", "gonzales", "gonzales", "2019-01-12", 15, 15),
("mario", "gratachia", "garnica", "2019-01-13", 11, 13),
("andres", "carvajal", "nieto", "2019-01-14", 10, 6 ),
("carmen", "endañu", "nieto", "2019-01-15", 8, 4 ),
("maria", "nieto", "carvajal", "2019-01-16", 17, 4 ),
("anita", "marin", "vasco", "2019-01-17", 16, 4 ),
("marcos", "matin", "martinez", "2019-01-18", 19, 2 ),
("daniela", "xingu", "ramirez", "2019-01-19", 1, 1 );




//eventos

INSERT INTO eventos(fecha, sala, empleado_id)
VALUES
("2005-01-15", "1", 1),
("2020-09-15", "1", 2),
("2007-08-15", "3", 3),
("2020-07-15", "1", 4),
("2019-06-15", "1", 5),
("2020-04-15", "4", 6),
("2020-03-15", "2", 7),
("2019-01-02", "1", 8),
("2017-02-15", "1", 9),
("2020-01-15", "4", 10),
("2011-01-11", "1", 11),
("2010-01-12", "1", 12),
("2009-01-10", "1", 13),
("2008-01-08", "5", 1),
("2007-01-05", "2", 5),
("2006-01-03", "2", 6),
("2005-01-11", "1", 9),
("2004-01-12", "8", 9),
("2003-01-17", "1", 10),
("2002-01-18", "3", 1);