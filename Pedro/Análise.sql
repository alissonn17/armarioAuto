select pedidos.status, mercado.nome
from pedidos
inner join mercado on mercado.mercado_id = pedidos.mercado_id;

select historico_consumo.quantidade_gramas, produto.nome
from historico_consumo
inner join produto on produto.produto_id = historico_consumo.produto_id;

select metasNutricionias.meta_calorias, metasNutricionias.meta_gorduras, usuario.nome
from metasNutricionias
inner join usuario on usuario.usuario_id = metasNutricionias.usuario_id; 