
CREATE SCHEMA IF NOT EXISTS subconsultas DEFAULT CHARACTER SET utf8;

USE subconsultas;


CREATE TABLE IF NOT EXISTS subconsultas.Aluno(
id INTEGER NOT NULL AUTO_INCREMENT,
nome  VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
dataNascimento DATETIME,
PRIMARY KEY (id)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS subconsultas.Turma(
id INTEGER NOT NULL AUTO_INCREMENT,
inicio DATETIME,
fim DATETIME,
observacoes LONGTEXT,
PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS subconsultas.AlunoTurma(
aluno_id INTEGER NOT NULL,
turma_id INTEGER NOT NULL,
PRIMARY KEY (aluno_id,turma_id),
FOREIGN KEY (aluno_id) references Aluno(id),
FOREIGN KEY (turma_id) references Turma(id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS subconsultas.Nota(
id INT NOT NULL,
aluno_id INT,
turma_id INT,
nota DECIMAL(4,2),
PRIMARY KEY (id),
FOREIGN KEY (aluno_id) references Aluno(id),
FOREIGN KEY (turma_id) references Turma(id)
) ENGINE = InnoDB;


INSERT INTO Aluno 
	VALUES  (1, 'Ítala Fabíola', 'fabiola2005@gmail.com', '2005-05-23'),
			(2, 'Jonh Lenon', 'lenin00@gmail.com','1989-02-27' ),
            (3, 'Severus Snape', 'mestico@gmail.com', '1981-10-12'),
            (4, 'Louis Hamilton', 'rapidin21@gmail.com', '2001-08-09'),
            (5, 'Zézé de Camargo', 'choro2000@gmail.com', '1998-12-01');
  
  

INSERT INTO turma 
	VALUES  (1,'2024-03-01','2024-03-26','Turma de SI'),
			(2,'2024-04-01','2024-04-24','Turma de ADS');
            
INSERT INTO AlunoTurma
	VALUES (1,1),
		   (2,1),
           (3,2);
           
INSERT INTO Nota
	VALUES (1,1,1,10),
		   (2,2,2,8),
           (3,3,2,5),
           (4,4,1,9);

SELECT*FROM nota;

SELECT*FROM Nota AS n1
WHERE n1.nota > (
	SELECT AVG (n2.nota)
    FROM Nota AS n2
    WHERE n2.turma_id = n1.turma_id);            
    
SELECT n1.*,(
	SELECT MAX(n2.nota)
    FROM Nota AS n2
    WHERE n2.turma_id = 1
    ) AS  maior_nota
    FROM Nota AS n1
    WHERE n1.turma_id;

	