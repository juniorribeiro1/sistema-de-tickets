-- Sistema de Chamados: criacao do esquema do banco
-- Observacao: sem acentos neste arquivo, para evitar problemas de codificacao

DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL,
    email       VARCHAR(150) NOT NULL UNIQUE,
    senha_hash  VARCHAR(255) NOT NULL,
    perfil      VARCHAR(30)  NOT NULL DEFAULT 'solicitante'
                CHECK (perfil IN ('solicitante', 'atendente', 'admin'))
);

CREATE TABLE categorias (
    id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL UNIQUE
);