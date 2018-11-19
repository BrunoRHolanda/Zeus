
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/17/2018 09:35:12
-- Generated from EDMX file: C:\Users\bruno\projetos\dotNET\api-wink.com\wink.com\api-wink.com\Models\DM_Wink.edmx
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

IF OBJECT_ID(N'[dbo].[FK_Categoriasubcategoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subcategorias] DROP CONSTRAINT [FK_Categoriasubcategoria];
GO
IF OBJECT_ID(N'[dbo].[FK_FornecedorProduto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produtos] DROP CONSTRAINT [FK_FornecedorProduto];
GO
IF OBJECT_ID(N'[dbo].[FK_SubcategoriaProduto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produtos] DROP CONSTRAINT [FK_SubcategoriaProduto];
GO
IF OBJECT_ID(N'[dbo].[FK_ProdutoProdutoOferta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdutosOfertas] DROP CONSTRAINT [FK_ProdutoProdutoOferta];
GO
IF OBJECT_ID(N'[dbo].[FK_OfertaProdutoOferta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdutosOfertas] DROP CONSTRAINT [FK_OfertaProdutoOferta];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioEndereco]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enderecos] DROP CONSTRAINT [FK_UsuarioEndereco];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioCartao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cartaoes] DROP CONSTRAINT [FK_UsuarioCartao];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioVenda]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vendas] DROP CONSTRAINT [FK_UsuarioVenda];
GO
IF OBJECT_ID(N'[dbo].[FK_VendaProdutoVenda]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdutosVendas] DROP CONSTRAINT [FK_VendaProdutoVenda];
GO
IF OBJECT_ID(N'[dbo].[FK_ProdutoProdutoVenda]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdutosVendas] DROP CONSTRAINT [FK_ProdutoProdutoVenda];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Enderecos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Enderecos];
GO
IF OBJECT_ID(N'[dbo].[Cartaoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cartaoes];
GO
IF OBJECT_ID(N'[dbo].[Vendas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vendas];
GO
IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[Subcategorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subcategorias];
GO
IF OBJECT_ID(N'[dbo].[Fornecedores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fornecedores];
GO
IF OBJECT_ID(N'[dbo].[Produtos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Produtos];
GO
IF OBJECT_ID(N'[dbo].[Ofertas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ofertas];
GO
IF OBJECT_ID(N'[dbo].[ProdutosOfertas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProdutosOfertas];
GO
IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO
IF OBJECT_ID(N'[dbo].[ProdutosVendas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProdutosVendas];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Enderecos'
CREATE TABLE [dbo].[Enderecos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [cep] nvarchar(max)  NOT NULL,
    [uf] nvarchar(max)  NOT NULL,
    [cidade] nvarchar(max)  NOT NULL,
    [bairro] nvarchar(max)  NOT NULL,
    [rua] nvarchar(max)  NOT NULL,
    [numero] int  NOT NULL,
    [complemento] nvarchar(max)  NOT NULL,
    [entrega] bit  NOT NULL,
    [Usuario_Id] int  NOT NULL
);
GO

-- Creating table 'Cartaoes'
CREATE TABLE [dbo].[Cartaoes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [numero] nvarchar(max)  NOT NULL,
    [cvv] int  NOT NULL,
    [mesExp] int  NOT NULL,
    [anoExp] int  NOT NULL,
    [selecionado] bit  NOT NULL,
    [Usuario_Id] int  NOT NULL
);
GO

-- Creating table 'Vendas'
CREATE TABLE [dbo].[Vendas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [dtVenda] datetime  NOT NULL,
    [valorVenda] float  NOT NULL,
    [status] int  NOT NULL,
    [codTransacao] nvarchar(max)  NOT NULL,
    [linkPgto] nvarchar(max)  NOT NULL,
    [formaPgto] int  NOT NULL,
    [hashVenda] nvarchar(max)  NOT NULL,
    [Usuario_Id] int  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Subcategorias'
CREATE TABLE [dbo].[Subcategorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL,
    [Categoria_Id] int  NOT NULL
);
GO

-- Creating table 'Fornecedores'
CREATE TABLE [dbo].[Fornecedores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL,
    [cnpj] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Produtos'
CREATE TABLE [dbo].[Produtos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL,
    [valor] int  NOT NULL,
    [qtdEstoque] int  NOT NULL,
    [descontoPromocao] float  NOT NULL,
    [foto] nvarchar(max)  NOT NULL,
    [promocao] float  NOT NULL,
    [Fornecedor_Id] int  NOT NULL,
    [Subcategoria_Id] int  NOT NULL
);
GO

-- Creating table 'Ofertas'
CREATE TABLE [dbo].[Ofertas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [descricao] nvarchar(max)  NOT NULL,
    [validade] datetime  NOT NULL,
    [expirado] bit  NOT NULL,
    [valor] float  NOT NULL
);
GO

-- Creating table 'ProdutosOfertas'
CREATE TABLE [dbo].[ProdutosOfertas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [qtd] nvarchar(max)  NOT NULL,
    [Produto_Id] int  NOT NULL,
    [Oferta_Id] int  NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [nome] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [senha] nvarchar(max)  NOT NULL,
    [dtNasc] datetime  NOT NULL,
    [sexo] bit  NOT NULL,
    [cpf] nvarchar(max)  NOT NULL,
    [tel] nvarchar(max)  NOT NULL,
    [role] int  NOT NULL
);
GO

-- Creating table 'ProdutosVendas'
CREATE TABLE [dbo].[ProdutosVendas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [qtde] nvarchar(max)  NOT NULL,
    [Venda_Id] int  NOT NULL,
    [Produto_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Enderecos'
ALTER TABLE [dbo].[Enderecos]
ADD CONSTRAINT [PK_Enderecos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cartaoes'
ALTER TABLE [dbo].[Cartaoes]
ADD CONSTRAINT [PK_Cartaoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Vendas'
ALTER TABLE [dbo].[Vendas]
ADD CONSTRAINT [PK_Vendas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subcategorias'
ALTER TABLE [dbo].[Subcategorias]
ADD CONSTRAINT [PK_Subcategorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Fornecedores'
ALTER TABLE [dbo].[Fornecedores]
ADD CONSTRAINT [PK_Fornecedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Produtos'
ALTER TABLE [dbo].[Produtos]
ADD CONSTRAINT [PK_Produtos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ofertas'
ALTER TABLE [dbo].[Ofertas]
ADD CONSTRAINT [PK_Ofertas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProdutosOfertas'
ALTER TABLE [dbo].[ProdutosOfertas]
ADD CONSTRAINT [PK_ProdutosOfertas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProdutosVendas'
ALTER TABLE [dbo].[ProdutosVendas]
ADD CONSTRAINT [PK_ProdutosVendas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Categoria_Id] in table 'Subcategorias'
ALTER TABLE [dbo].[Subcategorias]
ADD CONSTRAINT [FK_Categoriasubcategoria]
    FOREIGN KEY ([Categoria_Id])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Categoriasubcategoria'
CREATE INDEX [IX_FK_Categoriasubcategoria]
ON [dbo].[Subcategorias]
    ([Categoria_Id]);
GO

-- Creating foreign key on [Fornecedor_Id] in table 'Produtos'
ALTER TABLE [dbo].[Produtos]
ADD CONSTRAINT [FK_FornecedorProduto]
    FOREIGN KEY ([Fornecedor_Id])
    REFERENCES [dbo].[Fornecedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FornecedorProduto'
CREATE INDEX [IX_FK_FornecedorProduto]
ON [dbo].[Produtos]
    ([Fornecedor_Id]);
GO

-- Creating foreign key on [Subcategoria_Id] in table 'Produtos'
ALTER TABLE [dbo].[Produtos]
ADD CONSTRAINT [FK_SubcategoriaProduto]
    FOREIGN KEY ([Subcategoria_Id])
    REFERENCES [dbo].[Subcategorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubcategoriaProduto'
CREATE INDEX [IX_FK_SubcategoriaProduto]
ON [dbo].[Produtos]
    ([Subcategoria_Id]);
GO

-- Creating foreign key on [Produto_Id] in table 'ProdutosOfertas'
ALTER TABLE [dbo].[ProdutosOfertas]
ADD CONSTRAINT [FK_ProdutoProdutoOferta]
    FOREIGN KEY ([Produto_Id])
    REFERENCES [dbo].[Produtos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProdutoProdutoOferta'
CREATE INDEX [IX_FK_ProdutoProdutoOferta]
ON [dbo].[ProdutosOfertas]
    ([Produto_Id]);
GO

-- Creating foreign key on [Oferta_Id] in table 'ProdutosOfertas'
ALTER TABLE [dbo].[ProdutosOfertas]
ADD CONSTRAINT [FK_OfertaProdutoOferta]
    FOREIGN KEY ([Oferta_Id])
    REFERENCES [dbo].[Ofertas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OfertaProdutoOferta'
CREATE INDEX [IX_FK_OfertaProdutoOferta]
ON [dbo].[ProdutosOfertas]
    ([Oferta_Id]);
GO

-- Creating foreign key on [Usuario_Id] in table 'Enderecos'
ALTER TABLE [dbo].[Enderecos]
ADD CONSTRAINT [FK_UsuarioEndereco]
    FOREIGN KEY ([Usuario_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioEndereco'
CREATE INDEX [IX_FK_UsuarioEndereco]
ON [dbo].[Enderecos]
    ([Usuario_Id]);
GO

-- Creating foreign key on [Usuario_Id] in table 'Cartaoes'
ALTER TABLE [dbo].[Cartaoes]
ADD CONSTRAINT [FK_UsuarioCartao]
    FOREIGN KEY ([Usuario_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioCartao'
CREATE INDEX [IX_FK_UsuarioCartao]
ON [dbo].[Cartaoes]
    ([Usuario_Id]);
GO

-- Creating foreign key on [Usuario_Id] in table 'Vendas'
ALTER TABLE [dbo].[Vendas]
ADD CONSTRAINT [FK_UsuarioVenda]
    FOREIGN KEY ([Usuario_Id])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioVenda'
CREATE INDEX [IX_FK_UsuarioVenda]
ON [dbo].[Vendas]
    ([Usuario_Id]);
GO

-- Creating foreign key on [Venda_Id] in table 'ProdutosVendas'
ALTER TABLE [dbo].[ProdutosVendas]
ADD CONSTRAINT [FK_VendaProdutoVenda]
    FOREIGN KEY ([Venda_Id])
    REFERENCES [dbo].[Vendas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VendaProdutoVenda'
CREATE INDEX [IX_FK_VendaProdutoVenda]
ON [dbo].[ProdutosVendas]
    ([Venda_Id]);
GO

-- Creating foreign key on [Produto_Id] in table 'ProdutosVendas'
ALTER TABLE [dbo].[ProdutosVendas]
ADD CONSTRAINT [FK_ProdutoProdutoVenda]
    FOREIGN KEY ([Produto_Id])
    REFERENCES [dbo].[Produtos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProdutoProdutoVenda'
CREATE INDEX [IX_FK_ProdutoProdutoVenda]
ON [dbo].[ProdutosVendas]
    ([Produto_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------