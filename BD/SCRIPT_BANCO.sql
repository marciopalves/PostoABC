CREATE TABLE Combustivel
(
    ID Integer NOT NULL PRIMARY KEY,
    Descricao VARCHAR(25),
    Sigla VARCHAR(2),
    Valor FLOAT
);

CREATE TABLE Tanque
(
    ID Integer NOT NULL PRIMARY KEY,
    Descricao VARCHAR(25),
    ID_Combustivel INTEGER NOT NULL, 
    Constraint FK_Combustivel foreign key ON ID_Combustivel REFERENCES Combustivel on (ID)
);

CREATE TABLE Tanque
(
    ID Integer NOT NULL PRIMARY KEY,
    Descricao VARCHAR(25),
    ID_Combustivel INTEGER NOT NULL, 
    Constraint FK_Combustivel foreign key ON (ID_Combustivel) REFERENCES Combustivel on (ID)
);

CREATE TABLE Abastecimento
(
    ID Integer INTEGER Not Null,
    ID_BOMBA INTEGER NOT NULL,
    QTD FLOAT,
    VALOR_UNITARIO FLOAT,
    PERCENTUAL_IMPOSTO INTEGER,
    VALOR_IMPOSTO FLOAT,
    VALOR_TOTAL FLOAT,
    CONSTRAINT PK_Abastecimento PRIMARY KEY(ID)
    CONSTRAINT FK_BOMBA FOREIGN KEY (ID_BOMBA) REFERENCES BOMBA (ID)    
)
