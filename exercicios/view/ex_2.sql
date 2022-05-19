
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
