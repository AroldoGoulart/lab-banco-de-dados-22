/* 
Recuperar o nome das editoras que s˜ao referenciados em pelo
menos 2 livros, ordem decrescente
*/
SELECT e.nome, count(l.livro_id)
    FROM livro l inner join editora e on e.editora_id = l.editora
    GROUP BY e.nome
    having count(l.editora) >= 2 
