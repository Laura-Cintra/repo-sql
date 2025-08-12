/*
DROP TABLE tbl_func_proj CASCADE CONSTRAINT;
DROP TABLE tbl_projeto CASCADE CONSTRAINT;
DROP TABLE tbl_funcionario CASCADE CONSTRAINT;
DROP TABLE tbl_departamento CASCADE CONSTRAINT;
*/

CREATE TABLE tbl_departamento (
    cod_depto  INTEGER,
    nome_depto VARCHAR(20) NOT NULL,
    PRIMARY KEY ( cod_depto )
);

CREATE TABLE tbl_funcionario (
    cod_func  INTEGER,
    nome_func VARCHAR(20) NOT NULL,
    salario   INTEGER NOT NULL,
    cod_depto INTEGER NOT NULL,
    PRIMARY KEY ( cod_func ),
    FOREIGN KEY ( cod_depto )
        REFERENCES tbl_departamento ( cod_depto )
);

CREATE TABLE tbl_projeto (
    cod_proj  INTEGER,
    nome_proj VARCHAR(20) NOT NULL,
    duracao   INTEGER NOT NULL,
    PRIMARY KEY ( cod_proj )
);

CREATE TABLE tbl_func_proj (
    cod_func   INTEGER,
    cod_proj   INTEGER,
    horas_trab INTEGER,
    PRIMARY KEY ( cod_func,
                  cod_proj ),
    FOREIGN KEY ( cod_func )
        REFERENCES tbl_funcionario ( cod_func ),
    FOREIGN KEY ( cod_proj )
        REFERENCES tbl_projeto ( cod_proj )
);

INSERT INTO tbl_departamento (cod_depto, nome_depto) VALUES (1, 'Marketing');
INSERT INTO tbl_departamento (cod_depto, nome_depto) VALUES (2, 'Vendas');
INSERT INTO tbl_departamento (cod_depto, nome_depto) VALUES (3, 'Dados');
INSERT INTO tbl_departamento (cod_depto, nome_depto) VALUES (4, 'Pesquisa');

INSERT INTO tbl_funcionario (cod_func, nome_func, salario, cod_depto) VALUES (101, 'Joao da Silva Santos', 2000, 2);
INSERT INTO tbl_funcionario (cod_func, nome_func, salario, cod_depto) VALUES (102, 'Mario Souza', 1500, 1);
INSERT INTO tbl_funcionario (cod_func, nome_func, salario, cod_depto) VALUES (103, 'Sergio Silva Santos', 2400, 2);
INSERT INTO tbl_funcionario (cod_func, nome_func, salario, cod_depto) VALUES (104, 'Maria Castro', 1200, 1);
INSERT INTO tbl_funcionario (cod_func, nome_func, salario, cod_depto) VALUES (105, 'Marcio Silva Santana', 1400, 4);

INSERT INTO tbl_projeto (cod_proj, nome_proj, duracao) VALUES (1001, 'SistemaA', 2);
INSERT INTO tbl_projeto (cod_proj, nome_proj, duracao) VALUES (1002, 'SistemaB', 6);
INSERT INTO tbl_projeto (cod_proj, nome_proj, duracao) VALUES (1003, 'SistemaX', 4);

INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (101, 1001, 24);
INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (101, 1002, 160);
INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (102, 1001, 56);
INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (102, 1003, 45);
INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (103, 1001, 86);
INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (103, 1003, 64);
INSERT INTO tbl_func_proj (cod_func, cod_proj, horas_trab) VALUES (104, 1001, 46);

----------------------------------------------------------------------------------

-- Exemplo procedure
CREATE OR REPLACE PROCEDURE aumento_salario IS
BEGIN
    UPDATE tbl_funcionario
    SET salario = salario * 1.1;
END aumento_salario;

CALL aumento_salario();
SELECT * FROM tbl_funcionario;

-- Exemplo function
CREATE OR REPLACE FUNCTION total_emp_depto (
    vdepto IN tbl_funcionario.cod_depto%TYPE
) RETURN NUMBER IS
    emptotal NUMBER;
BEGIN
    SELECT COUNT(*) INTO emptotal FROM tbl_funcionario
    WHERE(cod_depto = vdepto);
    
    RETURN emptotal;
END total_emp_depto;

SELECT total_emp_depto(1)
FROM DUAL;