
/* ====================================================
   ECOsave - Consultas Expandidas e Contextualizadas
   Geração automática: 2025-10-13 18:34:17 UTC
   ==================================================== */

-- ======================
-- 1. CONSULTAS COM JOIN
-- ======================

-- 1) Resgates com suas equipes e local de atuação (últimos 60 dias)
SELECT r.id_resgate, r.data_resgate, r.lugar, r.status,
       e.id_equipe, e.membros_qtd, e.disponibilidade
FROM Resgate r
JOIN Equipe_Resgate e ON r.id_equipe = e.id_equipe
WHERE r.data_resgate >= DATE_SUB(CURDATE(), INTERVAL 60 DAY);

-- 2) Animais e suas espécies, mostrando apenas os em tratamento
SELECT a.id_animal, c.especie, a.status, a.condicao
FROM Animal a
JOIN Catalogo_Especie c ON a.id_especie = c.id_especie
WHERE a.status = 'Em tratamento';

-- 3) Animais com resgates finalizados e as equipes envolvidas (3 tabelas)
SELECT a.id_animal, a.status AS status_animal, r.data_resgate, r.lugar, e.id_equipe
FROM Animal a
JOIN Resgate r ON a.id_resgate = r.id_resgate
JOIN Equipe_Resgate e ON r.id_equipe = e.id_equipe
WHERE r.status = 'Finalizado';

-- 4) Avaliações clínicas com o centro de triagem e local de resgate
SELECT av.id_avaliacao, av.diagnostico, ct.nome_centro, r.lugar
FROM Avaliacao_Clinica av
JOIN Centro_de_Triagem ct ON av.id_centro_de_triagem = ct.id_centro_de_triagem
JOIN Resgate r ON av.id_resgate = r.id_resgate;

-- 5) Tratamentos e respectivos médicos com dados dos animais tratados
SELECT t.id_tratamento, t.medico, a.id_animal, a.status
FROM Tratamento t
JOIN Animal a ON t.id_tratamento = a.id_tratamento
WHERE a.status IN ('Em tratamento', 'Solto');

-- 6) Denúncias e resgates associados
SELECT d.id_denuncia, d.data_denuncia, d.lugar AS local_denuncia, r.id_resgate, r.status
FROM Denuncia d
LEFT JOIN Resgate r ON d.id_denuncia = r.id_denuncia;

-- 7) Solturas com informações dos animais e espécies
SELECT s.id_soltura, s.data_soltura, s.local_soltura, a.id_animal, c.especie, a.status
FROM Soltura s
JOIN Animal a ON s.id_animal = a.id_animal
JOIN Catalogo_Especie c ON a.id_especie = c.id_especie
WHERE s.data_soltura >= DATE_SUB(NOW(), INTERVAL 90 DAY);

-- 8) Profissionais envolvidos em avaliações clínicas
SELECT p.id_profissional, p.nome, p.funcao, av.id_avaliacao
FROM Profissional p
JOIN Avaliacao_Profissional ap ON p.id_profissional = ap.id_profissional
JOIN Avaliacao_Clinica av ON ap.id_avaliacao = av.id_avaliacao;

-- 9) Quantidade de resgates por equipe
SELECT e.id_equipe, COUNT(r.id_resgate) AS total_resgates
FROM Equipe_Resgate e
LEFT JOIN Resgate r ON e.id_equipe = r.id_equipe
GROUP BY e.id_equipe;

-- 10) Relatórios vinculados a solturas e animais
SELECT rl.id_relatorio, rl.data_emissao, s.id_soltura, a.id_animal
FROM Relatorio rl
JOIN Soltura s ON rl.id_soltura = s.id_soltura
JOIN Animal a ON s.id_animal = a.id_animal;

-- 11) Espécies e número de animais resgatados
SELECT c.especie, COUNT(a.id_animal) AS qtd_animais
FROM Catalogo_Especie c
LEFT JOIN Animal a ON c.id_especie = a.id_especie
GROUP BY c.especie
ORDER BY qtd_animais DESC;

-- 12) Animais com tratamento e soltura (se houver)
SELECT a.id_animal, a.status, t.id_tratamento, s.id_soltura, s.local_soltura
FROM Animal a
LEFT JOIN Tratamento t ON a.id_tratamento = t.id_tratamento
LEFT JOIN Soltura s ON a.id_animal = s.id_animal;


-- ================================
-- 2. CONSULTAS COM GROUP BY/HAVING
-- ================================

-- 1) Equipes com mais de 2 resgates realizados
SELECT e.id_equipe, COUNT(r.id_resgate) AS qtd_resgates
FROM Equipe_Resgate e
JOIN Resgate r ON e.id_equipe = r.id_equipe
GROUP BY e.id_equipe
HAVING COUNT(r.id_resgate) > 2;

-- 2) Médicos com mais de 3 tratamentos concluídos
SELECT t.medico, COUNT(t.id_tratamento) AS num_tratamentos
FROM Tratamento t
JOIN Animal a ON t.id_tratamento = a.id_tratamento
WHERE a.status = 'Solto'
GROUP BY t.medico
HAVING COUNT(*) > 3;

-- 3) Locais de soltura com mais de 2 registros
SELECT s.local_soltura, COUNT(s.id_soltura) AS qtd
FROM Soltura s
GROUP BY s.local_soltura
HAVING COUNT(*) > 2;

-- 4) Espécies com média de animais acima da média geral
SELECT c.especie, COUNT(a.id_animal) AS qtd
FROM Catalogo_Especie c
JOIN Animal a ON c.id_especie = a.id_especie
GROUP BY c.especie
HAVING COUNT(a.id_animal) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM Animal GROUP BY id_especie) AS tmp);

-- 5) Equipes com média de experiência maior que 5 anos
SELECT disponibilidade, AVG(tempo_experiencia) AS media_experiencia
FROM Equipe_Resgate
GROUP BY disponibilidade
HAVING AVG(tempo_experiencia) > 5;


-- ======================
-- 3. CONSULTAS SUBQUERY
-- ======================

-- 1) Animais cuja espécie tem risco de extinção acima de 0.8
SELECT id_animal, id_especie
FROM Animal
WHERE id_especie IN (SELECT id_especie FROM Catalogo_Especie WHERE risco_extincao > 0.8);

-- 2) Resgates feitos por equipes acima da média de resgates
SELECT id_equipe, COUNT(id_resgate) AS total
FROM Resgate
GROUP BY id_equipe
HAVING COUNT(id_resgate) > (
  SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM Resgate GROUP BY id_equipe) AS medias
);

-- 3) Animais sem soltura registrada
SELECT id_animal, status
FROM Animal
WHERE id_animal NOT IN (SELECT id_animal FROM Soltura);

-- 4) Espécies com menos animais que a média do catálogo
SELECT especie, quantidade_animais
FROM Catalogo_Especie
WHERE quantidade_animais < (SELECT AVG(quantidade_animais) FROM Catalogo_Especie);

-- 5) Centros de triagem que possuem mais de 3 avaliações
SELECT nome_centro
FROM Centro_de_Triagem
WHERE id_centro_de_triagem IN (
  SELECT id_centro_de_triagem FROM Avaliacao_Clinica GROUP BY id_centro_de_triagem HAVING COUNT(*) > 3
);


-- ===================
-- 4. CRIAÇÃO DE VIEWS
-- ===================

CREATE OR REPLACE VIEW vw_resgates_completo AS
SELECT r.id_resgate, r.data_resgate, r.lugar, r.status,
       e.id_equipe, e.membros_qtd, d.id_denuncia, d.lugar AS local_denuncia
FROM Resgate r
LEFT JOIN Equipe_Resgate e ON r.id_equipe = e.id_equipe
LEFT JOIN Denuncia d ON r.id_denuncia = d.id_denuncia;

CREATE OR REPLACE VIEW vw_animais_em_tratamento AS
SELECT a.id_animal, c.especie, t.medico, t.data_inicio, t.data_fim
FROM Animal a
JOIN Catalogo_Especie c ON a.id_especie = c.id_especie
JOIN Tratamento t ON a.id_tratamento = t.id_tratamento
WHERE a.status = 'Em tratamento';

CREATE OR REPLACE VIEW vw_especies_criticas AS
SELECT id_especie, especie, risco_extincao
FROM Catalogo_Especie
WHERE risco_extincao >= 0.8;

CREATE OR REPLACE VIEW vw_profissionais_avaliacoes AS
SELECT p.nome, p.funcao, av.id_avaliacao, av.diagnostico
FROM Profissional p
JOIN Avaliacao_Profissional ap ON p.id_profissional = ap.id_profissional
JOIN Avaliacao_Clinica av ON ap.id_avaliacao = av.id_avaliacao;

CREATE OR REPLACE VIEW vw_solturas_recentes AS
SELECT * FROM Soltura WHERE data_soltura >= DATE_SUB(NOW(), INTERVAL 30 DAY);


-- =============================
-- 5. UPDATEs E DELETE JUSTIFICADOS
-- =============================

-- UPDATE 1: Equipes com resgates em andamento marcadas como indisponíveis
UPDATE Equipe_Resgate e
JOIN Resgate r ON e.id_equipe = r.id_equipe
SET e.disponibilidade = FALSE
WHERE r.status = 'Em andamento';

-- UPDATE 2: Corrigir status de resgates antigos ainda 'Em andamento'
UPDATE Resgate
SET status = 'Finalizado'
WHERE status = 'Em andamento' AND data_resgate < DATE_SUB(CURDATE(), INTERVAL 45 DAY);

-- UPDATE 3: Sincronizar status de animais com solturas registradas
UPDATE Animal a
JOIN Soltura s ON a.id_animal = s.id_animal
SET a.status = 'Solto'
WHERE a.status <> 'Solto';

-- DELETE 1: Limpeza de resgates com falha antigos
DELETE FROM Resgate
WHERE status = 'Falhou' AND data_resgate < '2025-01-01';

-- FIM DO SCRIPT EXPANDIDO
