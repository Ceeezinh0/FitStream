-- Criação do Banco de Dados FITISTREAM
CREATE DATABASE FITISTREAM;

-- Seleciona o Banco de Dados FITISTREAM
USE FITISTREAM;

-- Tabela de Usuarios
CREATE TABLE usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    sexo ENUM('Masculino', 'Feminino', 'Outro'),
    email VARCHAR(255) UNIQUE,
    data_cadastro DATE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    cidade VARCHAR(255),
    estado VARCHAR(255),
    cep VARCHAR(10),
    plano_assinatura VARCHAR(255),
    restricoes_medicas TEXT,
    observacoes TEXT
);

-- Tabela de Questionarios
CREATE TABLE questionario (
    idquestionario INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    descricao TEXT,
    data_resposta DATE,
    nivel_experiencia ENUM('Iniciante', 'Intermediario', 'Avancado'),
    historico_medico TEXT,
    estilo_de_vida TEXT,
    sono ENUM('Ruim', 'Regular', 'Bom'),
    motivacao_esperada TEXT,
    expectativa TEXT,
    avaliacao ENUM('Baixa', 'Media', 'Alta'),
    altura DECIMAL(5, 2),
    peso DECIMAL(5, 2)
);

-- Tabela de Exercicios
CREATE TABLE exercicio (
    idexercicio INT PRIMARY KEY AUTO_INCREMENT,
    nome_exercicio VARCHAR(255),
    descricao TEXT,
    dificuldade ENUM('Facil', 'Moderado', 'Dificil'),
    musculos_alvos TEXT,
    video_link VARCHAR(255)
);

-- Tabela de Perguntas
CREATE TABLE pergunta (
    idpergunta INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT,
    tipo_de_resposta ENUM('Aberta', 'Multipla Escolha'),
    idquestionario INT,
    FOREIGN KEY (idquestionario) REFERENCES questionario(idquestionario)
);

-- Tabela de Respostas
CREATE TABLE resposta (
    idresposta INT PRIMARY KEY AUTO_INCREMENT,
    idpergunta INT,
    idusuario INT,
    resposta TEXT,
    data_resposta DATE,
    FOREIGN KEY (idpergunta) REFERENCES pergunta(idpergunta),
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario)
);

-- Tabela de Progresso
CREATE TABLE progresso (
    idprogresso INT PRIMARY KEY AUTO_INCREMENT,
    idusuario INT,
    idquestionario INT,
    data_resposta DATE,
    idexercicio INT,
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario),
    FOREIGN KEY (idquestionario) REFERENCES questionario(idquestionario),
    FOREIGN KEY (idexercicio) REFERENCES exercicio(idexercicio)
);