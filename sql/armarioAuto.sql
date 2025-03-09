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
CREATE TABLE notificacoes (
	notificacoes_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    tipo VARCHAR(20),
    mensagem text,
    status VARCHAR(10),
    data_envio DATE,
    local VARCHAR(20),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
    
    #COLOCAR DEPOIS
#	CREATE TABLE pedido_produto(
#	pedido_id INT,
#	produto_id INT,
#	FOREIGN KEY (pedido_id) REFERENCES pedido (pedido_id),
#	FOREIGN KEY (produto_id) REFERENCES produto (produto_id),
#	);

CREATE TABLE historico_consumo(
	historico_id INT AUTO_INCREMENT PRIMARY KEY,
	produto_id INT,
	usuario INT,
	quantidade_gramas DECIMAL(5,2),
	arquivo_atual_criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	arquivo_atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	local_stl varchar(80)
);

SHOW TABLES;

ALTER TABLE usuario
ADD criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE usuario
ADD atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

