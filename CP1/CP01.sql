-- 2TDSPJ

-- RM 558843 - Laura de Oliveira Cintra
-- RM 558832 - Maria Eduarda Alves da Paixao
-- RM 554456 - Vinicius Saes de Souza

/*
DROP TABLE cp4_reserva;
DROP TABLE cp4_cliente;
DROP TABLE cp4_veiculo;
DROP TABLE cp4_modelo;
DROP TABLE cp4_marca;
*/

CREATE TABLE cp4_marca (
    cod_marca  INTEGER,
    nome_marca VARCHAR(30),
    PRIMARY KEY ( cod_marca )
);

CREATE TABLE cp4_modelo (
    cod_modelo  INTEGER,
    nome_modelo VARCHAR(30),
    cod_marca   INTEGER,
    PRIMARY KEY ( cod_modelo ),
    FOREIGN KEY ( cod_marca )
        REFERENCES cp4_marca ( cod_marca )
);

CREATE TABLE cp4_veiculo (
    cod_veic        INTEGER,
    placa_veic      VARCHAR(10),
    disponibilidade CHAR(2),
    cod_modelo      INTEGER,
    PRIMARY KEY ( cod_veic ),
    FOREIGN KEY ( cod_modelo )
        REFERENCES cp4_modelo ( cod_modelo )
);

CREATE TABLE cp4_cliente (
    cod_cli   INTEGER,
    nome_cli  VARCHAR(40),
    renda_cli INTEGER,
    idade     INTEGER,
    PRIMARY KEY ( cod_cli )
);

CREATE TABLE cp4_reserva (
    cod_reserva  INTEGER,
    cod_veic     INTEGER,
    cod_cli      INTEGER,
    dt_retirada  DATE,
    dt_devolucao DATE,
    dt_reserva   DATE,
    valor        INTEGER,
    PRIMARY KEY ( cod_reserva ),
    FOREIGN KEY ( cod_veic )
        REFERENCES cp4_veiculo ( cod_veic ),
    FOREIGN KEY ( cod_cli )
        REFERENCES cp4_cliente ( cod_cli )
);

Insert into cp4_marca (cod_marca, nome_marca) values (1, 'Chevrolet'); 
Insert into cp4_marca (cod_marca, nome_marca) values (2, 'Ford'); 
Insert into cp4_marca (cod_marca, nome_marca) values (3, 'Honda'); 
Insert into cp4_marca (cod_marca, nome_marca) values (4, 'Fiat');

Insert into cp4_modelo (cod_modelo, nome_modelo, cod_marca) values (100, 'Celta', 1);
Insert into cp4_modelo (cod_modelo, nome_modelo, cod_marca) values (101, 'Corsa Classic', 1); 
Insert into cp4_modelo (cod_modelo, nome_modelo, cod_marca) values (102, 'Fiesta Sedan', 2); 
Insert into cp4_modelo (cod_modelo, nome_modelo, cod_marca) values (103, 'Fusion', 2);
Insert into cp4_modelo (cod_modelo, nome_modelo, cod_marca) values (104, 'Uno', 4); 
Insert into cp4_modelo (cod_modelo, nome_modelo, cod_marca) values (105, 'Palio', 4);

Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1000, 'HES-2354', 'S', 100);
Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1001, 'HFF-5467', 'S', 100);
Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1002, 'HFG-7686', 'S', 104);
Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1003, 'HFH-1245', 'S', 104);
Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1004, 'HHH-9889', 'S', 103);
Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1005, 'HIH-5556', 'S', 104);
Insert into cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) values (1006, 'HIH-4322', 'S', 104);

Insert into cp4_cliente (cod_cli, nome_cli, renda_cli, idade)	values	(200, 'Joao Silva', 2500, 28);
Insert into cp4_cliente (cod_cli, nome_cli, renda_cli,	idade)	values	(201, 'Ana Souza', 3500, 48);
Insert into cp4_cliente (cod_cli, nome_cli, renda_cli,	idade)	values	(202, 'Maria Ferreira', 3100, 35);									
Insert into cp4_cliente (cod_cli, nome_cli, renda_cli,	idade)	values	(203, 'Antonio Martins', 4200, 30);									
Insert into cp4_cliente (cod_cli, nome_cli, renda_cli,	idade)	values	(204, 'Marcos Garcia', 2000, 29);									

Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (1, 1000, 200, TO_DATE('02/12/2012','DD/MM/YYYY'), TO_DATE('05/12/2012','DD/MM/YYYY'), TO_DATE('01/12/2012','DD/MM/YYYY'), 200);
Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (2, 1000, 201, TO_DATE('02/01/2013','DD/MM/YYYY'), TO_DATE('05/01/2013','DD/MM/YYYY'), TO_DATE('30/12/2012','DD/MM/YYYY'), 200);
Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (3, 1003, 202, TO_DATE('12/02/2013','DD/MM/YYYY'), TO_DATE('14/02/2013','DD/MM/YYYY'), TO_DATE('30/01/2013','DD/MM/YYYY'), 200);
Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (4, 1005, 202, TO_DATE('22/03/2013','DD/MM/YYYY'), TO_DATE('27/03/2013','DD/MM/YYYY'), TO_DATE('01/03/2013','DD/MM/YYYY'), 200);
Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (5, 1004, 203, TO_DATE('25/03/2013','DD/MM/YYYY'), TO_DATE('28/03/2013','DD/MM/YYYY'), TO_DATE('20/03/2013','DD/MM/YYYY'), 200);
Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (6, 1001, 204, TO_DATE('05/04/2013','DD/MM/YYYY'), TO_DATE('12/04/2013','DD/MM/YYYY'), TO_DATE('20/03/2013','DD/MM/YYYY'), 200);
Insert into cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) values (7, 1006, 204, TO_DATE('15/05/2013','DD/MM/YYYY'), TO_DATE('16/05/2013','DD/MM/YYYY'), TO_DATE('26/04/2013','DD/MM/YYYY'), 200);

COMMIT;

SELECT * FROM cp4_MARCA; 
SELECT * FROM cp4_MODELO;
SELECT * FROM cp4_VEICULO; 
SELECT * FROM cp4_CLIENTE; 
SELECT * FROM cp4_RESERVA;

---------------------------------------------------------------------------------

-- Consulta 1 – Liste os modelos de veículos que foram alugados mais de uma vez. Mostre o nome do modelo e a quantidade de vezes que ele foi reservado.

SELECT
    nome_modelo,
    total_reservas
FROM (
    SELECT 
        c.nome_modelo,
        COUNT(a.cod_reserva) AS total_reservas
    FROM cp4_reserva a
    INNER JOIN cp4_veiculo b ON b.cod_veic = a.cod_veic
    INNER JOIN cp4_modelo c ON c.cod_modelo = b.cod_modelo
    GROUP BY c.nome_modelo
)
WHERE total_reservas > 1;

-- Consulta 2 – Liste os nomes dos clientes que já fizeram reservas de veículos da marca Chevrolet. Mostre também o nome do modelo e a data da reserva.

SELECT
    b.nome_cli,
    e.nome_marca,
    d.nome_modelo,
    a.dt_reserva
FROM cp4_reserva a
    INNER JOIN cp4_cliente b ON b.cod_cli = a.cod_cli
    INNER JOIN cp4_veiculo c ON a.cod_veic = c.cod_veic
    INNER JOIN cp4_modelo  d ON c.cod_modelo = d.cod_modelo
    INNER JOIN cp4_marca   e ON d.cod_marca = e.cod_marca
WHERE
    e.nome_marca = 'Chevrolet';

-- Consulta 3 – Liste a marca e o modelo dos veículos que foram reservados por clientes com idade entre 20 e 30 anos. Indicar qual cliente fez a reserva e qual veículo foi alugado.

SELECT
    e.nome_marca,
    d.nome_modelo,
    a.nome_cli,
    c.placa_veic
FROM cp4_cliente a
    LEFT JOIN cp4_reserva b ON a.cod_cli = b.cod_cli
    LEFT JOIN cp4_veiculo c ON b.cod_veic = c.cod_veic
    LEFT JOIN cp4_modelo  d ON c.cod_modelo = d.cod_modelo
    LEFT JOIN cp4_marca   e ON d.cod_marca = e.cod_marca
WHERE
    a.idade BETWEEN 20 AND 30;

-- Consulta 4 - Liste todos os veículos que nunca foram reservados, incluindo para cada um deles: a placa, o modelo e a marca

SELECT
    b.placa_veic,
    c.nome_modelo,
    d.nome_marca
FROM cp4_reserva a
    RIGHT JOIN cp4_veiculo b ON b.cod_veic = a.cod_veic
    INNER JOIN cp4_modelo  c ON c.cod_modelo = b.cod_modelo
    INNER JOIN cp4_marca   d ON d.cod_marca = c.cod_marca
WHERE
    a.cod_reserva IS NULL;

-- Procedure 1 – Crie uma procedure que receba o código de um cliente como parâmetro e exiba o relatório com: nome do cliente, data da reserva, nome do modelo e marca do veículo reservado.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE prc_relatorio_cliente (
    p_cod IN INTEGER
) AS 
BEGIN
    FOR i IN (
        SELECT 
            a.nome_cli,
            b.dt_reserva,
            d.nome_modelo,
            e.nome_marca
        FROM cp4_cliente a
        INNER JOIN cp4_reserva b ON a.cod_cli = b.cod_cli
        INNER JOIN cp4_veiculo c ON b.cod_veic = c.cod_veic
        INNER JOIN cp4_modelo d ON c.cod_modelo = d.cod_modelo
        INNER JOIN cp4_marca e ON d.cod_marca = e.cod_marca
        WHERE a.cod_cli = p_cod
    ) LOOP
        dbms_output.put_line('=== Relatório === ');
        dbms_output.put_line('');
        dbms_output.put_line('Cliente: ' || i.nome_cli);
        dbms_output.put_line('Data Reserva: ' || i.dt_reserva);
        dbms_output.put_line('Modelo: ' || i.nome_modelo);
        dbms_output.put_line('Marca: ' || i.nome_marca);
    END LOOP;
END;

CALL prc_relatorio_cliente(201);

-- Procedure 2 - Crie uma procedure que receba uma data de devolução como parâmetro. Para todas as reservas com data de devolução igual ou anterior à informada, a procedure deve atualizar o campo disponibilidade dos veículos correspondentes para 'S' (disponível).

-- Dados para teste
INSERT INTO cp4_veiculo (cod_veic, placa_veic, disponibilidade, cod_modelo) VALUES (1007, 'ABC-1234', 'N', 104);
INSERT INTO cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) VALUES (10, 1007, 202, TO_DATE('10/03/2013','DD/MM/YYYY'), TO_DATE('30/03/2013','DD/MM/YYYY'), TO_DATE('10/03/2013','DD/MM/YYYY'), 200);

CREATE OR REPLACE PROCEDURE prc_atualiza_disponibilidade (
    p_data IN DATE
) AS 
BEGIN
    UPDATE cp4_veiculo a SET disponibilidade = 'S'
    WHERE a.cod_veic IN (
        SELECT b.cod_veic
        FROM cp4_reserva b
        WHERE b.dt_devolucao <= p_data
    );
END;

CALL prc_atualiza_disponibilidade(TO_DATE('30/03/2013', 'DD/MM/YYYY'));
SELECT * FROM cp4_veiculo;

-- Function 1 - Crie uma função que receba o código de um veículo como parâmetro e retorne o total de dias que ele foi alugado, somando o intervalo entre a data de retirada e devolução de todas as suas reservas.

CREATE OR REPLACE FUNCTION fun_calc_dias_alugado (
    p_cod IN INTEGER
) RETURN INTEGER IS
    v_total INTEGER;
BEGIN
    SELECT SUM(a.dt_devolucao - a.dt_retirada)
    INTO v_total
    FROM cp4_reserva a
    WHERE a.cod_veic = p_cod;

    IF v_total IS NULL THEN
        v_total := 0;
    END IF;

    RETURN v_total;
END;

SELECT fun_calc_dias_alugado(1000) AS total_dias FROM DUAL;

-- Function 2 - Crie uma função que receba o código de uma marca como parâmetro e retorne a quantidade total de reservas feitas para veículos dessa marca

CREATE OR REPLACE FUNCTION func_calc_reservas_marca (
    p_cod IN INTEGER
) RETURN INTEGER IS
    v_total INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM cp4_reserva a
    INNER JOIN cp4_veiculo b ON a.cod_veic = b.cod_veic
    INNER JOIN cp4_modelo c ON b.cod_modelo = c.cod_modelo
    WHERE c.cod_marca = p_cod;

    RETURN v_total;
END;

SELECT func_calc_reservas_marca(1) AS quantidade_reservas FROM DUAL;

-- Trigger 1 - Crie uma trigger que impeça a inserção ou atualização de uma reserva na tabela cp4_reserva caso já exista uma reserva para o mesmo veículo dentro daquele período

CREATE OR REPLACE TRIGGER trg_valida_reserva
BEFORE INSERT OR UPDATE ON cp4_reserva
FOR EACH ROW
DECLARE
    v_total_conflitos INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_total_conflitos
    FROM cp4_reserva
    WHERE cod_veic = :NEW.cod_veic
      AND (
           (:NEW.dt_retirada BETWEEN dt_retirada AND dt_devolucao)
        OR (:NEW.dt_devolucao BETWEEN dt_retirada AND dt_devolucao)
        OR (dt_retirada BETWEEN :NEW.dt_retirada AND :NEW.dt_devolucao)
      )
      -- Evita o conflito ao atualizar a própria reserva
      AND (:NEW.cod_reserva IS NULL OR cod_reserva <> :NEW.cod_reserva);

    IF v_total_conflitos > 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'ERRO: Esse veículo já possui uma reserva dentro desse período!');
    END IF;
END;

-- Criando reserva sem conflito
INSERT INTO cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) VALUES (11, 1003, 200, TO_DATE('01/06/2013','DD/MM/YYYY'), TO_DATE('05/06/2013','DD/MM/YYYY'), TO_DATE('31/05/2013','DD/MM/YYYY'), 250);

-- Tentando inserir outra reserva para o mesmo veículo com datas sobrepostas
-- 03/12/2012 entra dentro do período da reserva existente (cod_veic 1000 já tem reserva de 02/12/2012 a 05/12/2012)
INSERT INTO cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva, valor) VALUES (12, 1000, 203, TO_DATE('03/12/2012','DD/MM/YYYY'), TO_DATE('06/12/2012','DD/MM/YYYY'), TO_DATE('02/12/2012','DD/MM/YYYY'), 300);

-- Trigger 2 - Crie uma trigger que calcule automaticamente o valor da reserva na tabela cp4_reserva sempre que uma reserva for inserida ou atualizada

CREATE OR REPLACE TRIGGER trg_calcula_valor_reserva
BEFORE INSERT OR UPDATE ON cp4_reserva
FOR EACH ROW
DECLARE
    v_diaria NUMBER := 100; -- valor de exemplo
BEGIN
    IF :NEW.dt_devolucao IS NOT NULL AND :NEW.dt_retirada IS NOT NULL THEN
        :NEW.valor := (:NEW.dt_devolucao - :NEW.dt_retirada) * v_diaria;
    END IF;
END;

-- Inserindo uma reserva para calcular automaticamente o valor
INSERT INTO cp4_reserva (cod_reserva, cod_veic, cod_cli, dt_retirada, dt_devolucao, dt_reserva) VALUES (30, 1003, 201, TO_DATE('10/06/2013','DD/MM/YYYY'), TO_DATE('13/06/2013','DD/MM/YYYY'), TO_DATE('09/06/2013','DD/MM/YYYY'));

-- Verificando o valor calculado
-- Nesse caso, o valor fica 300 porque o veículo ficou reservado por 3 dias
SELECT cod_reserva, cod_veic, dt_retirada, dt_devolucao, valor FROM cp4_reserva WHERE cod_reserva = 30;
