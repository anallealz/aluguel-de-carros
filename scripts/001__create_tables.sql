CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS dados_bancarios (
    id_dados_bancarios INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pessoa INTEGER NOT NULL UNIQUE,
    banco VARCHAR(100) NOT NULL,
    agencia VARCHAR(20) NOT NULL,
    conta VARCHAR(30) NOT NULL,

    CONSTRAINT fk_dados_bancarios_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
);

CREATE TABLE IF NOT EXISTS veiculo (
    id_veiculo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,

    CONSTRAINT chk_tipo_veiculo
        CHECK (tipo IN ('Carro de passeio', 'Motocicleta', 'Caminhão'))
);

CREATE TABLE IF NOT EXISTS contrato (
    id_contrato INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero_contrato VARCHAR(20) NOT NULL UNIQUE,
    tipo_pagamento VARCHAR(20) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    id_pessoa INTEGER NOT NULL,
    id_veiculo INTEGER NOT NULL,

    CONSTRAINT fk_contrato_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa),

    CONSTRAINT fk_contrato_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo),

    CONSTRAINT chk_tipo_pagamento
        CHECK (tipo_pagamento IN ('Cartão', 'PIX')),

    CONSTRAINT chk_periodo_contrato
        CHECK (data_fim >= data_inicio)
);

CREATE TABLE IF NOT EXISTS atendente (
    id_atendente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pessoa INTEGER NOT NULL UNIQUE,

    CONSTRAINT fk_atendente_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoa(id_pessoa)
);
