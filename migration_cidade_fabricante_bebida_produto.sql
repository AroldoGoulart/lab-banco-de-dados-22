/*
Cidade={codigo,nome}
Fabricante={codigo,nome,codcidade}
Bebida={codigo,descricao,codfabricante}
Produto={codigo,descricao,codfabricante}
*/

create table cidade (
    cidade_id serial primary key,
    cidade_nome varchar(255)
);

create table fabricante(
    fabricante_id serial primary key,
    fabricante_nome varchar(255),
    fabricante_cidade_id integer references cidade(cidade_id)
);

create table bebida(
    bebida_id serial primary key,
    bebida_descricao varchar(255),
    bebida_fabricante_id integer references fabricante(fabricante_id)
);

create table produto (
    produto_id serial primary key,
    produto_descricao varchar(255),
    produto_fabricante_id integer references fabricante(fabricante_id)
);

insert into cidade (cidade_nome) values ('São Paulo');
insert into cidade (cidade_nome) values ('Rio de Janeiro');

insert into fabricante (fabricante_nome, fabricante_cidade_id) values ('Coca-Cola', 1);
insert into fabricante (fabricante_nome, fabricante_cidade_id) values ('Quack', 1);
insert into fabricante (fabricante_nome, fabricante_cidade_id) values ('Guaraná', 1);

insert into bebida (bebida_descricao, bebida_fabricante_id) values ('Coca-Cola BEBIDA', 1);
insert into bebida (bebida_descricao, bebida_fabricante_id) values ('Fanta BEBIDA', 2);
insert into bebida (bebida_descricao, bebida_fabricante_id) values ('Guaraná BEBIDA', 3);
insert into bebida (bebida_descricao, bebida_fabricante_id) values ('Quack BEBIDA', 2);

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