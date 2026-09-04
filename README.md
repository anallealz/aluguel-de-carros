# 🚗 Sistema de Aluguel de Carros

Projeto desenvolvido para a disciplina de **Introdução a Banco de Dados**, utilizando o **PostgreSQL**.

## 📌 Sobre o projeto

O projeto consiste no desenvolvimento de um banco de dados relacional para uma empresa de aluguel de veículos, com foco principalmente em motoristas de aplicativos.

O sistema permite o cadastro de pessoas, dados bancários, veículos, contratos de aluguel e atendentes.

## 🎯 Objetivo

Organizar e relacionar as principais informações necessárias para o funcionamento de uma locadora de veículos, permitindo o controle dos clientes, atendentes, veículos disponíveis e contratos realizados.

## 👥 Público-alvo

Empresas de aluguel de veículos, especialmente aquelas que oferecem serviços para motoristas de aplicativos.

## 🗃️ Estrutura do banco de dados

O banco possui cinco tabelas principais:

- **pessoa:** armazena os dados pessoais dos clientes.
- **dados_bancarios:** armazena os dados bancários relacionados a cada pessoa.
- **veiculo:** registra os veículos disponíveis para aluguel.
- **contrato:** registra os contratos realizados entre clientes e veículos.
- **atendente:** identifica quais pessoas cadastradas também atuam como atendentes.

## 🔗 Modelo Relacional

```mermaid
erDiagram
    PESSOA ||--o| DADOS_BANCARIOS : possui
    PESSOA ||--o| ATENDENTE : pode_ser
    PESSOA ||--o{ CONTRATO : realiza
    VEICULO ||--o{ CONTRATO : participa

    PESSOA {
        int id_pessoa PK
        varchar cpf UK
        varchar nome
        varchar sobrenome
        varchar endereco
        varchar email UK
    }

    DADOS_BANCARIOS {
        int id_dados_bancarios PK
        int id_pessoa FK
        varchar banco
        varchar agencia
        varchar conta
    }

    ATENDENTE {
        int id_atendente PK
        int id_pessoa FK
    }

    VEICULO {
        int id_veiculo PK
        varchar placa UK
        varchar marca
        varchar modelo
        varchar tipo
    }

    CONTRATO {
        int id_contrato PK
        varchar numero_contrato UK
        varchar tipo_pagamento
        date data_inicio
        date data_fim
        int id_pessoa FK
        int id_veiculo FK
    }
```

## 🛠️ Tecnologias utilizadas

- PostgreSQL
- pgAdmin
- SQL
- GitHub

## 📂 Scripts

Os scripts SQL do projeto estão disponíveis na pasta `scripts`:

- `001__create_tables.sql` — criação das tabelas e relacionamentos.
- `002__insert_dados_iniciais.sql` — inserção dos dados utilizados para testes.
- `003__testes_update_delete.sql` — operações de UPDATE e DELETE para validação do banco.

## 📚 Disciplina

**Introdução a Banco de Dados**
