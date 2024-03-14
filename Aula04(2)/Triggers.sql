DROP DATABASE bd_aulas_triggers;

CREATE SCHEMA IF NOT EXISTS bd_aulas_triggers DEFAULT CHARACTER SET utf8;
USE bd_aulas_triggers;

CREATE TABLE IF NOT EXISTS bd_aulas_triggers.Aluno(
cod INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL,
curso INT NOT NULL,
status INT NOT NULL,
PRIMARY KEY (cod)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS bd_aulas_triggers.Curso(
cod INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR (200) NOT NULL,
PRIMARY KEY (cod)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS bd_aulas_triggers.Matricula(
cod INT NOT NULL AUTO_INCREMENT,
aluno_cod  INT NOT NULL,
curso_cod INT NOT NULL,
PRIMARY KEY (cod)
)ENGINE=InnoDB;

INSERT INTO curso
	Values (NULL, "CIÊNCIAS DA COMPUTAÇÃO"),
			(NULL, "TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS"),
            (NULL, "ENGENHARIA DA COMPUTAÇÃO"),
            (NULL, "SISTEMAS DA INFORMAÇÃO");
			
SELECT * FROM curso;

SET DELIMITER $$

CREATE  TRIGGER  tg_matricula
AFTER  INSERT ON Aluno
	FOR EACH ROW BEGIN
		INSERT INTO Matricula VALUES  (NULL, NEW.cod, NEW.curso);
	END;
    
SET DELIMITER ;

INSERT INTO Aluno 
	VALUES (NULL, "João Paulo Pimentel", 2, 1),
    	   (NULL, "José da Silva", 4, 1);

    
SELECT * FROM Aluno;

SELECT * FROM Matricula;

SHOW TRIGGERS;

CREATE TABLE IF NOT EXISTS bd_aulas_triggers.Alunos_Auditoria(
id	INT NOT NULL AUTO_INCREMENT,
cod INT NOT NULL,
nome VARCHAR (100) NOT NULL,
modificado_em DATETIME DEFAULT NULL,
acao VARCHAR (50) DEFAULT NULL,
PRIMARY KEY (id)
)ENGINE=InnoDB;

SET DELIMITER $$

CREATE  TRIGGER  antesDeUpdate_Alunos
BEFORE UPDATE ON Aluno
	FOR EACH ROW
		BEGIN
			INSERT INTO Alunos_Auditoria
            SET  acao = 'update',
            cod = OLD.cod,
            nome =  OLD.nome,
            modificado_em = NOW();
	END;
    
SET DELIMITER ;
    
UPDATE Aluno SET nome =  "Itala Fabiola" 
WHERE cod = 1;

SELECT * FROM Alunos_Auditoria;

UPDATE Aluno SET nome =  "Laura Satelis" 
WHERE cod = 2;

CREATE TABLE IF NOT EXISTS bd_aulas_triggers.Cursos_Auditoria(
id	INT NOT NULL AUTO_INCREMENT,
cod INT NOT NULL,
descricao VARCHAR (100) NOT NULL,
modificado_em DATETIME DEFAULT NULL,
acao VARCHAR (50) DEFAULT NULL,
PRIMARY KEY (id)
)ENGINE=InnoDB;

SET DELIMITER $$

CREATE  TRIGGER  antesDeUpdate_Cursos
BEFORE UPDATE ON Curso
	FOR EACH ROW
		BEGIN
			INSERT INTO Cursos_Auditoria
            SET  acao = 'update',
            cod = OLD.cod,
            descricao =  OLD.descricao,
            modificado_em = NOW();
	END;
    
SET DELIMITER ;

UPDATE Curso SET descricao =  "ENGENHARARIA DE SOFTWARE" 
WHERE cod = 3;

SELECT * FROM Cursos_Auditoria;
SELECT * FROM Curso
;

