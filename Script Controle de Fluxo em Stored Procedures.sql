CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10,2)
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INTEGER
);

INSERT INTO produtos (nome, preco) VALUES
('Notebook', 3500.00),
('Mouse Gamer', 150.00),
('Teclado Mecânico', 450.00),
('Monitor', 1200.00);

INSERT INTO alunos (nome, idade) VALUES
('João', 18),
('Maria', 20),
('Pedro', 17);

SELECT * FROM produtos;

SELECT * FROM alunos;

/*====================================================
  PROCEDURE COM PARÂMETRO IN
====================================================*/

CREATE OR REPLACE PROCEDURE aumentar_preco(
    IN percentual NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

    UPDATE produtos
    SET preco = preco * (1 + percentual / 100);

END;
$$;

CALL aumentar_preco(10);

SELECT * FROM produtos;


/*====================================================
  PROCEDURE COM PARÂMETRO OUT
====================================================*/

CREATE OR REPLACE PROCEDURE contar_alunos(
    OUT total INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN

    SELECT COUNT(*)
    INTO total
    FROM alunos;

END;
$$;


CALL contar_alunos(NULL);


/*====================================================
  PROCEDURE COM PARÂMETRO INOUT
====================================================*/

CREATE OR REPLACE PROCEDURE dobrar_numero(
    INOUT valor INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN

    valor := valor * 2;

END;
$$;

CALL dobrar_numero(10);


/*====================================================
  PROCEDURE COM MÚLTIPLOS PARÂMETROS
====================================================*/


CREATE OR REPLACE PROCEDURE cadastrar_aluno(
    IN p_nome VARCHAR(100),
    IN p_idade INTEGER,
    OUT mensagem TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO alunos(nome, idade)
    VALUES (p_nome, p_idade);

    mensagem := 'Aluno cadastrado com sucesso!';

END;
$$;


CALL cadastrar_aluno('Carlos', 22, NULL);

SELECT * FROM alunos;


/*====================================================
  ESTRUTURA IF
====================================================*/

CREATE OR REPLACE PROCEDURE verificar_preco(
    p_preco NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

    IF p_preco > 100 THEN
        RAISE NOTICE 'Produto caro';
    END IF;

END;
$$;


CALL verificar_preco(150);


/*====================================================
  ESTRUTURA IF ... ELSE
====================================================*/

CREATE OR REPLACE PROCEDURE verificar_idade(
    p_idade INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN

    IF p_idade >= 18 THEN
        RAISE NOTICE 'Maior de idade';
    ELSE
        RAISE NOTICE 'Menor de idade';
    END IF;

END;
$$;


CALL verificar_idade(20);
CALL verificar_idade(15);


/*====================================================
  ESTRUTURA CASE
====================================================*/


CREATE OR REPLACE PROCEDURE dia_semana(
    p_dia INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN

    CASE p_dia
        WHEN 1 THEN
            RAISE NOTICE 'Domingo';

        WHEN 2 THEN
            RAISE NOTICE 'Segunda-feira';

        WHEN 3 THEN
            RAISE NOTICE 'Terça-feira';

        ELSE
            RAISE NOTICE 'Dia inválido';
    END CASE;

END;
$$;


CALL dia_semana(1);
CALL dia_semana(2);
CALL dia_semana(5);


/*====================================================
  LOOP
====================================================*/


CREATE OR REPLACE PROCEDURE contar_loop()
LANGUAGE plpgsql
AS $$
DECLARE
    contador INTEGER := 1;
BEGIN

    LOOP

        RAISE NOTICE 'Contador: %', contador;

        contador := contador + 1;

        EXIT WHEN contador > 5;

    END LOOP;

END;
$$;


CALL contar_loop();


/*====================================================
  WHILE
====================================================*/


CREATE OR REPLACE PROCEDURE contar_while()
LANGUAGE plpgsql
AS $$
DECLARE
    contador INTEGER := 1;
BEGIN

    WHILE contador <= 5 LOOP

        RAISE NOTICE 'Valor: %', contador;

        contador := contador + 1;

    END LOOP;

END;
$$;

CALL contar_while();


/*====================================================
  FOR
====================================================*/


CREATE OR REPLACE PROCEDURE contar_for()
LANGUAGE plpgsql
AS $$
DECLARE
    i INTEGER;
BEGIN

    FOR i IN 1..5 LOOP

        RAISE NOTICE 'Número: %', i;

    END LOOP;

END;
$$;

CALL contar_for();

SELECT * FROM produtos;

SELECT * FROM alunos;
