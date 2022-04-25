
/*
Recuperar a descrição dos assuntos que são referenciados em
pelo menos 2 livros, ordem decrescente
*/
SELECT a.descricao, count(l.livro_id)
    FROM livro l inner join assunto a on a.assunto_id = l.assunto
    GROUP BY a.descricao
    having count(l.assunto) >= 2
    order by count(l.assunto) desc
