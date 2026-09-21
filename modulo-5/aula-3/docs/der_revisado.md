# Módulo 5 — Aula 3
## DER Revisado — Essência Nova

### Entidades

- USUÁRIO
- VEÍCULO
- VIAGEM
- CONTATO_CONFIANÇA
- CONTATO_ALERTA
- ALERTA
- INFRAÇÃO
- AGENTE_TRÂNSITO
- SERVIÇO_EMERGÊNCIA

### Chaves e relacionamentos

- USUÁRIO 1:N VEÍCULO
- USUÁRIO 1:N CONTATO_CONFIANÇA
- VEÍCULO 1:N VIAGEM
- VIAGEM 1:N ALERTA
- CONTATO_CONFIANÇA 1:N CONTATO_ALERTA
- ALERTA 1:N CONTATO_ALERTA
- AGENTE_TRÂNSITO 1:N INFRAÇÃO
- AGENTE_TRÂNSITO 1:N SERVIÇO_EMERGÊNCIA

### Legenda

- PK = Chave Primária
- FK = Chave Estrangeira
- 1 = Um
- N = Muitos

### Resultado

O DER foi revisado após as descobertas das Aulas 1 e 2,
mantendo as entidades, atributos, chaves, relacionamentos
e cardinalidades necessárias para representar o sistema.
