drop table if exists pais cascade;
drop table if exists estado cascade;
drop table if exists cidade cascade;


create table pais (
    pais_id serial primary key,
    pais_sigla varchar(2) not null,
    pais_nome varchar(100) not null
);

create table estado (
    estado_id serial primary key,
    estado_nome varchar(100) not null,
    estado_sigla varchar(2) not null,
    estado_pais_id integer,
    foreign key (estado_pais_id) references pais (pais_id)
);


create table cidade (
    cidade_id serial primary key,
    cidade_nome varchar(100) not null,
    cidade_estado_id integer,
    foreign key (cidade_estado_id) references estado (estado_id)
);


insert into pais (pais_nome, pais_sigla) values ('Brasil', 'BR');
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Acre', 'AC', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Alagoas', 'AL', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Amapá', 'AP', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Amazonas', 'AM', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Bahia', 'BA', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Ceará', 'CE', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Distrito Federal', 'DF', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Espírito Santo', 'ES', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Goiás', 'GO', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Maranhão', 'MA', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Mato Grosso', 'MT', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Mato Grosso do Sul', 'MS', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Minas Gerais', 'MG', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Pará', 'PA', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Paraíba', 'PB', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Paraná', 'PR', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Pernambuco', 'PE', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Piauí', 'PI', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Rio de Janeiro', 'RJ', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Rio Grande do Norte', 'RN', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Rio Grande do Sul', 'RS', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Rondônia', 'RO', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Roraima', 'RR', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Santa Catarina', 'SC', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('São Paulo', 'SP', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Sergipe', 'SE', 1);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Tocantins', 'TO', 1);

insert into cidade(cidade_nome, cidade_estado_id) values ('Abaíra', 1);
insert into cidade(cidade_nome, cidade_estado_id) values ('Abaré', 1);
insert into cidade(cidade_nome, cidade_estado_id) values ('Acajutiba', 1);
insert into cidade(cidade_nome, cidade_estado_id) values ('Adustina', 1);
insert into cidade(cidade_nome, cidade_estado_id) values ('Água Fria', 1);

insert into cidade(cidade_nome, cidade_estado_id) values ('Água Boa', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Cuiabá', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Jaciara', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Natal', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Paraná', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Rio Branco', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Rondonópolis', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('São Félix do Araguaia', 11);
insert into cidade(cidade_nome, cidade_estado_id) values ('Sorriso', 11);

insert into pais (pais_nome, pais_sigla) values ('Estados Unidos', 'US');
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Alabama', 'AL', 2);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Alaska', 'AK', 2);
insert into estado (estado_nome, estado_sigla, estado_pais_id) values ('Arizona', 'AZ', 2);

/* cidade do de alabama*/
insert into cidade(cidade_nome, cidade_estado_id) values ('Aberdeen', 2);
insert into cidade(cidade_nome, cidade_estado_id) values ('Acomanhacao', 2);

/* cidade de alaksa */
insert into cidade(cidade_nome, cidade_estado_id) values ('Anchorage', 2);
insert into cidade(cidade_nome, cidade_estado_id) values ('Fairbanks', 2);
insert into cidade(cidade_nome, cidade_estado_id) values ('Juneau', 2);

/* cidade do arizona */
insert into cidade(cidade_nome, cidade_estado_id) values ('Phoenix', 2);
insert into cidade(cidade_nome, cidade_estado_id) values ('Tucson', 2);
insert into cidade(cidade_nome, cidade_estado_id) values ('Yuma', 2);


select (
    case 
        when pais.pais_id = 1 then pais.pais_sigla
        else pais.pais_nome
    end,
    case 
        when pais.pais_id = 1 then estado.estado_sigla
        else estado.estado_nome
    end
) from pais
    inner join estado on pais.pais_id = estado.estado_pais_id


/*
Recuperar todos os nomes de todos as cidades, 
mostrando o nome da cidade e o nome do estado, 
contudo quando n˜ao for o Brasil, o relat´orio dever´a mostrar
somente o nome da cidade e a sigla do pa´ıs
*/

select 
    cidade.cidade_nome,
    case 
        when pais.pais_id = 1 then estado.estado_sigla
        else pais.pais_sigla
    end
from cidade
    inner join estado on cidade.cidade_estado_id = estado.estado_id
    inner join pais on estado.estado_pais_id = pais.pais_id
