USE armarioauto;

SELECT notificacoes.status, notificacoes.usuario_id, usuario.nome
FROM notificacoes
INNER JOIN usuario ON notificacoes.usuario_id = usuario.usuario_id;

SELECT produto.nome, produto.preco, pedidos.status
FROM produto
INNER JOIN pedidos_produto ON produto.produto_id = pedidos_produto.produto_id
INNER JOIN pedidos ON pedidos_produto.pedidos_id = pedidos.pedidos_id;

SELECT usuario.nome, pedidos.status, mercado.nome
FROM usuario
INNER JOIN pedidos ON pedidos.usuario_id = usuario.usuario_id
INNER JOIN mercado ON mercado.mercado_id = pedidos.mercado_id;

