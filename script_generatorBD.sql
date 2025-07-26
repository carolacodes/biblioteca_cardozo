CREATE DATABASE biblioteca_cardozo

CREATE TABLE Tipo_libro (
	id_tipo int not null identity(1,1),
	nombre_tipo varchar(250)
	constraint PK_id_tipo primary key (id_tipo)
);


CREATE TABLE Libro (
	id_libro int not null identity(1,1),
	nombre varchar(250),
	resumen varchar(max),
	foto_libro varchar(500),
	id_tipo_libro int,
	constraint PK_id_libro primary key (id_libro),
	constraint FK_id_tipo_libro foreign key (id_tipo_libro) references Tipo_libro (id_tipo) 
);

CREATE TABLE Autor (
	id_autor int not null identity(1,1),
	nombre varchar (250),
	constraint PK_id_autor primary key (id_autor),
);

CREATE TABLE Libros_Autores(
	id_libro int not null,
	id_autor int not null,
	constraint PK_libro_autor primary key (id_libro, id_autor),
	constraint FK_id_libro foreign key (id_libro) references Libro(id_libro),
	constraint FK_id_autor foreign key (id_autor) references Autor(id_autor)
);

CREATE TABLE Categoria (
	id_categoria int not null identity(1,1),
	nombre varchar(250),
	constraint PK_id_categoria primary key (id_categoria)
);

CREATE TABLE Libros_Categorias(
	id_categoria int not null,
	id_libro int not null,
	constraint PK_categoria_libro primary key (id_categoria, id_libro),
	constraint FK_id_categoria foreign key (id_categoria) references Categoria(id_categoria),
	constraint FK_id_libro foreign key (id_libro) references Libro(id_libro)
);

CREATE TABLE Editorial (
	id_editorial int not null identity (1,1),
	nombre varchar(250),
	constraint PK_id_editorial primary key (id_editorial)
);

CREATE TABLE Libros_Editoriales (
	id_libro int not null,
	id_editorial int not null,
	constraint PK_libro_editorial primary key (id_libro, id_editorial),
	constraint FK_libro foreign key (id_libro) references Libro(id_libro),
	constraint FK_editorial foreign key (id_editorial) references Editorial(id_editorial)
);

CREATE TABLE Idioma (
	id_idioma int not null identity (1,1),
	nombre varchar(250),
	constraint PK_id_idioma primary key (id_idioma),
	constraint UQ_nombre_idioma UNIQUE (nombre)
);

CREATE TABLE Libros_Idiomas (
	id_libro int not null,
	id_idioma int not null,
	constraint PK_libro_idioma primary key (id_libro, id_idioma),
	constraint FK_libro foreign key (id_libro) references Libro(id_libro),
	constraint FK_idioma foreign key (id_idioma) references Idioma(id_idioma)
);