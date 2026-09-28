-- Módulo 5 - Aula 10
-- DQL - Essência Nova — Trânsito Inteligente
--Pergunta da aula:
 “O que alguém envolvido no problema precisa conseguir descobrir consultando os dados?”
     --Resposta:
Precisa conseguir consultar informações como usuários, veículos, viagens, alertas, infrações e agentes de trânsito, usando filtros, JOINs e outras consultas para obter informações úteis sobre o trânsito.

-- Pergunta 1: Quais infrações foram registradas?
SELECT
    tipo,
    descricao,
    valor_multa,
    status
FROM infracao;


-- Pergunta 2: Quais agentes registraram as infrações?
SELECT
    infracao.tipo,
    infracao.valor_multa,
    agente_transito.nome AS agente
FROM infracao
JOIN agente_transito
    ON infracao.id_agente = agente_transito.id_agente;


-- Pergunta 3: Quais viagens foram realizadas por cada usuário?
SELECT
    usuario.nome,
    viagem.origem,
    viagem.destino,
    viagem.distancia
FROM viagem
JOIN usuario
    ON viagem.id_usuario = usuario.id_usuario;


-- Pergunta 4: Quais alertas possuem risco alto?
SELECT
    tipo_alerta,
    nivel_risco,
    status,
    localizacao,
    descricao
FROM alerta
WHERE nivel_risco = 'Alto';


-- Pergunta 5: Quais veículos pertencem a cada usuário?
SELECT
    usuario.nome,
    veiculo.modelo,
    veiculo.placa,
    veiculo.cor
FROM veiculo
JOIN usuario
    ON veiculo.id_usuario = usuario.id_usuario;
