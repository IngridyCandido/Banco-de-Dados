CREATE TABLE alunos2 (
id SERIAL PRIMARY KEY,
nome VARCHAR(100),
nota NUMERIC(4,2)
);

CREATE OR REPLACE PROCEDURE inserir_aluno(
	p_nome VARCHAR,
	p_nota NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO alunos2(nome, nota)
	VALUES (p_nome, p_nota);

END;
$$;

CALL inserir_aluno('Carlos', 8.5);

CALL inserir_aluno('Maria', 9.0);

select * from alunos2;