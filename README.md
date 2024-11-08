# Projeto Finanças

Este é um projeto de gerenciamento de finanças desenvolvido com **Angular** no frontend e **Node.js** com **Express** no backend. Ele permite que os usuários gerenciem transações financeiras, como compras, pagamentos e despesas, fornecendo uma interface para criar, visualizar e excluir transações.

## Tecnologias Utilizadas

### Frontend
- **Angular**: Framework para desenvolvimento de aplicações web.
- **TypeScript**: Linguagem de programação usada no Angular.
- **HttpClient**: Para requisições HTTP ao backend.

### Backend
- **Node.js**: Ambiente de execução JavaScript no servidor.
- **Express**: Framework para criar APIs de forma simples e rápida.
- **PostgreSQL**: Banco de dados relacional para armazenar as transações.
- **pg**: Biblioteca Node.js para conectar e executar consultas no PostgreSQL.

## Estrutura do Projeto

A estrutura do projeto é organizada em dois diretórios principais: `frontend` e `backend`.


## Funcionalidades

- Adicionar novas transações financeiras.
- Listar todas as transações.
- Remover transações existentes.
- Integração entre frontend e backend para persistência de dados.

## Configuração e Execução

### Pré-requisitos

- **Node.js** (v14 ou superior)
- **PostgreSQL** (Banco de dados configurado)
- **Angular CLI** (para rodar o frontend)

### 1. Configuração do Banco de Dados

1. Crie um banco de dados no PostgreSQL chamado `projeto_financas`.
2. Configure as variáveis de ambiente do banco de dados no arquivo `.env` no diretório `backend` (se necessário). Exemplo:
   ```plaintext
   DB_USER=postgres
   DB_PASSWORD=sua_senha
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=projeto_financas
