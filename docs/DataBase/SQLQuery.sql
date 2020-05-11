Create database WebProjectAPI_Prog3

go
use WebProjectAPI_Prog3
go

create table PAIS(
ID int identity(1,1),
Nombre varchar(60) unique not null,
constraint PK_PAIS primary key (ID)
);

create table CIUDAD(
ID int identity(1,1),
Nombre varchar(60) not null,
Nombre_Pais int not null,
constraint PK_CIUDAD primary key (ID),
constraint FK_CIUDAD_PAIS foreign key (Nombre_Pais) references PAIS(ID) ON UPDATE CASCADE
);

create table USER_POSTER(
ID int identity(726380,125),
Nombre_Empresa varchar(120) not null,
Email varchar(90) unique not null,
Contra varchar(90) not null,
Fecha_Creacion datetime DEFAULT GETDATE() not null,
Nombre_Calle varchar(90),
Nombre_Ciudad int not null,
Nombre_Pais int not null,
constraint PK_POSTER primary key (ID),
constraint FK_POSTER_CIUDAD foreign key (Nombre_Ciudad) references CIUDAD(ID) ON UPDATE CASCADE,
constraint FK_POSTER_PAIS foreign key (Nombre_Pais) references PAIS(ID) 
);

create table USER_ADMIN(
ID int identity(13267038,75),
Usuario varchar(90) unique not null,
Contraseña varchar(90) not null,
Fecha_Creacion datetime DEFAULT GETDATE() not null,
Nombre varchar(120) not null,
Email varchar(90) ,
constraint PK_ADMIN primary key(ID)
);

create table CATEGORIA(
ID int identity(1,1),
Nombre varchar(60) unique not null,
constraint PK_CATEGORIA primary key (ID)
);

create table TIPO_TRABAJO(
ID int identity(1,1),
Nombre varchar(60) unique not null,
constraint PK_TRABAJO primary key (ID)
);

create table POST(
ID int identity(1092467,99),
Nombre_Categoria int not null,
Nombre_Tipo_Trabajo int not null,
Poster int not null,
Logo varbinary(MAX),
Direccion_URL varchar(MAX),
Nombre_Posicion varchar(90) not null,
Nombre_Calle varchar(90),
Nombre_Ciudad int not null,
Nombre_Pais int not null,
Descripcion varchar(MAX) not null,
Fecha_Creacion datetime DEFAULT GETDATE() not null,
constraint PK_POST primary key (ID),
constraint FK_POST_CIUDAD foreign key (Nombre_Ciudad) references CIUDAD(ID) ON UPDATE CASCADE,
constraint FK_POST_PAIS foreign key (Nombre_Pais) references PAIS(ID),
constraint FK_POST_CATEGORIA foreign key (Nombre_Categoria) references CATEGORIA(ID) ON UPDATE CASCADE,
constraint FK_POST_TRABAJO foreign key (Nombre_Tipo_Trabajo) references TIPO_TRABAJO(ID) ON UPDATE CASCADE
);
