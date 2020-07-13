alter TRIGGER tr_Genera_Facturacion
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