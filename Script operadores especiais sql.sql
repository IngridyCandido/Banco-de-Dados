create table alunos (
	id serial primary key,
	nome text,
	idade int,
	telefone int,
	curso_id  integer references curso (curso_id)
);

create table curso (
	curso_id serial primary key,
	nome_curso text
);

insert into alunos (id, nome, idade, telefone, curso_id) values (1, 'Ingridy', 25, 99990000, 3);
insert into alunos (id, nome, idade, telefone, curso_id) values (2, 'Jose', 20, 99991111, 1);
insert into alunos (id, nome, idade, telefone, curso_id) values (3, 'Paulo', 24, 99992222, 2);

insert into curso (curso_id, nome_curso) values (1, 'ADS');
insert into curso (curso_id, nome_curso) values (2, 'SI');
insert into curso (curso_id, nome_curso) values (3, 'Engenharia');

select * from curso;

select * from alunos;

SELECT * FROM alunos WHERE idade BETWEEN 18 AND 25;

SELECT * FROM alunos WHERE nome IN ('Jose', 'Ingridy', 'Paulo');

SELECT * FROM alunos WHERE nome NOT IN ('Jose', 'Paulo');

SELECT * FROM alunos WHERE telefone IS NULL;

SELECT * FROM alunos WHERE telefone IS NOT NULL;

SELECT nome FROM alunos c
WHERE EXISTS (
SELECT 1
FROM curso p
WHERE c.id = p.curso_id
);

