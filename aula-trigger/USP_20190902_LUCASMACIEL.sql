-- 1 Criar History Procedure

--TABELAS
  --VENDEDOR
    --cod_vendedor 
  --CLIENTES
     --cod_cliente
  --FUNCIONARIOS
     --faixaSalarial
  --PEDIDOS
    --cod_vendedor
  --ITEM PEDIDOS
    --cod_Produto
    --cod_Cliente

-- 1.1 Tem como parametro de entrada o codigo do vendedor 
-- e mostrar todas as as datas dos pedidos que foram feitos por este funcionario
CREATE PROCEDURE usp_PedidosVendedor
  @codVendedor int
  AS 
    BEGIN 
      SELECT p.datapedido,v.cod_vendedor,v.nome_vendedor
	  FROM vendedor as v
        INNER JOIN pedido as p ON p.cod_vendedor = v.cod_vendedor
      WHERE v.cod_vendedor = @codVendedor
  END 

 EXEC  usp_PedidosVendedor 11


-- 1.2 mostrar todos os pedidos realizados no dia 25/03/2015
CREATE PROCEDURE usp_PedidosData
   AS 
    BEGIN
      SELECT * 
	  FROM pedido as p
      WHERE p.datapedido BETWEEN '2015-03-25 00:00:00' AND '2015-03-25 23:59:00'
    END    
        
EXEC usp_PedidosData

-- 1.3 Tem como parametro de entrada o codigo do cliente e o nome da cidade que o cliente
-- mora, e mostra os nomes dos produtos  comprados por este cliente, e a UF 
-- que cliente mora  
    CREATE PROCEDURE usp_ListCliente
    @codCliente int,
	@cidade VARCHAR(30)
    AS 
    BEGIN 
		SELECT c.cod_cliente,c.nome_cliente,c.cidade,c.uf,p.descricao
		FROM pedido as pe
			INNER JOIN item_pedido as itp ON itp.num_pedido = pe.num_pedido
			INNER JOIN produto as p ON p.cod_produto = itp.cod_produto
			INNER JOIN cliente as c ON c.cod_cliente = pe.cod_cliente
		WHERE  c.cod_cliente= @codCliente AND c.cidade= @cidade
		GROUP BY  c.cod_cliente,c.nome_cliente,c.cidade,c.uf,p.descricao
    END

  EXEC  usp_ListCliente 260, 'NITERI'  

-- 1.4 Tem como como parametro de entrada para faixa salarial (sigla) e mostra 
-- quantos vendendores exitesm nesta faixa e uma soma do salarios pagos aos vendedores
  
  CREATE PROCEDURE ListVendedorSalarios
   @faixaComissao VARCHAR(1)
    AS
	 BEGIN
	   SELECT COUNT(*), SUM(salario_fixo) 
	   FROM vendedor
	   WHERE  faixa_comissao= @faixaComissao   
	 END

EXEC ListVendedorSalarios 'C'

          
          
          
          
