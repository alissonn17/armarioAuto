SELECT notificacoes.status, notificacoes.usuario_id, usuario.nome
FROM notificacoes
INNER JOIN usuario ON notificacoes.usuario_id = usuario.usuario_id;

SELECT pedidos.usuario_id, pedidos.status, usuario.nome
FROM pedidos
INNER JOIN usuario ON pedidos.usuario_id = usuario.usuario_id;

SELECT historico_consumo.produto_id, historico_consumo.local_stl,produto.categoria
FROM historico_consumo
INNER JOIN produto ON historico_consumo.produto_id = produto.produto_id;