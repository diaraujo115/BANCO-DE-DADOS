USE DAM;

-- PROCEDURE PARA PROCURAR UM CLIENTE PELO SEU CÓDIGO


SET DELIMITER $$
DROP PROCEDURE IF EXISTS listar_clientes $$
CREATE PROCEDURE listar_clientes(IN id INT)
BEGIN
IF (id IS NULL) THEN
SELECT * FROM Cliente;
ELSE
SELECT * FROM Cliente WHERE codCliente = id;
END IF;
END $$

SET DELIMITER ;
CALL listar_clientes (NULL);
CALL listar_clientes (426);


-- Procedure para Registrar Compra

DELIMITER //
CREATE PROCEDURE RegistrarCompra(
    IN p_datahora DATETIME,
    IN p_Cliente_codCliente INT,
    IN p_Funcionario_codFuncionario INT,
    IN p_Customizacao_codPedido INT,
    IN p_Bolo_codBolo INT
)
BEGIN
    DECLARE v_codCompra INT;
    DECLARE v_valorBolo DECIMAL(10, 2);
    DECLARE v_pesoBolo DECIMAL(10, 2);
    DECLARE v_valorCustomizacao DECIMAL(10, 2);
    DECLARE v_pesoCustomizacao DECIMAL(10, 2);
    DECLARE v_totalBolo DECIMAL(10, 2);
    DECLARE v_totalCustomizacao DECIMAL(10, 2);
    DECLARE v_valorTotal DECIMAL(10, 2);
    

    SELECT IFNULL(MAX(codCompra), 0) + 1 INTO v_codCompra FROM Compra;
    

    SELECT valor_kilo, peso INTO v_valorBolo, v_pesoBolo
    FROM Bolo
    WHERE codBolo = p_Bolo_codBolo;
    
    
    SELECT valor_kilo, peso INTO v_valorCustomizacao, v_pesoCustomizacao
    FROM Customizacao
    WHERE codPedido = p_Customizacao_codPedido;

    SET v_totalBolo = v_valorBolo * v_pesoBolo;
    
    SET v_totalCustomizacao = v_valorCustomizacao * v_pesoCustomizacao;

    SET v_valorTotal = v_totalBolo + v_totalCustomizacao;
    
 
    INSERT INTO Compra (codCompra, datahora, valor_total, Cliente_codCliente, Funcionario_codFuncionario, Customizacao_codPedido, Bolo_codBolo)
    VALUES (v_codCompra, p_datahora, v_valorTotal, p_Cliente_codCliente, p_Funcionario_codFuncionario, p_Customizacao_codPedido, p_Bolo_codBolo);
    

    SELECT CONCAT('Compra registrada com sucesso. Código: ', v_codCompra, ', Valor Total: ', v_valorTotal) AS Mensagem;
END //
DELIMITER ;

CALL RegistrarCompra('2024-05-27 10:00:00', 547, 922, 332, 6);

select*from compra;



-- TRIGGER PARA GRAVAR EM UMA TABELA QUANDO FOR INSERIDO UM NOVO CLIENTE

DELIMITER //

CREATE TRIGGER tg_registroCliente
AFTER INSERT ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO registroCliente (acao, cod_Cliente, nome, email, modificado_em)
    VALUES ('Insert de Cliente', NEW.codCliente, NEW.nome, NEW.email, NOW());
END//

DELIMITER ;

INSERT INTO Cliente (codCliente, nome, email, telefone, cnpj, cpf)
VALUES (500, "Gabriela", "gabigola@gmail.com",
"11111111111",1,"00478946221");

select * from registroCliente;

-- Trigger para gravar quando cliente for deletado

DELIMITER //
CREATE TRIGGER after_cliente_delete
AFTER DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO registroCliente (acao, cod_Cliente, nome, email, modificado_em)
    VALUES ('Deleção de Cliente', OLD.codCliente, OLD.nome, OLD.email, CURDATE());
END //
DELIMITER ;

DELETE FROM Cliente WHERE codCliente = 549;

select*from cliente;

select*from registroCliente;



-- Função para simplificar o insert de novos clientes

DELIMITER //
CREATE FUNCTION AdicionarCliente(
    p_nome VARCHAR(45),
    p_email VARCHAR(45),
    p_telefone VARCHAR(11),
    p_cnpj VARCHAR(15),
    p_cpf VARCHAR(11)
) RETURNS VARCHAR(255)
BEGIN
    DECLARE v_codCliente INT;
    DECLARE v_msg VARCHAR(255);
    
    SELECT IFNULL(MAX(codCliente), 0) + 1 INTO v_codCliente FROM Cliente;
    
    INSERT INTO Cliente (codCliente, nome, email, telefone, cnpj, cpf)
    VALUES (v_codCliente, p_nome, p_email, p_telefone, p_cnpj, p_cpf);
    
    SET v_msg = CONCAT('Cliente adicionado com sucesso. Código: ', v_codCliente);
    RETURN v_msg;
END //
DELIMITER ;


SELECT AdicionarCliente(
    'João Pereira',
    'joao.silva@example.com',
    '11999999999',
    '12345678000199',
    '12345678901'
) AS Mensagem;

select*from cliente;


-- Função para calcular o total de compras de determinado cliente

DELIMITER //
CREATE FUNCTION CalcularTotalComprasCliente(
    p_codCliente INT
   
) RETURNS DECIMAL(10, 2) 
BEGIN
    DECLARE v_total DECIMAL(10, 2);
    
    
    SELECT SUM(valor_total) INTO v_total
    FROM Compra
    WHERE Cliente_codCliente = p_codCliente;
    
    RETURN IFNULL(v_total, 0.00);
END //
DELIMITER ;

select CalcularTotalComprasCliente(547);
