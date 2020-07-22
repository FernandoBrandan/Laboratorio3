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
		
		
/* ****************************************************************************** */		
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