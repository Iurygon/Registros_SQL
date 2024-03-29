--AUTO INCREMENTO

/*AUTO INCREMENTO � QUANDO UM CAMPO IMPREQUEMENTA SEU VALOR SEMPRE QUE UMA NOVA LINHA � ADICIONADA NA TABALA. O VALOR DO AUTO INCREMENTO N�O PODE SER
REMOVIDO DA TABELA, OU SEJA, MESMO QUE VOC� ELIMINE O ID DE AUTO INCREMENTO DE N�MERO 1, AO GERAR UMA NOVA LINHA, O VALOR AINDA ASSIM SER� DOIS. E
POR FIM, N�O � POSS�VEL ADICIONAR UM VALOR NOVO NO AUTO INCREMENTO AO SE FAZER UM INSERTO.
� FEITO DA SEGUINTE FORMA:*/

--CREATE TABLE TAB_INCREMENTO (
--	ID INT IDENTITY(1,1) NOT NULL, --ESSA SERIA A FORMA DE FAZER A CRIA��O DE UM CAMPO COM AUTO INCREMENTO, DEFININDO O NOME, TIPO, E PRECISA SER NOT NULL
--	DESCRITOR VARCHAR(20) NULL
--);

/*VEJA QUE A FUN��O IDENTITY POSSUIM DOIS PAR�METROS, SENDO O PRIMEIRO RESPONS�VEL POR DEFINIR EM QUAL VALOR IR� COME�AR A CONTAGEM, E O SEGUNDO DEFINE
QUANTO SER� INCREMENTADO POR CONTAGEM.*/


--DEFAULT
/*DEFAULT � A DEFINI��O DE UM VALOR PADR�O PARA UM CAMPO, QUANDO SEU VALOR N�O FOR ESPECIFICADO NA HORA DE INSERIR VALORES NA TABELA. PEGANDO COMO EXEMPLO
O MESMO C�DIGO ACIMA, TEMOS O SEGUINTE:*/

--CREATE TABLE TAB_INCREMENTO
--ID INT IDENTITY(1, 1) NOT NULL --PRECISA SER NOT NULL PORQUE SER� SEMPRE INCREMENTADO
--DESCRITOR VARCHAR(20) NULL --O DEFAULT DESSE CAMPO � NULL, OU SEJA, QUANDO FOREM INSERIDOS VALORES, MAS N�O FOREM ESPECIFICADOS, SER� CONSIDERADO NULL
--CIDADE VARCHAR(100) DEFAULT 'Rio de Janeiro' --COM ESSE PADR�O, QUANDO N�O HOUVER ESPECIFICA��O DA CIDADE, O VALOR SER� CONSIDERADO 'Rio de Janeiro'
--DATA DATE DEFAULT GETDATE() --AQUI, FOI USADA UMA FUN��O PARA SEMPRE PEGAR A DATA ATUAL NA INCLUS�O DE UMA LINHA NA TABELA