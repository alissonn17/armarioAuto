CREATE DATABASE armarioauto;

USE armarioauto;

CREATE TABLE usuario(
usuario_id int primary key auto_increment not null,
nome varchar(50),
email varchar(50),
senha varchar(20) not null,
saldo_cashback decimal(10, 2)
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
    local VARCHAR(20)
    )
    