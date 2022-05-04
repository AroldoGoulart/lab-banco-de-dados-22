/* criar tabela clientes, produtos, venda */
/* venda e produtos (n,n) */
/* venda e clientes (n,1) */

    drop table if exists cliente cascade;
    drop table if exists produto cascade;
    drop table if exists venda cascade;
    drop table if exists venda_produto cascade;

    create table produto (
        prod_id serial primary key,
        prod_name varchar(255),
        prod_preco double precision
    );

    create table cliente(
        cliente_id serial primary key,
        cliente_nome varchar(255)
    );


    create table venda (
        venda_id serial primary key,
        cliente_venda integer,
        constraint cliente_fk foreign key (cliente_venda) references cliente (cliente_id)
    );

    /* tabela de ligacao n,n * entre produto e venda */
    create table prouto_venda (
        prod_id integer,
        venda_id integer,
        quantidade integer,
        primary key (prod_id, venda_id),
        constraint produto_fk foreign key (prod_id) references produto (prod_id),
        constraint venda_fk foreign key (venda_id) references venda (venda_id)
    );

insert into produto (prod_name, prod_preco) values ('Uva', 10);
insert into produto (prod_name, prod_preco) values ('Maçã', 5);
insert into produto (prod_name, prod_preco) values ('Banana', 3);
insert into produto (prod_name, prod_preco) values ('Pera', 8);
insert into produto (prod_name, prod_preco) values ('Melancia', 7);

insert into cliente (cliente_nome) values ('João');
insert into cliente (cliente_nome) values ('Maria');
insert into cliente (cliente_nome) values ('Pedro');

insert into venda(cliente_venda) values (1);
insert into venda(cliente_venda) values (2);
insert into venda(cliente_venda) values (3);

insert into prouto_venda (prod_id, venda_id, quantidade) values (1, 1, 1);
insert into prouto_venda (prod_id, venda_id, quantidade) values (2, 2, 2);
insert into prouto_venda (prod_id, venda_id, quantidade) values (3, 3, 3);



/*
    A quantidade total de vendas por cada cliente, sendo que deve
    aparecer o nome do cliente, o total ordenado por aquele que
    comprou mais para o que comprou menos
*/


/* o que mais comprou */
select cliente_id, cliente_nome, (pv.quantidade) as compras from cliente
    inner join venda v on cliente_id = v.cliente_venda
    inner join prouto_venda pv on v.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id
    order by compras desc;

/* oque mais gastou ordenado */
select cliente_id, cliente_nome, (pv.quantidade * p.prod_preco) as total from cliente
    inner join venda v on cliente_id = v.cliente_venda
    inner join prouto_venda pv on v.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id
    order by total desc;

/* 
    quantidade de produtos por cliente
*/
select cliente_nome, pv.quantidade as quantidade, p.prod_name as item  from cliente
    inner join venda v on cliente_id = v.cliente_venda
    inner join prouto_venda pv on v.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id

/*
    A quantidade total de vendas por cada cliente, sendo que deve
    aparecer o nome do cliente, o total ordenado por aquele que
    comprou mais para o que comprou menos, desde que a
    quantidade compras seja maior do que 1
*/
select cliente_nome, count(pv.venda_id) as vendas from cliente
    inner join venda v on cliente_id = v.cliente_venda
    inner join prouto_venda pv on v.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id
    group by cliente_nome
    having count(pv.venda_id) > 1
    order by vendas desc;

/*
    Crie um relat´orio que mostre a quantidade o total de cada
    produto comprado por cada cliente, desde que a quantidade de
    produtos comprados seja maior do que 1.
    Ex: Cliente1, 10, L´apis
*/
select cliente_nome, count(pv.venda_id) as vendas, p.prod_name from cliente
    inner join venda v on cliente_id = v.cliente_venda
    inner join prouto_venda pv on v.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id
    group by cliente_nome, p.prod_name
    having count(pv.venda_id) > 1
    order by vendas desc;

/*
    Precisamos saber quais s˜ao os c´odigos e os nomes dos
    produtos que foram vendidos
*/
select produto.prod_id, produto.prod_name from produto
    inner join prouto_venda pv on produto.prod_id = pv.prod_id
    inner join venda v on pv.venda_id = v.venda_id

/*
    Recupere as informa¸c˜oes do cliente que mais gastou na loja
*/
select cliente_id, c.cliente_nome, prod_name, (quantidade * prod_preco) as total from venda
    inner join prouto_venda pv on venda.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id
    inner join cliente c on venda.cliente_venda = c.cliente_id
    where (quantidade * prod_preco) = (
        select max(pv.quantidade * p.prod_preco) from venda v
        inner join prouto_venda pv on v.venda_id = pv.venda_id
        inner join produto p on pv.prod_id = p.prod_id
    );


/*
Precisamos saber quais s˜ao os c´odigos e os nomes dos produtos e a
quantidade que tiveram pelo menos 10 vendas, ou que tiveram somente
1 venda
*/

select produto.prod_id, produto.prod_name, count(pv.venda_id) as vendas from produto
    inner join prouto_venda pv on produto.prod_id = pv.prod_id
    inner join venda v on pv.venda_id = v.venda_id
    group by produto.prod_id, produto.prod_name
    having count(pv.venda_id) >= 10
    union
    	select produto.prod_id, produto.prod_name, count(pv.venda_id) as vendas from produto
	        inner join prouto_venda pv on produto.prod_id = pv.prod_id
		    inner join venda v on pv.venda_id = v.venda_id
		    group by produto.prod_id, produto.prod_name
		    having count(pv.venda_id) = 1

/*
cliente que mais gastou
e o que menos gastou
*/
select cliente_id, c.cliente_nome, prod_name, (quantidade * prod_preco) as total from venda
    inner join prouto_venda pv on venda.venda_id = pv.venda_id
    inner join produto p on pv.prod_id = p.prod_id
    inner join cliente c on venda.cliente_venda = c.cliente_id
    where (quantidade * prod_preco) = (
        select max(pv.quantidade * p.prod_preco) from venda v
        inner join prouto_venda pv on v.venda_id = pv.venda_id
        inner join produto p on pv.prod_id = p.prod_id
    )
    union 
        select cliente_id, c.cliente_nome, prod_name, (quantidade * prod_preco) as total from venda
        inner join prouto_venda pv on venda.venda_id = pv.venda_id
        inner join produto p on pv.prod_id = p.prod_id
        inner join cliente c on venda.cliente_venda = c.cliente_id
        where (quantidade * prod_preco) = (
            select min(pv.quantidade * p.prod_preco) from venda v
            inner join prouto_venda pv on v.venda_id = pv.venda_id
            inner join produto p on pv.prod_id = p.prod_id
        )