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
