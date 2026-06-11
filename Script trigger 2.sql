CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	salario NUMERIC
);

CREATE TABLE log_exclusoes (
    id SERIAL PRIMARY KEY,
    funcionario_id INT,
    nome VARCHAR(100),
    data_exclusao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO funcionarios (nome, salario) VALUES ('paulo', '2000');
INSERT INTO funcionarios (nome, salario) VALUES ('jose', '3000');
INSERT INTO funcionarios (nome, salario) VALUES ('João', '1000');

SELECT * FROM funcionarios

CREATE OR REPLACE FUNCTION validar_salario()
RETURNS TRIGGER AS $$
BEGIN

	IF NEW.salario < 0 THEN
		RAISE EXCEPTION 'O salário não pode ser negativo.';
	END IF;
	
	RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION registrar_exclusao()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_exclusoes(funcionario_id, nome)
    VALUES (OLD.id, OLD.nome);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_salario
BEFORE INSERT OR UPDATE
ON funcionarios
FOR EACH ROW
EXECUTE FUNCTION validar_salario();

CREATE TRIGGER trg_registrar_exclusao
AFTER DELETE
ON funcionarios
FOR EACH ROW
EXECUTE FUNCTION registrar_exclusao();

SELECT trigger_name
FROM information_schema.triggers;

UPDATE funcionarios
SET salario = '-500'
WHERE id = 2;

UPDATE funcionarios
SET salario = 2500
WHERE id = 2;

DROP FUNCTION registrar_exclusao();

DELETE FROM funcionarios WHERE id = 1;

SELECT trigger_name, event_manipulation
FROM information_schema.triggers
WHERE event_object_table = 'funcionarios';