/*
A quantidade de livro por cada editora, ordenado do maior
para o menor
*/
select e.nome, count(l.livro_id)
    from livro l inner join editora e on e.editora_id = l.editora
    group by e.nome
    order by count(l.editora) desc;