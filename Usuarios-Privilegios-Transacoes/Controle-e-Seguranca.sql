-- denunciador
CREATE USER 'denunciador'@'localhost' IDENTIFIED BY 'denunciador123' ;
GRANT insert on denuncias to 'denunciador'@'localhost';

-- equipe resgate
CREATE USER 'Equipe_Resgate'@'localhost' IDENTIFIED BY 'equipe123';
GRANT SELECT ON denuncia TO 'Equipe_Resgate'@'localhost';
GRANT SELECT ON resgate TO 'Equipe_Resgate'@'localhost';
GRANT SELECT ON animal TO 'Equipe_Resgate'@'localhost';
GRANT SELECT ON soltura TO 'Equipe_Resgate'@'localhost';
GRANT INSERT ON resgate TO 'Equipe_Resgate'@'localhost';
GRANT INSERT ON animal TO 'Equipe_Resgate'@'localhost';
GRANT INSERT ON soltura TO 'Equipe_Resgate'@'localhost';
GRANT UPDATE ON resgate TO 'Equipe_Resgate'@'localhost';
GRANT UPDATE ON animal TO 'Equipe_Resgate'@'localhost';


-- medico
CREATE USER 'medicos'@'localhost' IDENTIFIED BY 'medicos123';
GRANT SELECT ON avaliacao_clinica TO 'medicos'@'localhost';
GRANT SELECT ON tratamento TO 'medicos'@'localhost';
GRANT SELECT ON relatorio TO 'medicos'@'localhost';
GRANT SELECT ON resgate TO 'medicos'@'localhost';
GRANT INSERT ON avaliacao_clinica TO 'medicos'@'localhost';
GRANT INSERT ON tratamento TO 'medicos'@'localhost';
GRANT INSERT ON relatorio TO 'medicos'@'localhost';
GRANT UPDATE ON tratamento TO 'medicos'@'localhost';

-- biologo
CREATE USER 'biologo'@'localhost' IDENTIFIED BY 'biologo123';
GRANT Insert, Select, DROP on catalogo_especies to 'biologo'@'localhost';
-- atualizar os privilégios para garantir que nao ocorra erros
FLUSH PRIVILEGES;


-- EXEMPLO DE TRANSACAO PROPOSTA NO SLIDE COM SUCESSO(COMMIT)
START TRANSACTION;
-- Criar um novo resgate
 INSERT INTO resgate (id_resgate, id_equipe, id_denuncia, data_resgate, lugar_resgate, status, descricao)
VALUES ('RES00051', 'EQP00004', 5, '2025-10-20', 'Bairro Bacacheri - Curitiba', 'Em andamento',
    	'Resgate simulado para teste de transação.');
INSERT INTO animal (id_animal, id_resgate, id_especie, condicao, status)
VALUES ('ANM00051', 'RES00051', 'ESP00009', 'Animal encontrado debilitado. Necessita avaliação.', 'Resgatado');
INSERT INTO avaliacao_clinica (id_avaliacao, diagnostico, id_centro_de_triagem, id_resgate)
VALUES ('AVA00051', 'Avaliação inicial pendente', 'CENTRO01', 'RES00051');
  COMMIT;


-- EXEMPLO DE TRANSACAO PROPOSTA NO SLIDE COM ERRO(ROLLBACK)
START TRANSACTION;
INSERT INTO resgate (id_resgate, id_equipe, id_denuncia, data_resgate, lugar_resgate, status, descricao)
VALUES ('RES00052', 'EQP00003', 7, '2025-10-21', 'Jardim Botânico - Curitiba', 'Em andamento',
    	'Resgate simulado com falha.');
INSERT INTO animal (id_animal, id_resgate, id_especie, condicao, status)
VALUES ('ANM00052', 'RES00052', 'ESP99999', 'Animal fictício usado para teste.', 'Resgatado');
ROLLBACK;

-- CRIACAO DA TABELA DE LOGS DE AUDITORIA
CREATE TABLE log_auditoria (
  id_log INT AUTO_INCREMENT PRIMARY KEY,
  data_evento DATETIME DEFAULT CURRENT_TIMESTAMP,
  usuario_db VARCHAR(100) NOT NULL,
  tipo_acao ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  tabela_afetada VARCHAR(50) NOT NULL,
  id_registro_afetado VARCHAR(20) NOT NULL,
  dados_anteriores TEXT,
  dados_novos TEXT,
  INDEX (tabela_afetada, id_registro_afetado), -- criacao de indices para facilitar
  INDEX (data_evento)                          -- a busca (mais usado em bancos com 
);   										   -- grande volume de dados)


-- CRIAÇÃO DE UM TRIGGER PARA INSERIR NA TABELA DE LOG DE AUDITORIA
CREATE TRIGGER trg_audit_animal_update
AFTER UPDATE ON animal
FOR EACH ROW
INSERT INTO log_auditoria (usuario_db, tipo_acao, tabela_afetada, id_registro_afetado, dados_anteriores, dados_novos)
VALUES
(USER(), 'UPDATE', 'animal', OLD.id_animal,
CONCAT('Status: ', OLD.status, ', Condicao: ', OLD.condicao),
CONCAT('Status: ', NEW.status, ', Condicao: ', NEW.condicao));
