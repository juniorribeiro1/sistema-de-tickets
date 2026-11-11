# 🎫 Sistema de Chamados (Help Desk)

> Sistema web para abertura, acompanhamento e resolução de chamados de suporte (tickets), construído do zero como projeto de aprendizado e portfólio.

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![Licença](https://img.shields.io/badge/licença-MIT-blue)

---

## 📌 Sobre o projeto

Este projeto simula o dia a dia de um setor de suporte: usuários abrem chamados descrevendo problemas ou solicitações, atendentes assumem e respondem, e administradores acompanham tudo por meio de relatórios.

Ele foi criado com dois objetivos:

1. **Aprender** na prática os fundamentos que uma vaga júnior de desenvolvimento exige: modelagem de banco de dados, back-end, API REST, autenticação, front-end, testes, versionamento e deploy.
2. **Servir de portfólio**, com código organizado, documentação e histórico de commits que mostrem a evolução.

---

## ✨ Funcionalidades

### Versão 1.0 (MVP)

- [ ] Cadastro e login de usuários
- [ ] Perfis de acesso: **Solicitante**, **Atendente** e **Administrador**
- [ ] Abertura de chamado (título, descrição, categoria, prioridade)
- [ ] Listagem e filtros (status, prioridade, categoria, responsável)
- [ ] Atribuição de chamado a um atendente
- [ ] Comentários/respostas dentro do chamado
- [ ] Alteração de status: `Aberto` → `Em andamento` → `Resolvido` → `Fechado`
- [ ] Histórico de alterações do chamado

### Próximas versões

- [ ] Anexos (imagens e arquivos)
- [ ] Notificações por e-mail
- [ ] Dashboard com métricas (tempo médio de resolução, chamados por categoria)
- [ ] SLA por prioridade
- [ ] Avaliação de atendimento pelo solicitante

---

## 🗃️ Modelagem de dados (rascunho inicial)

Entidades principais previstas:

| Entidade | Descrição |
|---|---|
| `usuarios` | Pessoas que acessam o sistema (nome, e-mail, senha com hash, perfil) |
| `categorias` | Tipos de chamado (ex.: Rede, Software, Hardware) |
| `chamados` | Chamado em si (título, descrição, status, prioridade, datas) |
| `comentarios` | Mensagens trocadas dentro de um chamado |
| `historico_status` | Registro de cada mudança de status e quem a fez |

Relacionamentos principais:

- Um usuário **abre** vários chamados (1:N)
- Um atendente **é responsável por** vários chamados (1:N)
- Uma categoria **classifica** vários chamados (1:N)
- Um chamado **possui** vários comentários e vários registros de histórico (1:N)

> O diagrama ER (DER) será adicionado em `docs/` conforme a modelagem evoluir.

---

## 🛠️ Tecnologias

> As escolhas abaixo são o plano inicial e podem mudar ao longo do projeto.

| Camada | Tecnologia |
|---|---|
| Front-end | HTML, CSS, JavaScript, React |
| Back-end | Node.js + Express |
| Banco de dados | PostgreSQL |
| Autenticação | JWT + bcrypt |
| Testes | Jest |
| Versionamento | Git e GitHub |
| Deploy | A definir |

---

## 📁 Estrutura de pastas (planejada)

```
.
├── backend/
│   ├── src/
│   │   ├── controllers/
│   │   ├── routes/
│   │   ├── services/
│   │   ├── middlewares/
│   │   └── database/
│   └── package.json
├── frontend/
│   ├── src/
│   └── package.json
├── docs/
│   └── (diagramas, decisões de arquitetura)
└── README.md
```

---

## 🚀 Como executar

> Esta seção será preenchida assim que a primeira versão rodável estiver pronta.

```bash
# Clonar o repositório
git clone https://github.com/SEU-USUARIO/NOME-DO-REPO.git
cd NOME-DO-REPO

# Back-end
cd backend
npm install
npm run dev

# Front-end (em outro terminal)
cd frontend
npm install
npm start
```

### Variáveis de ambiente

Crie um arquivo `.env` em `backend/` com base em `.env.example`:

```
DATABASE_URL=postgresql://usuario:senha@localhost:5432/chamados
JWT_SECRET=troque-por-um-segredo-forte
PORT=3000
```

---

## 🗺️ Roadmap de aprendizado

| Fase | Foco | Entrega |
|---|---|---|
| 1 | Modelagem de banco de dados e SQL | DER, scripts de criação das tabelas, consultas básicas |
| 2 | Git/GitHub e organização do projeto | Repositório estruturado, commits e branches |
| 3 | Back-end com Node.js e Express | API REST com CRUD de chamados |
| 4 | Autenticação e autorização | Login, JWT, perfis de acesso |
| 5 | Front-end com React | Telas de login, lista e detalhe de chamados |
| 6 | Testes e qualidade | Testes automatizados, validações, tratamento de erros |
| 7 | Deploy | Aplicação publicada e documentada |

---

## 📚 Documentação da API

> Será adicionada conforme os endpoints forem criados (previsão: Swagger/OpenAPI).

---

## 🤝 Contribuição

Este é um projeto de estudo, mas sugestões e revisões de código são bem-vindas. Abra uma *issue* ou um *pull request*.

---

## 📄 Licença

Distribuído sob a licença MIT.

---

## 👤 Autor

**Junior**: em transição de carreira para desenvolvimento de software.

- GitHub: [@SEU-USUARIO](https://github.com/SEU-USUARIO)
- LinkedIn: *adicione o seu link aqui*
