
--Criando banco de dados
CREATE DATABASE Ecommerce;
USE Ecommerce;

--Criando tabela Pedido. Obs: Essa CONSTRAINT me deixaram em dúvida, não estou muito
--confiante nela. 
CREATE TABLE Pedido (
    IdPedido INT AUTO_INCREMENT PRIMARY KEY,
    Status_Pedido BOOL,
    Descricao VARCHAR(40),
    Entrega_IdEntrega INT,
    CONSTRAINT fk_entrega FOREIGN KEY (Entrega_IdEntrega) REFERENCES Entrega(IdEntrega)
);

--Criando tabela Pedido Produto
CREATE TABLE Pedido_Produto (
    IdFornecedor INT,
    OutroVendedorIdOutroVendedor INT,
    Quantidade FLOAT,
    PRIMARY KEY (IdFornecedor, OutroVendedorIdOutroVendedor)
);

--Criando tabela Entrega
CREATE TABLE Entrega (
    IdEntrega INT PRIMARY KEY,
    Status VARCHAR(40),
    Data DATE
);

--Criando tabela Cliente. Telefone deixei Varchar 12 conciderando o código de área e o 
-- 9º dígito, CPF é padrão 11 caracters
CREATE TABLE Cliente (
    IdCliente INT PRIMARY KEY,
    Nome VARCHAR(40),
    Endereco VARCHAR(40),
    Telefone VARCHAR(12),
    CPF VARCHAR(11)
);

--Criando tabela Pagamento
CREATE TABLE Pagamento (
    IdPagamento INT PRIMARY KEY,
    Cartao VARCHAR(40),
    Bandeira VARCHAR(40),
    Numero VARCHAR(40),
    Cliente_IdCliente INT,
    Pedido_Cliente_IdPedido INT
);

--Criando tabela Estoque
CREATE TABLE Estoque (
    IdEstoque INT PRIMARY KEY,
    Local VARCHAR(40)
);

--Criando tabela Produto Estoque
CREATE TABLE Produto_Estoque (
    Produto_IdProduto INT,
    Estoque_IdEstoque INT,
    Quantidade FLOAT,
    PRIMARY KEY (Produto_IdProduto, Estoque_IdEstoque)
);

--Criando tabela Fornecedor. CNPJ 14 caracter padrão
CREATE TABLE Fornecedor (
    IdFornecedor INT PRIMARY KEY,
    Endereco VARCHAR(40),
    CNPJ VARCHAR(14)
);

--Criando tabela Produto estoque (outro fornecedor)
CREATE TABLE Produto_Estoque_Outro_Fornecedor (
    Produto_IdProduto INT,
    Fornecedor_IdFornecedor INT,
    PRIMARY KEY (Produto_IdProduto, Fornecedor_IdFornecedor)
);

--Criando tabela Pedido Produto
CREATE TABLE Pedido_Produto (
    Produto_IdProduto INT,
    OutroVendedorIdOutroVendedor INT,
    Quantidade FLOAT,
    PRIMARY KEY (Produto_IdProduto, OutroVendedorIdOutroVendedor)
);

--Criando tabela Produto
CREATE TABLE Produto (
    IdProduto INT PRIMARY KEY,
    Categoria VARCHAR(40),
    Descricao VARCHAR(40),
    Valor FLOAT
);

--Obs1 - Esse diacho tá + ou -
--Obs2 - (Tenho dúvidas em alguns pontos)
--Obs3 - Revisado, agora vai.