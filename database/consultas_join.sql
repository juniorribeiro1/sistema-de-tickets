-- =====================================================================
-- Sistema de Chamados: consultas com JOIN
-- =====================================================================
-- Como executar (na raiz do repositorio):
--   psql -v ON_ERROR_STOP=1 -U postgres -h localhost -d sistema_chamados -f database/consultas_join.sql
--
-- Observacao sobre a transacao:
-- Este arquivo abre uma transacao (BEGIN), insere um chamado de
-- demonstracao SEM atendente (para mostrar a diferenca entre JOIN e
-- LEFT JOIN) e, no final, desfaz tudo com ROLLBACK. O banco volta
-- exatamente ao estado anterior.
-- =====================================================================

BEGIN;

-- Chamado de demonstracao (sera desfeito no final).
-- Assume que existem o usuario 1 e a categoria 1 (criados pelo seed).
INSERT INTO chamados (titulo, descricao, solicitante_id, categoria_id)
VALUES ('Chamado de demonstracao sem atendente', 'Usado para mostrar o LEFT JOIN', 1, 1);

-- ---------------------------------------------------------------------
\echo '--- 1) Chamados com o nome do solicitante (JOIN) ---'
-- Pergunta: quem abriu cada chamado?
-- solicitante_id e NOT NULL, entao o JOIN comum nao perde nenhuma linha.
SELECT c.id, c.titulo, u.nome AS solicitante
FROM chamados c
JOIN usuarios u ON u.id = c.solicitante_id
ORDER BY c.id;

-- ---------------------------------------------------------------------
\echo '--- 2) Chamados com solicitante e categoria (dois JOINs) ---'
-- Pergunta: quem abriu e de qual categoria e cada chamado?
-- categoria_id tambem e NOT NULL, entao JOIN comum.
SELECT c.id, c.titulo, c.status,
       u.nome   AS solicitante,
       cat.nome AS categoria
FROM chamados c
JOIN usuarios   u   ON u.id   = c.solicitante_id
JOIN categorias cat ON cat.id = c.categoria_id
ORDER BY c.id;

-- ---------------------------------------------------------------------
\echo '--- 3) Chamados com solicitante, categoria e atendente (LEFT JOIN) ---'
-- Pergunta: visao completa, mostrando "Sem atendente" quando nao houver.
-- atendente_id pode ser NULL, entao usamos LEFT JOIN para nao perder linhas.
-- A tabela usuarios entra duas vezes, com apelidos diferentes (papeis).
SELECT c.id, c.titulo, c.status,
       sol.nome AS solicitante,
       cat.nome AS categoria,
       COALESCE(ate.nome, 'Sem atendente') AS atendente
FROM chamados c
JOIN usuarios   sol ON sol.id = c.solicitante_id
JOIN categorias cat ON cat.id = c.categoria_id
LEFT JOIN usuarios ate ON ate.id = c.atendente_id
ORDER BY c.id;

-- ---------------------------------------------------------------------
\echo '--- 4a) Contagem com INNER JOIN no atendente (perde chamados sem atendente) ---'
SELECT COUNT(*) AS linhas_inner_join
FROM chamados c
JOIN usuarios ate ON ate.id = c.atendente_id;

\echo '--- 4b) Contagem com LEFT JOIN no atendente (mantem todos os chamados) ---'
SELECT COUNT(*) AS linhas_left_join
FROM chamados c
LEFT JOIN usuarios ate ON ate.id = c.atendente_id;

-- ---------------------------------------------------------------------
\echo '--- 5) Chamados de um solicitante especifico ---'
-- Pergunta: quais chamados a Ana abriu?
-- Se o nome no seu seed for diferente, ajuste o texto abaixo.
SELECT c.id, c.titulo, c.status, c.prioridade
FROM chamados c
JOIN usuarios u ON u.id = c.solicitante_id
WHERE u.nome = 'Ana Souza'
ORDER BY c.id;

-- ---------------------------------------------------------------------
\echo '--- 6) Quantidade de chamados por categoria (JOIN + GROUP BY) ---'
-- Pergunta: qual o volume de chamados de cada categoria?
-- Partimos de categorias com LEFT JOIN para listar tambem as categorias
-- que ainda nao tem nenhum chamado (total = 0).
SELECT cat.nome AS categoria, COUNT(c.id) AS total
FROM categorias cat
LEFT JOIN chamados c ON c.categoria_id = cat.id
GROUP BY cat.id, cat.nome
ORDER BY total DESC, cat.nome;

-- ---------------------------------------------------------------------
\echo '--- 7) Comentarios com o autor e o titulo do chamado ---'
-- Pergunta: quem comentou o que, em cada chamado, em ordem cronologica?
SELECT c.id AS chamado,
       c.titulo,
       u.nome AS autor,
       co.mensagem,
       co.criado_em
FROM comentarios co
JOIN chamados c ON c.id = co.chamado_id
JOIN usuarios u ON u.id = co.usuario_id
ORDER BY c.id, co.criado_em, co.id;

-- ---------------------------------------------------------------------
\echo '--- 8) Chamados por atendente, incluindo quem nao tem nenhum ---'
-- Pergunta: quantos chamados cada atendente/admin tem atribuidos?
-- Partimos de usuarios (lado esquerdo) para nao perder quem esta com zero.
-- COUNT(c.id) ignora NULL, entao quem nao tem chamado aparece com 0.
-- O filtro de perfil esta no WHERE porque e sobre a tabela da esquerda.
SELECT u.nome AS atendente, COUNT(c.id) AS chamados_atribuidos
FROM usuarios u
LEFT JOIN chamados c ON c.atendente_id = u.id
WHERE u.perfil IN ('atendente', 'admin')
GROUP BY u.id, u.nome
ORDER BY chamados_atribuidos DESC, u.nome;

-- ---------------------------------------------------------------------
\echo '--- 9) Fila de triagem: chamados sem atendente ---'
-- Pergunta: quais chamados ainda precisam ser assumidos por alguem?
SELECT c.id, c.titulo, c.prioridade,
       u.nome   AS solicitante,
       cat.nome AS categoria,
       c.criado_em
FROM chamados c
JOIN usuarios   u   ON u.id   = c.solicitante_id
JOIN categorias cat ON cat.id = c.categoria_id
WHERE c.atendente_id IS NULL
ORDER BY c.criado_em, c.id;

-- ---------------------------------------------------------------------
-- Desfaz o chamado de demonstracao e qualquer outra alteracao.
ROLLBACK;

\echo '--- Apos o ROLLBACK: o banco voltou ao estado original ---'
SELECT COUNT(*) AS total_de_chamados FROM chamados;
