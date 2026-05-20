CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	cidade VARCHAR(50),
	renda NUMERIC(10,2)
);

INSERT INTO cliente (nome, cidade, renda) values ('Ana', 'Natal', 3500), ('Carlos', 'Recife', 7200), ('Marina', 'Natal', 5100);

select * from cliente;

CREATE VIEW vw_cliente_natal AS
SELECT nome, renda
FROM cliente
WHERE cidade = 'Natal';

SELECT * FROM vw_cliente_natal;

CREATE MATERIALIZED VIEW mv_relatorio AS
SELECT cidade, COUNT(*) AS total
FROM cliente
GROUP BY cidade;

REFRESH MATERIALIZED VIEW mv_relatorio;

SELECT * FROM mv_relatorio;

UPDATE vw_cliente_natal
SET renda = 4000
WHERE nome = 'Ana';

DROP VIEW vw_cliente_natal;

CREATE OR REPLACE VIEW vw_cliente_natal AS
SELECT nome, cidade, renda
FROM cliente
WHERE cidade = 'Natal';

