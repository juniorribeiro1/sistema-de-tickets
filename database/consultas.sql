--Id, titulo e status de todos chamados
SELECT
    id,
    titulo,
    status
FROM
    chamados;

-- Chamados com status aberto
SELECT
    *
FROM
    chamados
WHERE
    status = 'aberto';

--Chamados de prioridade alta que não estejam fechado.
SELECT
    *
FROM
    chamados
WHERE
    prioridade = 'alta'
    AND status != 'fechado';

--Chamados sem atendente
SELECT
    *
FROM
    chamados
WHERE
    atendente_id is NULL;

--Chamado cujo titulo contem uma palavra de minha escolha
SELECT
    *
FROM
    chamados
WHERE
    titulo ILIKE '%computador%';

--Todos os chamados do mais recente para o mais antigo
SELECT
    *
FROM
    chamados
ORDER BY
    criado_em DESC;

--Os 3 chamados mais recentes
SELECT
    *
FROM
    chamaodos
ORDER BY
    criado_em DESC
LIMIT
    3;

--Lista usuarios que são atendentes ou administradores
SELECT
    *
FROM
    usuarios
WHERE
    perfil IN ('atendente', 'admin');

--Mostra quantos chamados existem por status
SELECT
    status,
    COUNT(*) AS quantidade
FROM
    chamados
GROUP BY
    status;

--Mostra quantos chamados existem por prioridade
SELECT
    prioridade,
    COUNT(*) AS quantidade
FROM
    chamados
GROUP BY
    prioridades;

