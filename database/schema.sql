-- Sistema de Chamados: criacao do esquema do banco
-- Observacao: sem acentos neste arquivo, para evitar problemas de codificacao
DROP TABLE IF EXISTS comentarios;

DROP TABLE IF EXISTS chamados;

DROP TABLE IF EXISTS categorias;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE
    usuarios (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        nome VARCHAR(150) NOT NULL,
        email VARCHAR(150) NOT NULL UNIQUE,
        senha_hash VARCHAR(255) NOT NULL,
        perfil VARCHAR(30) NOT NULL DEFAULT 'solicitante' CHECK (perfil IN ('solicitante', 'atendente', 'admin'))
    );

CREATE TABLE
    categorias (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        nome VARCHAR(100) NOT NULL UNIQUE
    );

CREATE TABLE
    chamados (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        titulo VARCHAR(200) NOT NULL,
        descricao TEXT NOT NULL,
        status VARCHAR(30) NOT NULL DEFAULT 'aberto' CHECK (
            status IN ('aberto', 'em_andamento', 'resolvido', 'fechado')
        ),
        prioridade VARCHAR(30) NOT NULL DEFAULT 'media' CHECK (prioridade IN ('baixa', 'media', 'alta')),
        criado_em TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
        atualizado_em TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
        fechado_em TIMESTAMPTZ,
        solicitante_id INT NOT NULL,
        atendente_id INT,
        categoria_id INT NOT NULL,
        CONSTRAINT fk_chamados_solicitante FOREIGN KEY (solicitante_id) REFERENCES usuarios (id),
        CONSTRAINT fk_chamados_atendente FOREIGN KEY (atendente_id) REFERENCES usuarios (id),
        CONSTRAINT fk_chamados_categoria FOREIGN KEY (categoria_id) REFERENCES categorias (id)
    );

CREATE TABLE
    comentarios (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        mensagem TEXT NOT NULL,
        criado_em TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
        chamado_id INT NOT NULL,
        usuario_id INT NOT NULL,
        CONSTRAINT fk_comentarios_chamado FOREIGN KEY (chamado_id) REFERENCES chamados (id),
        CONSTRAINT fk_comentarios_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
    );