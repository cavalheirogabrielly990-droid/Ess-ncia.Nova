-- Módulo 5 — Aula 5
-- Script DDL — Essência Nova
PERGUNTA DA AULA 5 
    -- RESPOSTA
Transformando o modelo validado em um script DDL (script_ddl.sql), usando comandos CREATE TABLE e definindo os tipos de dados, chaves primárias (PK), chaves estrangeiras (FK) e restrições como NOT NULL e UNIQUE, respeitando a ordem dos relacionamentos entre as tabelas.

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(50),
    data_cadastro DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(100),
    cor VARCHAR(50),
    ano INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE viagem (
    id_viagem INT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_usuario INT NOT NULL,
    origem VARCHAR(200) NOT NULL,
    destino VARCHAR(200) NOT NULL,
    data_inicio TIMESTAMP,
    data_fim TIMESTAMP,
    distancia DECIMAL(10,2),
    tempo_estimado INT,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE contato_confianca (
    id_contato INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150),
    parentesco VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE alerta (
    id_alerta INT PRIMARY KEY,
    id_viagem INT NOT NULL,
    tipo_alerta VARCHAR(50) NOT NULL,
    nivel_risco VARCHAR(30) NOT NULL,
    status VARCHAR(30) NOT NULL,
    localizacao VARCHAR(200),
    descricao TEXT,
    data_hora TIMESTAMP,
    FOREIGN KEY (id_viagem) REFERENCES viagem(id_viagem)
);

CREATE TABLE contato_alerta (
    id_contato_alerta INT PRIMARY KEY,
    id_contato INT NOT NULL,
    id_alerta INT NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES contato_confianca(id_contato),
    FOREIGN KEY (id_alerta) REFERENCES alerta(id_alerta)
);

CREATE TABLE agente_transito (
    id_agente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150),
    turno VARCHAR(30)
);

CREATE TABLE infracao (
    id_infracao INT PRIMARY KEY,
    id_viagem INT NOT NULL,
    id_agente INT NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_hora TIMESTAMP,
    valor_multa DECIMAL(10,2),
    status VARCHAR(30),
    FOREIGN KEY (id_viagem) REFERENCES viagem(id_viagem),
    FOREIGN KEY (id_agente) REFERENCES agente_transito(id_agente)
);

CREATE TABLE servico_emergencia (
    id_servico INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    tipo_servico VARCHAR(50) NOT NULL
);J
