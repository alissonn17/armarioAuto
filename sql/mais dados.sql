USE armarioauto;

START TRANSACTION;

SELECT * FROM usuario; #20
SELECT * FROM produto; #30
SELECT * FROM notificacoes; #27
SELECT * FROM mercado; #7
SELECT * FROM historico_consumo; #27
SELECT * FROM pedidos; #32
SELECT * FROM pedidos_produto; #32
SELECT * FROM metasNutricionias; #20


INSERT INTO notificacoes (usuario_id, tipo, mensagem, status, data_envio, local) VALUES
(5, 'Promoção', 'Promoção de Arroz em oferta especial', 'Lido', '2025-03-11', 'São Paulo'),
(12, 'Aviso', 'Estoque de Feijão está acabando!', 'Enviado', '2025-03-10', 'Rio de Janeiro'),
(8, 'Atualização', 'Óleo de cozinha com desconto por tempo limitado', 'Lido', '2025-03-09', 'Belo Horizonte'),
(5, 'Promoção', 'Novidade: Macarrão integral disponível', 'Enviado', '2025-03-08', 'Curitiba'),
(6, 'Aviso', 'Leite em promoção! Aproveite antes que acabe', 'Lido', '2025-03-07', 'Fortaleza'),
(15, 'Atualização', 'Café gourmet com preço especial nesta semana', 'Enviado', '2025-03-06', 'Brasília'),
(20, 'Promoção', 'Açúcar refinado e mascavo com desconto', 'Lido', '2025-03-05', 'Manaus'),
(12, 'Aviso', 'Farinha de trigo premium disponível', 'Lido', '2025-03-04', 'Recife'),
(9, 'Atualização', 'Biscoito recheado em oferta', 'Enviado', '2025-03-03', 'Porto Alegre'),
(4, 'Promoção', 'Refrigerante com combo promocional', 'Lido', '2025-03-02', 'Salvador'),
(11, 'Aviso', 'Sabão em barra com novos preços', 'Enviado', '2025-03-01', 'São Bernardo'),
(7, 'Atualização', 'Detergente líquido com oferta especial', 'Lido', '2025-02-28', 'Campinas'),
(14, 'Promoção', 'Amaciante com fragrância renovada em promoção', 'Enviado', '2025-02-27', 'João Pessoa'),
(6, 'Aviso', 'Shampoo revitalizante agora com desconto', 'Lido', '2025-02-26', 'Natal'),
(6, 'Atualização', 'Condicionador para cabelos secos por um ótimo preço', 'Enviado', '2025-02-25', 'Maceió'),
(19, 'Promoção', 'Sabonete hidratante em oferta especial', 'Lido', '2025-02-24', 'Aracaju'),
(13, 'Aviso', 'Pasta de dente com embalagem econômica disponível', 'Enviado', '2025-02-23', 'Belém'),
(6, 'Atualização', 'Papel higiênico pacote jumbo em promoção', 'Lido', '2025-02-22', 'Florianópolis'),
(18, 'Promoção', 'Carne fresca com cortes especiais em promoção', 'Enviado', '2025-02-21', 'Goiânia'),
(17, 'Aviso', 'Frango congelado por tempo limitado', 'Lido', '2025-02-20', 'Vitória'),
(3, 'Atualização', 'Peixe fresco disponível no setor de pescados', 'Enviado', '2025-02-19', 'São Luís'),
(5, 'Promoção', 'Presunto fatiado com promoção exclusiva', 'Lido', '2025-02-18', 'Teresina'),
(5, 'Aviso', 'Queijo especial agora com desconto', 'Enviado', '2025-02-17', 'Macapá'),
(1, 'Atualização', 'Iogurte com sabores diversos em oferta', 'Lido', '2025-02-16', 'Boa Vista'),
(6, 'Promoção', 'Margarina com preço reduzido por tempo limitado', 'Enviado', '2025-02-15', 'Palmas'),
(15, 'Aviso', 'Manteiga especial com desconto exclusivo', 'Lido', '2025-02-14', 'Cuiabá'),
(20, 'Atualização', 'Chocolate importado com preços incríveis', 'Enviado', '2025-02-13', 'Campo Grande'),
(5, 'Promoção', 'Suco natural com embalagem família em oferta', 'Lido', '2025-02-12', 'Porto Velho'),
(4, 'Aviso', 'Água mineral pacote econômico disponível', 'Enviado', '2025-02-11', 'Rio Branco'),
(7, 'Atualização', 'Cerveja premium com preço especial', 'Lido', '2025-02-10', 'Santarém'),
(12, 'Promoção', 'Desconto exclusivo em produtos selecionados', 'Enviado', '2025-02-09', 'Marabá'),
(5, 'Aviso', 'Ofertas da semana em destaque!', 'Lido', '2025-02-08', 'Itabuna'),
(8, 'Promoção', 'Oferta imperdível em Suco natural', 'Enviado', '2025-03-07', 'Natal');
# + 33 dados = 60

INSERT INTO historico_consumo (produto_id, usuario_id, quantidade_gramas, local_stl) VALUES
(12, 5, 200.50, 'São Paulo/mercado/modelo1.stl'),
(8, 12, 300.00, 'Rio de Janeiro/mercado/modelo1.stl'),
(15, 5, 450.25, 'Curitiba/mercado/modelo1.stl'),
(32, 6, 100.75, 'Fortaleza/mercado/modelo1.stl'),
(7, 20, 250.00, 'Manaus/mercado/modelo1.stl'),
(19, 6, 500.00, 'Brasília/mercado/modelo1.stl'),
(4, 5, 150.50, 'Belo Horizonte/mercado/modelo1.stl'),
(28, 12, 320.00, 'Recife/mercado/modelo1.stl'),
(9, 5, 120.35, 'Salvador/mercado/modelo1.stl'),
(11, 7, 220.80, 'São Bernardo/mercado/modelo1.stl'),
(13, 5, 340.50, 'Campinas/mercado/modelo1.stl'),
(22, 19, 180.00, 'Porto Alegre/mercado/modelo1.stl'),
(18, 6, 390.75, 'João Pessoa/mercado/modelo1.stl'),
(2, 15, 410.90, 'Natal/mercado/modelo1.stl'),
(25, 5, 205.20, 'Maceió/mercado/modelo1.stl'),
(6, 13, 275.65, 'Aracaju/mercado/modelo1.stl'),
(29, 6, 360.30, 'Belém/mercado/modelo1.stl'),
(21, 5, 415.00, 'Florianópolis/mercado/modelo1.stl'),
(1, 18, 295.15, 'Goiânia/mercado/modelo1.stl'),
(31, 17, 320.40, 'Vitória/mercado/modelo1.stl'),
(3, 3, 450.75, 'São Luís/mercado/modelo1.stl'),
(14, 5, 280.55, 'Teresina/mercado/modelo1.stl'),
(10, 5, 330.00, 'Macapá/mercado/modelo1.stl'),
(20, 1, 140.45, 'Boa Vista/mercado/modelo1.stl'),
(16, 6, 310.75, 'Palmas/mercado/modelo1.stl'),
(26, 15, 220.80, 'Cuiabá/mercado/modelo1.stl'),
(27, 20, 180.25, 'Campo Grande/mercado/modelo1.stl'),
(30, 5, 200.60, 'Porto Velho/mercado/modelo1.stl'),
(8, 4, 330.45, 'Rio Branco/mercado/modelo1.stl'),
(12, 7, 410.90, 'Santarém/mercado/modelo1.stl'),
(24, 12, 240.00, 'Marabá/mercado/modelo1.stl'),
(11, 19, 150.50, 'Itabuna/mercado/modelo1.stl'),
(17, 5, 350.35, 'Franca/mercado/modelo1.stl');
# + 33 dados = 60

INSERT INTO pedidos (usuario_id, mercado_id, status, total) VALUES
(5, 3, 'Pendente', 125.50),
(12, 2, 'Concluído', 230.75),
(8, 5, 'Pendente', 315.20),
(5, 6, 'Concluído', 150.00),
(6, 4, 'Pendente', 87.30),
(15, 3, 'Cancelado', 400.95),
(20, 7, 'Pendente', 180.50),
(12, 1, 'Concluído', 250.00),
(5, 4, 'Pendente', 105.75),
(9, 2, 'Concluído', 345.80),
(11, 6, 'Pendente', 415.25),
(7, 5, 'Concluído', 295.00),
(6, 4, 'Cancelado', 120.60),
(5, 3, 'Pendente', 220.35),
(3, 1, 'Cancelado', 135.75),
(15, 2, 'Concluído', 350.45),
(8, 6, 'Pendente', 280.00),
(20, 5, 'Concluído', 110.50),
(6, 7, 'Pendente', 175.20),
(5, 2, 'Cancelado', 195.10),
(12, 3, 'Concluído', 310.90),
(8, 4, 'Pendente', 98.75),
(9, 6, 'Concluído', 265.50),
(5, 7, 'Cancelado', 220.00),
(6, 1, 'Pendente', 185.40),
(15, 3, 'Concluído', 400.50),
(5, 6, 'Pendente', 325.00),
(7, 2, 'Concluído', 240.75);
# + 28 dados = 60

INSERT INTO pedidos_produto (pedidos_id, produto_id) VALUES
(5, 12),
(10, 8),
(15, 20),
(2, 4),
(7, 25),
(22, 18),
(30, 14),
(8, 21),
(17, 3),
(12, 11),
(28, 7),
(33, 6),
(6, 19),
(40, 1),
(45, 16),
(50, 29),
(60, 9),
(11, 22),
(3, 13),
(20, 30),
(25, 15),
(35, 32),
(19, 27),
(42, 2),
(55, 17),
(9, 23),
(14, 5),
(24, 31);
# + 28 dados = 60

ROLLBACK;