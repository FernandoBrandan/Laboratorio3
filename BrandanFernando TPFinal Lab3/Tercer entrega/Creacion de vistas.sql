
create view vw_Socio_x_Inscripcion_Activos
as
select p.DNI, p.Apellido, p.Nombre, ta.Descripcion from Persona as p
inner join Socio as s on s.DNI = p.DNI
inner join Inscripcion as i on i.Legajo=s.LegajoSo
inner join Actividad as a on a.IdActividad = i.IdActividad
inner join Tipo_Actividad as ta on ta.IdTipoActividad = a.IdTipoActividad
where i.FechaBaja is null


create view vw_Profesor_x_Actividad
as
select distinct p.Apellido, p.Nombre, ta.Descripcion  from Persona as p
inner join Empleado as e on e.DNI=p.DNI
inner join Actividad as a on a.Profesor=e.LegajoEm
inner join Tipo_Actividad as ta on ta.IdTipoActividad = a.IdTipoActividad