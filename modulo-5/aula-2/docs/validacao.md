# Módulo 5 — Aula 2
## Apresentar e testar o modelo atual

### Pergunta da aula

O modelo que já construímos representa aquilo que o problema precisa?

Sim. O modelo representa as principais necessidades do Essência Nova, pois relaciona o problema aos dados necessários, às entidades, aos atributos, aos relacionamentos e às regras do sistema.

## 1. Teste de rastreabilidade

| Necessidade | Entidade | Atributo |
|---|---|---|
| Saber quem usa o sistema | Usuário | nome, contato |
| Saber onde o usuário está | Usuário | localização |
| Encontrar uma rota | Rota | origem, destino |
| Identificar problemas no trânsito | Ocorrência | tipo, localização |
| Informar problemas ao usuário | Alerta | tipo, mensagem |
| Ter contatos para emergência | Contato de emergência | nome, telefone |

## 2. Apresentação do modelo

### Problema
Dificuldade de encontrar rotas seguras e rápidas e falta de informações sobre problemas no trânsito.

### Dados
Usuário, localização, origem, destino, rotas, velocidade, ocorrências, condições do trânsito, alertas e contatos de emergência.

### Entidades
Usuário, Rota, Ocorrência, Alerta e Contato de emergência.

### Relacionamentos
O usuário consulta rotas, as rotas possuem informações de trânsito e as ocorrências podem gerar alertas para o usuário.

### Regras
O sistema utiliza os dados disponíveis para apresentar informações de trânsito e emitir alertas ao usuário.

## 3. Ficha de Validação

| Item | Ação |
|---|---|
| Usuário | MANTER |
| Localização | MANTER |
| Rota | MANTER |
| Ocorrência | MANTER |
| Alerta | MANTER |
| Contato de emergência | MANTER |

## 4. Conclusão

O modelo atual representa as principais necessidades do problema, relacionando os dados necessários às entidades e aos atributos do sistema.