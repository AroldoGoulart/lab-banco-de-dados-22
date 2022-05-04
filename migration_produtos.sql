

drop table if exists produtos;
create table produtos (
    code serial primary key,
    prod_name varchar(255),
    prod_preco double precision
 );

insert into produtos (prod_name, prod_preco) values ('Uva', 10);
insert into produtos (prod_name, prod_preco) values ('Maçã', 5);
insert into produtos (prod_name, prod_preco) values ('Banana', 3);
insert into produtos (prod_name, prod_preco) values ('Pera', 8);
insert into produtos (prod_name, prod_preco) values ('Melancia', 7);
insert into produtos (prod_name, prod_preco) values ('Abacaxi', 9);
insert into produtos (prod_name, prod_preco) values ('Laranja', 6);
insert into produtos (prod_name, prod_preco) values ('Goiaba', 4);
insert into produtos (prod_name, prod_preco) values ('Manga', 2);

/* select from produto mais caro sem sub-select */
select prod_name, prod_name 
    from produtos 
    order by prod_preco 
    desc limit 1;

/* select from produto mais caro com sub-select */
select prod_name, prod_preco 
    from produtos 
    where prod_preco = (
        select max(prod_preco) 
        from produtos
    );
    