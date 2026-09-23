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


-- CONTATOS DE CONFIANÇA
INSERT INTO contato_confianca
(id_contato, id_usuario, nome, telefone, email, parentesco)
VALUES
(1, 1, 'Carlos Silva', '(44) 99999-1111', 'carlos@email.com', 'Pai'),
(2, 2, 'Juliana Santos', '(44) 98888-2222', 'juliana@email.com', 'Mãe'),
(3, 3, 'Roberto Oliveira', '(44) 97777-3333', 'roberto@email.com', 'Irmão');

-- ALERTAS
INSERT INTO alerta
(id_alerta, id_viagem, tipo_alerta, nivel_risco, status, localizacao, descricao, data_hora)
VALUES
(1, 1, 'Acidente', 'Alto', 'ativo',
 'Centro de Maringá',
 'Acidente registrado na via.',
 CURRENT_TIMESTAMP),

(2, 2, 'Congestionamento', 'Médio', 'ativo',
 'Zona Norte de Maringá',
 'Trânsito intenso no local.',
 CURRENT_TIMESTAMP);

-- CONTATOS DOS ALERTAS
INSERT INTO contato_alerta
(id_contato_alerta, id_contato, id_alerta)
VALUES
(1, 1, 1),
(2, 2, 2);

-- AGENTES DE TRÂNSITO
INSERT INTO agente_transito
(id_agente, nome, matricula, telefone, email, turno)
VALUES
(1, 'João Pereira', 'AG001', '(44) 96666-1111', 'joao@transito.com', 'Manhã'),
(2, 'Fernanda Costa', 'AG002', '(44) 95555-2222', 'fernanda@transito.com', 'Tarde');

-- INFRAÇÕES
INSERT INTO infracao
(id_infracao, id_viagem, id_agente, tipo, descricao, data_hora, valor_multa, status)
VALUES
(1, 1, 1, 'Excesso de velocidade',
 'Velocidade acima do limite permitido.',
 CURRENT_TIMESTAMP, 195.23, 'registrada'),

(2, 2, 2, 'Estacionamento irregular',
 'Veículo estacionado em local proibido.',
 CURRENT_TIMESTAMP, 130.16, 'registrada');

-- SERVIÇOS DE EMERGÊNCIA
INSERT INTO servico_emergencia
(id_servico, nome, telefone, tipo_servico)
VALUES
(1, 'SAMU', '192', 'Ambulância'),
(2, 'Corpo de Bombeiros', '193', 'Emergência'),
(3, 'Polícia Militar', '190', 'Segurança');
