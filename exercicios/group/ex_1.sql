/*
A quantidade de livro por cada editora, ordenado do maior
para o menor
*/
select e.nome, count(l.livro_id)
    from livro l inner join editora e on e.editora_id = l.editora
    group by e.nome
    order by count(l.livro_id) desc;
    
/* 
    A quantidade de livro por cada assunto, ordenado do menor
    para o maior
*/
select e.descricao, count(l.livro_id)
    from livro l inner join assunto e on e.assunto_id = l.assunto
    group by e.descricao
    order by count(l.assunto) desc;
