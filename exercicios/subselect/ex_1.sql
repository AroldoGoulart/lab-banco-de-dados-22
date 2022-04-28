/* 
    Faço as consultas para responder as seguintes questões
    Recuperar o nome das editoras são referenciados 
*/
select 
    editora.name
    from livro
    inner join editora e on e.editora_id = livro.editora
    group by editora.nome

/* 
    Recuperar a descri¸c˜ao e a sigla dos assuntos que s˜ao
*/

select 
    a.sigla, a.descricao
    from livro 
    inner join assunto a on a.assunto_id = livro.assunto
    group by a.sigla, a.descricao 