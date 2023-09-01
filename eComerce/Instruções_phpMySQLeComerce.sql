-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-142725-db.mysql-142725:11543
-- Tempo de geração: 01-Set-2023 às 02:05
-- Versão do servidor: 8.0.26
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `eComerce`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `IdCliente` int NOT NULL,
  `Nome` varchar(40) DEFAULT NULL,
  `Endereco` varchar(40) DEFAULT NULL,
  `Telefone` varchar(12) DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `CNPJ` varchar(14) DEFAULT (0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Cliente`
--

INSERT INTO `Cliente` (`IdCliente`, `Nome`, `Endereco`, `Telefone`, `CPF`, `CNPJ`) VALUES
(1, 'Maria João', 'Rua A nmr 12', '79999999991', '11111111101', '0'),
(2, 'José Rony', 'Rua A nmr 215', '79999999992', '11111111102', '0'),
(3, 'José Maria', 'Rua 09 nmr 15', '79999999993', '11111111103', '0'),
(4, 'Neuton Roky', 'Rua y nmr 21', '79999999994', '11111111104', '0'),
(5, 'Severino Nau', 'Rua nova nmr 25', '79999999995', '11111111105', '0'),
(6, 'Vandy Norys', 'Rua 12 nmr 51', '79999999996', '11111111106', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Entrega`
--

CREATE TABLE `Entrega` (
  `IdEntrega` int NOT NULL,
  `Status` varchar(40) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Codigo_Rastreio` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Estoque`
--

CREATE TABLE `Estoque` (
  `IdEstoque` int NOT NULL,
  `Local` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Fornecedor`
--

CREATE TABLE `Fornecedor` (
  `IdFornecedor` int NOT NULL,
  `Endereco` varchar(40) DEFAULT NULL,
  `CNPJ` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Fornecedor`
--

INSERT INTO `Fornecedor` (`IdFornecedor`, `Endereco`, `CNPJ`) VALUES
(1, 'Rua do Forncedor 2 2', '11111111111101'),
(2, 'Rua do Forncedor 3 3', '11111111111101'),
(3, 'Rua do Forncedor 4 4', '11111111111101'),
(4, 'Rua do Forncedor 5 5', '11111111111101'),
(5, 'Rua do Forncedor 1 1', '11111111111101');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pagamento`
--

CREATE TABLE `Pagamento` (
  `IdPagamento` int NOT NULL,
  `Cartao` varchar(40) DEFAULT NULL,
  `Bandeira` varchar(40) DEFAULT NULL,
  `Numero` varchar(40) DEFAULT NULL,
  `Cliente_IdCliente` int DEFAULT NULL,
  `Pedido_Cliente_IdPedido` int DEFAULT NULL,
  `boleto` varchar(40) DEFAULT NULL,
  `PIX` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Pagamento`
--

INSERT INTO `Pagamento` (`IdPagamento`, `Cartao`, `Bandeira`, `Numero`, `Cliente_IdCliente`, `Pedido_Cliente_IdPedido`, `boleto`, `PIX`) VALUES
(1, 'Nu', 'Master', '4550', 2, 1, NULL, NULL),
(2, 'Nu', 'Visa', '50', 3, 2, NULL, NULL),
(3, 'BB', 'Master', '133', 1, 1, NULL, NULL),
(4, 'Cx', 'Visa', '02', 5, 4, NULL, NULL),
(5, 'Std', 'Master', '896', 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pedido`
--

CREATE TABLE `Pedido` (
  `IdPedido` int NOT NULL,
  `Status_Pedido` tinyint(1) DEFAULT NULL,
  `Descricao` varchar(40) DEFAULT NULL,
  `Entrega_IdEntrega` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pedido_Produto`
--

CREATE TABLE `Pedido_Produto` (
  `IdFornecedor` int NOT NULL,
  `OutroVendedorIdOutroVendedor` int NOT NULL,
  `Quantidade` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Produto`
--

CREATE TABLE `Produto` (
  `Id` int NOT NULL,
  `Categoria` varchar(40) DEFAULT NULL,
  `Descricao` varchar(40) DEFAULT NULL,
  `Valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Produto`
--

INSERT INTO `Produto` (`Id`, `Categoria`, `Descricao`, `Valor`) VALUES
(1, 'Roupa', 'Camisa Polo M', 60),
(2, 'Sapato', 'Sapatenis 40', 120),
(3, 'Roupa', 'Calça Jeans', 100),
(4, 'Roupa', 'Camisa Social', 70),
(5, 'Roupa', 'Camisa Regata', 50),
(6, 'Roupa', 'Camisa Polo M', 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Produto_Estoque`
--

CREATE TABLE `Produto_Estoque` (
  `Produto_IdProduto` int NOT NULL,
  `Estoque_IdEstoque` int NOT NULL,
  `Quantidade` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Produto_Estoque_Outro_Fornecedor`
--

CREATE TABLE `Produto_Estoque_Outro_Fornecedor` (
  `Produto_IdProduto` int NOT NULL,
  `Fornecedor_IdFornecedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Índices para tabela `Entrega`
--
ALTER TABLE `Entrega`
  ADD PRIMARY KEY (`IdEntrega`);

--
-- Índices para tabela `Estoque`
--
ALTER TABLE `Estoque`
  ADD PRIMARY KEY (`IdEstoque`);

--
-- Índices para tabela `Fornecedor`
--
ALTER TABLE `Fornecedor`
  ADD PRIMARY KEY (`IdFornecedor`);

--
-- Índices para tabela `Pagamento`
--
ALTER TABLE `Pagamento`
  ADD PRIMARY KEY (`IdPagamento`);

--
-- Índices para tabela `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`IdPedido`),
  ADD KEY `fk_entrega` (`Entrega_IdEntrega`);

--
-- Índices para tabela `Pedido_Produto`
--
ALTER TABLE `Pedido_Produto`
  ADD PRIMARY KEY (`IdFornecedor`,`OutroVendedorIdOutroVendedor`);

--
-- Índices para tabela `Produto`
--
ALTER TABLE `Produto`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `Produto_Estoque`
--
ALTER TABLE `Produto_Estoque`
  ADD PRIMARY KEY (`Produto_IdProduto`,`Estoque_IdEstoque`);

--
-- Índices para tabela `Produto_Estoque_Outro_Fornecedor`
--
ALTER TABLE `Produto_Estoque_Outro_Fornecedor`
  ADD PRIMARY KEY (`Produto_IdProduto`,`Fornecedor_IdFornecedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `IdPedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Produto`
--
ALTER TABLE `Produto`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `fk_entrega` FOREIGN KEY (`Entrega_IdEntrega`) REFERENCES `Entrega` (`IdEntrega`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
