CREATE  SCHEMA 	IF	NOT	EXISTS	DAM	DEFAULT CHARACTER SET utf8;

Use DAM;
-- drop database dam;

CREATE TABLE Cliente (
codCliente INT (3) NOT NULL PRIMARY KEY,
nome VARCHAR (45)NOT NULL,
email VARCHAR (45)NOT NULL,

telefone VARCHAR(11)NOT NULL,
cnpj VARCHAR (15)NOT NULL,
cpf VARCHAR (11)NOT NULL
);


CREATE TABLE Funcionario (
codFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
funcao VARCHAR (20)NOT NULL
);

CREATE TABLE Ingrediente ( 
codIngre INT primary KEY NOT NULL, 
sabor VARCHAR (40),
recheio VARCHAR (40),
cobertura VARCHAR (40), valorIngre DECIMAL NOT NULL
);


CREATE TABLE Bolo ( 
codBolo INT NOT NULL PRIMARY KEY,
nome VARCHAR(20)NOT NULL, peso DECIMAL NOT NULL,
valor_kilo DECIMAL

);

CREATE TABLE Empresa(
razaoSocial VARCHAR(40) NOT NULL, 
nomeFantasia VARCHAR (40) NOT NULL, 
Endereco VARCHAR (45) NOT NULL, 
email VARCHAR (40) NOT NULL,
Funcionario_codFuncionario INT NOT null,
CONSTRAINT fk_Funcionario_codFuncionario
FOREIGN KEY (Funcionario_codFuncionario)
REFERENCES Funcionario(codFuncionario) 
) ENGINE=InnoDB;



CREATE TABLE Customizacao (
codPedido INT NOT NULL PRIMARY KEY,
valor_kilo DECIMAL NOT NULL,
peso DECIMAL NOT NULL,
ingrediente_codIngre INT,
FOREIGN	KEY	(ingrediente_codIngre)	REFERENCES Ingrediente(codIngre));


CREATE TABLE Compra (
codCompra INT (4) NOT NULL primary KEY,
datahora DATETIME NOT NULL, 
valor_total DECIMAL NOT NULL,
Cliente_codCliente INT(3),
Funcionario_codFuncionario INT,
bolo_codBolo INT,
customizacao_codPedido INT,
FOREIGN	KEY	(Cliente_codCliente)REFERENCES cliente(codCliente),
FOREIGN KEY (Funcionario_codFuncionario) REFERENCES funcionario(codFuncionario),
FOREIGN KEY (bolo_codBolo) REFERENCES bolo(codBolo),
FOREIGN	KEY	(customizacao_codPedido)REFERENCES customizacao(codPedido)
);

CREATE TABLE registroCliente (
id	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
acao VARCHAR(200),
cod_Cliente INT,
nome VARCHAR (200),
email VARCHAR(200),
modificado_em date

);




INSERT INTO Cliente (codCliente, nome, email, telefone, cnpj, cpf)
VALUES (547, "Gabriel Barbosa Almeida", "gabigol@gmail.com",
"11992121981",0,"45878542114");
INSERT INTO Cliente (codCliente, nome, email, telefone, cnpj, cpf)
VALUES (426, "Bruno Henrique Pinto ", "bh27@gmail.com", "21994512355",0,"36549965622");


 INSERT INTO Funcionario (codFuncionario, nome, funcao)
VALUES (965, "Maria Andrade Nunes", "Boleira");
INSERT INTO Funcionario (codFuncionario, nome, funcao)
VALUES (922, "Pedro Maia da Silva", "Atendente");


INSERT INTO Bolo (codBolo, nome, peso, valor_kilo)
VALUES (006, "Formigueiro", 3.0, 16.0);
INSERT INTO Bolo (codBolo, nome, peso, valor_kilo)
VALUES (002, "Brigadeirão", 5.0, 17.0);


INSERT INTO ingrediente (codIngre, sabor, recheio, valorIngre)
VALUES (0497, "Formigueiro", "Chocolate", 5.0);
INSERT INTO ingrediente (codIngre, sabor, recheio, valorIngre)
VALUES (0547, "Cenoura", "Chocolate", 7.0);


INSERT INTO Empresa (razaoSocial, nomeFantasia, Endereco, email,
Funcionario_codFuncionario)
VALUES ("Serviços BSB ltda", "Serviços e Limpeza", "315, Asa Sul", "servicesbsb@gmail.com",
"965");
 INSERT INTO Empresa (razaoSocial, nomeFantasia, Endereco, email,
Funcionario_codFuncionario)
VALUES ("Confeitaria e Cozinha ltda", "Confeiteiro's", "210, Asa Norte",
"cozinhaeconf@gmail.com", "922");

INSERT INTO Customizacao (codPedido, valor_kilo, peso,ingrediente_codIngre)
VALUES (332, 15.0, 3.0, 0497);
INSERT INTO Customizacao (codPedido, valor_kilo, peso,ingrediente_codIngre)
VALUES (324, 14.0, 4.0, 0547);

INSERT INTO Compra (codCompra, datahora, valor_total, Cliente_codCliente,
Funcionario_codFuncionario, Customizacao_codPedido, Bolo_codBolo)
VALUES (9444, '2023-11-25 11:25:30', 140.00, 426, 965, 324, 002);

INSERT INTO Compra (codCompra, datahora, valor_total, Cliente_codCliente,
Funcionario_codFuncionario, Customizacao_codPedido, Bolo_codBolo)
VALUES (9464, '2023-11-02 15:30:00', 120.00, 547, 922, 332, 006);









