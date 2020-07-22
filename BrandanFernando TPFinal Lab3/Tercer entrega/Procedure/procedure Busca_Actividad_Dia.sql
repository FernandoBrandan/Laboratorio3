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

Exec Busca_Actividad_Dia 'miercoles'
