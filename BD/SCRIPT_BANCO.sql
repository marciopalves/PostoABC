Create table Combustivel(
    Id INTEGER NOT NULL PRIMARY KEY,
    Descricao VARCHAR(25),
    Sigla VARCHAR(2),
    PercentualImposto INTEGER,
    Valor Float
);

CREATE TABLE TANQUE(
    ID INTEGER NOT NULL PRIMARY KEY,
    DESCRICAO VARCHAR(25),
    ID_COMBUSTIVEL INTEGER NOT NULL,
    ARMAZENAMENTO FLOAT,
    CONSTRAINT FK_COMBUSTIVEL FOREIGN KEY (ID_COMBUSTIVEL) REFERENCES COMBUSTIVEL(ID)  
);

CREATE TABLE BOMBA(
    ID INTEGER NOT NULL PRIMARY KEY,
    DESCRICAO VARCHAR(25),
    ID_TANQUE INTEGER NOT NULL,    
    CONSTRAINT FK_TANQUE FOREIGN KEY (ID_TANQUE) REFERENCES TANQUE(ID)  
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
);
