INSERT INTO
    usuarios (nome, email, senha_hash, perfil)
VALUES
    (
        'Ana Souza',
        'ana@exemplo.com',
        'hash_ficticio_1',
        'solicitante'
    ),
    (
        'Carlos Lima',
        'carlos@exemplo.com',
        'hash_ficticio_2',
        'atendente'
    ),
    (
        'Bruna Silva',
        'bruna@exemplo.com',
        'hash_ficticio_3',
        'solicitante'
    ),
    (
        'Malu Sena',
        'malu@exemplo.com',
        'hash_ficticio_4',
        'solicitante'
    ),
    (
        'Pedro Cruz',
        'pedro@exemplo.com',
        'hash_ficticio_5',
        'solicitante'
    );

INSERT INTO
    categorias (nome)
VALUES
    ('Hardware'),
    ('Software'),
    ('Redes');

INSERT INTO
    chamados (
        titulo,
        descricao,
        status,
        prioridade,
        solicitante_id,
        atendente_id,
        categoria_id
    )
VALUES
    (
        'Computador nao liga',
        'Computador nao apresenta sinal de energia.',
        'aberto',
        'alta',
        1,
        NULL,
        1
    ),
    (
        'Erro ao acessar sistema ERP',
        'Sistema apresenta erro durante o login.',
        'em_andamento',
        'media',
        2,
        3,
        2
    ),
    (
        'Internet indisponivel',
        'Setor financeiro sem conexao com a internet.',
        'fechado',
        'alta',
        1,
        4,
        3
    ),
    (
        'Solicitacao de acesso',
        'Usuario precisa de permissao para acessar o sistema.',
        'aberto',
        'baixa',
        2,
        NULL,
        3
    ),
    (
        'Impressora apresentando falhas',
        'Impressora nao esta realizando impressoes.',
        'em_andamento',
        'alta',
        1,
        3,
        1
    );

INSERT INTO
    comentarios (mensagem, chamado_id, usuario_id)
VALUES
    (
        'Ja verifiquei a conexao eletrica, mas o computador continua sem ligar.',
        1,
        1
    ),
    (
        'Estou verificando os logs do sistema para identificar o erro.',
        2,
        3
    ),
    (
        'Problema identificado no switch. Conexao restabelecida.',
        3,
        4
    ),
    (
        'Preciso que o acesso seja liberado o quanto antes.',
        4,
        2
    ),
    (
        'Estou atualizando o driver da impressora para realizar novos testes.',
        5,
        3
    );