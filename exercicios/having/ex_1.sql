/* 
Recuperar o nome das editoras que s˜ao referenciados em pelo
menos 2 livros, ordem decrescente
*/
SELECT e.nome, count(l.livro_id)
    FROM livro l inner join editora e on e.editora_id = l.editora
    GROUP BY e.nome
    having count(l.editora) >= 2 

/*
Recuperar a descrição dos assuntos que são referenciados em
pelo menos 2 livros, ordem decrescente
*/
SELECT a.descricao, count(l.livro_id)
    FROM livro l inner join assunto a on a.assunto_id = l.assunto
    GROUP BY a.descricao
    having count(l.assunto) >= 2
    order by count(l.assunto) desc