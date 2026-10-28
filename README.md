# Essência Nova — Trânsito Inteligente

## Sobre o projeto

O **Essência Nova — Trânsito Inteligente** é um projeto desenvolvido no curso de Desenvolvimento de Sistemas, com o objetivo de utilizar a tecnologia para contribuir com a segurança viária e melhorar a mobilidade urbana. A proposta é desenvolver uma solução inteligente para auxiliar motoristas, motociclistas, ciclistas e passageiros durante seus deslocamentos, oferecendo informações que ajudem na prevenção de acidentes e na tomada de decisões no trânsito.

O sistema busca enfrentar problemas como congestionamentos, acidentes, excesso de velocidade e falta de informações atualizadas sobre as condições das vias. Entre as funcionalidades propostas estão o cadastro de usuários e veículos, o gerenciamento de viagens, o registro de alertas e a organização de contatos de confiança para situações de emergência.

O projeto também apresenta dois diferenciais principais: o **Trânsito Preditivo**, que busca analisar informações históricas, horários, condições climáticas e eventos para auxiliar no planejamento de rotas; e o **Modo Emergência Inteligente**, pensado para identificar possíveis acidentes por meio de sensores do celular, quando disponíveis, solicitar confirmação ao usuário e facilitar o compartilhamento da localização com contatos de confiança.

O desenvolvimento envolve programação em Python, construção de uma API backend, banco de dados relacional e análise de dados com inteligência artificial. A proposta é integrar essas tecnologias em uma solução voltada à prevenção, à informação e à segurança no trânsito.

**Atenção:** este README documenta a proposta e a estrutura técnica do Essência Nova. As funcionalidades que ainda estão em desenvolvimento são apresentadas como propostas, e não como recursos já concluídos ou testados.

## 1. Tecnologias utilizadas

- **Python:** linguagem utilizada no desenvolvimento do backend e na análise de dados.
- **FastAPI:** framework utilizado para desenvolver a API e disponibilizar endpoints para comunicação entre as partes do sistema.
- **Supabase:** plataforma utilizada para hospedar e gerenciar o banco de dados PostgreSQL.
- **PostgreSQL:** banco de dados relacional utilizado para armazenar e relacionar as informações do sistema.
- **SQL:** linguagem utilizada para criar tabelas, definir relacionamentos e consultar dados.
- **Pandas:** biblioteca que pode ser utilizada no processamento e na análise de conjuntos de dados.
- **CSV:** formato utilizado para organizar dados que podem alimentar as análises da inteligência artificial.
- **Visual Studio Code:** ambiente de desenvolvimento utilizado na implementação e organização do código.
- **Git e GitHub:** ferramentas utilizadas para versionar, armazenar e documentar o projeto.
- **Postman e Swagger UI:** ferramentas de apoio para testar e documentar as rotas da API.

As tecnologias utilizadas em cada funcionalidade devem corresponder à implementação efetiva do projeto. A análise inteligente pode começar com estatísticas, regras de classificação e identificação de padrões, evoluindo conforme a disponibilidade e a qualidade dos dados.

## 2. Organização dos arquivos

A estrutura do projeto pode seguir a organização abaixo, considerando os módulos já desenvolvidos e aqueles que ainda serão implementados.

```text
essencia-nova/
├── README.md
├── banco_de_dados/
│   └── essencia_nova.sql
├── backend/
│   ├── main.py
│   ├── database.py
│   ├── requirements.txt
│   ├── .env
│   ├── .env.example
│   ├── .gitignore
│   ├── models/
│   │   └── ...
│   ├── schemas/
│   │   └── ...
│   ├── controllers/
│   │   └── ...
│   └── routes/
│       └── ...
├── inteligencia_artificial/
│   ├── dados/
│   │   └── ocorrencias.csv
│   └── analise.py
├── frontend/
│   └── ...
└── documentacao/
    └── ...
```

A estrutura acima é uma sugestão de organização, não uma afirmação de que todas essas pastas e arquivos já existem no repositório.

### Responsabilidade dos arquivos

- **`README.md`:** apresenta o projeto, suas tecnologias e os procedimentos de execução.
- **`essencia_nova.sql`:** reúne os comandos SQL utilizados para estruturar o banco de dados.
- **`main.py`:** concentra a inicialização da API FastAPI e o registro das rotas.
- **`database.py`:** configura o acesso ao banco de dados conforme o método de conexão utilizado.
- **`requirements.txt`:** lista as dependências Python.
- **`models/`:** organiza os modelos de dados, conforme a arquitetura adotada.
- **`schemas/`:** pode organizar os modelos Pydantic utilizados na validação das requisições e respostas.
- **`controllers/` e `routes/`:** podem separar as regras de negócio e os endpoints da API.
- **`inteligencia_artificial/`:** organiza os scripts e dados utilizados nas análises.
- **`frontend/`:** reúne as interfaces da aplicação, conforme a implementação.
- **`documentacao/`:** pode armazenar diagramas, modelos de dados e documentos técnicos.

Os nomes e a estrutura definitiva devem ser ajustados para corresponder aos arquivos reais do projeto.

## 3. Estrutura do banco de dados

O banco de dados do Essência Nova utiliza o PostgreSQL por meio do Supabase. Sua finalidade é organizar as informações dos usuários, veículos, viagens, alertas e contatos relacionados às funcionalidades do sistema.

As tabelas são relacionadas por chaves primárias (PK) e chaves estrangeiras (FK), permitindo manter a integridade dos registros.

### Principais tabelas

| Tabela | Finalidade |
|---|---|
| `usuario` | Armazenar informações cadastrais dos usuários. |
| `veiculo` | Registrar os veículos associados aos usuários. |
| `viagem` | Armazenar informações sobre origem, destino e deslocamentos. |
| `servico_emergencia` | Organizar informações sobre serviços de emergência cadastrados no sistema. |
| `contato_confianca` | Registrar pessoas de confiança vinculadas aos usuários. |
| `contato_alerta` | Organizar os vínculos entre contatos e alertas enviados. |
| `alerta` | Registrar alertas relacionados às condições de trânsito e a possíveis emergências. |
| `agente_transito` | Organizar informações dos agentes de trânsito cadastrados no sistema. |

Essa relação reúne as entidades discutidas para o projeto. Os campos, as chaves e os relacionamentos definitivos devem seguir o modelo físico e o script SQL efetivamente utilizados pela equipe.

### Relacionamentos

- Um usuário pode possuir veículos cadastrados.
- Um usuário pode estar associado a viagens.
- Um veículo pode estar relacionado a diferentes viagens.
- Os contatos de confiança podem estar vinculados a usuários.
- Os alertas podem ser associados a viagens e contatos, conforme as regras definidas no banco.
- Os serviços de emergência e os agentes de trânsito podem integrar as funcionalidades de apoio ao usuário.

Os relacionamentos devem ser implementados por meio de chaves estrangeiras e respeitar as restrições definidas no banco de dados.

### Configuração no Supabase

1. Acesse o painel do projeto Supabase.
2. Abra o **SQL Editor**.
3. Execute o script de criação das tabelas no banco correto.
4. Acesse o **Table Editor** para verificar a estrutura criada.
5. Confira os nomes das colunas, as chaves primárias, as chaves estrangeiras e as restrições.
6. Verifique as permissões de acesso e as políticas de segurança necessárias para as operações da API.

**Importante:** a estrutura deve ser conferida antes de executar novamente um script de criação. Não exclua tabelas nem dados sem confirmar que a operação é segura.

## 4. Preparação do ambiente Python

Para executar o backend, é necessário ter o Python instalado e configurar um ambiente virtual para as dependências.

Abra o terminal na pasta `backend`.

### Linux

```bash
python3 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### Windows — Prompt de Comando

```bat
python -m venv venv
venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### Windows — PowerShell

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Após a instalação, verifique se existem conflitos entre as dependências:

```bash
python -m pip check
```

O arquivo `requirements.txt` deve incluir as bibliotecas necessárias para a implementação real, como FastAPI, Uvicorn, SQLAlchemy e o driver PostgreSQL, caso o backend utilize essa arquitetura.

Se o projeto utilizar acesso ao banco por meio da Data API do Supabase, será necessário configurar o cliente `supabase` em vez de assumir uma conexão direta por SQLAlchemy. A lista de dependências precisa corresponder ao código efetivamente utilizado.

## 5. Configuração do banco e das variáveis de ambiente

O Essência Nova utiliza o Supabase como plataforma de banco de dados. A conexão do backend deve ser configurada de acordo com a arquitetura implementada.

Se a aplicação utilizar conexão PostgreSQL direta, crie o arquivo `.env` com as variáveis esperadas pelo código. Um exemplo de configuração é:

```env
DATABASE_URL="SUA_URL_DE_CONEXAO_POSTGRESQL"
```

Se o backend utilizar o cliente Supabase pela Data API, a configuração poderá utilizar:

```env
SUPABASE_URL="https://SEU_PROJETO.supabase.co"
SUPABASE_KEY="SUA_CHAVE_DE_ACESSO"
```

Esses são exemplos alternativos de configuração. Utilize somente as variáveis exigidas pela implementação atual, sem misturar métodos de conexão diferentes.

No arquivo `.gitignore`, inclua:

```gitignore
.env
venv/
.venv/
__pycache__/
*.pyc
```

Não envie credenciais reais para o GitHub. Utilize variáveis de ambiente e mantenha as permissões do banco limitadas às operações necessárias.

## 6. Desenvolvimento do backend

O backend é responsável por receber as requisições, validar os dados, executar as regras de negócio e se comunicar com o banco de dados.

A API FastAPI permite organizar os recursos do sistema por meio de endpoints HTTP. Entre as operações previstas estão o cadastro e a consulta de usuários, veículos, viagens, contatos de confiança, alertas e serviços de emergência.

### Operações CRUD

CRUD representa as quatro operações fundamentais de manipulação de dados:

- **Create:** cadastrar novos registros.
- **Read:** consultar e listar registros.
- **Update:** atualizar informações existentes.
- **Delete:** excluir registros.

A tabela abaixo apresenta exemplos de rotas que podem ser implementadas. Os caminhos definitivos dependem do código da API.

| Recurso | Exemplos de rotas | Finalidade |
|---|---|---|
| Usuários | `/usuarios` | Cadastro e consulta de usuários. |
| Veículos | `/veiculos` | Cadastro e consulta de veículos. |
| Viagens | `/viagens` | Registro e consulta de deslocamentos. |
| Contatos de confiança | `/contatos-confianca` | Gerenciamento de contatos cadastrados. |
| Alertas | `/alertas` | Registro e consulta de alertas. |
| Serviços de emergência | `/servicos-emergencia` | Consulta dos serviços cadastrados. |
| Agentes de trânsito | `/agentes-transito` | Consulta e gerenciamento de agentes cadastrados. |

Esses endpoints são exemplos de organização e não devem ser considerados implementados até que estejam registrados no código.

### Cuidados na implementação

- Validar os dados recebidos pela API.
- Utilizar as chaves primárias e estrangeiras definidas no banco.
- Verificar a existência de registros relacionados antes de realizar operações.
- Tratar erros de validação e registros inexistentes.
- Retornar códigos HTTP adequados ao resultado das operações.
- Evitar duplicidade de registros quando houver restrições de unicidade.
- Implementar autenticação e autorização adequadas antes de disponibilizar informações pessoais.
- Proteger dados de localização, contatos e informações de emergência.

## 7. Inteligência artificial e análise de dados

A inteligência artificial é uma das áreas de desenvolvimento do Essência Nova. Sua proposta é utilizar dados de trânsito para identificar padrões e produzir informações que auxiliem na prevenção de riscos e no planejamento dos deslocamentos.

A análise pode utilizar arquivos CSV contendo registros de ocorrências, horários, locais e outras informações relevantes disponíveis para o projeto.

### Etapas da análise

1. **Coleta de dados:** reunir dados disponíveis e adequados para análise.
2. **Organização:** estruturar os registros e verificar campos ausentes ou inconsistentes.
3. **Análise estatística:** identificar frequências de ocorrências por horário, local ou categoria.
4. **Classificação de risco:** aplicar regras ou modelos para organizar situações em categorias como normal, atenção e risco.
5. **Identificação de padrões:** comparar registros para reconhecer períodos e locais que merecem atenção.
6. **Apresentação dos resultados:** organizar as informações em tabelas, gráficos ou alertas, conforme as funcionalidades implementadas.

A classificação por categorias é uma proposta de análise e deve ser documentada de acordo com as regras efetivamente utilizadas no código.

Os resultados dependem da qualidade, da quantidade e da representatividade dos dados. Uma análise baseada em registros históricos não garante a previsão de um acidente nem substitui as informações oficiais de trânsito.

## 8. Funcionalidades propostas

O Essência Nova foi planejado para reunir recursos que auxiliem os usuários durante seus deslocamentos.

### 8.1. Cadastro de usuários e veículos

Permitir que o sistema organize os dados dos usuários e dos veículos associados a eles, respeitando as regras de validação e os relacionamentos do banco de dados.

### 8.2. Registro e acompanhamento de viagens

Organizar informações sobre origem, destino, horários e outros dados dos deslocamentos, conforme os campos implementados no banco.

### 8.3. Alertas de trânsito

Registrar e apresentar informações relevantes sobre ocorrências e condições das vias, de acordo com os dados disponíveis e as funcionalidades implementadas.

### 8.4. Contatos de confiança

Permitir o cadastro de contatos autorizados para receber informações em situações de emergência, conforme as permissões e as regras de privacidade definidas pela aplicação.

### 8.5. Trânsito Preditivo

O diferencial Trânsito Preditivo propõe analisar informações históricas, horários, condições climáticas, calendário e eventos para auxiliar no planejamento de rotas e na estimativa dos deslocamentos.

A implementação desse recurso depende da disponibilidade de dados, das integrações necessárias e do desenvolvimento dos modelos ou regras de análise.

### 8.6. Modo Emergência Inteligente

O Modo Emergência Inteligente propõe identificar uma possível ocorrência por meio de sensores do celular, quando disponíveis, e solicitar a confirmação do usuário sempre que possível.

Após a confirmação de uma emergência ou uma solicitação explícita de ajuda, o sistema poderá facilitar o compartilhamento da localização e das informações necessárias com contatos de confiança.

A funcionalidade também prevê recursos de compartilhamento de viagem e acesso a informações sobre serviços de emergência. A detecção automática, o envio de alertas e as integrações com sensores dependem de implementação e testes específicos.

### 8.7. Recursos voltados aos motociclistas

Outra proposta é adaptar as informações de rota às necessidades dos motociclistas, considerando restrições de circulação, condições das vias e alertas relevantes para esse público.

A disponibilização desses recursos depende da obtenção de informações confiáveis e atualizadas sobre as vias e da implementação das regras de roteamento.

## 9. Inicialização da API

Com o ambiente virtual ativado e o terminal na pasta `backend`, execute:

```bash
python -m uvicorn main:app --reload --host 127.0.0.1 --port 8000
```

Esse comando pressupõe que existe um arquivo `main.py` com uma instância FastAPI chamada `app`.

Se o servidor iniciar corretamente, a documentação interativa poderá ser acessada pelos endereços abaixo:

- **Swagger UI:** http://127.0.0.1:8000/docs
- **ReDoc:** http://127.0.0.1:8000/redoc

A página do Swagger apresenta as rotas que estão realmente registradas na aplicação. Caso alguma rota não apareça, confira os imports e o registro dos módulos responsáveis pelos endpoints.

Se houver falha de conexão com o banco, verifique as variáveis de ambiente, a URL de conexão, as permissões e a conectividade com o Supabase.

O comando acima é destinado à execução local. Uma implantação pública exige configuração de segurança, gerenciamento adequado de credenciais e tratamento dos dados dos usuários.

## 10. Testes da API

Os testes devem ser realizados com dados fictícios e registros preparados para o ambiente de desenvolvimento.

É possível utilizar o Swagger UI ou o Postman para enviar requisições à API.

Para cada recurso implementado, verifique:

| Etapa | Operação | O que conferir |
|---|---|---|
| 1 | Listagem | A API retorna os registros esperados. |
| 2 | Cadastro | O registro é inserido corretamente no banco. |
| 3 | Consulta individual | O registro pode ser localizado pela chave primária. |
| 4 | Atualização | Os campos modificados são persistidos. |
| 5 | Nova consulta | A alteração aparece na resposta da API. |
| 6 | Exclusão | O registro é removido conforme as regras definidas. |
| 7 | Validação | Dados inválidos são rejeitados adequadamente. |

A sequência deve ser adaptada às rotas que realmente existem no projeto. Não é necessário implementar exclusão para todos os recursos caso as regras de negócio exijam outro comportamento.

Após cada operação, confira o resultado retornado pela API e, quando aplicável, confirme a persistência no Table Editor do Supabase.

Os testes devem incluir situações de erro, como campos obrigatórios ausentes, identificadores inexistentes e violações de integridade referencial.

**Importante:** não registre como concluídos testes que ainda não foram executados. Os resultados e as capturas de tela devem corresponder ao ambiente real.

## 11. Evidências do desenvolvimento

Para documentar a evolução do Essência Nova, podem ser organizadas evidências reais das etapas de desenvolvimento.

- Estrutura do projeto no Visual Studio Code.
- Código Python utilizado no backend.
- Tabelas e relacionamentos no Supabase.
- Execução da API e documentação Swagger.
- Requisições realizadas pelo Postman.
- Cadastro e consulta de registros.
- Arquivos CSV utilizados na análise de dados.
- Código e resultados da análise de inteligência artificial.
- Interfaces e protótipos desenvolvidos para a aplicação.
- Repositório GitHub com o código e a documentação.

As evidências devem apresentar somente informações necessárias para demonstrar o desenvolvimento. Senhas, chaves de acesso, dados pessoais e localizações privadas devem permanecer protegidos.

## 12. Considerações finais

O Essência Nova — Trânsito Inteligente é uma proposta de solução tecnológica voltada à mobilidade urbana e à segurança viária. O projeto integra desenvolvimento de sistemas, banco de dados, APIs e análise de dados para organizar informações e apoiar os usuários durante seus deslocamentos.

A utilização de Python, FastAPI e PostgreSQL por meio do Supabase oferece uma base para desenvolver os serviços responsáveis pelo cadastro de informações, pelo registro de viagens e pela organização de alertas.

Os diferenciais Trânsito Preditivo e Modo Emergência Inteligente ampliam a proposta ao explorar a análise de padrões e o apoio ao usuário em situações de risco. Sua efetividade dependerá da implementação, da disponibilidade de dados confiáveis e da realização de testes adequados.

O desenvolvimento será evoluído conforme as necessidades do projeto, com atenção à integridade do banco, à segurança das informações e à confiabilidade das funcionalidades.

---

**Projeto:** Essência Nova — Trânsito Inteligente  
**Área:** Desenvolvimento de Sistemas  
**Linguagem principal:** Python  
**Backend:** FastAPI  
**Banco de dados:** PostgreSQL / Supabase  
**Inteligência artificial:** análise e classificação de dados de trânsito  
**Público-alvo:** motoristas, motociclistas, ciclistas e passageiros  
**Objetivo:** contribuir para a segurança viária e a mobilidade urbana por meio da tecnologia

