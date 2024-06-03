CREATE TABLE cliente (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL, 
telefone VARCHAR(20),
email VARCHAR(60) UNIQUE,
cpf VARCHAR(11) UNIQUE
);

CREATE TABLE estabelecimento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL,
telefone VARCHAR(20),
cnpj VARCHAR(20) UNIQUE,
descricao VARCHAR(200)
);

CREATE TABLE endereco(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
rua VARCHAR(60),
bairro VARCHAR(60),
cidade VARCHAR(60),
numero VARCHAR(10),
complemento VARCHAR(60),
ID_cliente INT,
ID_estabelecimento INT
);

CREATE TABLE produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL,
preco DECIMAL (10,2),
descricao VARCHAR(60),
ID_estabelecimento INT,
ID_categoria_produto INT
);

CREATE TABLE categoria_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL,
descricao VARCHAR(200)
);

CREATE TABLE pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
taxa_entrega DECIMAL(10,2),
valor_total DECIMAL(10,2),
descricao VARCHAR(200),
ID_endereco INT ,
ID_cliente INT,
ID_status_pedido INT
);

CREATE TABLE pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
valor DECIMAL(10,2),
data_hora DATETIME,
ID_pedido INT,
ID_metado_pagamento INT
);

CREATE TABLE metado_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL,
descricao VARCHAR(200)
);

CREATE TABLE status_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL,
descricao VARCHAR(200)
);

CREATE TABLE status_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60) NOT NULL,
descricao VARCHAR(200)
);

CREATE TABLE historico_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
ID_pedido INT,
ID_status_pedido INT
);

CREATE TABLE historico_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
ID_pagamento INT,
ID_status_pagamento INT
);

CREATE TABLE funcionamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
dia INT,
hora_abrir INT,
hora_fechar INT,
ID_estabelecimento INT
);

ALTER TABLE endereco
ADD CONSTRAINT cliente_FK
FOREIGN KEY (ID_cliente) REFERENCES cliente(ID);

ALTER TABLE endereco
ADD CONSTRAINT estabelecimento_FK
FOREIGN KEY (ID_estabelecimento) REFERENCES estabelecimento(ID);

ALTER TABLE produto
ADD CONSTRAINT estabelecimento_produto_FK
FOREIGN KEY (ID_estabelecimento) REFERENCES estabelecimento(ID);

ALTER TABLE produto
ADD CONSTRAINT categoria_produto_FK
FOREIGN KEY (ID_categoria_produto) REFERENCES categoria_produto(ID);

ALTER TABLE pagamento
ADD CONSTRAINT pedido_fk
FOREIGN KEY (ID_pedido) REFERENCES pedido(ID);

ALTER TABLE pagamento
ADD CONSTRAINT metado_pagamento_FK
FOREIGN KEY (ID_metado_pagamento) REFERENCES metado_pagamento(ID);

ALTER TABLE pedido
ADD CONSTRAINT endereco_FK
FOREIGN KEY (ID_endereco) REFERENCES endereco(ID);

ALTER TABLE pedido
ADD CONSTRAINT pedido_cliente_FK
FOREIGN KEY (ID_cliente) REFERENCES cliente(ID);

ALTER TABLE pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (ID_status_pedido) REFERENCES status_pedido(ID);

ALTER TABLE historico_pedido
ADD CONSTRAINT hist_pedido_FK
FOREIGN KEY (ID_pedido) REFERENCES pedido(ID);

ALTER TABLE historico_pedido
ADD CONSTRAINT hist_status_pedido_FK
FOREIGN KEY (ID_status_pedido) REFERENCES status_pedido(ID);

ALTER TABLE historico_pagamento
ADD CONSTRAINT pagamento_FK
FOREIGN KEY (ID_pagamento) REFERENCES pagamento(ID);

ALTER TABLE historico_pagamento
ADD CONSTRAINT status_pagamento_FK
FOREIGN KEY (ID_status_pagamento) REFERENCES status_pagamento(ID);

ALTER TABLE funcionamento
ADD CONSTRAINT func_estabelecimento_FK
FOREIGN KEY (ID_estabelecimento) REFERENCES estabelecimento(ID);

INSERT INTO cliente (date_Create, status, nome, telefone, email, cpf) VALUES 
('2023-01-15 10:15:00', 1, 'João Silva', '81999990001', 'joao1@example.com', '12345678901'), 
('2023-02-20 11:30:00', 1, 'Maria Souza', '81999990002', 'maria2@example.com', '12345678902'), 
('2023-03-25 09:45:00', 1, 'Carlos Pereira', '81999990003', 'carlos3@example.com', '12345678903'), 
('2023-04-10 14:00:00', 1, 'Ana Oliveira', '81999990004', 'ana4@example.com', '12345678904'), 
('2023-05-05 16:30:00', 1, 'Paulo Santos', '81999990005', 'paulo5@example.com', '12345678905'), 
('2023-06-18 08:20:00', 1, 'Claudia Lima', '81999990006', 'claudia6@example.com', '12345678906'), 
('2023-07-22 13:50:00', 1, 'Roberto Costa', '81999990007', 'roberto7@example.com', '12345678907'), 
('2023-08-14 12:00:00', 1, 'Juliana Mendes', '81999990008', 'juliana8@example.com', '12345678908'), 
('2023-09-09 15:30:00', 1, 'Fernanda Almeida', '81999990009', 'fernanda9@example.com', '12345678909'), 
('2023-10-29 11:15:00', 1, 'Ricardo Nascimento', '81999990010', 'ricardo10@example.com', '12345678910'), 
('2023-11-23 10:45:00', 1, 'Lucas Lima', '81999990011', 'lucas11@example.com', '12345678911'), 
('2023-12-18 17:00:00', 1, 'Mariana Rocha', '81999990012', 'mariana12@example.com', '12345678912'), 
('2024-01-12 09:30:00', 1, 'Thiago Barbosa', '81999990013', 'thiago13@example.com', '12345678913'), 
('2024-02-16 14:45:00', 1, 'Camila Correia', '81999990014', 'camila14@example.com', '12345678914'), 
('2024-03-20 16:15:00', 1, 'Fernando Araújo', '81999990015', 'fernando15@example.com', '12345678915'), 
('2024-04-25 13:30:00', 1, 'Patricia Gomes', '81999990016', 'patricia16@example.com', '12345678916'), 
('2024-05-28 11:00:00', 1, 'Rodrigo Costa', '81999990017', 'rodrigo17@example.com', '12345678917'), 
('2024-06-03 08:45:00', 1, 'Aline Dias', '81999990018', 'aline18@example.com', '12345678918'), 
('2024-07-08 12:30:00', 1, 'Felipe Alves', '81999990019', 'felipe19@example.com', '12345678919'), 
('2024-08-12 15:00:00', 1, 'Viviane Silva', '81999990020', 'viviane20@example.com', '12345678920'), 
('2024-09-16 09:15:00', 1, 'André Sousa', '81999990021', 'andre21@example.com', '12345678921'), 
('2024-10-21 14:30:00', 1, 'Laura Mendes', '81999990022', 'laura22@example.com', '12345678922'), 
('2024-11-25 13:00:00', 1, 'Gustavo Nunes', '81999990023', 'gustavo23@example.com', '12345678923'), 
('2024-12-30 16:45:00', 1, 'Luciana Ribeiro', '81999990024', 'luciana24@example.com', '12345678924'), 
('2023-01-10 08:20:00', 1, 'Rafael Lima', '81999990025', 'rafael25@example.com', '12345678925'), 
('2023-02-14 10:30:00', 1, 'Simone Oliveira', '81999990026', 'simone26@example.com', '12345678926'), 
('2023-03-18 13:45:00', 1, 'Daniela Batista', '81999990027', 'daniela27@example.com', '12345678927'), 
('2023-04-22 15:00:00', 1, 'Igor Souza', '81999990028', 'igor28@example.com', '12345678928'), 
('2023-05-26 09:45:00', 1, 'Bianca Ferreira', '81999990029', 'bianca29@example.com', '12345678929'),
('2023-06-30 11:15:00', 1, 'Matheus Rocha', '81999990030', 'matheus30@example.com', '12345678930');

INSERT INTO estabelecimento (date_Create, status, nome, telefone, cnpj, descricao) VALUES
('2023-01-01 09:00:00', 1, 'Bebidas & Cia', '81999990000', '12345678000101', 'Estabelecimento especializado em bebidas de todos os tipos.');

INSERT INTO endereco (date_Create, status, rua, bairro, cidade, numero, complemento, ID_cliente, ID_estabelecimento) VALUES 
('2023-01-05 10:15:00', 1, 'Rua A', 'Centro', 'Arcoverde', '100', 'Apto 1', 1, 1), 
('2023-02-10 11:30:00', 1, 'Rua B', 'Centro', 'Buíque', '101', 'Apto 2', 2, 1), 
('2023-03-15 09:45:00', 1, 'Rua C', 'Centro', 'Pedra', '102', 'Apto 3', 3, 1), 
('2023-04-20 14:00:00', 1, 'Rua D', 'Centro', 'Tupanatinga', '103', 'Apto 4', 4, 1), 
('2023-05-25 16:30:00', 1, 'Rua E', 'Centro', 'Itaíba', '104', 'Apto 5', 5, 1), 
('2023-06-30 08:20:00', 1, 'Rua F', 'Centro', 'Pesqueira', '105', 'Apto 6', 6, 1), 
('2023-07-05 13:50:00', 1, 'Rua G', 'Centro', 'Arcoverde', '106', 'Apto 7', 7, 1), 
('2023-08-10 12:00:00', 1, 'Rua H', 'Centro', 'Buíque', '107', 'Apto 8', 8, 1), 
('2023-09-15 15:30:00', 1, 'Rua I', 'Centro', 'Pedra', '108', 'Apto 9', 9, 1), 
('2023-10-20 11:15:00', 1, 'Rua J', 'Centro', 'Tupanatinga', '109', 'Apto 10', 10, 1), 
('2023-11-25 10:45:00', 1, 'Rua K', 'Centro', 'Itaíba', '110', 'Apto 11', 11, 1), 
('2023-12-30 17:00:00', 1, 'Rua L', 'Centro', 'Pesqueira', '111', 'Apto 12', 12, 1), 
('2024-01-04 09:30:00', 1, 'Rua M', 'Centro', 'Arcoverde', '112', 'Apto 13', 13, 1), 
('2024-02-09 14:45:00', 1, 'Rua N', 'Centro', 'Buíque', '113', 'Apto 14', 14, 1), 
('2024-03-16 16:15:00', 1, 'Rua O', 'Centro', 'Pedra', '114', 'Apto 15', 15, 1), 
('2024-04-21 13:30:00', 1, 'Rua P', 'Centro', 'Tupanatinga', '115', 'Apto 16', 16, 1), 
('2024-05-26 11:00:00', 1, 'Rua Q', 'Centro', 'Itaíba', '116', 'Apto 17', 17, 1), 
('2024-06-01 08:45:00', 1, 'Rua R', 'Centro', 'Pesqueira', '117', 'Apto 18', 18, 1), 
('2024-07-06 12:30:00', 1, 'Rua S', 'Centro', 'Arcoverde', '118', 'Apto 19', 19, 1), 
('2024-08-11 15:00:00', 1, 'Rua T', 'Centro', 'Buíque', '119', 'Apto 20', 20, 1), 
('2024-09-16 09:15:00', 1, 'Rua U', 'Centro', 'Pedra', '120', 'Apto 21', 21, 1), 
('2024-10-21 14:30:00', 1, 'Rua V', 'Centro', 'Tupanatinga', '121', 'Apto 22', 22, 1), 
('2024-11-26 13:00:00', 1, 'Rua W', 'Centro', 'Itaíba', '122', 'Apto 23', 23, 1), 
('2024-12-31 16:45:00', 1, 'Rua X', 'Centro', 'Pesqueira', '123', 'Apto 24', 24, 1), 
('2023-01-15 08:20:00', 1, 'Rua Y', 'Centro', 'Arcoverde', '124', 'Apto 25', 25, 1), 
('2023-02-20 10:30:00', 1, 'Rua Z', 'Centro', 'Buíque', '125', 'Apto 26', 26, 1), 
('2023-03-25 13:45:00', 1, 'Rua AA', 'Centro', 'Pedra', '126', 'Apto 27', 27, 1), 
('2023-04-30 15:00:00', 1, 'Rua BB', 'Centro', 'Tupanatinga', '127', 'Apto 28', 28, 1), 
('2023-05-10 09:45:00', 1, 'Rua CC', 'Centro', 'Itaíba', '128', 'Apto 29', 29, 1), 
('2023-06-15 11:15:00', 1, 'Rua DD', 'Centro', 'Pesqueira', '129', 'Apto 30', 30, 1);

INSERT INTO categoria_produto (date_Create, status, nome, descricao) VALUES
('2023-01-05 10:00:00', 1, 'Cervejas', 'Diversas marcas de cervejas'),
('2023-02-10 11:00:00', 1, 'Whiskys', 'Diversas marcas de whiskys'),
('2023-03-15 12:00:00', 1, 'Vodkas', 'Diversas marcas de vodkas'),
('2023-04-20 13:00:00', 1, 'Gins', 'Diversas marcas de gins'),
('2023-05-25 14:00:00', 1, 'Vinhos', 'Diversas marcas de vinhos'),
('2023-06-30 15:00:00', 1, 'Espumantes', 'Diversas marcas de espumantes'),
('2023-07-05 16:00:00', 1, 'Cachaças', 'Diversas marcas de cachaças'),
('2023-08-10 17:00:00', 1, 'Runs', 'Diversas marcas de runs'),
('2023-09-15 18:00:00', 1, 'Tequilas', 'Diversas marcas de tequilas'),
('2023-10-20 19:00:00', 1, 'Licores', 'Diversas marcas de licores'),
('2023-11-25 20:00:00', 1, 'Sucos', 'Diversos tipos de sucos'),
('2023-12-30 21:00:00', 1, 'Refrigerantes', 'Diversas marcas de refrigerantes'),
('2024-01-04 22:00:00', 1, 'Águas', 'Água mineral e com gás'),
('2024-02-09 23:00:00', 1, 'Energéticos', 'Diversas marcas de energéticos'),
('2024-03-16 10:00:00', 1, 'Tônicas', 'Diversas marcas de tônicas'),
('2024-04-21 11:00:00', 1, 'Água de Coco', 'Água de coco natural'),
('2024-05-26 12:00:00', 1, 'Chás', 'Diversos tipos de chás gelados');

INSERT INTO produto (date_Create, status, nome, preco, descricao, ID_estabelecimento, ID_categoria_produto) VALUES
('2023-01-05 10:00:00', 1, 'Cerveja Skol', 4.50, 'Lata 350ml', 1, 1),
('2023-02-10 11:00:00', 1, 'Cerveja Brahma', 5.00, 'Lata 350ml', 1, 1),
('2023-03-15 12:00:00', 1, 'Cerveja Heineken', 7.50, 'Long Neck 330ml', 1, 1),
('2023-04-20 13:00:00', 1, 'Cerveja Budweiser', 6.00, 'Long Neck 330ml', 1, 1),
('2023-05-25 14:00:00', 1, 'Cerveja Stella Artois', 8.00, 'Long Neck 330ml', 1, 1),
('2023-06-30 15:00:00', 1, 'Whisky Red Label', 90.00, 'Garrafa 1L', 1, 2),
('2023-07-05 16:00:00', 1, 'Whisky Jack Daniels', 120.00, 'Garrafa 1L', 1, 2),
('2023-08-10 17:00:00', 1, 'Vodka Smirnoff', 35.00, 'Garrafa 1L', 1, 3),
('2023-09-15 18:00:00', 1, 'Vodka Absolut', 75.00, 'Garrafa 1L', 1, 3),
('2023-10-20 19:00:00', 1, 'Gin Tanqueray', 110.00, 'Garrafa 1L', 1, 4),
('2023-11-25 20:00:00', 1, 'Vinho Casillero del Diablo', 50.00, 'Garrafa 750ml', 1, 5),
('2023-12-30 21:00:00', 1, 'Vinho Miolo', 45.00, 'Garrafa 750ml', 1, 5),
('2024-01-04 22:00:00', 1, 'Espumante Chandon', 120.00, 'Garrafa 750ml', 1, 6),
('2024-02-09 23:00:00', 1, 'Cachaça 51', 15.00, 'Garrafa 1L', 1, 7),
('2024-03-16 10:00:00', 1, 'Cachaça Ypióca', 20.00, 'Garrafa 1L', 1, 7),
('2024-04-21 11:00:00', 1, 'Rum Bacardi', 40.00, 'Garrafa 1L', 1, 8),
('2024-05-26 12:00:00', 1, 'Tequila Jose Cuervo', 90.00, 'Garrafa 750ml', 1, 9),
('2024-06-01 13:00:00', 1, 'Licor Amarula', 70.00, 'Garrafa 750ml', 1, 10),
('2024-07-06 14:00:00', 1, 'Suco de Laranja', 6.00, 'Garrafa 1L', 1, 11),
('2024-08-11 15:00:00', 1, 'Suco de Uva', 8.00, 'Garrafa 1L', 1, 11),
('2024-09-16 16:00:00', 1, 'Refrigerante Coca-Cola', 4.00, 'Lata 350ml', 1, 12),
('2024-10-21 17:00:00', 1, 'Refrigerante Guaraná', 4.00, 'Lata 350ml', 1, 12),
('2024-11-26 18:00:00', 1, 'Água Mineral', 2.00, 'Garrafa 500ml', 1, 13),
('2024-12-31 19:00:00', 1, 'Água com Gás', 3.00, 'Garrafa 500ml', 1, 13),
('2023-01-15 20:00:00', 1, 'Energético Red Bull', 10.00, 'Lata 250ml', 1, 14),
('2023-02-20 21:00:00', 1, 'Energético Monster', 8.00, 'Lata 350ml', 1, 14),
('2023-03-25 22:00:00', 1, 'Tônica Schweppes', 5.00, 'Lata 350ml', 1, 15),
('2023-04-30 23:00:00', 1, 'Água de Coco', 4.00, 'Caixa 1L', 1, 16),
('2023-05-10 10:00:00', 1, 'Chá Gelado Lipton', 4.50, 'Garrafa 1L', 1, 17),
('2023-06-15 11:00:00', 1, 'Chá Mate Leão', 3.50, 'Garrafa 1L', 1, 17);

INSERT INTO status_pedido (date_Create, status, nome, descricao) VALUES
('2023-01-01 10:00:00', 1, 'Pendente', 'Pedido pendente de confirmação'),
('2023-01-02 11:00:00', 1, 'Em Processamento', 'Pedido em processamento'),
('2023-01-03 12:00:00', 1, 'Aprovado', 'Pedido aprovado'),
('2023-01-04 13:00:00', 1, 'Rejeitado', 'Pedido rejeitado'),
('2023-01-05 14:00:00', 1, 'Em Análise', 'Pedido em análise'),
('2023-01-06 15:00:00', 1, 'Aguardando Pagamento', 'Aguardando pagamento'),
('2023-01-07 16:00:00', 1, 'Estornado', 'Pedido estornado'),
('2023-01-08 17:00:00', 1, 'Cancelado', 'Pedido cancelado'),
('2023-01-09 18:00:00', 1, 'Concluído', 'Pedido concluído'),
('2023-01-10 19:00:00', 1, 'Falha no Processamento', 'Falha no processamento do pedido'),
('2023-01-11 20:00:00', 1, 'Aguardando Autorização', 'Aguardando autorização do pedido'),
('2023-01-12 21:00:00', 1, 'Autorizado', 'Pedido autorizado'),
('2023-01-13 22:00:00', 1, 'Falha na Autorização', 'Falha na autorização do pedido'),
('2023-01-14 23:00:00', 1, 'Em Disputa', 'Pedido em disputa'),
('2023-01-15 10:00:00', 1, 'Aguardando Estorno', 'Aguardando estorno do pedido'),
('2023-01-16 11:00:00', 1, 'Estorno Processado', 'Estorno do pedido processado'),
('2023-01-17 12:00:00', 1, 'Aguardando Reembolso', 'Aguardando reembolso do pedido'),
('2023-01-18 13:00:00', 1, 'Reembolsado', 'Pedido reembolsado'),
('2023-01-19 14:00:00', 1, 'Aguardando Confirmação', 'Aguardando confirmação do pedido'),
('2023-01-20 15:00:00', 1, 'Parcialmente Estornado', 'Pedido parcialmente estornado'),
('2023-01-21 16:00:00', 1, 'Parcialmente Reembolsado', 'Pedido parcialmente reembolsado'),
('2023-01-22 17:00:00', 1, 'Em Revisão', 'Pedido em revisão'),
('2023-01-23 18:00:00', 1, 'Revisado', 'Pedido revisado'),
('2023-01-24 19:00:00', 1, 'Pago', 'Pedido pago'),
('2023-01-25 20:00:00', 1, 'Não Pago', 'Pedido não pago'),
('2023-01-26 21:00:00', 1, 'Atrasado', 'Pedido atrasado'),
('2023-01-27 22:00:00', 1, 'Cancelamento Processado', 'Processamento do cancelamento do pedido'),
('2023-01-28 23:00:00', 1, 'Pedido de Estorno', 'Pedido de estorno'),
('2023-01-29 10:00:00', 1, 'Estorno Parcial', 'Estorno parcial do pedido'),
('2023-01-30 11:00:00', 1, 'Estorno Rejeitado', 'Estorno do pedido rejeitado');

INSERT INTO pedido (date_Create, status, taxa_entrega, valor_total, descricao, ID_endereco, ID_cliente, ID_status_pedido) VALUES
('2023-01-05 10:00:00', 1, 5.00, 30.00, 'Pedido de cervejas', 1, 1, 1),
('2023-02-10 11:00:00', 1, 6.00, 45.00, 'Pedido de whiskys', 2, 2, 1),
('2023-03-15 12:00:00', 1, 4.00, 50.00, 'Pedido de vodkas', 3, 3, 1),
('2023-04-20 13:00:00', 1, 5.50, 80.00, 'Pedido de gins', 4, 4, 1),
('2023-05-25 14:00:00', 1, 6.00, 100.00, 'Pedido de vinhos', 5, 5, 1),
('2023-06-30 15:00:00', 1, 7.00, 150.00, 'Pedido de espumantes', 6, 6, 1),
('2023-07-05 16:00:00', 1, 5.00, 20.00, 'Pedido de cachaças', 7, 7, 1),
('2023-08-10 17:00:00', 1, 4.00, 40.00, 'Pedido de runs', 8, 8, 1),
('2023-09-15 18:00:00', 1, 5.50, 60.00, 'Pedido de tequilas', 9, 9, 1),
('2023-10-20 19:00:00', 1, 6.00, 80.00, 'Pedido de licores', 10, 10, 1),
('2023-11-25 20:00:00', 1, 4.00, 10.00, 'Pedido de sucos', 11, 11, 1),
('2023-12-30 21:00:00', 1, 5.50, 8.00, 'Pedido de refrigerantes', 12, 12, 1),
('2024-01-04 22:00:00', 1, 6.00, 5.00, 'Pedido de águas', 13, 13, 1),
('2024-02-09 23:00:00', 1, 7.00, 20.00, 'Pedido de energéticos', 14, 14, 1),
('2024-03-16 10:00:00', 1, 5.00, 10.00, 'Pedido de tônicas', 15, 15, 1),
('2024-04-21 11:00:00', 1, 6.00, 4.00, 'Pedido de água de coco', 16, 16, 1),
('2024-05-26 12:00:00', 1, 7.00, 9.00, 'Pedido de chás', 17, 17, 1),
('2024-06-01 13:00:00', 1, 4.50, 20.00, 'Pedido de cervejas', 18, 18, 1),
('2024-07-06 14:00:00', 1, 5.50, 40.00, 'Pedido de whiskys', 19, 19, 1),
('2024-08-11 15:00:00', 1, 6.00, 50.00, 'Pedido de vodkas', 20, 20, 1),
('2024-09-16 16:00:00', 1, 7.00, 75.00, 'Pedido de gins', 21, 21, 1),
('2024-10-21 17:00:00', 1, 4.00, 90.00, 'Pedido de vinhos', 22, 22, 1),
('2024-11-26 18:00:00', 1, 5.00, 110.00, 'Pedido de espumantes', 23, 23, 1),
('2024-12-31 19:00:00', 1, 6.50, 15.00, 'Pedido de cachaças', 24, 24, 1),
('2023-01-15 20:00:00', 1, 7.00, 30.00, 'Pedido de runs', 25, 25, 1),
('2023-02-20 21:00:00', 1, 5.50, 50.00, 'Pedido de tequilas', 26, 26, 1),
('2023-03-25 22:00:00', 1, 4.50, 70.00, 'Pedido de licores', 27, 27, 1),
('2023-04-30 23:00:00', 1, 6.00, 10.00, 'Pedido de sucos', 28, 28, 1),
('2023-05-10 10:00:00', 1, 5.50, 5.00, 'Pedido de refrigerantes', 29, 29, 1),
('2023-06-15 11:00:00', 1, 6.00, 3.00, 'Pedido de águas', 30, 30, 1);

INSERT INTO pagamento (date_Create, status, valor, data_hora, ID_pedido, ID_metado_pagamento) VALUES
('2023-01-05 10:15:00', 1, 30.00, '2023-01-05 10:15:00', 1, 1),
('2023-02-10 11:30:00', 1, 45.00, '2023-02-10 11:30:00', 2, 2),
('2023-03-15 12:45:00', 1, 50.00, '2023-03-15 12:45:00', 3, 3),
('2023-04-20 13:15:00', 1, 80.00, '2023-04-20 13:15:00', 4, 4),
('2023-05-25 14:30:00', 1, 100.00, '2023-05-25 14:30:00',5, 5),
('2023-06-30 15:45:00', 1, 150.00, '2023-06-30 15:45:00', 6, 5),
('2023-07-05 16:15:00', 1, 20.00, '2023-07-05 16:15:00', 7, 6),
('2023-08-10 17:30:00', 1, 40.00, '2023-08-10 17:30:00', 8, 7),
('2023-09-15 18:45:00', 1, 60.00, '2023-09-15 18:45:00', 9, 8),
('2023-10-20 19:15:00', 1, 80.00, '2023-10-20 19:15:00', 10, 9),
('2023-11-25 20:30:00', 1, 10.00, '2023-11-25 20:30:00', 11, 10),
('2023-12-30 21:45:00', 1, 8.00, '2023-12-30 21:45:00', 12, 11),
('2024-01-04 22:15:00', 1, 5.00, '2024-01-04 22:15:00', 13, 12),
('2024-02-09 23:30:00', 1, 20.00, '2024-02-09 23:30:00', 14, 13),
('2024-03-16 10:45:00', 1, 10.00, '2024-03-16 10:45:00', 15, 14),
('2024-04-21 11:15:00', 1, 4.00, '2024-04-21 11:15:00', 16, 15),
('2024-05-26 12:30:00', 1, 9.00, '2024-05-26 12:30:00', 17, 16),
('2024-06-01 13:45:00', 1, 20.00, '2024-06-01 13:45:00', 18, 1),
('2024-07-06 14:15:00', 1, 40.00, '2024-07-06 14:15:00', 19, 2),
('2024-08-11 15:30:00', 1, 50.00, '2024-08-11 15:30:00', 20, 3),
('2024-09-16 16:45:00', 1, 75.00, '2024-09-16 16:45:00', 21, 4),
('2024-10-21 17:15:00', 1, 90.00, '2024-10-21 17:15:00', 22, 5),
('2024-11-26 18:30:00', 1, 110.00, '2024-11-26 18:30:00', 23, 6),
('2024-12-31 19:45:00', 1, 15.00, '2024-12-31 19:45:00', 24, 7),
('2023-01-15 20:15:00', 1, 30.00, '2023-01-15 20:15:00', 25, 8),
('2023-02-20 21:30:00', 1, 50.00, '2023-02-20 21:30:00', 26, 9),
('2023-03-25 22:45:00', 1, 70.00, '2023-03-25 22:45:00', 27, 10),
('2023-04-30 23:15:00', 1, 10.00, '2023-04-30 23:15:00', 28, 11),
('2023-05-10 10:30:00', 1, 5.00, '2023-05-10 10:30:00', 29, 12),
('2023-06-15 11:45:00', 1, 3.00, '2023-06-15 11:45:00', 30, 13);

INSERT INTO historico_pedido (date_Create, status, ID_pedido, ID_status_pedido) VALUES
('2023-01-05 10:05:00', 1, 1, 1),
('2023-02-10 11:05:00', 1, 2, 2),
('2023-03-15 12:05:00', 1, 3, 3),
('2023-04-20 13:05:00', 1, 4, 4),
('2023-05-25 14:05:00', 1, 5, 1),
('2023-06-30 15:05:00', 1, 6, 2),
('2023-07-05 16:05:00', 1, 7, 3),
('2023-08-10 17:05:00', 1, 8, 4),
('2023-09-15 18:05:00', 1, 9, 1),
('2023-10-20 19:05:00', 1, 10, 2),
('2023-11-25 20:05:00', 1, 11, 3),
('2023-12-30 21:05:00', 1, 12, 4),
('2024-01-04 22:05:00', 1, 13, 1),
('2024-02-09 23:05:00', 1, 14, 2),
('2024-03-16 10:05:00', 1, 15, 3),
('2024-04-21 11:05:00', 1, 16, 4),
('2024-05-26 12:05:00', 1, 17, 1),
('2024-06-01 13:05:00', 1, 18, 2),
('2024-07-06 14:05:00', 1, 19, 3),
('2024-08-11 15:05:00', 1, 20, 4),
('2024-09-16 16:05:00', 1, 21, 1),
('2024-10-21 17:05:00', 1, 22, 2),
('2024-11-26 18:05:00', 1, 23, 3),
('2024-12-31 19:05:00', 1, 24, 4),
('2023-01-15 20:05:00', 1, 25, 1),
('2023-02-20 21:05:00', 1, 26, 2),
('2023-03-25 22:05:00', 1, 27, 3),
('2023-04-30 23:05:00', 1, 28, 4),
('2023-05-10 10:05:00', 1, 29, 1),
('2023-06-15 11:05:00', 1, 30, 2);

INSERT INTO historico_pagamento (date_Create, status, ID_pagamento, ID_status_pagamento) VALUES
('2023-01-05 10:20:00', 1, 1, 1),
('2023-02-10 11:35:00', 1, 2, 2),
('2023-03-15 12:50:00', 1, 3, 3),
('2023-04-20 13:20:00', 1, 4, 4),
('2023-05-25 14:35:00', 1, 5, 5),
('2023-06-30 15:50:00', 1, 6, 1),
('2023-07-05 16:20:00', 1, 7, 2),
('2023-08-10 17:35:00', 1, 8, 3),
('2023-09-15 18:50:00', 1, 9, 4),
('2023-10-20 19:20:00', 1, 10, 5),
('2023-11-25 20:35:00', 1, 11, 1),
('2023-12-30 21:50:00', 1, 12, 2),
('2024-01-04 22:20:00', 1, 13, 3),
('2024-02-09 23:35:00', 1, 14, 4),
('2024-03-16 10:50:00', 1, 15, 5),
('2024-04-21 11:20:00', 1, 16, 1),
('2024-05-26 12:35:00', 1, 17, 2),
('2024-06-01 13:50:00', 1, 18, 3),
('2024-07-06 14:20:00', 1, 19, 4),
('2024-08-11 15:35:00', 1, 20, 5),
('2024-09-16 16:50:00', 1, 21, 1),
('2024-10-21 17:20:00', 1, 22, 2),
('2024-11-26 18:35:00', 1, 23, 3),
('2024-12-31 19:50:00', 1, 24, 4),
('2023-01-15 20:20:00', 1, 25, 5),
('2023-02-20 21:35:00', 1, 26, 1),
('2023-03-25 22:50:00', 1, 27, 2),
('2023-04-30 23:20:00', 1, 28, 3),
('2023-05-10 10:35:00', 1, 29, 4),
('2023-06-15 11:50:00', 1, 30, 5);

INSERT INTO funcionamento (date_Create, status, dia, hora_abrir, hora_fechar, ID_estabelecimento) VALUES
('2023-01-01 00:00:00', 1, 1, 8, 20, 1),
('2023-01-02 00:00:00', 1, 2, 8, 20, 1),
('2023-01-03 00:00:00', 1, 3, 8, 20, 1),
('2023-01-04 00:00:00', 1, 4, 8, 20, 1),
('2023-01-05 00:00:00', 1, 5, 8, 20, 1),
('2023-01-06 00:00:00', 1, 6, 10, 22, 1),
('2023-01-07 00:00:00', 1, 7, 10, 22, 1),
('2023-01-08 00:00:00', 1, 1, 8, 20, 1),
('2023-01-09 00:00:00', 1, 2, 8, 20, 1),
('2023-01-10 00:00:00', 1, 3, 8, 20, 1),
('2023-01-11 00:00:00', 1, 4, 8, 20, 1),
('2023-01-12 00:00:00', 1, 5, 8, 20, 1),
('2023-01-13 00:00:00', 1, 6, 10, 22, 1),
('2023-01-14 00:00:00', 1, 7, 10, 22, 1),
('2023-01-15 00:00:00', 1, 1, 8, 20, 1),
('2023-01-16 00:00:00', 1, 2, 8, 20, 1),
('2023-01-17 00:00:00', 1, 3, 8, 20, 1),
('2023-01-18 00:00:00', 1, 4, 8, 20, 1),
('2023-01-19 00:00:00', 1, 5, 8, 20, 1),
('2023-01-20 00:00:00', 1, 6, 10, 22, 1),
('2023-01-21 00:00:00', 1, 7, 10, 22, 1),
('2023-01-22 00:00:00', 1, 1, 8, 20, 1),
('2023-01-23 00:00:00', 1, 2, 8, 20, 1),
('2023-01-24 00:00:00', 1, 3, 8, 20, 1),
('2023-01-25 00:00:00', 1, 4, 8, 20, 1),
('2023-01-26 00:00:00', 1, 5, 8, 20, 1),
('2023-01-27 00:00:00', 1, 6, 10, 22, 1),
('2023-01-28 00:00:00', 1, 7, 10, 22, 1),
('2023-01-29 00:00:00', 1, 1, 8, 20, 1),
('2023-01-30 00:00:00', 1, 2, 8, 20, 1);

INSERT INTO status_pagamento (date_Create, status, nome, descricao) VALUES
('2023-01-01 10:00:00', 1, 'Pendente', 'Pagamento pendente de confirmação'),
('2023-01-02 11:00:00', 1, 'Em Processamento', 'Pagamento em processamento'),
('2023-01-03 12:00:00', 1, 'Aprovado', 'Pagamento aprovado'),
('2023-01-04 13:00:00', 1, 'Rejeitado', 'Pagamento rejeitado'),
('2023-01-05 14:00:00', 1, 'Em Análise', 'Pagamento em análise'),
('2023-01-06 15:00:00', 1, 'Aguardando Pagamento', 'Aguardando pagamento'),
('2023-01-07 16:00:00', 1, 'Estornado', 'Pagamento estornado'),
('2023-01-08 17:00:00', 1, 'Cancelado', 'Pagamento cancelado'),
('2023-01-09 18:00:00', 1, 'Concluído', 'Pagamento concluído'),
('2023-01-10 19:00:00', 1, 'Falha no Processamento', 'Falha no processamento do pagamento'),
('2023-01-11 20:00:00', 1, 'Aguardando Autorização', 'Aguardando autorização do pagamento'),
('2023-01-12 21:00:00', 1, 'Autorizado', 'Pagamento autorizado'),
('2023-01-13 22:00:00', 1, 'Falha na Autorização', 'Falha na autorização do pagamento'),
('2023-01-14 23:00:00', 1, 'Em Disputa', 'Pagamento em disputa'),
('2023-01-15 10:00:00', 1, 'Aguardando Estorno', 'Aguardando estorno do pagamento'),
('2023-01-16 11:00:00', 1, 'Estorno Processado', 'Estorno do pagamento processado'),
('2023-01-17 12:00:00', 1, 'Aguardando Reembolso', 'Aguardando reembolso do pagamento'),
('2023-01-18 13:00:00', 1, 'Reembolsado', 'Pagamento reembolsado'),
('2023-01-19 14:00:00', 1, 'Aguardando Confirmação', 'Aguardando confirmação do pagamento'),
('2023-01-20 15:00:00', 1, 'Parcialmente Estornado', 'Pagamento parcialmente estornado'),
('2023-01-21 16:00:00', 1, 'Parcialmente Reembolsado', 'Pagamento parcialmente reembolsado'),
('2023-01-22 17:00:00', 1, 'Em Revisão', 'Pagamento em revisão'),
('2023-01-23 18:00:00', 1, 'Revisado', 'Pagamento revisado'),
('2023-01-24 19:00:00', 1, 'Pago', 'Pagamento pago'),
('2023-01-25 20:00:00', 1, 'Não Pago', 'Pagamento não pago'),
('2023-01-26 21:00:00', 1, 'Atrasado', 'Pagamento atrasado'),
('2023-01-27 22:00:00', 1, 'Cancelamento Processado', 'Processamento do cancelamento do pagamento'),
('2023-01-28 23:00:00', 1, 'Pedido de Estorno', 'Pedido de estorno do pagamento'),
('2023-01-29 10:00:00', 1, 'Estorno Parcial', 'Estorno parcial do pagamento'),
('2023-01-30 11:00:00', 1, 'Estorno Rejeitado', 'Estorno do pagamento rejeitado');

INSERT INTO metado_pagamento (date_Create, status, nome, descricao) VALUES
('2023-01-01 10:00:00', 1, 'Cartão de Crédito', 'Pagamento com cartão de crédito'),
('2023-01-02 11:00:00', 1, 'Cartão de Débito', 'Pagamento com cartão de débito'),
('2023-01-03 12:00:00', 1, 'Dinheiro', 'Pagamento em dinheiro'),
('2023-01-04 13:00:00', 1, 'Pix', 'Pagamento via Pix'),
('2023-01-05 14:00:00', 1, 'Transferência Bancária', 'Pagamento por transferência bancária'),
('2023-01-06 15:00:00', 1, 'Boleto Bancário', 'Pagamento via boleto bancário'),
('2023-01-07 16:00:00', 1, 'PayPal', 'Pagamento via PayPal'),
('2023-01-08 17:00:00', 1, 'Google Pay', 'Pagamento via Google Pay'),
('2023-01-09 18:00:00', 1, 'Apple Pay', 'Pagamento via Apple Pay'),
('2023-01-10 19:00:00', 1, 'Criptomoeda', 'Pagamento com criptomoeda'),
('2023-01-11 20:00:00', 1, 'Cheque', 'Pagamento com cheque'),
('2023-01-12 21:00:00', 1, 'Vale Alimentação', 'Pagamento com vale alimentação'),
('2023-01-13 22:00:00', 1, 'Vale Refeição', 'Pagamento com vale refeição'),
('2023-01-14 23:00:00', 1, 'Voucher', 'Pagamento com voucher'),
('2023-01-15 10:00:00', 1, 'TED', 'Pagamento por TED'),
('2023-01-16 11:00:00', 1, 'DOC', 'Pagamento por DOC'),
('2023-01-17 12:00:00', 1, 'Débito Automático', 'Pagamento com débito automático'),
('2023-01-18 13:00:00', 1, 'Débito Direto Autorizado', 'Pagamento com débito direto autorizado'),
('2023-01-19 14:00:00', 1, 'PagSeguro', 'Pagamento via PagSeguro'),
('2023-01-20 15:00:00', 1, 'Mercado Pago', 'Pagamento via Mercado Pago'),
('2023-01-21 16:00:00', 1, 'PicPay', 'Pagamento via PicPay'),
('2023-01-22 17:00:00', 1, 'Samsung Pay', 'Pagamento via Samsung Pay'),
('2023-01-23 18:00:00', 1, 'Amazon Pay', 'Pagamento via Amazon Pay'),
('2023-01-24 19:00:00', 1, 'Pagamento na Entrega', 'Pagamento na entrega'),
('2023-01-25 20:00:00', 1, 'WeChat Pay', 'Pagamento via WeChat Pay'),
('2023-01-26 21:00:00', 1, 'AliPay', 'Pagamento via AliPay'),
('2023-01-27 22:00:00', 1, 'Stripe', 'Pagamento via Stripe'),
('2023-01-28 23:00:00', 1, 'Square', 'Pagamento via Square'),
('2023-01-29 10:00:00', 1, 'Venmo', 'Pagamento via Venmo'),
('2023-01-30 11:00:00', 1, 'Zelle', 'Pagamento via Zelle');