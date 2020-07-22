/*	TRABAJO PRACTICO CUATRIMESTRAL  */
use master
go
create database BrandanFernando_Club
go
use BrandanFernando_Club

/*CREACION DE TABLAS ESTANDAR*/

go
create table Tipo_Actividad
	(
	IdTipoActividad bigint not null  primary key identity(1,1),
	Descripcion varchar(100) not null  
	)
go
create table Tipo_Inscripcion
	(
	IdTipoInscripcion bigint not null  primary key identity(1,1),
	Descripcion varchar(100) not null,
	Monto money 
	)
go
create table Dias
	(
	IdDias bigint not null  primary key identity(1,1),
	Descripcion varchar(100) not null
	)
go
create table Horarios
	(
	IdHorarios bigint not null  primary key identity(1,1),
	Desde time null, 
	Hasta time null
	)
go
create table Seleccion_DiasHorario				
	(
	IdSeleccionDias bigint not null  primary key identity(1,1),
	IdDias1 bigint null  foreign key references Dias(IdDias),
	IdDias2 bigint null  foreign key references Dias(IdDias),
	IdDias3 bigint null  foreign key references Dias(IdDias),
	Horarios bigint null  foreign key references Horarios(IdHorarios)
	)
go

/*CREACION DE TABLAS PRINCIPALES*/

create table Persona
	(
	DNI bigint not null  primary key ,
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	FechaNacimiento date,
	Domicilio varchar(100) not null,
	)
go
create table Empleado
	(
	LegajoEm bigint not null  primary key identity (1,8),	
	DNI bigint not null unique foreign key references Persona(DNI),	
	Contraseña varchar(20) null, 
	TipoEmpleado varchar(10) not null check(TipoEmpleado = 'Adm' or TipoEmpleado = 'Prof'),
	FechaIngreso date not null,
	Estado bit null
	)
go
create table Socio
	(
	LegajoSo bigint not null  primary key identity (1,8),
	DNI bigint not null unique foreign key references Persona(DNI),
	FechaIngreso date not null,
	Estado bit null
	)
go
create table Actividad
	(
	IdActividad bigint not null primary key identity (1,8),
	IdTipoActividad bigint not null foreign key references Tipo_Actividad(IdTipoActividad),
	Profesor bigint null foreign key references Empleado(LegajoEm),
	LugaresDisponibles int null
	)
go
create table Actividad_X_Dias			
	(
	IdAct_Dias bigint not null  primary key identity(1,1),
	IdSeleccionDias bigint null  foreign key references Seleccion_DiasHorario(IdSeleccionDias),
	IdActividad bigint null  foreign key references Actividad(IdActividad)			
	)
go
create table Inscripcion
	(
	IdInscripcion int not null primary key identity (1,8),
	Legajo bigint not null foreign key references Socio(LegajoSo),
	IdActividad bigint  null foreign key references Actividad(IdActividad),
	IdTipoInscripcion bigint null foreign key references Tipo_Inscripcion(IdTipoInscripcion),
	FechaInscripcion date not null,
	FechaBaja bit null
	)
go
create table Factura
	(
	IdFactura int not null primary key identity (1,12),
	Descripcion varchar(100) null,
	IdInscripcion int null foreign key references Inscripcion(IdInscripcion),
	NumeroFactura int not null, 
	Estado varchar(10) null,
	Monto money not null
	)
go

/*CREACION DE TABLAS RELACIONALES*/



