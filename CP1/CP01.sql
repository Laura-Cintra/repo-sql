-- RM 558843
-- Laura de Oliveira Cintra

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

-- Consulta 1: Média de renda dos clientes que reservaram veículos do modelo Celta
-- Consulta 2: Consultar os clientes que reservaram veículos da marca Chevrolet
-- Consulta 3: Liste a marca e modelo dos veículos reservados por clientes com idade entre 30 e 40 anos
-- Consulta 4: Listar todos os veículos que não têm nenhuma reserva associada, mostrando sua marca e modelo

-- Procedure 1: Relatório de reserva feitas em 2012 (Nome do cliente, data da reserva, marca e modelo do veículo reservado)