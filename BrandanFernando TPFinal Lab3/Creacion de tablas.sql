/*	TRABAJO PRACTICO CUATRIMESTRAL  */
use master
go
create database Laboratorio3Final
go
use Laboratorio3Final

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
create table Seleccion_Dias
	(
	IdSeleccionDias bigint not null  primary key identity(1,1),
	Descripcion varchar(100) null,
	IdDias1 bigint null  foreign key references Dias(IdDias),
	IdDias2 bigint null  foreign key references Dias(IdDias),
	IdDias3 bigint null  foreign key references Dias(IdDias)
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
	HorarioDesde time null, 
	HorarioHasta time null, 
	IdDias bigint not null foreign key references Seleccion_Dias(IdSeleccionDias),
	CantidadPersonas int null,
	LugaresDisponibles int null
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
	Estado varchar(10) null,
	Pagados int null,
	Pendientes int null
	)
go

/*CREACION DE TABLAS RELACIONALES*/



