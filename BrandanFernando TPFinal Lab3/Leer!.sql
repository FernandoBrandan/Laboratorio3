--PRIMERO EJECUTAR EL ARCHIVO BASE DE DATOS.SQL

/*********************************************/
--VISTAS
select * from vw_Socio_x_Inscripcion_Activos
select * from vw_Profesor_x_Actividad

/*********************************************/
--PROCEDIMEITNO ALMACENADO
--verifica las actividades que se realiza el dia requerido
Exec Busca_Actividad_Dia 'miercoles'

/*********************************************/
--TRANSACCIONES
--Para generar una incripcion verificar datos
select * from Socio
select * from Actividad
select * from Tipo_Inscripcion

--Para verificar las incripciones
select * from Inscripcion
select * from Actividad
select * from Factura
--ORDEN DE PARAMETROS @Identificador(dni o legajo del socio), @Actividad, @TipoIncripcion
exec Genera_Inscripcion 25, 145, 3
--Probar con TipoIncripcion mayor o igual a 4, genera facturas de los meses siguientes
/*******/
--El insert de incripcion dispara dos triggers
--TRIGGER tr_Actualiza_Disponibilidad_Actividad para modificar los lugares disponibles de la actividad.
--TRIGGER tr_Genera_Facturacion captura los datos para ejecutar el proceso PR_INSERTA_FACTURA

/*********************************************/
/*VOLVER TODO DE CERO*/
GO
DELETE Factura
GO
DELETE Inscripcion
GO
UPDATE Actividad
SET LugaresDisponibles = 10

--(para mas detalles en la carpeta "tercer entrega")
--(para mas detalles en la carpeta "tercer entrega")