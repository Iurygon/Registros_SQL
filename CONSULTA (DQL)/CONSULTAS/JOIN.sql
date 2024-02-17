/*O COMANDO INNER JOIN FAZ A JUN��O DE TABELAS DIFERENTES, PERMITINDO FAZER A SELE��O DOS CAMPOS DESEJADOS.
DEVE INFORMAR UMA COLUNA EM COMUM ENTRE AS TABELAS PARA SER FEITO O JOIN. N�O � NECESS�RIO QUE O NOME SEJA O MESMO NAS COLUNAS,
MAS PRECISA SER DO MESMO TIPO E TER OS MESMOS TAMANHOS

O INNER JOIN � UMA INTERSE��O ENTRE AS TABELAS PASSADAS, LOGO S� VAI RETORNAR OS VALORES CORRESPONDENTES EM AMBAS AS TABELAS. CASO
APARE�A EM UMA E N�O EM OUTRA, O VALOR N�O SER� APRESENTADO.
*/

--CONSULTA O NOME DO VENDEDOR, SUA MATR�CULA E A QUANTIDADE DE NOTAS FISCAIS EMITIDAS.
SELECT 
	
	TV.NOME, 
	NF.MATRICULA,
	COUNT(*)	AS	NUMERO_VENDAS

FROM TABELA_DE_VENDEDORES TV
INNER JOIN NOTAS_FISCAIS NF ON
	NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA ,TV.NOME;

--CONSULTA O NOME DO PRODUTO, SEU CODIGO, E O TOTAL DE VENDAS EMITIDAS, ORDENANDO DO MAIOR PARA O MENOR
SELECT 

	TP.NOME_DO_PRODUTO		AS	PRODUTO,
	INF.CODIGO_DO_PRODUTO	AS	CODIGO,
	SUM(INF.QUANTIDADE)		AS	QTD_VENDAS

FROM TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF
	ON	TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
GROUP BY TP.NOME_DO_PRODUTO, INF.CODIGO_DO_PRODUTO
ORDER BY QTD_VENDAS DESC;