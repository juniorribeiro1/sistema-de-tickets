
-- ==========================================
-- SEED.SQL
-- ==========================================

-- USUARIOS
INSERT INTO usuarios (nome, email, senha_hash, perfil)
VALUES
    ('Ana Souza', 'ana@exemplo.com', 'hash_ficticio_1', 'solicitante'),
    ('Carlos Lima', 'carlos@exemplo.com', 'hash_ficticio_2', 'atendente'),
    ('Bruna Silva', 'bruna@exemplo.com', 'hash_ficticio_3', 'solicitante'),
    ('Malu Sena', 'malu@exemplo.com', 'hash_ficticio_4', 'solicitante'),
    ('Pedro Cruz', 'pedro@exemplo.com', 'hash_ficticio_5', 'solicitante');


-- CATEGORIAS
INSERT INTO categorias (nome)
VALUES
    ('Hardware'),
    ('Software'),
    ('Redes');


-- CHAMADOS
-- atendente_id foi omitido: todos nascem sem atendente.
INSERT INTO chamados (
    titulo,
    descricao,
    status,
    prioridade,
    criado_em,
    atualizado_em,
    fechado_em,
    solicitante_id,
    categoria_id
)
VALUES
    (
        'Computador nao liga',
        'Computador nao apresenta sinal de energia.',
        'aberto',
        'alta',
        CURRENT_TIMESTAMP - INTERVAL '5 days',
        CURRENT_TIMESTAMP - INTERVAL '5 days',
        NULL,
        1,
        1
    ),
    (
        'Erro ao acessar sistema ERP',
        'Sistema apresenta erro durante o login.',
        'em_andamento',
        'media',
        CURRENT_TIMESTAMP - INTERVAL '3 days',
        CURRENT_TIMESTAMP - INTERVAL '2 hours',
        NULL,
        3,
        2
    ),
    (
        'Internet indisponivel',
        'Setor financeiro sem conexao com a internet.',
        'fechado',
        'alta',
        CURRENT_TIMESTAMP - INTERVAL '10 days',
        CURRENT_TIMESTAMP - INTERVAL '8 days',
        CURRENT_TIMESTAMP - INTERVAL '8 days',
        1,
        3
    ),
    (
        'Solicitacao de acesso',
        'Usuario precisa de permissao para acessar o sistema.',
        'aberto',
        'baixa',
        CURRENT_TIMESTAMP - INTERVAL '1 day',
        CURRENT_TIMESTAMP - INTERVAL '1 day',
        NULL,
        4,
        2
    ),
    (
        'Impressora apresentando falhas',
        'Impressora nao esta realizando impressoes.',
        'em_andamento',
        'alta',
        CURRENT_TIMESTAMP - INTERVAL '2 days',
        CURRENT_TIMESTAMP - INTERVAL '30 minutes',
        NULL,
        5,
        1
    );


-- ATRIBUINDO CHAMADOS SOMENTE AO ATENDENTE CARLOS (ID 2)
UPDATE chamados
SET atendente_id = 2
WHERE id IN (2, 3, 5);


-- COMENTARIOS
INSERT INTO comentarios (
    mensagem,
    criado_em,
    chamado_id,
    usuario_id
)
VALUES
    (
        'Ja verifiquei a conexao eletrica, mas o computador continua sem ligar.',
        CURRENT_TIMESTAMP - INTERVAL '4 days',
        1,
        1
    ),
    (
        'Estou verificando os logs do sistema para identificar o erro.',
        CURRENT_TIMESTAMP - INTERVAL '2 hours',
        2,
        2
    ),
    (
        'Problema identificado no switch. Conexao restabelecida.',
        CURRENT_TIMESTAMP - INTERVAL '8 days',
        3,
        2
    ),
    (
        'Preciso que o acesso seja liberado o quanto antes.',
        CURRENT_TIMESTAMP - INTERVAL '12 hours',
        4,
        4
    ),
    (
        'Estou atualizando o driver da impressora para realizar novos testes.',
        CURRENT_TIMESTAMP - INTERVAL '20 minutes',
        5,
        2
    );
