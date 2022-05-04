drop table if exists livro;
drop table if exists assunto;
create table assunto (
    assunto_id serial primary key,
    sigla varchar(255),
    descricao varchar(255)
);

drop table if exists editora;
create table editora (
    editora_id serial  primary key,
    nome varchar(255)
);

create table livro (
    livro_id serial,
    titulo varchar(255),
    editora integer,
    assunto integer,
    primary key (livro_id),
    constraint livro_assunto_fk foreign key (assunto) references assunto (assunto_id),
    constraint livro_editora_fk foreign key (editora) references editora (editora_id)
);
/* criar editoras aleatorias */
insert into editora (nome) values ('Janina');
insert into editora (nome) values ('Livraria Saraiva');
insert into editora (nome) values ('FTD');

/* criar assuntos */
insert into assunto (sigla, descricao) values ('L', 'Literatura');
insert into assunto (sigla, descricao) values ('P', 'Poesia');
insert into assunto (sigla, descricao) values ('C', 'Ciência');
insert into assunto (sigla, descricao) values ('Fic', 'Ficção');

/* Criar livros de literatura, poesia e ciencia com titulo reais */
insert into livro (titulo, editora, assunto) values ('O Homem de Ferro', 1, 1);
insert into livro (titulo, editora, assunto) values ('O Pequeno Príncipe', 1, 2);
insert into livro (titulo, editora, assunto) values ('O Guia do Mochileiro das Galáxias', 1, 3);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis', 2, 1);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis: A Sociedade do Anel', 2, 1);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis: A Sociedade do Anel - As Duas Torres', 2, 1);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis: As Duas Torres', 2, 1);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis: A Sociedade do Anel - A Estrela do Norte', 2, 1);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis: A Sociedade do Anel - O Retorno do Rei', 2, 1);
insert into livro (titulo, editora, assunto) values ('O Senhor dos Anéis: As Duas Torres - O Retorno do Rei', 2, 1);

/* exercicios */

/* Group */
/*
    A quantidade de livro por cada editora, ordenado do maior
    para o menor
*/
select e.nome, count(l.livro_id)
    from livro l inner join editora e on e.editora_id = l.editora
    group by e.nome
    order by count(l.editora) desc;

/* 
    A quantidade de livro por cada assunto, ordenado do menor
    para o maior
*/
select e.descricao, count(l.livro_id)
    from livro l inner join assunto e on e.assunto_id = l.assunto
    group by e.descricao
    order by count(l.assunto) desc;

/* Having */

/* 
    Recuperar o nome das editoras que são referenciados em pelo
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

/* Sub-query */

/* 
    Faço as consultas para responder as seguintes questões
    Recuperar o nome das editoras são referenciados 
*/
select 
    editora.name
    from livro
    inner join editora e on e.editora_id = livro.editora
    group by editora.nome

/* 
    Recuperar a descri¸c˜ao e a sigla dos assuntos que s˜ao
*/

select 
    a.sigla, a.descricao
    from livro 
    inner join assunto a on a.assunto_id = livro.assunto
    group by a.sigla, a.descricao 



insert into assunto (sigla, descricao) values ('Fic', 'Ficção');
select * from assunto;
insert into livro (titulo, editora, assunto) values ('O Guia do Mochileiro das Galáxias (fic)', 1, 3);

/*
numero de livro por editora''
Recuperar o nome das editoras s˜ao referenciados que possuem pelo
menos 2 livros, ou que seus livros tenham o assunto ’Fic¸c˜ao’
*/
select nome, count(livro.livro_id) from editora  
    inner join livro on livro.editora = editora.editora_id
    group  by nome
    having count(livro.editora) >= 2
    union 
        select nome from editora
            inner join livro on livro.editora = editora.editora_id
            inner join assunto on assunto.assunto_id = livro.assunto
            group by nome
            where assunto.sigla = 'Fic'
            
/*
Recuperar a descri¸c˜ao e a sigla dos assuntos que s˜ao referenciados por
pelo menos 1 livro, ou que tenham a editora ’Pearson’
*/

select a.sigla, a.descricao  from assunto a
    inner join livro on livro.assunto = a.assunto_id
    inner join editora on editora.editora_id = livro.editora
    group by a.sigla, a.descricao
    having count(livro.assunto) >= 1
    union
        select a.sigla, a.descricao  from assunto a
            inner join livro on livro.assunto = a.assunto_id
            inner join editora on editora.editora_id = livro.editora
            where editora.nome = 'Pearson'

