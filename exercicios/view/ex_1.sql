
/*
    Mostre o nome do fabricante e a bebidsa que ele vende
    COM VIEW
*/
create or replace view vw_fabricante_bebida as
select
    f.fabricante_nome,
    b.bebida_descricao
from
    fabricante f
    inner join bebida b on f.fabricante_id = b.bebida_fabricante_id;

select * from vw_fabricante_bebida;

/*
Mostre o nome do fabricante, o nome da cidade e o nome da bebida
que fabrica
*/
create or replace view vw_fabricante_cidade_bebida as
select 
    f.fabricante_nome,
    c.cidade_nome,
    b.bebida_descricao
from 
    fabricante f
    inner join bebida b on f.fabricante_id = b.bebida_fabricante_id
    inner join cidade c on f.fabricante_cidade_id = c.cidade_id;
select * from vw_fabricante_cidade_bebida;

/*
Mostre os nomes das bebidas e o nome dos produtos em uma ´unica
consulta
*/
create or replace view vw_bebida_produto as
select 
    b.bebida_descricao,
    p.produto_descricao
from
    bebida b
    inner join produto p on b.bebida_id = p.produto_fabricante_id;
select * from vw_bebida_produto;