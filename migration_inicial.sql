create table funcionario (
    nome varchar (255),
	setor varchar(255),
	ano_contratacao integer,
	salario double precision
);

insert into funcionario values ('Ana', 'Recepção', 2000, 900);
insert into funcionario values ('Pedro', 'Administração', 1999, 2000);
insert into funcionario values ('Maria', 'Administração', 2001, 1500);
insert into funcionario values ('Tiago', 'Linha de Produção', 2000, 1700);

/* Funcionarios por setor usando groupby */
select setor, count(nome) from funcionario group by setor;

/* Funcionarios por setor a qual possuem o mesmo nome */
select setor, 
    count(nome) 
    from funcionario 
    group by setor 
    having count(nome) > 1;

/* Funcionarios por ano  */
select ano_contratacao, 
    count(ano_contratacao) 
    from funcionario 
    group by ano_contratacao;  

/* Media salarial por setor */
select setor, 
    avg(salario) 
    from funcionario 
    group by setor;

/* Media salarial por setor > 1000 */
select setor, 
    avg(salario) 
    from funcionario 
    group by setor
    having avg(salario) > 1000