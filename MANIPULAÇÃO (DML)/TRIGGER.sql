--TRIGGER
/*S�O, COMO O PR�PRIO NOME SUGERE, GATILHOS QUE SER�O EXECUTADOS AP�S DETERMINADAS A��ES. PODE SER USADO PARA REDUZIR ESCRITAS DE COMANDOS, COMO 
VEREMOS NO EXEMPLO A SEGUIR:*/

--VAMOS CRIAR UMA NOVA TABELA DE FATURAMENTO, QUE IR� CALCURAR O TOTAL VENDIDO POR DATAS

CREATE TABLE TAB_FATURAMENTO(
	DATA_VENDA DATE NULL,
	TOTAL_VENDA FLOAT);

/*ESSA TABELA DE FATURAMENTO RECEBE OS VALORES DE DUAS OUTRAS TABELAS, A DE VENDAS (TEMOS A DATA), E A DE ITENS VENDIDOS (MULTIPLICANDO O VALOR PELO
TOTAL, TEMOS O FATURAMENTO)*/

SELECT
	TV.DATA,
	SUM(TIV.QUANTIDADE * TIV.PRECO)		AS		TOTAL_VENDA
FROM TABELA_DE_VENDAS TV
INNER JOIN TABELA_ITENS_VENDIDOS TIV
ON  TV.NUMERO = TIV.NUMERO
GROUP BY
	TV.DATA

/*ESSA CONSULTA ANTERIOR MOSTRA OS DADOS QUE PRECISAM SER PASSADOS PARA A TABELA DE FATURAMENTO, MAS AO ROD�-LA, VEMOS QUE N�O H� RESULTADO, J� QUE
AS DUAS TABELAS QUE COMP�EM A CONSULTA EST�O VAZIOS, POR ISSO, VAMOS ADICIONAR ALGUNS VALORES*/

INSERT INTO TABELA_DE_VENDAS
VALUES
(
'0101', '2018-05-16', '1471156710', '235', 0.18
);

INSERT INTO TABELA_ITENS_VENDIDOS
VALUES
(
'0101', '1000889', 100, 10
);

/*RODANDO NOVAMENTE A CONSULTA, VEMOS QUE AGORA J� TEMOS VALORES, NESTE CASO, R$1000,00 DE VENDA NO DIA 15 DE MAIO DE 2018, ENT�O PODEREMOS USAR A 
CONSULTA PARA INSERIR VALORES NA TABELA DE FATURAMENTO*/

INSERT INTO TAB_FATURAMENTO --NESSE CASO, N�O PRECISAMOS INFORMAR VALUES, MAS � PRECISO QUE O NOME DOS CAMPOS DA CONSULTA SEJAM IGUAIS AOS DA TABELA
SELECT
	TV.DATA								AS		DATA_VENDA,
	SUM (TIV.QUANTIDADE * TIV.PRECO)	AS		TOTAL_VENDA
FROM TABELA_DE_VENDAS TV
INNER JOIN TABELA_ITENS_VENDIDOS TIV
ON  TV.NUMERO = TIV.NUMERO
GROUP BY
	TV.DATA

SELECT * FROM TAB_FATURAMENTO

/*AGORA, VAMOS ADICIONAR UMA NOVA NOTA*/
INSERT INTO TABELA_DE_VENDAS
VALUES
(
'0103', '2018-05-15', '1471156710', '235', 0.18
);

INSERT INTO TABELA_ITENS_VENDIDOS
VALUES
(
'0103', '1000889', 100, 10
);

INSERT INTO TAB_FATURAMENTO --NESSE CASO, N�O PRECISAMOS INFORMAR VALUES, MAS � PRECISO QUE O NOME DOS CAMPOS DA CONSULTA SEJAM IGUAIS AOS DA TABELA
SELECT
	TV.DATA								AS		DATA_VENDA,
	SUM(TIV.QUANTIDADE * TIV.PRECO)		AS		TOTAL_VENDA
FROM TABELA_DE_VENDAS TV
INNER JOIN TABELA_ITENS_VENDIDOS TIV
ON  TV.NUMERO = TIV.NUMERO
GROUP BY
	TV.DATA

--VERIFICANDO AGORA A TABELA DE FATURAMENTO, VEMOS QUE TEMOS DOIS REGISTROS

SELECT * FROM TAB_FATURAMENTO

--NOTE QUE TEMOS TODOS OS VALORES INSERIDOS, MAS N�O � ISSO QUE QUEREMOS. QUEREMOS APENAS A SOMAT�RIA TOTAL POR DIA. SENDO ASSIM, FAZEMOS O SEGUINTE:

DELETE FROM TAB_FATURAMENTO

INSERT INTO TAB_FATURAMENTO --NESSE CASO, N�O PRECISAMOS INFORMAR VALUES, MAS � PRECISO QUE O NOME DOS CAMPOS DA CONSULTA SEJAM IGUAIS AOS DA TABELA
SELECT
	TV.DATA								AS		DATA_VENDA,
	SUM(TIV.QUANTIDADE * TIV.PRECO)		AS		TOTAL_VENDA
FROM TABELA_DE_VENDAS TV
INNER JOIN TABELA_ITENS_VENDIDOS TIV
ON  TV.NUMERO = TIV.NUMERO
GROUP BY
	TV.DATA

/*FAZEMOS O DELETE DO DADOS E DEPOIS INSERIMOS NOVAMENTE. OU SEJA, TODA VEZ QUE FOR FEITA UMA NOVA VENDA, � PRECISO RODAR ESSE SCRIPT PARA ATUALIZAR
A TABELA DE FATURAMENTO.
O TRIGGER ENTRA JUSTAMENTE PARA RESOLVER ESSA QUEST�O DE TER DE FICAR REALIZANDO MANUALMENTE ESSA TAREFA, DA SEGUINTE FORMA:*/

CREATE TRIGGER TG_ITENS_VENDIDOS	--CRIA E NOMEIA A TRIGGER
ON DBO.TABELA_ITENS_VENDIDOS		--DEFINE QUAL TABELA O TRIGGER IR� 'VIGIAR'
AFTER INSERT, UPDATE, DELETE		--QUAIS COMANDOS FEITOS NA TABELA VIGIADA IR�O DISPARAR A TRIGGER
AS 
BEGIN								--ENTRE 'BEGIN' E 'END' EST� O CORPO DA TRIGGER, QUE SER�O AS A��ES EXECUTADAS QUANDO ELA FOR CHAMADA
DELETE FROM TAB_FATURAMENTO;

INSERT INTO TAB_FATURAMENTO 
SELECT 
    TV.DATA								AS	DATA_VENDA, 
    SUM (TIV.QUANTIDADE * TIV.PRECO)	AS	TOTAL_VENDA 
FROM TABELA_DE_VENDAS TV 
INNER JOIN TABELA_ITENS_VENDIDOS TIV 
ON TV.NUMERO = TIV.NUMERO 
GROUP BY TV.DATA;

END;

--AGORA, TODA VEZ QUE EU FAZER UMA NOVA INSER��O, ALTERA��O OU REMO��O NA TABELA_ITENS_VENDIDOS, A TRIGGER SER� CHAMADA E ATUALIZAR� A TABELA DE FATURAMENTO

INSERT INTO TABELA_DE_VENDAS
VALUES
(
'0105', '2018-05-16', '1471156710', '235', 0.18
);

INSERT INTO TABELA_ITENS_VENDIDOS
VALUES
(
'0105', '1000889', 150, 10
);

SELECT * FROM TAB_FATURAMENTO