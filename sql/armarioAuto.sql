CREATE DATABASE armarioauto;

USE armarioauto;

CREATE TABLE usuario(
usuario_id int primary key auto_increment not null,
nome varchar(50),
email varchar(50),
senha varchar(20) not null,
saldo_cashback decimal(10, 2)
)