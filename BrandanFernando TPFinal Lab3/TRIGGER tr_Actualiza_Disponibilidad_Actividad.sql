
alter TRIGGER tr_Actualiza_Disponibilidad_Actividad 
ON Inscripcion
AFTER INSERT
AS
BEGIN
    Declare @IdActividad bigint
    Declare @CantidadPersonas bigint
    Declare @LugaresDisponibles bigint
    
     select @IdActividad = IdActividad 
    from inserted
    
    select @CantidadPersonas = CantidadPersonas, 
		  @LugaresDisponibles = LugaresDisponibles 
	from Actividad
	where IdActividad = @IdActividad
	  
    update Actividad
    set CantidadPersonas = @CantidadPersonas +1,
    LugaresDisponibles = @LugaresDisponibles  -1
    where IdActividad = @IdActividad

END
