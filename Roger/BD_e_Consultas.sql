DROP DATABASE armarioauto;

CREATE DATABASE armarioauto;
 
 USE armarioauto;
 
 CREATE TABLE usuario(
 usuario_id int primary key auto_increment not null,
 nome varchar(50),
 email varchar(50),
 senha varchar(20) not null,
 saldo_cashback decimal(10, 2),
 criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );

CREATE TABLE notificacoes (
 	notificacoes_id INT AUTO_INCREMENT PRIMARY KEY,
     usuario_id INT,
     tipo VARCHAR(20),
     mensagem text,
     status VARCHAR(10),
     data_envio DATE,
     local VARCHAR(20),
     FOREIGN KEY (usuario_id) REFERENCES  usuario (usuario_id) 
     );
     
     CREATE TABLE metas_nutricionias(
 	metas_id INT AUTO_INCREMENT PRIMARY KEY,
     usuario_id INT,
     data_criacao DATETIME,
     meta_carboidratos INT,
     meta_calorias INT,
     meta_proteinas INT,
     meta_gorduras INT,
     arquivo_atual_criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	arquivo_atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
 );
     
    CREATE TABLE mercado (
     mercado_id INT AUTO_INCREMENT PRIMARY KEY,
     horario_funcionamento VARCHAR(10),
     telefone VARCHAR(15),
     api_url VARCHAR(75),
     nome VARCHAR(30),
     localizacao VARCHAR(50),
     criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );
 
  CREATE TABLE produto( -- tabela produtos criada, necessario a tabela intermediaria com pedido para funcionamento completo
	produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    unidade INT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT,
    categoria VARCHAR(20),
    data_validade date,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE pedido(
 	pedido_id 	INT AUTO_INCREMENT PRIMARY KEY,
	usuario_id INT,
	mercado_id INT,
	status VARCHAR(84),
	total float,
	arquivo_atual_criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 	arquivo_atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
	FOREIGN KEY (mercado_id) REFERENCES mercado(mercado_id)
 );

#COLOCAR DEPOIS
	CREATE TABLE pedido_produto(
	id INT AUTO_INCREMENT PRIMARY KEY,
	pedido_id INT,
	produto_id INT,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (pedido_id) REFERENCES pedido (pedido_id),
	FOREIGN KEY (produto_id) REFERENCES produto (produto_id)
	);

CREATE TABLE historico_consumo(
historico_id INT AUTO_INCREMENT PRIMARY KEY,
produto_id INT,
usuario_id INT,
quantidade_gramas DECIMAL(5,2),
motivo VARCHAR(80),
arquivo_atual_criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
arquivo_atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
local_stl VARCHAR(80),
criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (produto_id) REFERENCES produto(produto_id),
FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

show tables;

INSERT INTO usuario (nome, email, senha, saldo_cashback)
 VALUES
 ('Ana Souza', 'ana_souza23@email.com', 'SeguraAna!45', 30.50),
 ('Carlos Pereira', 'carlosp77@email.com', 'C4r1os@P2025', 100.00),
 ('Mariana Santos', 'mari.santos@email.com', 'Mar1an@#89', 75.00),
 ('João Oliveira', 'oliveira_joao@email.net', 'Jo40Liv!321', 120.50),
 ('Beatriz Lima', 'bia.lima89@email.org', 'B3atriz123', 15.75),
 ('Lucas Martins', 'lucasmartins@email.com', 'LuckyM2023!', 89.30),
 ('Fernanda Costa', 'fernandac888@email.com', 'F3rnC#008', 200.00),
 ('Rafael Almeida', 'rafael_a@email.net', 'Alm3id4$$', 60.20),
 ('Juliana Barros', 'j.barros22@email.org', 'Jul@2024++', 43.90),
 ('Carlos Henrique', 'henrique.carlos@email.com', 'CHenr#007', 150.00),
 ('Gabriela Rocha', 'gabirocha07@email.org', 'Gabi#Prime55', 80.00),
 ('Pedro Borges', 'p.borges@email.com', 'BorgXP!123', 45.50),
 ('Camila Ferreira', 'camila_ferreira@email.net', 'Cam24&Star', 110.75),
 ('Thiago Monteiro', 'thiagom@email.org', 'TMont@rio98', 60.20),
 ('Sofia Alves', 'sofia_a89@email.net', 'Sof!We$199', 95.00),
 ('Renato Nogueira', 'renato_nog@email.com', 'ReN22!Gold', 140.35),
 ('Laura Mendes', 'lauram.email@email.org', 'LaurA++2023', 75.25),
 ('Daniel Souza', 'danielsouzaxyz@email.net', 'Souz&D4N!', 50.00),
 ('Patrícia Vieira', 'p.vieira@email.org', 'ViE$77Pat', 120.45),
 ('Vinícius Cardoso', 'vinicardoso2025@email.com', 'Vini*Top2025', 200.00);
 
 SELECT * FROM usuario;
 
 INSERT INTO metas_nutricionias (usuario_id, data_criacao, meta_carboidratos, meta_calorias, meta_proteinas, meta_gorduras) VALUES
 (1, '2025-03-01 08:00:00', 250, 2000, 80, 70),
 (2, '2025-03-02 09:00:00', 300, 2200, 100, 80),
 (3, '2025-03-03 10:00:00', 200, 1800, 70, 60),
 (4, '2025-03-04 11:00:00', 270, 2100, 85, 75),
 (5, '2025-03-05 12:00:00', 240, 1900, 75, 65),
 (6, '2025-03-06 13:00:00', 280, 2300, 90, 85),
 (7, '2025-03-07 14:00:00', 260, 2000, 80, 70),
 (8, '2025-03-08 15:00:00', 310, 2500, 110, 90),
 (9, '2025-03-09 16:00:00', 230, 1900, 75, 65),
 (10, '2025-03-10 17:00:00', 290, 2200, 95, 85),
 (11, '2025-03-11 18:00:00', 250, 2000, 80, 70),
 (12, '2025-03-12 19:00:00', 270, 2100, 85, 75),
 (13, '2025-03-13 20:00:00', 240, 1900, 75, 65),
 (14, '2025-03-14 21:00:00', 300, 2200, 100, 80),
 (15, '2025-03-15 22:00:00', 200, 1800, 70, 60),
 (16, '2025-03-16 23:00:00', 280, 2300, 90, 85),
 (17, '2025-03-17 08:00:00', 250, 2000, 80, 70),
 (18, '2025-03-18 09:00:00', 310, 2500, 110, 90),
 (19, '2025-03-19 10:00:00', 260, 2000, 80, 70),
 (20, '2025-03-20 11:00:00', 290, 2200, 95, 85);
 
 INSERT INTO produto (nome, unidade, preco, quantidade, categoria, data_validade)
 VALUES
 ('Arroz', 1, 5.99, 100, 'Alimento', '2025-12-31'),
 ('Feijão', 1, 4.49, 80, 'Alimento', '2025-11-30'),
 ('Óleo', 1, 9.90, 50, 'Alimento', '2026-01-15'),
 ('Macarrão', 1, 3.99, 120, 'Alimento', '2025-10-20'),
 ('Leite', 1, 6.50, 200, 'Bebida', '2025-06-15'),
 ('Café', 1, 12.99, 60, 'Bebida', '2026-02-28'),
 ('Açúcar', 1, 4.75, 150, 'Alimento', '2025-09-25'),
 ('Farinha', 1, 3.50, 90, 'Alimento', '2025-07-10'),
 ('Biscoito', 1, 2.99, 70, 'Alimento', '2025-08-05'),
 ('Refrigerante', 1, 7.99, 40, 'Bebida', '2025-12-20'),
 ('Sabão', 1, 1.99, 100, 'Limpeza', '2026-03-15'),
 ('Detergente', 1, 2.49, 80, 'Limpeza', '2026-04-10'),
 ('Amaciante', 1, 8.90, 30, 'Limpeza', '2026-05-05'),
 ('Shampoo', 1, 15.00, 50, 'Higiene', '2026-06-01'),
 ('Condicionador', 1, 15.50, 45, 'Higiene', '2026-06-01'),
 ('Sabonete', 1, 2.20, 200, 'Higiene', '2025-11-01'),
 ('Pasta de Dente', 1, 3.50, 180, 'Higiene', '2026-01-15'),
 ('Papel Higiênico', 4, 15.99, 100, 'Higiene', '2026-02-10'),
 ('Carne', 1, 25.00, 30, 'Alimento', '2025-07-18'),
 ('Frango', 1, 18.99, 60, 'Alimento', '2025-07-20'),
 ('Peixe', 1, 22.50, 40, 'Alimento', '2025-08-15'),
 ('Presunto', 1, 13.99, 70, 'Alimento', '2025-06-25'),
 ('Queijo', 1, 14.50, 80, 'Alimento', '2025-06-30'),
 ('Iogurte', 1, 4.50, 100, 'Bebida', '2025-10-10'),
 ('Margarina', 1, 3.99, 90, 'Alimento', '2025-09-05'),
 ('Manteiga', 1, 6.99, 75, 'Alimento', '2025-08-25'),
 ('Chocolate', 1, 7.50, 50, 'Alimento', '2025-12-10'),
 ('Suco', 1, 5.99, 60, 'Bebida', '2025-07-30'),
 ('Água', 1, 1.50, 300, 'Bebida', '2025-05-01'),
 ('Cerveja', 1, 8.99, 90, 'Bebida', '2025-12-31');
 
 SELECT * FROM produto;
 
 INSERT INTO notificacoes (usuario_id, tipo, mensagem, status, data_envio, local)
 VALUES
 (1, 'Promoção', 'Arroz agora com desconto especial por tempo limitado!', 'Enviado', '2025-03-15', 'São Paulo'),
 (5, 'Aviso', 'Feijão está quase esgotado no estoque, aproveite enquanto dura!', 'Lido', '2025-03-16', 'Rio de Janeiro'),
 (3, 'Promoção', 'Leve 3 unidades de Óleo e pague por 2, oferta imperdível.', 'Enviado', '2025-03-12', 'Belo Horizonte'),
 (8, 'Atualização', 'Reabastecimento de Macarrão agendado para amanhã.', 'Lido', '2025-03-10', 'Porto Alegre'),
 (2, 'Aviso', 'Leite em promoção, estoque limitado até dia 20/03!', 'Enviado', '2025-03-13', 'Curitiba'),
 (6, 'Promoção', 'Na compra de 5 pacotes de Farinha, ganhe 1 de Açúcar grátis!', 'Enviado', '2025-03-14', 'Recife'),
 (4, 'Aviso', 'Biscoito disponível em novos sabores a partir desta semana.', 'Lido', '2025-03-11', 'Florianópolis'),
 (10, 'Promoção', 'Compre 2 Refrigerantes e ganhe 10% de cashback.', 'Enviado', '2025-03-16', 'Manaus'),
 (7, 'Aviso', 'Sabão com preço reduzido para limpeza econômica.', 'Lido', '2025-03-09', 'Fortaleza'),
 (15, 'Promoção', 'Na compra de Amaciante, leve um Detergente grátis.', 'Enviado', '2025-03-12', 'Vitória'),
 (12, 'Aviso', 'Não perca a nova linha de Shampoos com 20% de desconto.', 'Enviado', '2025-03-14', 'Brasília'),
 (18, 'Promoção', 'Sabonete com preço especial na compra de 10 unidades.', 'Lido', '2025-03-13', 'Salvador'),
 (20, 'Aviso', 'Pasta de Dente com promoção válida até o fim do mês.', 'Enviado', '2025-03-11', 'Goiânia'),
 (1, 'Promoção', 'Carne fresca em oferta exclusiva de hoje!', 'Enviado', '2025-03-15', 'João Pessoa'),
 (9, 'Aviso', 'Peixe fresco disponível apenas até quinta-feira.', 'Enviado', '2025-03-13', 'Maceió'),
 (14, 'Promoção', 'Frango congelado na promoção leve 2 pague 1.', 'Lido', '2025-03-16', 'Cuiabá'),
 (11, 'Atualização', 'Presunto em nova embalagem prática.', 'Enviado', '2025-03-10', 'São Luís'),
 (19, 'Promoção', 'Queijo em promoção até sábado. Não perca!', 'Enviado', '2025-03-12', 'Natal'),
 (13, 'Aviso', 'Iogurte com validade estendida em novos lotes.', 'Lido', '2025-03-08', 'Belém'),
 (2, 'Promoção', 'Frete grátis na compra de 3 caixas de Chocolate.', 'Lido', '2025-03-14', 'Campo Grande'),
 (17, 'Aviso', 'Água mineral com preço reduzido por tempo limitado.', 'Enviado', '2025-03-11', 'Aracaju'),
 (5, 'Promoção', 'Cerveja com até 15% off para o final de semana.', 'Enviado', '2025-03-13', 'Teresina'),
 (8, 'Aviso', 'Margarina de 1kg com validade promocional estendida.', 'Lido', '2025-03-10', 'Palmas'),
 (16, 'Promoção', 'Manteiga com desconto especial em compras acima de R$50.', 'Lido', '2025-03-16', 'Macapá'),
 (4, 'Aviso', 'Nova remessa de Suco natural chegou hoje.', 'Enviado', '2025-03-09', 'Rio Branco'),
 (3, 'Promoção', 'Aproveite a semana de ofertas no Biscoito.', 'Enviado', '2025-03-12', 'Boa Vista'),
 (7, 'Aviso', 'Açúcar refinado com validade longa já disponível.', 'Lido', '2025-03-13', 'Porto Velho'),
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
 
 INSERT INTO mercado (horario_funcionamento, telefone, api_url, nome, localizacao)
 VALUES
 ('08-22', '(11) 98765-4321', 'https://api.mercadosantos.com', 'Mercado Santos', 'São Paulo, SP'),
 ('07-21', '(21) 99999-1234', 'https://api.rioalimentos.com', 'Rio Alimentos', 'Rio de Janeiro, RJ'),
 ('09-20', '(31) 91234-5678', 'https://api.bhmineiros.com', 'BH Mineiros', 'Belo Horizonte, MG'),
 ('06-23', '(51) 94567-8910', 'https://api.gauchomarket.com', 'Gaúcho Market', 'Porto Alegre, RS'),
 ('08-21', '(41) 99876-5432', 'https://api.curitibamercearia.com', 'Curitiba Mercearia', 'Curitiba, PR'),
 ('08-22', '(71) 98765-1010', 'https://api.bahiasuper.com', 'Bahia Super', 'Salvador, BA'),
 ('07-22', '(85) 99911-2233', 'https://api.cearamercantil.com', 'Ceará Mercantil', 'Fortaleza, CE');
 
 INSERT INTO historico_consumo (produto_id,usuario_id, quantidade_gramas, motivo, local_stl)
 VALUES
 (1, 3, 500.25, 'Dieta', 'São Paulo/mercado/modelo1.stl'),
 (5, 8, 250.50, 'Dieta', 'Rio de Janeiro/mercado/modelo2.stl'),
 (10, 15, 300.75, 'Compulsão', 'Belo Horizonte/mercado/modelo3.stl'),
 (12, 20, 450.30, 'Higiene', 'Porto Alegre/mercado/modelo4.stl'),
 (7, 9, 100.20, 'Consumo', 'Curitiba/mercado/modelo5.stl'),
 (18, 6, 600.00, 'Higiene', 'Salvador/mercado/modelo6.stl'),
 (4, 2, 350.15, 'Dieta', 'Recife/mercado/modelo7.stl'),
 (9, 1, 520.80, 'Consumo', 'Fortaleza/mercado/modelo8.stl'),
 (14, 4, 220.60, 'Higiene', 'Brasília/mercado/modelo9.stl'),
 (6, 12, 415.45, 'Consumo', 'Goiânia/mercado/modelo10.stl'),
 (3, 7, 180.50, 'Dieta', 'Vitória/mercado/modelo11.stl'),
 (11, 5, 140.90, 'Higiene', 'Manaus/mercado/modelo12.stl'),
 (20, 11, 370.00, 'Dieta', 'Florianópolis/mercado/modelo13.stl'),
 (13, 18, 255.75, 'Higiene', 'Maceió/mercado/modelo14.stl'),
 (2, 10, 480.35, 'Dieta', 'João Pessoa/mercado/modelo15.stl'),
 (8, 17, 600.00, 'Consumo', 'Natal/mercado/modelo16.stl'),
 (15, 14, 310.25, 'Higiene', 'Campo Grande/mercado/modelo17.stl'),
 (16, 19, 280.40, 'Higiene', 'Belém/mercado/modelo18.stl'),
 (30, 16, 200.50, 'Compulsão', 'Macapá/mercado/modelo19.stl'),
 (25, 13, 100.25, 'Compulsão', 'Cuiabá/mercado/modelo20.stl'),
 (22, 2, 450.60, 'Consumo', 'Aracaju/mercado/modelo21.stl'),
 (27, 8, 500.35, 'Compulsão', 'São Luís/mercado/modelo22.stl'),
 (19, 1, 320.80, 'Dieta', 'Porto Velho/mercado/modelo23.stl'),
 (24, 6, 490.00, 'Dieta', 'Rio Branco/mercado/modelo24.stl'),
 (17, 9, 360.45, 'Higiene', 'Boa Vista/mercado/modelo25.stl'),
 (21, 15, 210.25, 'Dieta', 'Palmas/mercado/modelo26.stl'),
 (29, 3, 375.30, 'Dieta', 'Teresina/mercado/modelo27.stl'),
 (12, 5, 200.50, 'Higiene','São Paulo/mercado/modelo1.stl'),
(8, 12, 300.00, 'Consumo','Rio de Janeiro/mercado/modelo1.stl'),
(15, 5, 450.25,  'Higiene','Curitiba/mercado/modelo1.stl'),
(30, 6, 100.75, 'Consumo', 'Fortaleza/mercado/modelo1.stl'),
(7, 20, 250.00, 'Consumo','Manaus/mercado/modelo1.stl'),
(19, 6, 500.00,  'Dieta','Brasília/mercado/modelo1.stl'),
(4, 5, 150.50,  'Dieta','Belo Horizonte/mercado/modelo1.stl'),
(28, 12, 320.00,  'Consumo','Recife/mercado/modelo1.stl'),
(9, 5, 120.35,  'Consumo','Salvador/mercado/modelo1.stl'),
(11, 7, 220.80,  'Higiene','São Bernardo/mercado/modelo1.stl'),
(13, 5, 340.50,  'Higiene','Campinas/mercado/modelo1.stl'),
(22, 19, 180.00,  'Dieta','Porto Alegre/mercado/modelo1.stl'),
(18, 6, 390.75, 'Higiene', 'João Pessoa/mercado/modelo1.stl'),
(2, 15, 410.90, 'Dieta', 'Natal/mercado/modelo1.stl'),
(25, 5, 205.20,  'Consumo','Maceió/mercado/modelo1.stl'),
(6, 13, 275.65, 'Consumo', 'Aracaju/mercado/modelo1.stl'),
(29, 6, 360.30, 'Consumo', 'Belém/mercado/modelo1.stl'),
(21, 5, 415.00,  'Dieta','Florianópolis/mercado/modelo1.stl'),
(1, 18, 295.15,  'Dieta','Goiânia/mercado/modelo1.stl'),
(30, 17, 320.40,  'Consumo','Vitória/mercado/modelo1.stl'),
(3, 3, 450.75,  'Dieta','São Luís/mercado/modelo1.stl'),
(14, 5, 280.55,  'Higiene','Teresina/mercado/modelo1.stl'),
(10, 5, 330.00, 'Compulsão', 'Macapá/mercado/modelo1.stl'),
(20, 1, 140.45,  'Dieta','Boa Vista/mercado/modelo1.stl'),
(16, 6, 310.75, 'Higiene', 'Palmas/mercado/modelo1.stl'),
(26, 15, 220.80,  'Consumo','Cuiabá/mercado/modelo1.stl'),
(27, 20, 180.25,  'Compulsão','Campo Grande/mercado/modelo1.stl'),
(30, 5, 200.60,  'Consumo','Porto Velho/mercado/modelo1.stl'),
(8, 4, 330.45,  'Dieta','Rio Branco/mercado/modelo1.stl'),
(12, 7, 410.90, 'Higiene', 'Santarém/mercado/modelo1.stl'),
(24, 12, 240.00, 'Dieta', 'Marabá/mercado/modelo1.stl'),
(11, 19, 150.50, 'Higiene', 'Itabuna/mercado/modelo1.stl'),
(17, 5, 350.35, 'Higiene', 'Franca/mercado/modelo1.stl');
 
 INSERT INTO pedido (usuario_id, mercado_id, status, total)
 VALUES
 (1, 3, 'Concluído', 150.75),
 (2, 5, 'Pendente', 250.40),
 (3, 2, 'Cancelado', 125.99),
 (4, 7, 'Concluído', 99.90),
 (5, 1, 'Pendente', 300.50),
 (6, 4, 'Concluído', 200.00),
 (7, 6, 'Em Andamento', 89.99),
 (8, 3, 'Concluído', 150.00),
 (9, 5, 'Cancelado', 50.25),
 (10, 2, 'Pendente', 175.30),
 (11, 4, 'Concluído', 400.00),
 (12, 1, 'Em Andamento', 215.80),
 (13, 7, 'Pendente', 325.45),
 (14, 6, 'Concluído', 275.99),
 (15, 3, 'Em Andamento', 150.75),
 (16, 5, 'Concluído', 349.90),
 (17, 2, 'Pendente', 240.00),
 (18, 4, 'Cancelado', 500.00),
 (19, 1, 'Concluído', 199.99),
 (20, 7, 'Em Andamento', 299.50),
 (6, 3, 'Pendente', 179.75),
 (8, 5, 'Concluído', 220.30),
 (10, 2, 'Cancelado', 99.99),
 (12, 4, 'Pendente', 125.50),
 (14, 1, 'Concluído', 189.40),
 (16, 6, 'Em Andamento', 280.75),
 (18, 7, 'Cancelado', 350.00),
 (3, 4, 'Concluído', 120.45),
 (7, 1, 'Pendente', 315.60),
 (11, 6, 'Em Andamento', 200.25),
 (14, 5, 'Cancelado', 150.75),
 (20, 2, 'Concluído', 275.30),
 #alisson
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
 
 INSERT INTO pedido_produto (pedido_id, produto_id)
 VALUES
 (1, 10),
 (2, 5),
 (3, 15),
 (4, 20),
 (5, 8),
 (6, 25),
 (7, 12),
 (8, 18),
 (9, 3),
 (10, 14),
 (11, 9),
 (12, 22),
 (13, 6),
 (14, 30),
 (15, 7),
 (16, 19),
 (17, 4),
 (18, 11),
 (19, 24),
 (20, 1),
 (21, 16),
 (22, 2),
 (23, 21),
 (24, 13),
 (25, 27),
 (26, 17),
 (27, 23),
 (28, 26),
 (29, 28),
 (30, 29),
 (31, 20),
 (32, 5),
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
(35, 30),
(19, 27),
(42, 2),
(55, 17),
(9, 23),
(14, 5),
(24, 30);





 
 
 #ANALISES ROGER 
 select * from metas_nutricionias;
select * from historico_consumo;
select * from mercado;
select * from notificacoes;
select * from pedido;
select * from produto;
select * from pedido_produto;
select * from usuario;

#1) ANALISE DE CONSUMO

-- TODOS OS CONSUMOS DE ALIMENTOS COM DUPLICADOS
SELECT historico_consumo.historico_id, historico_consumo.usuario_id, produto.nome, produto.categoria, historico_consumo.motivo 
FROM produto
INNER JOIN historico_consumo ON produto.produto_id = historico_consumo.produto_id ;

-- TODOS OS CONSUMOS DE ALIMENTO = 42
SELECT COUNT(historico_id) as Todos_Consumos from historico_consumo WHERE motivo <> 'Higiene'; 


-- CONTAGEM DE QUANTIDADE DE CONSUMO DIETA DOS USUÁRIOS = deu 20
SELECT COUNT(historico_consumo.usuario_id) as Seguiu_Dieta
FROM produto
INNER JOIN historico_consumo ON produto.produto_id = historico_consumo.produto_id
WHERE (produto.categoria = 'Alimento' OR produto.categoria = 'Bebida') AND historico_consumo.motivo = 'Dieta' ;

-- CONTAGEM DE QUANTIDADE DE CONSUMO CORRETO DOS USUÁRIOS = deu 36
SELECT COUNT(historico_consumo.usuario_id) as Alguns_erros
FROM produto
INNER JOIN historico_consumo ON produto.produto_id = historico_consumo.produto_id
WHERE (produto.categoria = 'Alimento' OR produto.categoria = 'Bebida') AND historico_consumo.motivo <> 'Compulsão';


-- CONTAGEM DE QUANTIDADE DE CONSUMO INcorreto DOS USUÁRIOS = deu 6 só tiveram HÁBITO COMPULSIVO.
SELECT COUNT(historico_consumo.usuario_id) as compulsivos
FROM produto
INNER JOIN historico_consumo ON produto.produto_id = historico_consumo.produto_id
WHERE (produto.categoria = 'Alimento' OR produto.categoria = 'Bebida') AND historico_consumo.motivo = 'Compulsão';


#2) ANALISE DE DISPERDICIO

-- TODOS CONSUMOS E QUANTIDADE 
SELECT produto.produto_id, produto.nome, produto.quantidade, produto.unidade, historico_consumo.quantidade_gramas
FROM produto
INNER JOIN historico_consumo ON produto.produto_id = historico_consumo.produto_id ;