USE Universitate;

CREATE TABLE Orase (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Denumire NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
);

CREATE TABLE Grupa (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Denumire NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
);

CREATE TABLE Student (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GrupaId INT REFERENCES Grupa(Id),
    OrasResedintaId INT REFERENCES Orase(Id),
    Nume NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS,
    Prenume NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
);

CREATE TABLE Materie (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nume NVARCHAR(MAX) COLLATE SQL_Romanian_CP1250_CS_AS
);

CREATE TABLE Note (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    StudentId INT REFERENCES Student(Id),
    MaterieId INT REFERENCES Materie(Id),
    NotaObtinuta INT 
);
