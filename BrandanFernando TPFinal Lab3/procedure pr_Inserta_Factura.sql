create procedure pr_Inserta_Factura(@TarIdInscripcion bigint, 
									@TarIdTipoInscripcion bigint)
as 
declare
@TarPagado bigint, 
@TarPendiente bigint,
@contador bigint
begin
--Comenzamos con el manejo de errores
	BEGIN TRY
	--Comienza la transacción
	BEGIN TRANSACTION
	
	if (@TarIdTipoInscripcion) = 1
		begin
			set @TarPagado = 1
			set @TarPendiente = 0
			
		insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
		values (@TarIdInscripcion,'Pagado',@TarPagado, @TarPendiente)
	
		end
	if (@TarIdTipoInscripcion) = 2
		begin
			set @TarPagado = 1
			set @TarPendiente = 0
			
		insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
		values (@TarIdInscripcion,'Pagado',@TarPagado, @TarPendiente)
		end
	if (@TarIdTipoInscripcion) = 3
		begin
			set @TarPagado = 1
			set @TarPendiente = 0
			
	insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
		values (@TarIdInscripcion,'Pagado',@TarPagado, @TarPendiente)
		end
/* ****************************************************************************** */		
	if (@TarIdTipoInscripcion) = 4
		begin
			set @TarPagado = 1
			set @TarPendiente = 2
			set @contador = 0
			
			insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
			values (@TarIdInscripcion,'Pagado',@TarPagado, @TarPendiente)
		
			 WHILE (@contador < 2)
				BEGIN
     				SET @contador = @contador + 1
     				
						insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
						values (@TarIdInscripcion,'Pendiente',@TarPagado, @TarPendiente)
			
				END 
		end
	if (@TarIdTipoInscripcion) = 5 or (@TarIdTipoInscripcion) = 6
		begin
			set @TarPagado = 1
			set @TarPendiente = 11
			set @contador = 0
			
			insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
			values (@TarIdInscripcion,'Pagado',@TarPagado, @TarPendiente)
		
			 WHILE (@contador < 12)
				BEGIN
     				SET @contador = @contador + 1
     				
						insert into factura(IdInscripcion, Estado, Pagados, Pendientes )
						values (@TarIdInscripcion,'Pendiente',@TarPagado, @TarPendiente)
				END 
		end	
	
	COMMIT TRANSACTION
	END TRY
	
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
end