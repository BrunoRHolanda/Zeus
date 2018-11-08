
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/07/2018 21:03:18
-- Generated from EDMX file: C:\Users\prog\Documents\projetos\api@wink.com\wink.com\Models\DB_wink.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB_wink];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ClienteDefinir'
CREATE TABLE [dbo].[ClienteDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(50)  NOT NULL,
    [email] nvarchar(100)  NOT NULL,
    [senha] nvarchar(max)  NOT NULL,
    [dt_nasc] datetime  NOT NULL,
    [sexo] bit  NOT NULL,
    [cpf] nvarchar(15)  NOT NULL,
    [cel] nvarchar(15)  NOT NULL,
    [sessao_api_pagSeguro] nvarchar(max)  NULL
);
GO

-- Creating table 'EnderecoDefinir'
CREATE TABLE [dbo].[EnderecoDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [cep] nvarchar(15)  NOT NULL,
    [uf] nvarchar(2)  NOT NULL,
    [cidade] nvarchar(100)  NOT NULL,
    [bairro] nvarchar(100)  NOT NULL,
    [rua] nvarchar(100)  NOT NULL,
    [numero] int  NOT NULL,
    [complemento] nvarchar(100)  NOT NULL,
    [entrega] bit  NOT NULL,
    [Cliente_id] int  NOT NULL
);
GO

-- Creating table 'CartaoDefinir'
CREATE TABLE [dbo].[CartaoDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [numero] nvarchar(15)  NOT NULL,
    [cvv] int  NOT NULL,
    [mes_exp] int  NOT NULL,
    [ano_exp] int  NOT NULL,
    [selecionado] bit  NOT NULL,
    [Cliente_id] int  NOT NULL
);
GO

-- Creating table 'VendaDefinir'
CREATE TABLE [dbo].[VendaDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [dt_venda] datetime  NOT NULL,
    [valor_total] float  NOT NULL,
    [status] int  NOT NULL,
    [cod_transacao] nvarchar(max)  NOT NULL,
    [link_pgto] nvarchar(max)  NOT NULL,
    [forma_pgto] int  NOT NULL,
    [hash_venda] nvarchar(max)  NOT NULL,
    [Cliente_id] int  NOT NULL
);
GO

-- Creating table 'CategoriaDefinir'
CREATE TABLE [dbo].[CategoriaDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SubcategoriaDefinir'
CREATE TABLE [dbo].[SubcategoriaDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] nvarchar(max)  NOT NULL,
    [Categoria_id] int  NOT NULL
);
GO

-- Creating table 'ProdutoDefinir'
CREATE TABLE [dbo].[ProdutoDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] nvarchar(max)  NOT NULL,
    [valor] decimal(18,0)  NOT NULL,
    [qtde_estoque] int  NOT NULL,
    [desconto_promocao] float  NOT NULL,
    [foto] geography  NOT NULL,
    [promocao] bit  NOT NULL,
    [Subcategoria_id] int  NOT NULL,
    [Fornecedor_id] int  NOT NULL
);
GO

-- Creating table 'FornecedorDefinir'
CREATE TABLE [dbo].[FornecedorDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL,
    [cnpj] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Produto_VendaDefinir'
CREATE TABLE [dbo].[Produto_VendaDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [qtde] int  NOT NULL,
    [Produto_id] int  NOT NULL,
    [Venda_id] int  NOT NULL
);
GO

-- Creating table 'OfertaDefinir'
CREATE TABLE [dbo].[OfertaDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] nvarchar(max)  NOT NULL,
    [validade] datetime  NOT NULL,
    [expirado] bit  NOT NULL,
    [valor_oferta] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Produto_ofertaDefinir'
CREATE TABLE [dbo].[Produto_ofertaDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Produto_id] int  NOT NULL,
    [Oferta_id] int  NOT NULL
);
GO

-- Creating table 'AdministradorDefinir'
CREATE TABLE [dbo].[AdministradorDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [senha] nvarchar(max)  NOT NULL,
    [token_api_pagSeguro] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RelatorioDefinir'
CREATE TABLE [dbo].[RelatorioDefinir] (
    [id] int IDENTITY(1,1) NOT NULL,
    [tipo] int  NOT NULL,
    [dt_inicio] datetime  NOT NULL,
    [dt_fim] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'ClienteDefinir'
ALTER TABLE [dbo].[ClienteDefinir]
ADD CONSTRAINT [PK_ClienteDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'EnderecoDefinir'
ALTER TABLE [dbo].[EnderecoDefinir]
ADD CONSTRAINT [PK_EnderecoDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'CartaoDefinir'
ALTER TABLE [dbo].[CartaoDefinir]
ADD CONSTRAINT [PK_CartaoDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'VendaDefinir'
ALTER TABLE [dbo].[VendaDefinir]
ADD CONSTRAINT [PK_VendaDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'CategoriaDefinir'
ALTER TABLE [dbo].[CategoriaDefinir]
ADD CONSTRAINT [PK_CategoriaDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'SubcategoriaDefinir'
ALTER TABLE [dbo].[SubcategoriaDefinir]
ADD CONSTRAINT [PK_SubcategoriaDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'ProdutoDefinir'
ALTER TABLE [dbo].[ProdutoDefinir]
ADD CONSTRAINT [PK_ProdutoDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'FornecedorDefinir'
ALTER TABLE [dbo].[FornecedorDefinir]
ADD CONSTRAINT [PK_FornecedorDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Produto_VendaDefinir'
ALTER TABLE [dbo].[Produto_VendaDefinir]
ADD CONSTRAINT [PK_Produto_VendaDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'OfertaDefinir'
ALTER TABLE [dbo].[OfertaDefinir]
ADD CONSTRAINT [PK_OfertaDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Produto_ofertaDefinir'
ALTER TABLE [dbo].[Produto_ofertaDefinir]
ADD CONSTRAINT [PK_Produto_ofertaDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'AdministradorDefinir'
ALTER TABLE [dbo].[AdministradorDefinir]
ADD CONSTRAINT [PK_AdministradorDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'RelatorioDefinir'
ALTER TABLE [dbo].[RelatorioDefinir]
ADD CONSTRAINT [PK_RelatorioDefinir]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Cliente_id] in table 'EnderecoDefinir'
ALTER TABLE [dbo].[EnderecoDefinir]
ADD CONSTRAINT [FK_ClienteEndereco]
    FOREIGN KEY ([Cliente_id])
    REFERENCES [dbo].[ClienteDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteEndereco'
CREATE INDEX [IX_FK_ClienteEndereco]
ON [dbo].[EnderecoDefinir]
    ([Cliente_id]);
GO

-- Creating foreign key on [Cliente_id] in table 'CartaoDefinir'
ALTER TABLE [dbo].[CartaoDefinir]
ADD CONSTRAINT [FK_ClienteCartao]
    FOREIGN KEY ([Cliente_id])
    REFERENCES [dbo].[ClienteDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteCartao'
CREATE INDEX [IX_FK_ClienteCartao]
ON [dbo].[CartaoDefinir]
    ([Cliente_id]);
GO

-- Creating foreign key on [Cliente_id] in table 'VendaDefinir'
ALTER TABLE [dbo].[VendaDefinir]
ADD CONSTRAINT [FK_ClienteVenda]
    FOREIGN KEY ([Cliente_id])
    REFERENCES [dbo].[ClienteDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteVenda'
CREATE INDEX [IX_FK_ClienteVenda]
ON [dbo].[VendaDefinir]
    ([Cliente_id]);
GO

-- Creating foreign key on [Categoria_id] in table 'SubcategoriaDefinir'
ALTER TABLE [dbo].[SubcategoriaDefinir]
ADD CONSTRAINT [FK_CategoriaSubcategoria]
    FOREIGN KEY ([Categoria_id])
    REFERENCES [dbo].[CategoriaDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaSubcategoria'
CREATE INDEX [IX_FK_CategoriaSubcategoria]
ON [dbo].[SubcategoriaDefinir]
    ([Categoria_id]);
GO

-- Creating foreign key on [Subcategoria_id] in table 'ProdutoDefinir'
ALTER TABLE [dbo].[ProdutoDefinir]
ADD CONSTRAINT [FK_SubcategoriaProduto]
    FOREIGN KEY ([Subcategoria_id])
    REFERENCES [dbo].[SubcategoriaDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SubcategoriaProduto'
CREATE INDEX [IX_FK_SubcategoriaProduto]
ON [dbo].[ProdutoDefinir]
    ([Subcategoria_id]);
GO

-- Creating foreign key on [Fornecedor_id] in table 'ProdutoDefinir'
ALTER TABLE [dbo].[ProdutoDefinir]
ADD CONSTRAINT [FK_FornecedorProduto]
    FOREIGN KEY ([Fornecedor_id])
    REFERENCES [dbo].[FornecedorDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FornecedorProduto'
CREATE INDEX [IX_FK_FornecedorProduto]
ON [dbo].[ProdutoDefinir]
    ([Fornecedor_id]);
GO

-- Creating foreign key on [Produto_id] in table 'Produto_VendaDefinir'
ALTER TABLE [dbo].[Produto_VendaDefinir]
ADD CONSTRAINT [FK_ProdutoProduto_Venda]
    FOREIGN KEY ([Produto_id])
    REFERENCES [dbo].[ProdutoDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProdutoProduto_Venda'
CREATE INDEX [IX_FK_ProdutoProduto_Venda]
ON [dbo].[Produto_VendaDefinir]
    ([Produto_id]);
GO

-- Creating foreign key on [Venda_id] in table 'Produto_VendaDefinir'
ALTER TABLE [dbo].[Produto_VendaDefinir]
ADD CONSTRAINT [FK_VendaProduto_Venda]
    FOREIGN KEY ([Venda_id])
    REFERENCES [dbo].[VendaDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VendaProduto_Venda'
CREATE INDEX [IX_FK_VendaProduto_Venda]
ON [dbo].[Produto_VendaDefinir]
    ([Venda_id]);
GO

-- Creating foreign key on [Produto_id] in table 'Produto_ofertaDefinir'
ALTER TABLE [dbo].[Produto_ofertaDefinir]
ADD CONSTRAINT [FK_ProdutoEntidade1]
    FOREIGN KEY ([Produto_id])
    REFERENCES [dbo].[ProdutoDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProdutoEntidade1'
CREATE INDEX [IX_FK_ProdutoEntidade1]
ON [dbo].[Produto_ofertaDefinir]
    ([Produto_id]);
GO

-- Creating foreign key on [Oferta_id] in table 'Produto_ofertaDefinir'
ALTER TABLE [dbo].[Produto_ofertaDefinir]
ADD CONSTRAINT [FK_OfertaEntidade1]
    FOREIGN KEY ([Oferta_id])
    REFERENCES [dbo].[OfertaDefinir]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OfertaEntidade1'
CREATE INDEX [IX_FK_OfertaEntidade1]
ON [dbo].[Produto_ofertaDefinir]
    ([Oferta_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------