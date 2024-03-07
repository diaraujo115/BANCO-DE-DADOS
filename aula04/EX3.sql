CREATE SCHEMA IF NOT EXISTS ExeAula3 DEFAULT CHARACTER SET utf8;

USE ExeAula3;


CREATE TABLE IF NOT EXISTS ExeAula3.projetos(
id INT NOT NULL,
titulo  VARCHAR(45) NOT NULL,
data DATETIME,
url VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

select*from projetos;

CREATE TABLE IF NOT EXISTS ExeAula3.usuario(
id INT NOT NULL,
nome  VARCHAR(45) NOT NULL,
email  VARCHAR(45) NOT NULL,
senha VARCHAR(45) NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ExeAula3.comentario(
id INT NOT NULL,
comentario TEXT NOT NULL,
data DATE NOT NULL,
id_usuario INT,
id_projeto INT,
PRIMARY KEY (id),
FOREIGN KEY (id_usuario) references usuario(id),
FOREIGN KEY (id_projeto) references projetos(id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ExeAula3.likes_por_projeto(
id_projeto INT NOT NULL,
id_usuario INT NOT NULL,
PRIMARY KEY (id_projeto, id_usuario),
FOREIGN KEY (id_usuario) references usuario(id),
FOREIGN KEY (id_projeto) references projetos(id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ExeAula3.likes_por_comentario(
id_usuario INT NOT NULL,
id_comentario INT NOT NULL,
PRIMARY KEY (id_usuario,id_comentario),
FOREIGN KEY (id_usuario) references usuario(id),
FOREIGN KEY (id_comentario) references comentario(id)
) ENGINE = InnoDB;



INSERT INTO projetos
	VALUES  (1, 'Aplicação C#', '2018-04-01', 'www.aplicacaocsharp.com.br'),
			(2, 'Aplicação Ionic', '2018-05-07','www.aplicacaoionic.com.br' ),
            (3, 'Aplicação Python', '2018-08-05 ', 'www.aplicacaopython.com.br');
            
INSERT INTO usuario
	VALUES  (1, 'Bruna Luiza ', 'bruninha@gmail.com', 'abc123.'),
			(2, 'Thiago Braga', 'thiagobraga_1@hotmail.com', 'pena093' ),
            (3, 'Osvaldo Justino', 'osvaltino@yahoo.com.br', 'osvaldit1_s'),
            (4, 'Gabriel Fernando', 'gabriel_fnd@gmail.com', 'gabss34' );
            
INSERT INTO comentario
	VALUES  (1, 'A microsoft acertou com essa linguagem!', '2018-05-01', '1', '1'),
			(2, 'Parabéns pelo projeto, bem legal!', '2018-12-01', '3', '1' ),
            (3, 'Super interessante! Fácil e rapido!', '2018-08-09', '4', '2'),
            (4, 'Cara, que simples fazer um APP assim!', '2018-01-01', '1', '2'),
            (5, 'Linguagem muito diferente.', '2018-11-01' ,'3' ,'3'),
            (6, 'Adorei aprender Python! Parabéns!', '2019-05-01', '2', '3'),
            (7, 'Muito maneiro esse framework!', '2018-04-05', '2', '2' );
            
INSERT INTO likes_por_projeto
	VALUES (1 ,1),
		   (1, 3),
		   (2, 1),
		   (2, 2),
		   (2, 3),
		   (2, 4),
		   (3, 2);
           
INSERT INTO likes_por_comentario
	VALUES (1 ,7),
		   (2, 7),
		   (4, 7);
		   
SELECT P.titulo,
		(SELECT COUNT(C.id_projeto)
        FROM
			comentario C 
		WHERE 
			C.id_projeto = P.id) AS Quantidade_comentarios
		FROM
			projetos P 
		GROUP BY
			P.id;

  
  
