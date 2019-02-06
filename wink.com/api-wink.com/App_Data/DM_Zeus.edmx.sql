
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/05/2019 18:34:10
-- Generated from EDMX file: C:\Users\bruno\Documents\projects\api-wink.com\wink.com\api-wink.com\Models\DM_Zeus.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB_zeus];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ContaMovimentacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Movimentacao] DROP CONSTRAINT [FK_ContaMovimentacao];
GO
IF OBJECT_ID(N'[dbo].[FK_ClienteConta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Conta] DROP CONSTRAINT [FK_ClienteConta];
GO
IF OBJECT_ID(N'[dbo].[FK_ClienteFisico_inherits_Cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cliente_ClienteFisico] DROP CONSTRAINT [FK_ClienteFisico_inherits_Cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ClienteJuridico_inherits_Cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cliente_ClienteJuridico] DROP CONSTRAINT [FK_ClienteJuridico_inherits_Cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ContaCorrente_inherits_Conta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Conta_ContaCorrente] DROP CONSTRAINT [FK_ContaCorrente_inherits_Conta];
GO
IF OBJECT_ID(N'[dbo].[FK_ContaPoupanca_inherits_Conta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Conta_ContaPoupanca] DROP CONSTRAINT [FK_ContaPoupanca_inherits_Conta];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Conta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Conta];
GO
IF OBJECT_ID(N'[dbo].[Movimentacao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Movimentacao];
GO
IF OBJECT_ID(N'[dbo].[Cliente_ClienteFisico]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente_ClienteFisico];
GO
IF OBJECT_ID(N'[dbo].[Cliente_ClienteJuridico]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente_ClienteJuridico];
GO
IF OBJECT_ID(N'[dbo].[Conta_ContaCorrente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Conta_ContaCorrente];
GO
IF OBJECT_ID(N'[dbo].[Conta_ContaPoupanca]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Conta_ContaPoupanca];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(100)  NOT NULL,
    [Login] nvarchar(50)  UNIQUE NOT NULL,
    [Senha] nvarchar(255)  NOT NULL,
    [TipoCliente] int  NOT NULL
);
GO

-- Creating table 'Conta'
CREATE TABLE [dbo].[Conta] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Numero] bigint  NOT NULL,
    [Saldo] float  NOT NULL,
    [TipoConta] int  NOT NULL,
    [Cliente_Id] int  NOT NULL
);
GO

-- Creating table 'Movimentacao'
CREATE TABLE [dbo].[Movimentacao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Valor] float  NOT NULL,
    [Data] datetime  NOT NULL,
    [TipoMovimento] int  NOT NULL,
    [Saldo] float  NOT NULL,
    [Conta_Id] int  NOT NULL
);
GO

-- Creating table 'Cliente_ClienteFisico'
CREATE TABLE [dbo].[Cliente_ClienteFisico] (
    [Cpf] nvarchar(20)  UNIQUE NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Cliente_ClienteJuridico'
CREATE TABLE [dbo].[Cliente_ClienteJuridico] (
    [Cnpj] nvarchar(50)  UNIQUE NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Conta_ContaCorrente'
CREATE TABLE [dbo].[Conta_ContaCorrente] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Conta_ContaPoupanca'
CREATE TABLE [dbo].[Conta_ContaPoupanca] (
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Conta'
ALTER TABLE [dbo].[Conta]
ADD CONSTRAINT [PK_Conta]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Movimentacao'
ALTER TABLE [dbo].[Movimentacao]
ADD CONSTRAINT [PK_Movimentacao]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cliente_ClienteFisico'
ALTER TABLE [dbo].[Cliente_ClienteFisico]
ADD CONSTRAINT [PK_Cliente_ClienteFisico]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cliente_ClienteJuridico'
ALTER TABLE [dbo].[Cliente_ClienteJuridico]
ADD CONSTRAINT [PK_Cliente_ClienteJuridico]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Conta_ContaCorrente'
ALTER TABLE [dbo].[Conta_ContaCorrente]
ADD CONSTRAINT [PK_Conta_ContaCorrente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Conta_ContaPoupanca'
ALTER TABLE [dbo].[Conta_ContaPoupanca]
ADD CONSTRAINT [PK_Conta_ContaPoupanca]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Conta_Id] in table 'Movimentacao'
ALTER TABLE [dbo].[Movimentacao]
ADD CONSTRAINT [FK_ContaMovimentacao]
    FOREIGN KEY ([Conta_Id])
    REFERENCES [dbo].[Conta]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContaMovimentacao'
CREATE INDEX [IX_FK_ContaMovimentacao]
ON [dbo].[Movimentacao]
    ([Conta_Id]);
GO

-- Creating foreign key on [Cliente_Id] in table 'Conta'
ALTER TABLE [dbo].[Conta]
ADD CONSTRAINT [FK_ClienteConta]
    FOREIGN KEY ([Cliente_Id])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteConta'
CREATE INDEX [IX_FK_ClienteConta]
ON [dbo].[Conta]
    ([Cliente_Id]);
GO

-- Creating foreign key on [Id] in table 'Cliente_ClienteFisico'
ALTER TABLE [dbo].[Cliente_ClienteFisico]
ADD CONSTRAINT [FK_ClienteFisico_inherits_Cliente]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Cliente_ClienteJuridico'
ALTER TABLE [dbo].[Cliente_ClienteJuridico]
ADD CONSTRAINT [FK_ClienteJuridico_inherits_Cliente]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Conta_ContaCorrente'
ALTER TABLE [dbo].[Conta_ContaCorrente]
ADD CONSTRAINT [FK_ContaCorrente_inherits_Conta]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Conta]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Conta_ContaPoupanca'
ALTER TABLE [dbo].[Conta_ContaPoupanca]
ADD CONSTRAINT [FK_ContaPoupanca_inherits_Conta]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Conta]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------