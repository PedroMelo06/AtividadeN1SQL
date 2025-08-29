create database BibliotecaUniversitaria;

use BibliotecaUniversitaria;

create table Pessoa(
CPF char(11) primary key,
Nome varchar(100) not null, 
data_nascimento date not null
);

INSERT INTO Pessoa (CPF, Nome, data_Nascimento) VALUES
('12345678901', 'João Silva', '2000-05-10'),
('98765432100', 'Maria Oliveira', '1999-09-15'),
('11122233344', 'Carlos Souza', '1980-01-20');

create table Autor(
ID int primary key auto_increment,
CPF char(11) unique,
Foreign key (CPF) references Pessoa(CPF)
);

INSERT INTO Autor (CPF) VALUES
('11122233344'),
('98765432100'),
('12345678901');

create table Aluno(
Matricula int primary key,
Dataentrada date not null,
Ativo boolean not null,
CPF char(11) unique,
Foreign key (CPF) references Pessoa(CPF)
);

INSERT INTO Aluno (Matricula, CPF, DataEntrada, Ativo) VALUES
(1, '12345678901', '2022-01-01', TRUE),
(2, '98765432100', '2023-02-15', TRUE),
(3, '11122233344', '2024-03-20', TRUE);

CREATE TABLE Curso (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

INSERT INTO Curso (Codigo, Nome) VALUES
(101, 'Ciência da Computação'),
(102, 'Engenharia Civil'),
(103, 'Medicina');

CREATE TABLE Turma (
    Codigo INT PRIMARY KEY,
    Semestre VARCHAR(10) NOT NULL
);

INSERT INTO Turma (Codigo, Semestre) VALUES
(201, '2025-1'),
(202, '2025-2'),
(203, '2025-3');

CREATE TABLE Livro (
    ISBN CHAR(13) PRIMARY KEY,       
    Titulo VARCHAR(200) NOT NULL,
    Ano INT,
    Editora VARCHAR(100)
);

INSERT INTO Livro (ISBN, Titulo, Ano, Editora) VALUES
('9781234567897', 'Introdução ao MySQL', 2020, 'Editora A'),
('9789876543210', 'Estruturas de Dados', 2021, 'Editora B'),
('9781112223334', 'Banco de Dados Avançado', 2019, 'Editora C');

CREATE TABLE Autor_Livro (
    AutorID INT,
    ISBN CHAR(13),
    PRIMARY KEY (AutorID, ISBN),
    FOREIGN KEY (AutorID) REFERENCES Autor(ID),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN)
);

INSERT INTO Autor_Livro (AutorID, ISBN) VALUES
(1, '9781234567897'),
(2, '9789876543210'),
(3, '9781112223334');

CREATE TABLE Aluno_Curso (
    Matricula INT,
    CodigoCurso INT,
    PRIMARY KEY (Matricula, CodigoCurso),
    FOREIGN KEY (Matricula) REFERENCES Aluno(Matricula),
    FOREIGN KEY (CodigoCurso) REFERENCES Curso(Codigo)
);

INSERT INTO Aluno_Curso (Matricula, CodigoCurso) VALUES
(1, 101),
(2, 102),
(3, 103);

CREATE TABLE Aluno_Turma (
    Matricula INT,
    CodigoTurma INT,
    PRIMARY KEY (Matricula, CodigoTurma),
    FOREIGN KEY (Matricula) REFERENCES Aluno(Matricula),
    FOREIGN KEY (CodigoTurma) REFERENCES Turma(Codigo)
);

INSERT INTO Aluno_Turma (Matricula, CodigoTurma) VALUES
(1, 201),
(2, 202),
(3, 203);

CREATE TABLE Emprestimo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Matricula INT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    DataEmprestimo DATE NOT NULL,
    DataDevolucao DATE,
    FOREIGN KEY (Matricula) REFERENCES Aluno(Matricula),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN)
);

INSERT INTO Emprestimo (Matricula, ISBN, DataEmprestimo, DataDevolucao) VALUES
(1, '9781234567897', '2025-08-01', NULL),
(2, '9789876543210', '2025-08-05', '2025-08-20'),
(3, '9781112223334', '2025-08-10', NULL);