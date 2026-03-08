CREATE TABLE VEICULOS
(
placa CHAR(8),
ano NUMBER(4),
km NUMBER(6),
marca VARCHAR(50),
modelo VARCHAR(50)
);

INSERT INTO VEICULOS
VALUES ('IJK-1212', 2022, 0, 'Chevrolet', 'Onix');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IJM-1556', 2015, 72045, 'Volkswagen', 'Gol');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IJA-1556', 2019, 72045, 'Volkswagen', 'Polo');

INSERT INTO VEICULOS
VALUES ('IJK-1218', 1999, 259450, 'Chevrolet', 'Corsa');

INSERT INTO VEICULOS
VALUES ('IJK-1912', 1999, 259450, 'Chevrolet', 'Kadett');

INSERT INTO VEICULOS
VALUES ('IJK-8594', 2011, 107000, 'Ford', 'Focus');

SELECT *
FROM VEICULOS;

SELECT placa, modelo, ano
FROM VEICULOS;

SELECT placa, ano, modelo
FROM VEICULOS
WHERE ano < 2022;

UPDATE VEICULOS
SET modelo = 'Cruze'
WHERE placa = 'IJK-1212';

UPDATE VEICULOS
SET km = km + 100
WHERE ano >=2015
AND ano <=2021;

DELETE FROM VEICULOS
WHERE placa = 'IJM-1556';

DELETE FROM VEICULOS
WHERE (marca = 'Chevrolet') AND (km > 50000);

SELECT placa, km
FROM VEICULOS
ORDER BY km;

SELECT placa, km
FROM VEICULOS
ORDER BY km;

SELECT marca, modelo
FROM VEICULOS
ORDER BY marca DESC, modelo ASC;

SELECT COUNT(*)
FROM VEICULOS;

SELECT DISTINCT marca
FROM VEICULOS;

CREATE TABLE PESSOAS
(
cpf VARCHAR(20) NOT NULL,
nome VARCHAR(150) NOT NULL,
idade NUMBER(3) NULL,
endereco VARCHAR(150)
);

INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('32809', 'Maria', 25, 'Rua A, 20');

INSERT INTO PESSOAS (idade, endereco, cpf, nome)
VALUES (25, 'Rua A, 20', '30599', 'Pedro');

INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('29385', 'Carlos', NULL, NULL);

INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('39582', 'Alice', 80, NULL);

INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('78838', 'Antonio', NULL, 'Rua B, 80');

INSERT INTO PESSOAS (cpf, nome)
VALUES ('90038', 'Ana Paula');

INSERT INTO PESSOAS (cpf, nome, idade)
VALUES ('23487', 'Patricia', 18);

INSERT INTO PESSOAS (cpf, nome, endereco)
VALUES ('23363', 'Jose', 'Rua C, 50');

SELECT *
FROM PESSOAS
WHERE idade IS NULL;

SELECT *
FROM PESSOAS
WHERE endereco IS NOT NULL;

SELECT *
FROM PESSOAS
WHERE nome LIKE 'A%';

SELECT *
FROM PESSOAS
WHERE nome LIKE 'Ana%';

SELECT *
FROM PESSOAS
WHERE nome LIKE '%Silva';

SELECT *
FROM PESSOAS
WHERE nome LIKE '%Carlos%';

SELECT *
FROM PESSOAS
WHERE nome LIKE 'Mari_ da Silva';

SELECT *
FROM PESSOAS
WHERE idade IN (25, 30, 40);

ALTER TABLE PESSOAS
DROP COLUMN idade;

ALTER TABLE PESSOAS
ADD sexo CHAR(1);

INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES ('29048', 'Roberto', '03-FEB-1980', 'Rua D, 80');

INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES ('29048', 'Roberto', DATE '1980-02-03', 'Rua D, 80');

SELECT TO_CHAR(SYSDATE, 'MONTH, DD, YYYY HH24:MI:SS')
FROM DUAL;

SELECT nome, TO_CHAR(datanasc, 'MONTH, DD, YYYY')
FROM PESSOAS;

INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES (
'29920',
'Beto',
TO_DATE('25-FEB-1979 21:36:28','DD-MON-YYYY HH24:MI:SS'),
'Rua E, 80'
);

SELECT SYSDATE + 1
FROM DUAL;

CREATE TABLE ALUNOS
(
nroMatricula VARCHAR(10) NOT NULL,
cpf VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
nome VARCHAR(150) NOT NULL,
anoIngresso NUMBER(4) NOT NULL,
endereco VARCHAR(150) NULL,
sexo CHAR(1) NOT NULL,

CONSTRAINT PK_ALUNOS PRIMARY KEY (nroMatricula),
CONSTRAINT AK1_ALUNOS UNIQUE (cpf),
CONSTRAINT AK2_ALUNOS UNIQUE (email)
);

ALTER TABLE ALUNOS
ADD CONSTRAINT CK_AnoIngr CHECK (anoIngresso > 2000);

ALTER TABLE ALUNOS
ADD CONSTRAINT CK_sexo CHECK (sexo IN ('M', 'F'));

CREATE TABLE ESTADOS
(
uf CHAR(2) NOT NULL,
nome VARCHAR2(40) NOT NULL,
regiao CHAR(2) NOT NULL,
CONSTRAINT PK_ESTADOS PRIMARY KEY (uf)
);

CREATE TABLE CIDADES
(
cod_cidade NUMBER(4) NOT NULL,
nome VARCHAR2(60) NOT NULL,
uf CHAR(2) NOT NULL,
CONSTRAINT PK_CIDADES PRIMARY KEY (cod_cidade)
);

ALTER TABLE CIDADES
ADD
(
CONSTRAINT FK_EST_CID
FOREIGN KEY (uf)
REFERENCES ESTADOS (uf)
);

CREATE TABLE MEDICOS 
(
crm char(6), 
nome varchar(100), 
especialidade varchar(50)
);

CREATE TABLE PACIENTES
(
cpf char(11), 
nome varchar(100), 
sexo char(1)
);

ALTER TABLE MEDICOS 
ADD CONSTRAINT PK_MEDICOS PRIMARY KEY(crm);

ALTER TABLE PACIENTES 
ADD CONSTRAINT PK_PACIENTES PRIMARY KEY(cpf);

CREATE TABLE MEDICOSPACIENTES
(
cpf char(11), 
crm char(6),
CONSTRAINT FK_MED_MEDPAC
FOREIGN KEY (crm)
REFERENCES MEDICOS (crm),
CONSTRAINT FK_PAC_MEDPAC
FOREIGN KEY (cpf)
REFERENCES PACIENTES (cpf)
);

SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST INNER JOIN CIDADES CID
ON EST.uf = CID.uf;

SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST LEFT OUTER JOIN CIDADES CID
ON EST.uf = CID.uf;

SELECT AU.nome, PROD.titulo
FROM AUTORES AU
JOIN AUTORES_PRODUTOS AP
ON (AU.cod_autor = AP.cod_autor)
JOIN PRODUTOS PROD
ON (AP.cod_produto = PROD.cod_produto);

SELECT função_agregada
FROM nome_da_tabela
[...]

COUNT (*)
COUNT ([ALL|DISTINCT] nome_da_coluna)
SUM ([ALL|DISTINCT] nome_da_coluna)
AVG ([ALL|DISTINCT] nome_da_coluna)
MAX ([ALL|DISTINCT] nome_da_coluna)
MIN ([ALL|DISTINCT] nome_da_coluna)
STDDEV ([ALL|DISTINCT] nome_da_coluna)
VARIANCE ([ALL|DISTINCT] nome_da_coluna) 

SELECT AVG(preco) MEDIA FROM PRODUTOS;
SELECT AVG(NVL(preco,0)) MEDIA FROM PRODUTOS;
SELECT MAX(preco) FROM PRODUTOS;
SELECT COUNT(*) NUM_CLIENTES FROM CLIENTES;
SELECT COUNT(ddd) FROM TELEFONES; 

SELECT nome_da_coluna [, ...], função_agregada [, ...]
FROM nome_da_tabela [, ...]
GROUP BY [ALL] nome
ORDER BY colunas

CREATE TABLE PRODS
(
codigo NUMERIC(3) NOT NULL,
nome VARCHAR(50) NOT NULL,
preco NUMERIC (5,2) NOT NULL,
tipo CHAR(1) NULL, -- [S]uprimento, [C]omponente, [P]eriférico
CONSTRAINT PK1 PRIMARY KEY (codigo)
);
INSERT INTO PRODS VALUES( 10, 'HD' ,200 ,'C');
INSERT INTO PRODS VALUES( 11, 'Memoria' ,250 ,'C');
INSERT INTO PRODS VALUES( 12, 'Impressora' ,680 ,'P');
INSERT INTO PRODS VALUES( 13, 'Processador' ,600 ,'C');
INSERT INTO PRODS VALUES( 14, 'DVD-RW' ,2 ,'S');
INSERT INTO PRODS VALUES( 15, 'Papel A4' ,19 ,'S'); 
INSERT INTO PRODS VALUES( 16, 'Scanner' ,199 ,'P'); 

ALTER TABLE PRODS ADD (usuario NUMBER(1) NULL);
UPDATE PRODS
SET usuario = 1
WHERE codigo IN (10,12,13,14);
UPDATE PRODS
SET usuario = 2
WHERE usuario IS NULL;
SELECT tipo, usuario, AVG(preco)
FROM PRODS
GROUP BY tipo, usuario
ORDER BY tipo, usuario;
UPDATE PRODS
SET usuario = 2
WHERE codigo = 14;

UPDATE PRODS
SET usuario = NULL
WHERE codigo = 13;

SELECT tipo, usuario, AVG(preco)
FROM PRODS
GROUP BY tipo, usuario
ORDER BY tipo, usuario;

SELECT nome_da_coluna [, ...], função_agregada [, ...]
FROM nome_da_tabela [, ...]
GROUP BY [ALL] nome_da_coluna [,...]
HAVING condições
ORDER BY colunas

SELECT CID.nome, COUNT(*) QTD
FROM CIDADES CID JOIN ENDERECOS END
ON CID.cod_cidade = END.cod_cidade
GROUP BY CID.nome
HAVING COUNT(*) > 10;

SELECT preco
FROM produtos
WHERE cod_produto = 9

SELECT titulo
FROM produtos
WHERE preco > 179

SELECT titulo
FROM PRODUTOS
WHERE preco >
(SELECT preco
FROM PRODUTOS
WHERE cod_produto = 9)

SELECT titulo
FROM PRODUTOS
WHERE importado = ‘N’ AND preco >
(SELECT MAX(preco)
FROM PRODUTOS
WHERE importado = ‘S’); 

SELECT ano_lançamento, AVG(preco)
FROM PRODUTOS
GROUP BY ano_lancamento
HAVING AVG(preco) >
(SELECT AVG(preco)
FROM PRODUTOS
WHERE ano_lancamento = trunc(sysdate, ‘YYYY’); 

INSERT INTO PRODS (codigo, nome, preco, tipo)
SELECT
cod_produto
SUBSTR(titulo, 1, 15),
preco,
FROM produtos
WHERE
importado = 'N’
AND titulo LIKE 'A%’
AND cod_produto > 2;

UPDATE PRODUTOS
SET preco = preco - (10/100 * preco)
WHERE cod_produto IN
( SELECT cod_produto
FROM PRODUTOS
WHERE prazo_entrega > 30 );

DELETE FROM PRODS
WHERE codigo IN
( SELECT cod_produto
FROM PRODUTOS
WHERE
importado = 'N’
AND titulo LIKE 'A%’
AND cod_produto > 100 );

SELECT nome, uf FROM CIDADES;

SELECT nome FROM AUTORES;

SELECT Count(*) FROM AUTORES;

SELECT nome FROM AUTORES ORDER BY nome;

SELECT cod_autor, nome, rowid FROM Autores;

CREATE INDEX <nome do índice> ON <nome da tabela> (<nome da coluna>);

CREATE INDEX idx_autores_nome ON AUTORES (nome);

CREATE SEQUENCE seq_titulacoes START WITH 6 ;

SELECT seq_titulações.nextval FROM DUAL; -- rodar várias vezes para observar a variação

INSERT INTO TITULACOES ( cod_titulação, titulo) VALUES (seq_titulações.nextval,

SELECT seq_titulações.currval FROM DUAL; 

CREATE TABLE TITULACOES
(
cod_titulacao NUMBER(4) DEFAULT seq_titulacoes.nextval NOT NULL,
titulo VARCHAR (20) NOT NULL,
CONSTRAINT pk_titulacoes PRIMARY KEY (cod_titulacao)
) ;

INSERT INTO TITULACOES ( titulo) VALUES (‘Bacharel’ );
INSERT INTO TITULACOES ( titulo) VALUES (‘Especialista’ );
INSERT INTO TITULACOES ( titulo) VALUES (‘Mestre’ );




