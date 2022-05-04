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