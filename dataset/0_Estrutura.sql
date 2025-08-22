-- CRIAÇÃO BANCO DE DADOS

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'dbHealthCare')
BEGIN
    CREATE DATABASE dbHealthCare;
END;


USE [dbHealthCare];

-- CRIAÇÃO DE TABELAS
CREATE TABLE [dim_Localizacao] (
    [ID_Localizacao] [INT] IDENTITY(1,1) PRIMARY KEY,
    [Pais] [VARCHAR] (50),
    [Estado] [VARCHAR] (50),
    [Cidade] [VARCHAR] (50),
    [Longitude] [FLOAT],
    [Latitude] [FLOAT]
);

CREATE TABLE [dim_Fabrica] (
    [ID_Fabrica] [INT] IDENTITY(1,1) PRIMARY KEY,
    [Nome_Fabrica] [VARCHAR] (100),
    [ID_Localizacao] [INT],
    [Capacidade_Producao_Mensal] [INT],
    [Status] [VARCHAR] (20),
    FOREIGN KEY ([ID_Localizacao]) REFERENCES [dim_Localizacao]([ID_Localizacao])
);

CREATE TABLE dim_Produtos (
    [ID_Produto] [INT] IDENTITY(1,1) PRIMARY KEY,
    [Nome_Produto] [VARCHAR] (100),
    [Categoria_Produto] [VARCHAR] (50),
    [Data_Inicio_P&D] [DATE],
    [Data_Fim_P&D] [DATE],
    [Status_P&D] [VARCHAR] (20),
    [Patente_Registrada] [BIT],
    [Investimento_P&D] [DECIMAL] (18,2),
    [Percentual_Conclusao_P&D] [DECIMAL] (5,2),
    [Custo_Unitario_Producao] [DECIMAL](18,2)
);

CREATE TABLE [dim_Clientes] (
    [ID_Cliente] [INT] IDENTITY(1,1) PRIMARY KEY,
    [Nome_Cliente] [VARCHAR] (100),
    [Tipo_Cliente] [VARCHAR] (50),
    [Contato] [VARCHAR] (100),
    [ID_Localizacao] [INT],
    [Status_Cliente] [VARCHAR] (20),
    FOREIGN KEY ([ID_Localizacao]) REFERENCES [dim_Localizacao]([ID_Localizacao])
);

CREATE TABLE [fact_Vendas] (
    [ID_Venda] [INT] IDENTITY(1,1) PRIMARY KEY,
    [ID_Produto] [INT],
    [ID_Cliente] [INT],
    [Data_Venda] [DATE],
    [Quantidade] [INT],
    [Preco_Unitario] [DECIMAL] (18,2),
    [Forma_Pagamento] [VARCHAR] (50),
    [Status_Venda] [VARCHAR] (20),
    FOREIGN KEY ([ID_Produto]) REFERENCES [dim_Produtos]([ID_Produto]),
    FOREIGN KEY ([ID_Cliente]) REFERENCES [dim_Clientes]([ID_Cliente]),
);

CREATE TABLE [fact_Estoque] (
    [ID_Estoque] [INT] IDENTITY(1,1) PRIMARY KEY,
    [ID_Produto] [INT],
    [ID_Fabrica] [INT],
    [Data_Atualizacao] [DATE],
    [Quantidade_Disponivel] [INT],
    FOREIGN KEY ([ID_Produto]) REFERENCES [dim_Produtos]([ID_Produto]),
    FOREIGN KEY ([ID_Fabrica]) REFERENCES [dim_Fabrica]([ID_Fabrica])
);

CREATE TABLE [fact_CustosDespesas] (
    [ID_Custo] [INT] IDENTITY(1,1) PRIMARY KEY,
    [Data_Referencia] [DATE],
    [Tipo_Custo] [VARCHAR] (50),
    [Valor_Custo] [DECIMAL] (18,2)
);

CREATE TABLE [dim_Equipe] (
    [ID_Funcionario] [INT] IDENTITY(1,1) PRIMARY KEY,
    [Nome_Funcionario] [VARCHAR] (100),
    [Cargo] [VARCHAR] (50),
    [ID_Fabrica] [INT] NULL,
    [Data_Entrada] [DATE],
    [Data_Saida] [DATE] NULL,
    [Salario_Mensal] [DECIMAL] (18,2),
    FOREIGN KEY ([ID_Fabrica]) REFERENCES [dim_Fabrica]([ID_Fabrica]),
);

CREATE TABLE [fact_P&D] (
    [ID_P&D] [INT] IDENTITY(1,1) PRIMARY KEY,
    [ID_Produto] [INT],
    [Data_Registro] [DATE],
    [Etapa] [VARCHAR] (50),
    [Custo_Etapa] [DECIMAL] (18,2),
    [Percentual_Conclusao] [DECIMAL] (5,2),
    FOREIGN KEY ([ID_Produto]) REFERENCES [dim_Produtos]([ID_Produto]),
);

