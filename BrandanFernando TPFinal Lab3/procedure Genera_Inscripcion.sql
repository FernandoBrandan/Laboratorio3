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

