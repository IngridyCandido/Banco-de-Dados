CREATE TABLE vendas (
    id INT,
    vendedor VARCHAR(50),
    mes VARCHAR(20),
    valor DECIMAL(10,2)
);

INSERT INTO vendas (id, vendedor, mes, valor)
VALUES
(1, 'Ana', 'Janeiro', 1000.00),
(2, 'Ana', 'Fevereiro', 1500.00),
(3, 'Ana', 'Março', 1200.00),
(4, 'Carlos', 'Janeiro', 2000.00),
(5, 'Carlos', 'Fevereiro', 2500.00);

SELECT
    vendedor,
    mes,
    valor,
    LAG(valor) OVER (
        PARTITION BY vendedor
        ORDER BY id
    ) AS valor_anterior
FROM vendas;

SELECT
    vendedor,
    mes,
    valor,
    LEAD(valor) OVER (
        PARTITION BY vendedor
        ORDER BY id
    ) AS proximo_valor
FROM vendas;

SELECT
    vendedor,
    mes,
    valor,
    FIRST_VALUE(valor) OVER (
        PARTITION BY vendedor
        ORDER BY id
    ) AS primeiro_valor
FROM vendas;

SELECT
    vendedor,
    mes,
    valor,
    LAST_VALUE(valor) OVER (
        PARTITION BY vendedor
        ORDER BY id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS ultimo_valor
FROM vendas;

