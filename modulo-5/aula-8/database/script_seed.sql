-- Módulo 5 — Aula 8
-- Script de dados de teste — Essência Nova

-- USUÁRIOS
INSERT INTO usuario
(id_usuario, nome, email, senha, tipo_usuario, data_cadastro, status)
VALUES
(1, 'Gaby Silva', 'gaby@email.com', 'senha123', 'motorista', CURRENT_DATE, 'ativo'),
(2, 'Ana Souza', 'ana@email.com', 'senha456', 'motociclista', CURRENT_DATE, 'ativo');

-- VEÍCULOS
INSERT INTO veiculo
(id_veiculo, id_usuario, placa, modelo, cor)
VALUES
(1, 1, 'ABC1D23', 'Honda Civic', 'Preto'),
(2, 2, 'XYZ4E56', 'Honda CG 160', 'Vermelho');

-- VIAGENS
INSERT INTO viagem
(id_viagem, id_veiculo, id_usuario, origem, destino, data_inicio, data_fim)
VALUES
(1, 1, 1, 'Maringá - Centro', 'Zona 7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 2, 2, 'Maringá - Zona 7', 'Universidade', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
