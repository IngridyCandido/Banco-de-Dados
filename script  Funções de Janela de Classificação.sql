CREATE TABLE ranking (
    jogador VARCHAR(50),
    pontos INT
);

INSERT INTO ranking (jogador, pontos)
VALUES
('Ana', 100),
('Carlos', 90),
('João', 90),
('Maria', 70),
('Pedro', 120);

SELECT
    jogador,
    pontos,
    ROW_NUMBER() OVER (
        ORDER BY pontos DESC
    ) AS numero
FROM ranking;

SELECT
    jogador,
    pontos,
    RANK() OVER (
        ORDER BY pontos DESC
    ) AS ranking
FROM ranking;

SELECT
    jogador,
    pontos,
    DENSE_RANK() OVER (
        ORDER BY pontos DESC
    ) AS ranking_denso
FROM ranking;

