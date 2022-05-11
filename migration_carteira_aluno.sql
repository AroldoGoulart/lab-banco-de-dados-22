
/*
Crie um conjunto de rela¸c˜oes Categoria Carteira de Motorista x Aluno:
Fa¸co as consultas para responder as seguintes quest˜oes
I Precisamos saber quais s˜ao os alunos e suas respectivas carteiras que
est˜ao almejando, assim o relat´orio dever´a retornar o nome do cliente, e
a categoria ao qual ele deseja, sendo que no banco s´o existem as
categorias A, B, C, D ou E, e o relat´orio dever´a retornar Moto, Carro
*/
drop table if exists categoria_carteira;
drop table if exists aluno;
drop table if exists carteira;

create table carteira (
   carteira_id serial primary key,
   carteira_tipo varchar(2)
)

create table aluno (
    aluno_id serial primary key,
    aluno_nome varchar(50)
)

create table carteira_aluno (
    ca_id integer references carteira(carteira_id),
    ca_carteira_id integer references carteira(carteira_id),
    constraint ca_primary key (ca_id, ca_carteira_id)
)


insert into carteira(carteira_tipo) values ('A');
insert into carteira(carteira_tipo) values ('B');
insert into carteira(carteira_tipo) values ('C');
insert into carteira(carteira_tipo) values ('D');
insert into carteira(carteira_tipo) values ('E');

insert into aluno (aluno_nome) values ('João');
insert into aluno (aluno_nome) values ('Maria');
insert into aluno (aluno_nome) values ('Pedro');
insert into aluno (aluno_nome) values ('Ana');
insert into aluno (aluno_nome) values ('José');
insert into aluno (aluno_nome) values ('José Agnaldo');

insert into carteira_aluno(ca_carteira_id, ca_id) values (1, 1);

insert into carteira_aluno(ca_carteira_id, ca_id) values (2, 2);
insert into carteira_aluno(ca_carteira_id, ca_id) values (3, 3);
insert into carteira_aluno(ca_carteira_id, ca_id) values (4, 4);
insert into carteira_aluno(ca_carteira_id, ca_id) values (5, 5);

/*
categorias A, B, C, D ou E, e o relat´orio dever´a retornar Moto, Carro,
Caminh˜ao, Onibus e Eixo, para as respectivas categorias 
*/

select 
    aluno_nome,
    case 
        when carteira_tipo = 'A' then 'Moto'
        when carteira_tipo = 'B' then 'Carro'
        when carteira_tipo = 'C' then 'Caminhão'
        when carteira_tipo = 'D' then 'Ônibus'
        when carteira_tipo = 'E' then 'Eixo'
    end as tipo
from aluno
    inner join carteira_aluno on aluno_id = ca_id
    inner join carteira on ca_carteira_id = carteira_id
