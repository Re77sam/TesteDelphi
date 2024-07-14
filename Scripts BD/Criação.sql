CREATE DATABASE BancoSistema;

USE BancoSistema;

-- Tabela de Agências
CREATE TABLE Agencias (
    CodigoAgencia INT PRIMARY KEY IDENTITY(1,1),
    NumeroAgencia VARCHAR(10) NOT NULL,
    NomeAgencia VARCHAR(100) NOT NULL,
    NomeCidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    DataAbertura DATE NOT NULL,
    GerenteResponsavel VARCHAR(100) NOT NULL
);

-- Tabela de Contas
CREATE TABLE Contas (
    CodigoConta INT PRIMARY KEY IDENTITY(1,1),
    NumeroConta VARCHAR(10) NOT NULL,
    DigitoConta VARCHAR(1) NOT NULL,
    CodigoAgencia INT NOT NULL,
    NumeroAgencia VARCHAR(10) NOT NULL,
    TitularConta VARCHAR(100) NOT NULL,
    GerenteConta VARCHAR(100) NOT NULL,
    FOREIGN KEY (CodigoAgencia) REFERENCES Agencias(CodigoAgencia)
);

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    CodigoFuncionario INT PRIMARY KEY IDENTITY(1,1),
    NomeFuncionario VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    DataContratacao DATE NOT NULL
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    CodigoCliente INT PRIMARY KEY IDENTITY(1,1),
    NomeCliente VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL
);