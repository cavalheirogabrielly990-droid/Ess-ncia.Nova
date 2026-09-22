# Módulo 5 — Aula 4
## Regras de Negócio — Essência Nova

### Pergunta da aula

Quais regras o sistema precisa garantir sobre os dados?

## Regras de negócio

1. Todo usuário deve possuir nome, e-mail e senha para utilizar o sistema.

2. Cada veículo deve estar vinculado a um usuário.

3. Cada viagem deve estar vinculada a um usuário e a um veículo.

4. Uma viagem deve possuir origem e destino.

5. Todo alerta deve estar relacionado a uma viagem.

6. Todo alerta deve possuir tipo, nível de risco e status.

7. Um contato de confiança deve estar vinculado a um usuário.

8. Um contato de alerta deve relacionar um contato de confiança a um alerta.

9. Uma infração deve estar relacionada a uma viagem e a um agente de trânsito.

10. Um agente de trânsito deve possuir identificação para ser registrado no sistema.

11. Os dados obrigatórios não podem ser cadastrados vazios.

12. Os relacionamentos entre as entidades devem respeitar as chaves primárias e estrangeiras.

## Matriz — Regra → Dados → Como validar

| Regra | Dados envolvidos | Como validar |
|---|---|---|
| Usuário deve ser identificado | Usuário | Verificar campos obrigatórios |
| Veículo pertence a um usuário | Usuário, Veículo | Validar FK |
| Viagem pertence a usuário e veículo | Usuário, Veículo, Viagem | Validar FKs |
| Viagem possui origem e destino | Viagem | Verificar campos obrigatórios |
| Alerta pertence a uma viagem | Viagem, Alerta | Validar FK |
| Alerta possui nível de risco e status | Alerta | Verificar campos obrigatórios |
| Contato pertence a um usuário | Usuário, Contato | Validar FK |
| Contato de alerta relaciona contato e alerta | Contato, Alerta | Validar FKs |
| Infração possui viagem e agente | Infração, Viagem, Agente | Validar FKs |
| Dados obrigatórios não podem ficar vazios | Todas as entidades | Validar preenchimento |

## Conclusão

As regras de negócio definem como os dados do sistema devem ser registrados e relacionados. Elas ajudam a garantir que o banco de dados represente corretamente as situações do projeto Essência Nova — Trânsito Inteligente.
