/***************************************************/
/*				CREACION DE TABLAS					*/
/***************************************************/
/*	TRABAJO PRACTICO CUATRIMESTRAL  */
go
PRINT 'CREACION DE TABLAS'
go
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

/*************************************************************************************************************************/
/***************************************************/
/*				INSERTA DATOS					*/
/***************************************************/

PRINT 'INSERTA DATOS'
USE [BrandanFernando_Club]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 07/22/2020 03:32:15 ******/
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (13789997, N'Vance', N'Coleman', CAST(0x32030B00 AS Date), N'Paraná 7156')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (15773080, N'Jermaine', N'Olson', CAST(0xD6100B00 AS Date), N'Nova Scotia 7943')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (16327838, N'Lucian', N'Kaufman', CAST(0x38010B00 AS Date), N'Puebla 2045')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (16514077, N'Colette', N'Gross', CAST(0xE8040B00 AS Date), N'Oaxaca 8133')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (16711063, N'Asher', N'Keller', CAST(0x8E010B00 AS Date), N'Hidalgo 8438')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (19982019, N'Rylee', N'Henson', CAST(0x11230B00 AS Date), N'Veracruz 4164')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (21042635, N'Tatyana', N'Stevenson', CAST(0xDC140B00 AS Date), N'Tamaulipas 6089')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (24205864, N'Carlos', N'Golden', CAST(0x45140B00 AS Date), N'San Luis Potosí 9811')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (26210857, N'Zelda', N'Kent', CAST(0x69110B00 AS Date), N'Tabasco 9949')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (27501687, N'Samantha', N'Head', CAST(0x5D0F0B00 AS Date), N'Ontario 4959')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (33928153, N'Asher', N'Campos', CAST(0x60070B00 AS Date), N'Michoacán 2496')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (36531430, N'Mollie', N'Macias', CAST(0x2B100B00 AS Date), N'New South Wales 6745')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (36947181, N'Lucian', N'Cooley', CAST(0x59080B00 AS Date), N'Guerrero 9633')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (38457701, N'Salvador', N'Goodwin', CAST(0x28080B00 AS Date), N'Pernambuco 7509')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (43824613, N'Lucas', N'Walter', CAST(0x33FB0A00 AS Date), N'Northern Territory 408')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (44543701, N'Elaine', N'Santana', CAST(0x4A150B00 AS Date), N'Chihuahua 8914')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (45014582, N'Zelda', N'Pollard', CAST(0x9C0C0B00 AS Date), N'Mexico City2989')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (46255915, N'Salvador', N'England', CAST(0xFCFB0A00 AS Date), N'Yucatán 3708')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (46763896, N'Rylee', N'Dalton', CAST(0x61FC0A00 AS Date), N'Jalisco 2620')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (48321851, N'Bevis', N'Glover', CAST(0xDB070B00 AS Date), N'Guanajuato 4861')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (53600383, N'Bevis', N'Lancaster', CAST(0x9F0B0B00 AS Date), N'Baja California 1757')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (61583890, N'Regina', N'Franklin', CAST(0x3C1F0B00 AS Date), N'Nunavut 5338')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (62312640, N'Elaine', N'Kirby', CAST(0x2B1C0B00 AS Date), N'Chiapas 6668')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (63623000, N'Tatyana', N'Farley', CAST(0xBF1E0B00 AS Date), N'Sinaloa 3456')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (65254656, N'Latifah', N'Espinoza', CAST(0xB21E0B00 AS Date), N'Nuevo León 2040')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (65661294, N'Dolan', N'Cameron', CAST(0xF3FA0A00 AS Date), N'Morelos 6995')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (89458710, N'Colette', N'Hunt', CAST(0x73230B00 AS Date), N'Coahuila 9653')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (93975467, N'Latifah', N'Moses', CAST(0x48060B00 AS Date), N'Sonora 6948')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (94117764, N'Hyatt', N'Warren', CAST(0x08220B00 AS Date), N'Pará 9812')
INSERT [dbo].[Persona] ([DNI], [Nombre], [Apellido], [FechaNacimiento], [Domicilio]) VALUES (99419202, N'Clare', N'Roth', CAST(0x9A0A0B00 AS Date), N'Querétaro 9605')
/****** Object:  Table [dbo].[Empleado]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Empleado] ON
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (121, 46255915, N'', N'Adm', CAST(0x18410B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (129, 48321851, N'', N'Prof', CAST(0x8E400B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (137, 16711063, N'', N'Prof', CAST(0xEE3F0B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (145, 46763896, N'', N'Prof', CAST(0x60420B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (153, 26210857, N'', N'Adm', CAST(0x9F400B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (161, 63623000, N'', N'Prof', CAST(0xD9400B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (169, 36947181, N'', N'Prof', CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (177, 93975467, N'', N'Prof', CAST(0x56410B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (185, 16514077, N'', N'Prof', CAST(0x21410B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (193, 62312640, N'', N'Adm', CAST(0x6C400B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (201, 65661294, N'', N'Adm', CAST(0x5F400B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (209, 99419202, N'', N'Prof', CAST(0x59400B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (217, 24205864, N'', N'Prof', CAST(0x8E420B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (225, 36531430, N'', N'Prof', CAST(0x2B420B00 AS Date), NULL)
INSERT [dbo].[Empleado] ([LegajoEm], [DNI], [Contraseña], [TipoEmpleado], [FechaIngreso], [Estado]) VALUES (233, 43824613, N'', N'Adm', CAST(0x09410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
/****** Object:  Table [dbo].[Tipo_Actividad]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Tipo_Actividad] ON
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (1, N'Acuática con Bandas')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (2, N'Acuática en Circuito')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (3, N'Acuática Max')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (4, N'Acuática Profunda')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (5, N'Aero Combat')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (6, N'Aero Dance')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (7, N'Aero Jump')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (8, N'Aeróbica')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (9, N'Aeróbica Coreográfica')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (10, N'Baile')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (11, N'BODYATTACK ')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (12, N'Boxeo')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (13, N'Chi Kung')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (14, N'Combat')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (15, N'Danza Árabe')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (16, N'Free Dance')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (17, N'Fútbol')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (18, N'Gimnasia Energética')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (19, N'Hip Hop')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (20, N'Iniciación Deportiva')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (21, N'Kangoo Jumps ')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (22, N'Karate Do')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (23, N'Meditación Activa')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (24, N'Musical Dance')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (25, N'Natación')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (26, N'Patín Artístico')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (27, N'POWERJUMP')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (28, N'Salsa')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (29, N'Spinning ')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (30, N'Step')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (31, N'Taekwondo')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (32, N'Tai Chi')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (33, N'Tango')
INSERT [dbo].[Tipo_Actividad] ([IdTipoActividad], [Descripcion]) VALUES (34, N'Zumba')
SET IDENTITY_INSERT [dbo].[Tipo_Actividad] OFF
/****** Object:  Table [dbo].[Actividad]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Actividad] ON
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (1, 31, 121, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (9, 31, 129, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (17, 12, 137, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (25, 12, 145, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (33, 8, 153, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (41, 34, 161, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (49, 34, 169, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (57, 15, 177, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (65, 17, 185, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (73, 17, 193, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (81, 22, 201, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (89, 33, 209, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (97, 33, 217, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (105, 26, 225, 10)
INSERT [dbo].[Actividad] ([IdActividad], [IdTipoActividad], [Profesor], [LugaresDisponibles]) VALUES (113, 26, 233, 10)
SET IDENTITY_INSERT [dbo].[Actividad] OFF
/****** Object:  Table [dbo].[Socio]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Socio] ON
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (1, 15773080, CAST(0x39410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (9, 61583890, CAST(0x17410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (17, 27501687, CAST(0xE13F0B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (25, 94117764, CAST(0xA7420B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (33, 13789997, CAST(0x6D410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (41, 38457701, CAST(0x68420B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (49, 53600383, CAST(0x77410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (57, 33928153, CAST(0x63410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (65, 19982019, CAST(0x2E400B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (73, 45014582, CAST(0xA5400B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (81, 21042635, CAST(0xF3410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (89, 16327838, CAST(0xAB400B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (97, 65254656, CAST(0x2F410B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (105, 89458710, CAST(0x54400B00 AS Date), NULL)
INSERT [dbo].[Socio] ([LegajoSo], [DNI], [FechaIngreso], [Estado]) VALUES (113, 44543701, CAST(0x45420B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Socio] OFF
/****** Object:  Table [dbo].[Tipo_Inscripcion]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Tipo_Inscripcion] ON
INSERT [dbo].[Tipo_Inscripcion] ([IdTipoInscripcion], [Descripcion], [Monto]) VALUES (1, N'Dia', 100.0000)
INSERT [dbo].[Tipo_Inscripcion] ([IdTipoInscripcion], [Descripcion], [Monto]) VALUES (2, N'Semanal', 450.0000)
INSERT [dbo].[Tipo_Inscripcion] ([IdTipoInscripcion], [Descripcion], [Monto]) VALUES (3, N'Mensual', 1600.0000)
INSERT [dbo].[Tipo_Inscripcion] ([IdTipoInscripcion], [Descripcion], [Monto]) VALUES (4, N'Trimestral', 45000.0000)
INSERT [dbo].[Tipo_Inscripcion] ([IdTipoInscripcion], [Descripcion], [Monto]) VALUES (5, N'Anual', 150000.0000)
INSERT [dbo].[Tipo_Inscripcion] ([IdTipoInscripcion], [Descripcion], [Monto]) VALUES (6, N'Indeterminado', 1600.0000)
SET IDENTITY_INSERT [dbo].[Tipo_Inscripcion] OFF
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 07/22/2020 03:32:15 ******/
/****** Object:  Table [dbo].[Factura]    Script Date: 07/22/2020 03:32:15 ******/
/****** Object:  Table [dbo].[Horarios]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Horarios] ON
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (1, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x070010ACD1530000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (2, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x07007870335C0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (3, CAST(0x070010ACD1530000 AS Time), CAST(0x07007870335C0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (4, CAST(0x070010ACD1530000 AS Time), CAST(0x0700E03495640000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (5, CAST(0x07007870335C0000 AS Time), CAST(0x0700E03495640000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (6, CAST(0x07007870335C0000 AS Time), CAST(0x070048F9F66C0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (7, CAST(0x0700E03495640000 AS Time), CAST(0x070048F9F66C0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (8, CAST(0x0700E03495640000 AS Time), CAST(0x0700B0BD58750000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (9, CAST(0x070048F9F66C0000 AS Time), CAST(0x0700B0BD58750000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (10, CAST(0x070048F9F66C0000 AS Time), CAST(0x07001882BA7D0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (11, CAST(0x0700B0BD58750000 AS Time), CAST(0x07001882BA7D0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (12, CAST(0x0700B0BD58750000 AS Time), CAST(0x070080461C860000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (13, CAST(0x07001882BA7D0000 AS Time), CAST(0x070080461C860000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (14, CAST(0x07001882BA7D0000 AS Time), CAST(0x0700E80A7E8E0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (15, CAST(0x070080461C860000 AS Time), CAST(0x0700E80A7E8E0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (16, CAST(0x070080461C860000 AS Time), CAST(0x070050CFDF960000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (17, CAST(0x0700E80A7E8E0000 AS Time), CAST(0x070050CFDF960000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (18, CAST(0x0700E80A7E8E0000 AS Time), CAST(0x0700B893419F0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (19, CAST(0x070050CFDF960000 AS Time), CAST(0x0700B893419F0000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (20, CAST(0x070050CFDF960000 AS Time), CAST(0x07002058A3A70000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (21, CAST(0x0700B893419F0000 AS Time), CAST(0x07002058A3A70000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (22, CAST(0x0700B893419F0000 AS Time), CAST(0x0700881C05B00000 AS Time))
INSERT [dbo].[Horarios] ([IdHorarios], [Desde], [Hasta]) VALUES (23, CAST(0x07002058A3A70000 AS Time), CAST(0x0700881C05B00000 AS Time))
SET IDENTITY_INSERT [dbo].[Horarios] OFF
/****** Object:  Table [dbo].[Dias]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Dias] ON
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (1, N'Lunes')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (2, N'Martes')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (3, N'Miercoles')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (4, N'Jueves')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (5, N'Viernes')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (6, N'Sabado')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (7, N'Domingo')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (8, N'Lunes-Miercoles-Viernes')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (9, N'Martes-Jueves-Sabado')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (10, N'Lunes-Miercoles')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (11, N'Lunes-Viernes')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (12, N'Miercoles-Viernes')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (13, N'Martes-Jueves')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (14, N'Martes-Sabado')
INSERT [dbo].[Dias] ([IdDias], [Descripcion]) VALUES (15, N'Jueves-Sabado')
SET IDENTITY_INSERT [dbo].[Dias] OFF
/****** Object:  Table [dbo].[Seleccion_DiasHorario]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Seleccion_DiasHorario] ON
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (1, 1, NULL, NULL, 5)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (2, 2, NULL, NULL, 9)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (3, 3, NULL, NULL, 1)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (4, 4, NULL, NULL, 2)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (5, 5, NULL, NULL, 5)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (6, 6, NULL, NULL, 3)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (7, 7, NULL, NULL, 7)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (8, 1, 3, 5, 9)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (9, 2, 4, 6, 5)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (10, 1, 3, NULL, 19)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (11, 1, 5, NULL, 11)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (12, 3, 5, NULL, 6)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (13, 2, 4, NULL, 12)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (14, 3, 6, NULL, 7)
INSERT [dbo].[Seleccion_DiasHorario] ([IdSeleccionDias], [IdDias1], [IdDias2], [IdDias3], [Horarios]) VALUES (15, 4, 6, NULL, 8)
SET IDENTITY_INSERT [dbo].[Seleccion_DiasHorario] OFF
/****** Object:  Table [dbo].[Actividad_X_Dias]    Script Date: 07/22/2020 03:32:15 ******/
SET IDENTITY_INSERT [dbo].[Actividad_X_Dias] ON
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (1, 1, 1)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (2, 2, 9)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (3, 3, 17)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (4, 4, 25)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (5, 5, 33)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (6, 6, 41)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (7, 7, 49)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (8, 8, 57)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (9, 9, 65)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (10, 10, 73)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (11, 11, 81)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (12, 12, 89)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (13, 13, 97)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (14, 14, 105)
INSERT [dbo].[Actividad_X_Dias] ([IdAct_Dias], [IdSeleccionDias], [IdActividad]) VALUES (15, 15, 113)
SET IDENTITY_INSERT [dbo].[Actividad_X_Dias] OFF



/*************************************************************************************************************************/
/***************************************************/
/*				CREACION DE VISTAS					*/
/***************************************************/
go
PRINT 'CREACION DE VISTAS'
GO
create view vw_Socio_x_Inscripcion_Activos
as
select p.DNI, p.Apellido, p.Nombre, ta.Descripcion from Persona as p
inner join Socio as s on s.DNI = p.DNI
inner join Inscripcion as i on i.Legajo=s.LegajoSo
inner join Actividad as a on a.IdActividad = i.IdActividad
inner join Tipo_Actividad as ta on ta.IdTipoActividad = a.IdTipoActividad
where i.FechaBaja is null


GO
create view vw_Profesor_x_Actividad
as
select distinct p.Apellido, p.Nombre, ta.Descripcion  from Persona as p
inner join Empleado as e on e.DNI=p.DNI
inner join Actividad as a on a.Profesor=e.LegajoEm
inner join Tipo_Actividad as ta on ta.IdTipoActividad = a.IdTipoActividad

/*************************************************************************************************************************/
/***************************************************/
/*				PROCEDIMIENTO ALMACENADOS				*/
/***************************************************/
go
PRINT 'CREACION PROCEDIMIENTO ALMACENADOS'

GO
create procedure Busca_Actividad_Dia(@Dia varchar(30))
as
Begin
	select ta.Descripcion, h.Desde, h.Hasta, 
			d1.Descripcion + '  ' + isnull(d2.Descripcion,' - ')  + '  ' + isnull(d3.Descripcion,' - ') as Dias,
		 a.LugaresDisponibles   from Tipo_Actividad as ta
	inner join Actividad as a on a.IdTipoActividad = ta.IdTipoActividad
	inner join Actividad_X_Dias as ad on ad.IdActividad = a.IdActividad
	inner join Seleccion_DiasHorario as dh on dh.IdSeleccionDias = ad.IdSeleccionDias
	left join Dias as d1 on d1.IdDias = dh.IdDias1
	left join Dias as d2 on d2.IdDias = dh.IdDias2
	left join Dias as d3 on d3.IdDias = dh.IdDias3
	inner join Horarios as h on h.IdHorarios = dh.Horarios
	where d1.Descripcion like '%' + @Dia + '%' or
	d2.Descripcion like '%' + @Dia + '%' or
	d3.Descripcion like '%' + @Dia + '%'
end

/*************************************************************************************************************************/
/***************************************************/
/*				TRANSACIONES				*/
/***************************************************/

go
PRINT 'CREACION TRANSACIONES'
/*********				Genera_Inscripcion				*********/

GO
create procedure Genera_Inscripcion(@Identificador bigint,
									@Actividad bigint,
									@TipoIncripcion bigint)
									
as
declare
@VerificaSocio int,
@VerificaLugar int,
@VerificaInscripcion int,
@Encuentralegajo int

BEGIN
--Comenzamos con el manejo de errores
	BEGIN TRY
	--Comienza la transacción
	BEGIN TRANSACTION
	
		--Verifico datos
		select @VerificaSocio = COUNT(1)
		from Socio 
		where LegajoSo = @Identificador  
		or DNI = @Identificador;
		
		if (@VerificaSocio) != 1 
			begin
				RAISERROR('NO EXISTE EL SOCIO', 16, 1)
			end
			
		--Verifico Disponibilidad
		Select @VerificaLugar = LugaresDisponibles 
		from Actividad 
		where IdActividad = @Actividad
		
		if (@VerificaLugar) = 0 
			begin
				RAISERROR('NO HAY LUGARES DISPONIBLES', 16, 1)
			end
			
		--Verifico que no tenga inscripcion
		select @VerificaInscripcion = COUNT(1) 
		from Inscripcion
		where Legajo = @Identificador  
		and IdActividad = @Actividad
		
		if (@VerificaInscripcion) = 1 
			begin
				RAISERROR('YA ESTA INSCRIPTO A LA ACTIVIDAD', 16, 1)
			end
			
		--Obtengo el legajo	
		select @Encuentralegajo = LegajoSo
		from Socio 
		where LegajoSo = @Identificador  
		or DNI = @Identificador;
	
	INSERT INTO Inscripcion(Legajo, IdActividad, IdTipoInscripcion,FechaInscripcion, FechaBaja)
	values(@Encuentralegajo, @Actividad, @TipoIncripcion, GETDATE(), null)
	
	COMMIT TRANSACTION
	END TRY
	
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH

end



/*********				pr_Inserta_Factura				*********/


GO
create procedure pr_Inserta_Factura(@TarIdInscripcion bigint, 
									@TarIdTipoInscripcion bigint)
as 
declare
@TarNumeroFactura bigint, 
@contador bigint,
@Monto money
begin
--Comenzamos con el manejo de errores
	BEGIN TRY
	--Comienza la transacción
	BEGIN TRANSACTION
	
	--BUSCO EL MONTO
	select @Monto = monto
	from Tipo_Inscripcion
	where IdTipoInscripcion = @TarIdTipoInscripcion
	
	--GENERA INSERT
	if (@TarIdTipoInscripcion) = 1
		begin
			set @TarNumeroFactura = 1
			
				insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
				values (@TarIdInscripcion,@TarNumeroFactura,'Pagado', @Monto)
		end
		
	if (@TarIdTipoInscripcion) = 2
		begin
			set @TarNumeroFactura = 1
			
				insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
				values (@TarIdInscripcion,@TarNumeroFactura,'Pagado', @Monto)
		end
		
	if (@TarIdTipoInscripcion) = 3
		begin
			set @TarNumeroFactura = 1
			
				insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
				values (@TarIdInscripcion,@TarNumeroFactura,'Pagado', @Monto)
		end
			
	if (@TarIdTipoInscripcion) = 4
		begin
			set @TarNumeroFactura = 1
			set @contador = 0
			
				insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
				values (@TarIdInscripcion,@TarNumeroFactura,'Pagado', @Monto)
		
			 WHILE (@contador < 2)
				BEGIN
     				SET @contador = @contador + 1
					set @TarNumeroFactura = @TarNumeroFactura + 1
     				
						insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
						values (@TarIdInscripcion,@TarNumeroFactura,'Pendiente', @Monto)
				END 
		end
		
	if (@TarIdTipoInscripcion) = 5 or (@TarIdTipoInscripcion) = 6
		begin
			set @TarNumeroFactura = 1
			set @contador = 0
			
			insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
			values (@TarIdInscripcion,@TarNumeroFactura,'Pagado', @Monto)
		
			 WHILE (@contador < 12)
				BEGIN
     				SET @contador = @contador + 1
					set @TarNumeroFactura = @TarNumeroFactura + 1
     				
						insert into factura(IdInscripcion, NumeroFactura, Estado, Monto)
						values (@TarIdInscripcion,@TarNumeroFactura,'Pendiente', @Monto)
				END 
		end	
	
	COMMIT TRANSACTION
	END TRY
	
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
end


/*************************************************************************************************************************/

/***************************************************/
/*				TRIGGER				*/
/***************************************************/
go
PRINT 'CREACION TRIGGERS'

/*********				tr_Genera_Facturacion				*********/

GO
create TRIGGER tr_Genera_Facturacion
ON Inscripcion
AFTER INSERT
AS
declare
@TarIdInscripcion bigint, 
@TarIdTipoInscripcion bigint
BEGIN
	--Toma los datos
	select @TarIdInscripcion = IdInscripcion, 
		   @TarIdTipoInscripcion = IdTipoInscripcion  
	from inserted
	
    exec pr_Inserta_Factura @TarIdInscripcion, @TarIdTipoInscripcion
END



/*********				tr_Actualiza_Disponibilidad_Actividad				*********/


GO
create TRIGGER tr_Actualiza_Disponibilidad_Actividad 
ON Inscripcion
AFTER INSERT
AS
BEGIN

    Declare @IdActividad bigint
    Declare @LugaresDisponibles bigint
    
    select @IdActividad = IdActividad 
    from inserted
    
    select @LugaresDisponibles = LugaresDisponibles 
	from Actividad
	where IdActividad = @IdActividad
	  
    update Actividad
    set LugaresDisponibles = @LugaresDisponibles  - 1
    where IdActividad = @IdActividad

END



