create procedure Busca_Actividad_Dia(@Dia varchar(30))
as
Begin
	select ta.Descripcion, a.HorarioDesde, a.HorarioHasta, sd.Descripcion, a.LugaresDisponibles  
	from Tipo_Actividad as ta
	inner join Actividad as a on a.IdTipoActividad=ta.IdTipoActividad
	inner join Seleccion_Dias as sd on sd.IdSeleccionDias=a.IdDias
	where sd.Descripcion like '%' + @Dia + '%'
end

Exec Busca_Actividad_Dia 'sabado'
