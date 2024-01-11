CREATE DATABASE vacinacao;

USE vacinacao;

CREATE TABLE vacinas
(
    id            INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo        VARCHAR(60)  NOT NULL,
    descricao     VARCHAR(200) NOT NULL,
    doses         INT          NOT NULL,
    periodicidade INT,
    intervalo     INT
);

CREATE TABLE usuarios
(
    id              INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(60) NOT NULL,
    data_nascimento DATE        NOT NULL,
    sexo            CHAR(1)     NOT NULL,
    logradouro      VARCHAR(60) NOT NULL,
    numero          NUMERIC     NOT NULL,
    setor           VARCHAR(40) NOT NULL,
    cidade          VARCHAR(40) NOT NULL,
    uf              CHAR(2)     NOT NULL
);

CREATE TABLE agendas
(
    id            INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data          DATE NOT NULL,
    hora          TIME NOT NULL,
    situacao      CHAR(10),
    data_situacao DATE,
    observacao    VARCHAR(200),
    id_vacina     INT  NOT NULL REFERENCES vacinas (id),
    id_usuario    INT  NOT NULL REFERENCES usuarios (id)
);

CREATE TABLE alergias
(
    id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE usuarios_alergias
(
    id_usuario INT NOT NULL REFERENCES usuarios (id),
    id_alergia INT NOT NULL REFERENCES alergias (id),
    PRIMARY KEY (id_usuario, id_alergia)
);