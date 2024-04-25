CREATE SCHEMA IF NOT EXISTS bd_aula_pratica DEFAULT CHARACTER SET utf8;
drop database bd_aula_pratica;
drop table tb_titulacao;
use bd_aula_pratica;


CREATE TABLE IF NOT EXISTS tb_titulacao (
id INT NOT NULL auto_increment,
descricao VARCHAR(50),
PRIMARY KEY (id))
ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS tb_instrutor (
id INT NOT NULL auto_increment,
rg VARCHAR(20) NULL,
nome VARCHAR(100) NOT NULL,
data_nascimento DATE NULL, 
titulacao_id INT NOT NULL,
PRIMARY KEY (id),
INDEX fk_tb_instrutor_tb_titulacao1_idx (titulacao_id ASC), 
UNIQUE INDEX rg_UNIQUE (rg ASC),
CONSTRAINT fk_tb_instrutor_tb_titulacao1
	FOREIGN KEY (titulacao_id)
    REFERENCES bd_aula_pratica.tb_titulacao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS tb_telefone_instrutor (
id INT NOT NULL auto_increment,
numero VARCHAR(15) NULL,
tipo VARCHAR(45) NOT NULL,
instrutor_id INT NOT NULL, 
PRIMARY KEY (id),
INDEX fk_tb_telefone_instrutor_tb_instrutor_idx (instrutor_id ASC), 
CONSTRAINT fk_tb_telefone_instrutor_tb_instrutor
	FOREIGN KEY (instrutor_id)
    REFERENCES bd_aula_pratica.tb_instrutor(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

INSERT INTO tb_titulacao(descricao) VALUES	
('Graduado');

INSERT INTO tb_titulacao (descricao) VALUES	
('Especialidade');

INSERT INTO tb_titulacao(descricao) VALUES	
('Mestrado');

INSERT INTO tb_titulacao(descricao) VALUES	
('Doutorado');

