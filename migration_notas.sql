
drop table if exists notas;
create table notas (
cod serial primary key,
	nota double precision
)


/* notas de 1-10 */
insert into notas (nota)
select floor(random() * 10 + 1)
