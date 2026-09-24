-- Módulo 5 - Aula 9
-- Script DQL - Essência Nova

-- 1. Consultar os usuários cadastrados
SELECT
    id_usuario,
    nome,
    email,
    tipo_usuario,
    status
FROM usuario;

-- 2. Consultar os veículos e seus respectivos usuários
SELECT
    usuario.nome AS usuario,
    veiculo.modelo,
    veiculo.placa,
    veiculo.cor
FROM usuario
JOIN veiculo
    ON usuario.id_usuario = veiculo.id_usuario;

-- 3. Consultar as viagens realizadas
SELECT
    usuario.nome AS usuario,
    viagem.origem,
    viagem.destino,
    viagem.distancia,
    viagem.tempo_estimado
FROM viagem
JOIN usuario
    ON viagem.id_usuario = usuario.id_usuario;

-- 4. Consultar alertas de alto risco
SELECT
    tipo_alerta,
    nivel_risco,
    status,
    localizacao,
    descricao
FROM alerta
WHERE nivel_risco = 'Alto';

-- 5. Consultar infrações e os agentes responsáveis
SELECT
    infracao.tipo,
    infracao.descricao,
    infracao.valor_multa,
    infracao.status,
    agente_transito.nome AS agente
FROM infracao
JOIN agente_transito
    ON infracao.id_agente = agente_transito.id_agente;

-- Módulo 5 - Aula 9
-- Consultas DQL - Essência Nova — Trânsito Inteligente

-- Pergunta da aula:
-- Como podemos consultar os dados do banco para verificar
-- se eles representam as situações reais do projeto?

-- Objetivo:
-- Criar consultas DQL usando SELECT para visualizar,
-- relacionar e analisar os dados cadastrados no sistema.


-- 1. Consultar os usuários cadastrados
SELECT
    id_usuario,
    nome,
    email,
    tipo_usuario,
    status
FROM usuario;


-- 2. Consultar os veículos e seus respectivos usuários
SELECT
    usuario.nome AS usuario,
    veiculo.modelo,
    veiculo.placa,
    veiculo.cor
FROM usuario
JOIN veiculo
    ON usuario.id_usuario = veiculo.id_usuario;


-- 3. Consultar as viagens realizadas
SELECT
    usuario.nome AS usuario,
    viagem.origem,
    viagem.destino,
    viagem.distancia,
    viagem.tempo_estimado
FROM viagem
JOIN usuario
    ON viagem.id_usuario = usuario.id_usuario;


-- 4. Consultar alertas de alto risco
SELECT
    tipo_alerta,
    nivel_risco,
    status,
    localizacao,
    descricao
FROM alerta
WHERE nivel_risco = 'Alto';


-- 5. Consultar infrações e os agentes responsáveis
SELECT
    infracao.tipo,
    infracao.descricao,
    infracao.valor_multa,
    infracao.status,
    agente_transito.nome AS agente
FROM infracao
JOIN agente_transito
    ON infracao.id_agente = agente_transito.id_agente;

