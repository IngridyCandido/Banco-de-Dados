create table funcionarios (
	cpf serial primary key,
	nome text,
	salario real,
	departamento_id integer references departamento (departamento_id)
);

create table departamento (
	departamento_id serial primary key,
	nome text
);

insert into funcionarios (cpf, nome, salario, departamento_id) values (1, 'José', 10000, 1);
insert into funcionarios (cpf, nome, salario, departamento_id) values (4, 'Paulo', 8000, 1);
insert into funcionarios (cpf, nome, salario, departamento_id) values (7, 'Ellen', 9000, 3);
insert into funcionarios (cpf, nome, salario, departamento_id) values (3, 'Ingridy', 15000, 2);
insert into funcionarios (cpf, nome, salario, departamento_id) values (6, 'Nicole', 11000, 1);

insert into departamento (departamento_id, nome) values (1, 'TI');
insert into departamento (departamento_id, nome) values (2, 'Vendas');
insert into departamento (departamento_id, nome) values (3, 'Administração');

select * from funcionarios;

select * from departamento;

SELECT nome, salario
FROM funcionarios
WHERE salario > (
SELECT AVG(salario)
FROM funcionarios
);

SELECT nome
FROM funcionarios
WHERE departamento_id = (
SELECT departamento_id
FROM departamento
WHERE nome = 'TI'
);

SELECT nome
FROM funcionarios
WHERE departamento_id IN (
SELECT departamento_id FROM departamento
);