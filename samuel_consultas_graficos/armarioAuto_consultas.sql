/* uma busca para ver quais usuários têm pedidos e qual é o status desses pedidos. 
O sistema conecta as informações dos usuários com os pedidos deles, 
e você vê quem fez o quê e o que aconteceu com os pedidos*/
SELECT
	usuario.usuario_id, usuario.nome AS nome_usuario, pedidos.pedidos_id, pedidos.status AS status_do_pedido
FROM usuario
INNER JOIN pedidos ON usuario.usuario_id = pedidos.pedidos_id;

-- A consulta retorna o nome do produto, o nome e e-mail do usuário que comprou o produto, além do preço do mesmo
SELECT produto.nome AS produto, produto.preco, usuario.nome AS usuario, usuario.email
FROM produto
JOIN pedidos_produto ON produto.produto_id = pedidos_produto.produto_id
JOIN pedidos ON pedidos_produto.pedidos_id = pedidos.pedidos_id
JOIN usuario ON pedidos.usuario_id = usuario.usuario_id;

-- total gasto por cada usuário em produtos
SELECT usuario.nome AS nome_usuario, SUM(produto.preco) AS total_gasto
FROM usuario
JOIN pedidos ON usuario.usuario_id = pedidos.usuario_id
JOIN pedidos_produto ON pedidos.pedidos_id = pedidos_produto.pedidos_id
JOIN produto ON pedidos_produto.produto_id = produto.produto_id
GROUP BY usuario.usuario_id;

USE armarioauto;
