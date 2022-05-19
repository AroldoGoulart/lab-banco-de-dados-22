
/*
Aluno={codigo,nome}
Disciplina={codigo,nome}
Professor={codigo,nome}
Turma={codigo,nome,coddisciplina,codprofessor}
Matricula={codigo,codaluno,codturma}
*/
create table aluno (
    aluno_id serial primary key,
    aluno_nome varchar(255)
);

create table disciplina (
    disciplina_id serial primary key,
    disciplina_nome varchar(255)
);

create table professor (
    professor_id serial primary key,
    professor_nome varchar(255)
);

create table turma (
    turma_id serial primary key,
    turma_nome varchar(255),
    turma_disciplina_id integer references disciplina(disciplina_id),
    turma_professor_id integer references professor(professor_id)
);

create table matricula (
    matricula_id serial primary key,
    matricula_aluno_id integer references aluno(aluno_id),
    matricula_turma_id integer references turma(turma_id)
);


insert into aluno (aluno_nome) values ('João');
insert into aluno (aluno_nome) values ('Maria');

insert into disciplina (disciplina_nome) values ('Matemática');
insert into disciplina (disciplina_nome) values ('Português');
insert into disciplina (disciplina_nome) values ('História');
insert into disciplina (disciplina_nome) values ('Geografia');

insert into professor (professor_nome) values ('João Goulart');
insert into professor (professor_nome) values ('Maria Goulart');
insert into professor (professor_nome) values ('Pedro Goulart');


insert into turma (turma_nome, turma_disciplina_id, turma_professor_id) values ('Turma 1', 9, 4);
insert into turma (turma_nome, turma_disciplina_id, turma_professor_id) values ('Turma 2', 10, 5);
insert into turma (turma_nome, turma_disciplina_id, turma_professor_id) values ('Turma 3', 11, 6);

select * from turma
insert into matricula (matricula_aluno_id, matricula_turma_id) values (3, 8);
insert into matricula (matricula_aluno_id, matricula_turma_id) values (4, 9);
insert into matricula (matricula_aluno_id, matricula_turma_id) values (5, 10);

/*
Mostre o nome dos alunos, disciplinas e dos professores
turma
*/
create or replace view vw_aluno_disciplina_professor as
select 
    a.aluno_nome,
    d.disciplina_nome,
    p.professor_nome
from
    aluno a
    inner join matricula m on a.aluno_id = m.matricula_aluno_id
    inner join turma t on m.matricula_turma_id = t.turma_id
    inner join disciplina d on t.turma_disciplina_id = d.disciplina_id
    inner join professor p on t.turma_professor_id = p.professor_id;
select * from vw_aluno_disciplina_professor;
/*
Mostre o nome das turmas, das disciplinas e dos professores
turma
*/
create or replace view vw_turma_disciplina_professor as
select 
    t.turma_nome,
    d.disciplina_nome,
    p.professor_nome
from
    turma t
    inner join disciplina d on t.turma_disciplina_id = d.disciplina_id
    inner join professor p on t.turma_professor_id = p.professor_id;
select * from vw_turma_disciplina_professor;

/*
Mostre o nome das turmas, dos professores e quantos alunos tem por
turma
*/
create or replace view vw_turma_professor_alunos as
select 
    t.turma_nome,
    p.professor_nome,
    count(m.matricula_aluno_id) as qtd_alunos
from
    turma t
    inner join matricula m on t.turma_id = m.matricula_turma_id
    inner join professor p on t.turma_professor_id = p.professor_id
group by
    t.turma_nome,
    p.professor_nome;
select * from vw_turma_professor_alunos;
