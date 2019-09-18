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
  @codVendedor INTEGER(11)
  AS 
    BEGIN 
      SELECT p.data,v.nome FROM vendedor as v
        INNER JOIN pedidos as p ON p.cod_vendedor = v.cod
      WHERE v.cod = @codVendedor
    END 

 EXEC  usp_PedidosVendedor 20

-- 1.2 mostrar todos os pedidos realizados no dia 25/03/2015
    
CREATE PROCEDURE usp_PedidosData
   AS 
    BEGIN
      SELECT * FROM pedidos as p
      WHERE p.data BETWEEN '2019-03-25 00:00:00' AND '2019-03-25 23:59:00'
    END    
        
EXEC usp_PedidosData

-- 1.3 Tem como parametro de entrada o codigo do cliente e o nome da cidade que o cliente
-- mora, e mostra os nomes dos produtos  comprados por este cliente, e a UF 
-- que cliente mora  
  
  CREATE PROCEDURE usp_ListCliente
    @codCliente INTEGER(11) 
    @cidade VARCHAR(40)
    AS 
    BEGIN 
      SELECT pro.nome,cli.uf,  FROM pedidos as pe
        INNER JOIN item_pedidos as itp ON itp.codPedido = pe.cod
        INNER JOIN produtos as pro ON pro.cod = itp.cod_Produto
        INNER JOIN clientes as cli ON cli.cod= pe.cod_Cliente
      WHERE cli.cod = @codCliente END cli.uf= @cidade
    END

  EXEC  usp_ListCliente 20, 'Curitiba'  
-- 1.4 Tem como como parametro de entrada para faixa salarial (sigla) e mostra 
-- quantos vendendores exitesm nesta faixa e uma soma do salarios pagos aos vendedores
  
  CREATE PROCEDURE listaFaixaSalarialVendedores
    @faixaSalarial VARCHAR(1)
    AS 
    BEGIN 
      SELECT COUNT(*), SUM(salario) 
      FROM clientes 
      WHERE faixa_salarial = @faixaSalarial
    END        
        
EXEC listaFaixaSalarialVendedores "D"

          
          
          
          
          
          