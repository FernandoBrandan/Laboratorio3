
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
