-- CRIACAO DO BANCO ORIGINAL

CREATE DATABASE EcoSave;
use EcoSave;

CREATE TABLE Catalogo_Especie (
    id_especie VARCHAR(8) PRIMARY KEY,
    risco_extincao DECIMAL(3, 2), 
    especie VARCHAR(40),
    habitat_especie TEXT,
    quantidade_animais INT
);


CREATE TABLE Denuncia (
    id_denuncia INT PRIMARY KEY AUTO_INCREMENT, 
    data_denuncia DATE,
    lugar VARCHAR(50),
    descricao TEXT
);


CREATE TABLE Equipe_Resgate (
    id_equipe VARCHAR(8) PRIMARY KEY,
    membros_qtd int, 
    tempo_experiencia DECIMAL(4, 2), 
    disponibilidade BOOLEAN
);


CREATE TABLE Resgate (
    id_resgate VARCHAR(8) PRIMARY KEY,
    id_equipe VARCHAR(8),
    FOREIGN KEY (id_equipe) REFERENCES Equipe_Resgate(id_equipe),
    id_denuncia INT,
    FOREIGN KEY (id_denuncia) REFERENCES Denuncia(id_denuncia),
    data_resgate DATE,
    lugar VARCHAR(50), 
    status ENUM('Em andamento', 'Finalizado', 'Falhou') NOT NULL DEFAULT 'Em andamento',
    descricao TEXT
);


CREATE TABLE Centro_de_Triagem (
    id_centro_de_triagem VARCHAR(8) PRIMARY KEY,
    responsavel VARCHAR(45),
    local_centro TEXT,
    telefone VARCHAR(15),
    capacidade INT
);

CREATE TABLE Avaliacao_Clinica (
    id_avaliacao VARCHAR(8) PRIMARY KEY,
    profissionais VARCHAR(45),  -- esta coluna sera normalizada
    diagnostico TEXT,
    id_centro_de_triagem VARCHAR(8) NOT NULL,
    FOREIGN KEY (id_centro_de_triagem) REFERENCES Centro_de_Triagem(id_centro_de_triagem),
    id_resgate VARCHAR(8) NOT NULL,
    FOREIGN KEY (id_resgate) REFERENCES Resgate(id_resgate)
);


CREATE TABLE Tratamento (
    id_tratamento VARCHAR(8) PRIMARY KEY,
    data_inicio DATETIME,
    data_fim DATETIME,
    descricao TEXT,
    medico VARCHAR(45),
    id_avaliacao VARCHAR(8) NOT NULL,
    FOREIGN KEY (id_avaliacao) REFERENCES Avaliacao_Clinica(id_avaliacao)
);

CREATE TABLE Animal (
    id_animal VARCHAR(8) PRIMARY KEY,
    id_resgate VARCHAR(8), 
    FOREIGN KEY (id_resgate) REFERENCES Resgate(id_resgate),
    id_especie VARCHAR(8),
    FOREIGN KEY (id_especie) REFERENCES Catalogo_Especie(id_especie),
    condicao TEXT,
    status ENUM('Resgatado', 'Em tratamento', 'Solto', 'Falecido') NOT NULL DEFAULT 'Resgatado',
    id_tratamento VARCHAR(8), 
    FOREIGN KEY (id_tratamento) REFERENCES Tratamento(id_tratamento)
);

CREATE TABLE Soltura (
    id_soltura VARCHAR(8) PRIMARY KEY,
    data_soltura DATETIME,
    local_soltura VARCHAR(50),
    observacoes TEXT,
    id_animal VARCHAR(8) NOT NULL UNIQUE, -- Garante que um animal seja solto apenas uma vez
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
);

CREATE TABLE Relatorio (
    id_relatorio VARCHAR(8) PRIMARY KEY,
    id_soltura VARCHAR(8) NOT NULL,
    conteudo TEXT,
    data_emissao DATE,
    FOREIGN KEY (id_soltura) REFERENCES Soltura(id_soltura)
);