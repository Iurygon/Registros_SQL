SELECT * FROM [Tabela de Clientes]
WHERE YEAR([Data de Nascimento]) > 1995; 

SELECT Nome, [Percentual Comissao] FROM [Tabela de Vendedores]
WHERE [Percentual Comissao] <= 0.08;

SELECT Nome, Embalagem, [Preco de lista] FROM [Tabela de Produtos]
WHERE [Preco de lista] < 6 AND Embalagem = 'Lata';

SELECT Nome, Estado FROM [Tabela de Clientes]
WHERE NOT(Estado = 'RJ');

UPDATE [Tabela de Produtos]
SET [Preco de lista] = [Preco de lista] * 0.9
WHERE Embalagem = 'Lata';

UPDATE [Tabela de Produtos]
SET Embalagem = 'Garrafa', [Preco de lista] = 8.10
WHERE [Codigo do Produto] = '1088126';

DELETE FROM [Tabela de Produtos]
WHERE [Codigo do Produto] = '1004327';