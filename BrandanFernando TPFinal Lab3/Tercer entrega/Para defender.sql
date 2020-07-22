select * from Tipo_Actividad	--ok
select * from Tipo_Inscripcion	--ok
/********************/
select * from Dias		--ok
select * from Horarios	--ok
select * from Seleccion_DiasHorario		--ok	
/*******************/
select * from Persona	--ok
select * from Empleado	--ok
select * from Socio		--ok
/**********************/
select * from Actividad		--ok
select * from Actividad_X_Dias	--ok
select * from Inscripcion
select * from Factura

/********/
/*	PRUEBAS		*/
select * from Socio
select * from Actividad
select * from Tipo_Inscripcion

exec Genera_Inscripcion 17, 1, 6

select * from Inscripcion
select * from Actividad
select * from Factura

/*VOLVER TODO DE CERO*/
GO
DELETE Factura
GO
DELETE Inscripcion
GO
UPDATE Actividad
SET LugaresDisponibles = 10