CREATE TABLE areas(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE cursos(
	codigo VARCHAR(10) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	creditos TINYINT UNSIGNED NOT NULL,
	inicio_rama VARCHAR(1) NOT NULL,
	id_area INT UNSIGNED NOT NULL,
	PRIMARY KEY (codigo),
	FOREIGN KEY id_area REFERENCES areas (id)
);

CREATE TABLE prerrequisitos(
	codigo_pre VARCHAR(10) NOT NULL,
	codigo_post VARCHAR(10) NOT NULL,
	PRIMARY KEY (codigo_pre, codigo_post),
	FOREIGN KEY codigo_pre REFERENCES cursos (codigo),
	FOREIGN KEY codigo_post REFERENCES cursos (codigo)
);

CREATE TABLE usuarios(
	carnet INT UNSIGNED NOT NULL,
	nombres VARCHAR(255) NOT NULL,
	apellidos VARCHAR(255) NOT NULL,
	PRIMARY KEY (carnet)
);

CREATE TABLE asignacion(
	correlativo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	carnet INT UNSIGNED NOT NULL,
	codigo VARCHAR(10) NOT NULL,
	PRIMARY KEY (correlativo),
	FOREIGN KEY carnet REFERENCES usuarios (carnet),
	FOREIGN KEY codigo REFERENCES cursos (codigo)
);
