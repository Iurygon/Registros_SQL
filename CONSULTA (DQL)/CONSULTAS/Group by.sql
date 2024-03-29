/*PARA USAR O GROUP BY � IMPORTANTE TER NO SELECT AO MENOS UM CAMPO EM QUE � APLICADO A CHAMADA FUN��O DE AGREGA��O, QUE PODE SER
SUM (SOMAR), AVG (M�DIA), MAX (M�XIMO), MIN (M�NIMO).*/

--APRESENTA O N�MERO DE CLIENTES POR CIDADE
SELECT CIDADE, COUNT(*) AS NUMERO_CLIENTES FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

--APRESENTA O N�MERO DE PRODUTOS POR TIPO DE EMBALAGEM
SELECT EMBALAGEM, COUNT(*) AS NUMERO_PRODUTOS FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--TAMB�M � POSS�VEL USAR FILTROS NA CONSULTA. NO EXEMPLO, TEMOS O N�MERO DE PRODUTOS SABOR LARANJA POR TIPO DE EMBALAGEM
SELECT EMBALAGEM, COUNT(*) AS NUMERO_PRODUTOS FROM TABELA_DE_PRODUTOS 
WHERE SABOR = 'Laranja'
GROUP BY EMBALAGEM;

SELECT COUNT(*) AS [VENDAS MAIORES QUE 99 UNIDADES] FROM ITENS_NOTAS_FISCAIS
WHERE CODIGO_DO_PRODUTO = '1101035' AND QUANTIDADE = 99;

--CONSULTA A QUANTIDADE TOTAL DE VENDAS DE CADA PRODUTO, ORDENANDO DO MAIOR PARA O MENOR
SELECT 
	
	CODIGO_DO_PRODUTO	AS	PRODUTO,
	SUM(QUANTIDADE)				AS	TOTAL_VENDIDO
	
FROM ITENS_NOTAS_FISCAIS
GROUP BY CODIGO_DO_PRODUTO
ORDER BY SUM(QUANTIDADE) DESC;