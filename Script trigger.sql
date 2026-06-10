CREATE TABLE produtos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	preco NUMERIC(10,2)
);

ALTER TABLE produtos ADD COLUMN ultima_atualizacao TIMESTAMP;

CREATE OR REPLACE FUNCTION atualizar_data()
RETURNS TRIGGER AS $$
BEGIN
	NEW.ultima_atualizacao = CURRENT_TIMESTAMP;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualizar_data
BEFORE UPDATE
ON produtos
FOR EACH ROW
EXECUTE FUNCTION atualizar_data();

insert into produtos (nome, preco) values('Processador', '3500');
insert into produtos (nome, preco) values('HD', '1500');
insert into produtos (nome, preco) values('Monitor', '800');

select * from produtos

UPDATE produtos
SET preco = 500
WHERE id = 3;

CREATE OR REPLACE FUNCTION verificar_alteracao_preco()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.preco <> OLD.preco THEN
        RAISE NOTICE
            'Produto ID % (%): preço alterado de R$ % para R$ %',
            OLD.id,
            OLD.nome,
            OLD.preco,
            NEW.preco;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_verificar_alteracao_preco
BEFORE UPDATE
ON produtos
FOR EACH ROW
EXECUTE FUNCTION verificar_alteracao_preco();

UPDATE produtos
SET preco = preco * 1.10;
