CREATE SCHEMA IF NOT EXISTS livraria DEFAULT CHARACTER SET utf8;

USE livraria;


CREATE TABLE IF NOT EXISTS aluno(
id INTEGER NOT NULL AUTO_INCREMENT,
nome  VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
telefone VARCHAR (14),
altura DECIMAL(3,2),
PRIMARY KEY (id)
) ENGINE = InnoDB;

SELECT nome, email FROM aluno;

SELECT * FROM aluno; 

TRUNCATE TABLE aluno;

INSERT INTO aluno (id, nome, email, telefone, altura)
	VALUES  (NULL, 'Ítala Fabíola', 'fabiola2005@gmail.com', '(61)99998-9888', 1.74),
			(NULL, 'Jonh Lenon', 'lenin00@gmail.com', '(61)99998-9887', 1.74),
            (NULL, 'Severus Snape', 'mestico@gmail.com', '(61)99998-9885', 1.94),
            (NULL, 'Louis Hamilton', 'rapidin21@gmail.com', '(61)99998-9880', 1.94),
            (NULL, 'Zézé de Camargo', 'choro2000@gmail.com', '(61)99998-9825', 1.94);
  
  DROP TABLE aluno;
            
CREATE TABLE IF NOT EXISTS professor(
id INTEGER NOT NULL AUTO_INCREMENT,
nome  VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
telefone VARCHAR (14),
altura DECIMAL(3,2),
PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO professor (id, nome, email, telefone, altura)
	VALUES  (NULL, 'Claudia Helena', 'leninha86@gmail.com', '(61)99998-9854', 1.54),
			(NULL, 'Pablo Geordan', 'geo1900@gmail.com', '(61)99998-9887', 1.70);
           
SELECT*FROM aluno, professor;

SELECT aluno.nome, professor.nome FROM aluno, professor;

SELECT a.nome AS aluno_nome, p.nome AS professor_nome FROM aluno AS a, professor AS p;

SELECT * FROM aluno WHERE altura > 1.80; 
SELECT * FROM aluno WHERE altura = 1.80; 	
SELECT * FROM aluno WHERE altura <> 1.80; 	
SELECT * FROM aluno WHERE altura != 1.80; 	
SELECT * FROM aluno WHERE altura <= 1.80; 	
SELECT * FROM aluno WHERE altura < 1.80; 	
SELECT * FROM aluno WHERE altura >= 1.80; 		
	
    
SELECT * FROM aluno WHERE altura BETWEEN 1.5 AND 1.80; 	
SELECT * FROM aluno WHERE altura NOT BETWEEN 1.5 AND 1.80;
SELECT * FROM aluno WHERE nome LIKE  'Rafael%'; 	 	
SELECT * FROM aluno WHERE nome NOT LIKE  'Rafael%'; 	 
SELECT * FROM aluno WHERE altura IN (1.5,1.6,1.7,1.8); 	 	
SELECT * FROM aluno WHERE altura NOT IN (1.5,1.6,1.7,1.8); 	 	

	

