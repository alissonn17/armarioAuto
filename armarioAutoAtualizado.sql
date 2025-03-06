USE armarioauto;

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

