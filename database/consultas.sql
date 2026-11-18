
-- ==========================================
-- CONSULTAS.SQL
-- ==========================================

-- 1. ID, titulo e status de todos os chamados

\echo '01 - TODOS OS CHAMADOS'

SELECT
    id,
    titulo,
    status
FROM
    chamados
ORDER BY
    id;


-- 2. Chamados com status aberto

\echo '02 - CHAMADOS ABERTOS'

SELECT
    *
FROM
    chamados
WHERE
    status = 'aberto';


-- 3. Chamados de prioridade alta que nao estejam fechados

\echo '03 - CHAMADOS DE PRIORIDADE ALTA NAO FECHADOS'

SELECT
    *
FROM
    chamados
WHERE
    prioridade = 'alta'
    AND status != 'fechado';


-- 4. Chamados sem atendente

\echo '04 - CHAMADOS SEM ATENDENTE'

SELECT
    *
FROM
    chamados
WHERE
    atendente_id IS NULL;


-- 5. Chamado cujo titulo contem uma palavra escolhida

\echo '05 - BUSCA POR PALAVRA NO TITULO'

SELECT
    *
FROM
    chamados
WHERE
    titulo ILIKE '%computador%';


-- 6. Todos os chamados do mais recente para o mais antigo

\echo '06 - CHAMADOS DO MAIS RECENTE PARA O MAIS ANTIGO'

SELECT
    *
FROM
    chamados
ORDER BY
    criado_em DESC,
    id DESC;


-- 7. Os 3 chamados mais recentes

\echo '07 - OS 3 CHAMADOS MAIS RECENTES'

SELECT
    *
FROM
    chamados
ORDER BY
    criado_em DESC,
    id DESC
LIMIT
    3;


-- 8. Lista usuarios que sao atendentes ou administradores

\echo '08 - USUARIOS ATENDENTES OU ADMINISTRADORES'

SELECT
    *
FROM
    usuarios
WHERE
    perfil IN ('atendente', 'admin');


-- 9. Quantidade de chamados por status

\echo '09 - QUANTIDADE DE CHAMADOS POR STATUS'

SELECT
    status,
    COUNT(*) AS quantidade
FROM
    chamados
GROUP BY
    status;


-- 10. Quantidade de chamados por prioridade

\echo '10 - QUANTIDADE DE CHAMADOS POR PRIORIDADE'

SELECT
    prioridade,
    COUNT(*) AS quantidade
FROM
    chamados
GROUP BY
    prioridade;

