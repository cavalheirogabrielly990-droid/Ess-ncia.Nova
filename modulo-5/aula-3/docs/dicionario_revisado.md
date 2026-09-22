# Módulo 5 — Aula 3
## Dicionário de Dados Revisado — Essência Nova

### USUÁRIO
- id_usuario — PK
- nome
- email
- senha
- tipo_usuario
- data_cadastro
- status

### VEÍCULO
- id_veiculo — PK
- id_usuario — FK
- placa
- modelo
- cor
- ano

### VIAGEM
- id_viagem — PK
- id_veiculo — FK
- id_usuario — FK
- origem
- destino
- data_inicio
- data_fim
- distancia
- tempo_estimado

### CONTATO_CONFIANÇA
- id_contato — PK
- id_usuario — FK
- nome
- telefone
- email
- parentesco

### CONTATO_ALERTA
- id_contato_alerta — PK
- id_contato — FK
- id_alerta — FK

### ALERTA
- id_alerta — PK
- id_viagem — FK
- tipo_alerta
- nivel_risco
- status
- localizacao
- descricao
- data_hora

### INFRAÇÃO
- id_infracao — PK
- id_viagem — FK
- id_agente — FK
- tipo
- descricao
- data_hora
- valor_multa
- status

### AGENTE_TRÂNSITO
- id_agente — PK
- nome
- matricula
- telefone
- e-mail
- turno

### SERVIÇO_EMERGÊNCIA
- id_servico — PK
- nome
- telefone
- tipo_servico
