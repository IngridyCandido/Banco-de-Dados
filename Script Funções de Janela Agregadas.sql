CREATE TABLE vendas (
    vendedor VARCHAR(50),
    mes VARCHAR(20),
    valor INT
);

INSERT INTO vendas (vendedor, mes, valor)
VALUES
('Ana', 'Janeiro', 100),
('Ana', 'Fevereiro', 200),
('Carlos', 'Janeiro', 300),
('Carlos', 'Fevereiro', 150),
('Maria', 'Janeiro', 250);

SELECT
    vendedor,
    mes,
    valor,
    SUM(valor) OVER (
        PARTITION BY vendedor
        ORDER BY mes
    ) AS total_acumulado
FROM vendas;

SELECT
    vendedor,
    mes,
    valor,
    AVG(valor) OVER (
        PARTITION BY vendedor
    ) AS media_vendedor
FROM vendas;

SELECT
    vendedor,
    mes,
    COUNT(*) OVER (
        PARTITION BY vendedor
    ) AS quantidade_vendas
FROM vendas;

SELECT
    vendedor,
    mes,
    valor,
    MIN(valor) OVER (
        PARTITION BY vendedor
    ) AS menor_venda
FROM vendas;

SELECT
    vendedor,
    mes,
    valor,
    MAX(valor) OVER (
        PARTITION BY vendedor
    ) AS maior_venda
FROM vendas;

