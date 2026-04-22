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

create table clientes (
	cliente_id serial primary key,
	nome text
);

create table pedidos (
	pedido_id serial primary key,
	cliente_id integer references clientes (cliente_id),
	data_pedido text
);

create table funcionarios_backup (
	nome text,
	salario int
);

insert into funcionarios (cpf, nome, salario, departamento_id) values (13, 'José', 3000, 1);
insert into funcionarios (cpf, nome, salario, departamento_id) values (45, 'Paulo', 8000, 1);
insert into funcionarios (cpf, nome, salario, departamento_id) values (47, 'Ellen', 9000, 3);
insert into funcionarios (cpf, nome, salario, departamento_id) values (73, 'Ingridy', 5000, 2);
insert into funcionarios (cpf, nome, salario, departamento_id) values (36, 'Nicole', 2000, 1);

insert into departamento (departamento_id, nome) values (19, 'TI');
insert into departamento (departamento_id, nome) values (62, 'Vendas');
insert into departamento (departamento_id, nome) values (43, 'Administração');

insert into clientes (cliente_id, nome) values (98, 'João');
insert into clientes (cliente_id, nome) values (63, 'Maria');
insert into clientes (cliente_id, nome) values (17, 'Raphael');

insert into pedidos (pedido_id, cliente_id, data_pedido) values (347, 98, '15/04/2026');


select * from funcionarios;

select * from departamento;

select * from clientes;

select * from pedidos;

select * from funcionarios_backup;

INSERT INTO funcionarios_backup (nome, salario)
SELECT nome, salario
FROM funcionarios
WHERE salario > 5000;

INSERT INTO pedidos (cliente_id, data_pedido)
VALUES (
(SELECT cliente_id FROM clientes WHERE nome = 'João'),
NOW()
);

SELECT e.nome, e.salario
FROM funcionarios e
WHERE e.salario > (
SELECT AVG(e2.salario)
FROM funcionarios e2
WHERE e2.departamento_id = e.departamento_id
);