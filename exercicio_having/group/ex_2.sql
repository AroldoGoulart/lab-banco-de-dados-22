/* 
    A quantidade de livro por cada assunto, ordenado do menor
    para o maior
*/
select e.descricao, count(l.livro_id)
    from livro l inner join assunto e on e.assunto_id = l.assunto
    group by e.descricao
    order by count(l.assunto) desc;