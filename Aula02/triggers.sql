-- === Triggers ===

-- CRIAÇÃO DAS TABELAS

/*
DROP TABLE avisos_estoque;
DROP TABLE vendas;
DROP TABLE produtos;
*/

-- Tabela de produtos
CREATE TABLE produtos (
    id_produto NUMBER PRIMARY KEY,
    nome       VARCHAR2(100),
    estoque    NUMBER,
    estoque_minimo NUMBER
);

-- Tabela de vendas
CREATE TABLE vendas (
    id_venda   NUMBER PRIMARY KEY,
    id_produto NUMBER,
    quantidade NUMBER,
    data_venda DATE
);

-- Tabela de avisos de estoque
CREATE TABLE avisos_estoque (
    id_aviso   NUMBER PRIMARY KEY,
    id_produto NUMBER,
    mensagem   VARCHAR2(200),
    data_aviso DATE
);

-- Criação da sequência
CREATE SEQUENCE avisos_seq
    START WITH 1       -- Começa pelo número 1
    INCREMENT BY 1     -- Aumenta de 1 em 1
    NOCACHE            -- Não guarda valores em cache (mais seguro, mas um pouco mais lento)
    NOCYCLE;           -- Não reinicia quando atingir o valor máximo

-- EXERCÍCIOS

-- Após cada venda (AFTER INSERT ON vendas), diminui a quantidade do produto no estoque
-- Verifica se o estoque atual está abaixo do estoque mínimo definido
-- Se estiver baixo, insere uma mensagem de alerta na tabela avisos_estoque

-- Trigger para atualizar e monitorar estoque
-- essa trigger roda depois de inserir algo na tabela de vendas 
-- depois desse novo insert pego os valores :NEW de quantidade e subtraio do valor antigo do estoque
-- ou seja, essa trigger serve para atualizar o estoque após uma venda
CREATE OR REPLACE TRIGGER trg_controle_estoque
AFTER INSERT ON vendas  -- quando a trigger vai rodar, o que ela esta escutando
FOR EACH ROW
DECLARE
    v_estoque_atual NUMBER;
    v_estoque_minimo NUMBER;
BEGIN
    -- Busca o estoque atual antes de fazer a venda
    SELECT estoque INTO v_estoque_atual
    FROM produtos
    WHERE id_produto = :NEW.id_produto;

    -- Busca o estoque mínimo do produto
    SELECT estoque_minimo INTO v_estoque_minimo
    FROM produtos
    WHERE id_produto = :NEW.id_produto;

    -- Se o estoque após a venda for maior ou igual ao estoque mínimo, atualiza o estoque
    IF v_estoque_atual - :NEW.quantidade >= v_estoque_minimo THEN
        -- Atualiza o estoque do produto
        UPDATE produtos
        SET estoque = estoque - :NEW.quantidade
        WHERE id_produto = :NEW.id_produto;
    ELSE
        -- Caso o estoque após a venda fique abaixo do mínimo, gera um alerta
        INSERT INTO avisos_estoque (id_aviso, id_produto, mensagem, data_aviso)
        VALUES (avisos_seq.NEXTVAL, :NEW.id_produto,
                'Estoque baixo! Restam apenas ' || (v_estoque_atual - :NEW.quantidade) || ' unidades.',
                SYSDATE);
    END IF;
END;

--- Teste
INSERT INTO produtos VALUES (1, 'Teclado Mecânico', 10, 3);
INSERT INTO produtos VALUES (2, 'Mouse Gamer', 5, 2);

-- Venda que não dispara alerta
INSERT INTO vendas VALUES (1, 1, 2, SYSDATE);

-- Venda que dispara alerta
INSERT INTO vendas VALUES (2, 2, 4, SYSDATE);

-- Consultando avisos geradosa
SELECT * FROM avisos_estoque;
SELECT * FROM produtos;