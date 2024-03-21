CREATE SCHEMA IF NOT EXISTS bd_aula_procedures DEFAULT CHARACTER SET utf8;
USE bd_aula_procedures;

CREATE TABLE IF NOT EXISTS pais(
id_pais INT NOT NULL AUTO_INCREMENT,
nome_pais VARCHAR (200) NOT NULL,
PRIMARY KEY(id_pais)
);

INSERT INTO pais Values (NULL, "BRASIL"),
						(NULL, "CHILE");
                        
/*Criar uma procedure (listar_paises)
para caso tenha sido passado eu
busco um país com aquele id, em caso contrário serão
retornados todos os registros da tabela.*/
                        
SET DELIMITER $$

DROP PROCEDURE IF EXISTS  listar_paises $$
CREATE PROCEDURE  listar_paises(IN id INT)
BEGIN
		IF (id IS NULL) THEN
			SELECT * FROM  pais;
		ELSE
			SELECT * FROM pais WHERE id_pais = id;
		END IF;
	END $$
    
SET DELIMITER ; 

CALL  listar_paises(NULL);
CALL  listar_paises(1);
CALL  listar_paises(2);

/*1) Criar uma procedure (Verificar_Quantidade_Pais)
para retornar a quantidade de países cadastrados
na tabela pais do nosso exemplo. Atribuir para a
variável total ao executar a chamada da
Procedure. Incluir mais um país na nossa tabela:
ARGENTINA*/

SET DELIMITER $$
CREATE PROCEDURE  Verificar_Quantidade (OUT quantidade INT)
BEGIN
			SELECT COUNT(*) INTO quantidade FROM pais;
	END $$
    
SET DELIMITER ;

INSERT INTO pais Values (NULL, "ARGENTINA");

CALL Verificar_Quantidade(@total);
SELECT @total as TOTAL;


/* 2) Criar uma procedure (Selecionar_Paises) para
fazer um select na tabela pais, limitando a
quantidade de registros pela quantidade recebida
como parâmetro. Antes inserem mais alguns
países em nossa tabela. Inserir os países BOLÍVIA
e URUGUAI.*/

SET DELIMITER $$
CREATE PROCEDURE Selecionar_paises (IN quantidade INT)
BEGIN
			SELECT * FROM pais
            LIMIT quantidade;
	END $$
    
SET DELIMITER ;

INSERT INTO pais Values (NULL, "BOLIVIA"),
						(NULL, "URUGUAI");

CALL Selecionar_paises(4);

/*3 ) Criar uma procedure(Selecionar_Paises_Iniciando_Com) 
para fazer um select na tabela pais, retornando 
os registros deacordo com a letra recebida como
parâmetro (Dica:comando CONCAT é para concatenar). */

SET DELIMITER $$
CREATE PROCEDURE Selecionar_Paises_Iniciando_Com (IN letra VARCHAR(1))
BEGIN
			SELECT * FROM pais WHERE nome_pais LIKE CONCAT(letra,'%');
            
	END $$
    
SET DELIMITER ;

CALL Selecionar_Paises_Iniciando_Com('B');









