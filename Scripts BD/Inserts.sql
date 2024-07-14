-- Populando a tabela de Agências
INSERT INTO Agencias (NumeroAgencia, NomeAgencia, NomeCidade, Estado, DataAbertura, GerenteResponsavel)
VALUES 
('001', 'Agência Central', 'São Paulo', 'SP', '2010-01-15', 'Ana Maria Silva'),
('002', 'Agência Norte', 'Rio de Janeiro', 'RJ', '2012-05-30', 'Carlos Alberto Santos'),
('003', 'Agência Sul', 'Curitiba', 'PR', '2015-08-20', 'Mariana Oliveira'),
('004', 'Agência Leste', 'Belo Horizonte', 'MG', '2018-11-10', 'Roberto Lima'),
('005', 'Agência Oeste', 'Porto Alegre', 'RS', '2020-02-25', 'Juliana Souza');

-- Populando a tabela de Contas
INSERT INTO Contas (NumeroConta, DigitoConta, CodigoAgencia, NumeroAgencia, TitularConta, GerenteConta)
VALUES 
('123456', '0', 1, '001', 'João da Silva', 'Ana Maria Silva'),
('234567', '1', 1, '001', 'Maria Fernandes', 'Ana Maria Silva'),
('345678', '2', 2, '002', 'Carlos Pereira', 'Carlos Alberto Santos'),
('456789', '3', 3, '003', 'Patrícia Almeida', 'Mariana Oliveira'),
('567890', '4', 4, '004', 'Fernanda Costa', 'Roberto Lima'),
('678901', '5', 5, '005', 'Ricardo Dias', 'Juliana Souza');

-- Populando a tabela de Funcionários
INSERT INTO Funcionarios (NomeFuncionario, Cargo, DataContratacao)
VALUES 
('Ana Maria Silva', 'Gerente', '2009-12-01'),
('Carlos Alberto Santos', 'Gerente', '2011-04-15'),
('Mariana Oliveira', 'Gerente', '2014-07-10'),
('Roberto Lima', 'Gerente', '2017-10-01'),
('Juliana Souza', 'Gerente', '2019-01-20'),
('Luiz Henrique', 'Caixa', '2021-05-22'),
('Gabriela Rocha', 'Caixa', '2022-03-14'),
('Felipe Martins', 'Atendente', '2020-08-30'),
('Sofia Carvalho', 'Atendente', '2023-02-17'),
('Rafael Almeida', 'Analista', '2021-09-25');

-- Populando a tabela de Clientes
INSERT INTO Clientes (NomeCliente, CPF, DataNascimento)
VALUES 
('João da Silva', '12345678901', '1980-05-20'),
('Maria Fernandes', '23456789012', '1992-07-15'),
('Carlos Pereira', '34567890123', '1985-09-30'),
('Patrícia Almeida', '45678901234', '1990-02-25'),
('Fernanda Costa', '56789012345', '1975-11-10'),
('Ricardo Dias', '67890123456', '2000-12-05'),
('Ana Clara', '78901234567', '1995-03-10'),
('Bruno Oliveira', '89012345678', '1988-08-20'),
('Lívia Santos', '90123456789', '1972-06-15'),
('Marcos Souza', '01234567890', '1983-01-25');
