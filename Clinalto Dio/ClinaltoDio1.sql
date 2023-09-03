-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-142725-db.mysql-142725:11543
-- Tempo de geração: 03-Set-2023 às 13:47
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
-- Banco de dados: `ClinaltoDio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Carro`
--

CREATE TABLE `Carro` (
  `IdCarro` int NOT NULL,
  `Marca` varchar(10) DEFAULT NULL,
  `Modelo` varchar(10) DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `Cor` varchar(10) DEFAULT NULL,
  `IdCliente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Carro`
--

INSERT INTO `Carro` (`IdCarro`, `Marca`, `Modelo`, `Ano`, `Cor`, `IdCliente`) VALUES
(1, 'Ford', 'Belina', 2005, 'P.fosco', NULL),
(2, 'Chevrolet', 'Onix', 2020, 'Branco', NULL),
(3, 'Volkswagen', 'Fusca', 2023, 'Pretinho', NULL),
(4, 'Toyota', 'Corolla', 2018, 'Branco', NULL),
(5, 'Honda', 'Acord', 2017, 'Vermelho', NULL),
(6, 'Nissan', 'Sentra', 2020, 'Cinza', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Cliente`
--

CREATE TABLE `Cliente` (
  `IdCliente` int NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Cel` varchar(10) DEFAULT NULL,
  `Endereco` varchar(40) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Cliente`
--

INSERT INTO `Cliente` (`IdCliente`, `CPF`, `Cel`, `Endereco`, `Nome`) VALUES
(1, '12345678901', '99999-9901', 'Rua A, 123', 'Marina Silva'),
(2, '12345678902', '99999-9902', 'Avenida B, 456', 'João Doria'),
(3, '12345678903', '99999-9903', 'Rua C, 789', 'Jair Mesias'),
(4, '12345678904', '99999-9904', 'Avenida D, 1011', 'Pedro Bial'),
(5, '12345678905', '99999-9905', 'Rua E, 1213', 'Dj Kevinho'),
(6, '12345678906', '99999-9906', 'Avenida F, 1415', 'Pablo Vitar'),
(7, '12345678907', '99999-9907', 'Rua G, 1617', 'Hebe Camargo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Equipe`
--

CREATE TABLE `Equipe` (
  `IdCargo` int NOT NULL,
  `Setor` varchar(15) DEFAULT NULL,
  `Cargo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Equipe`
--

INSERT INTO `Equipe` (`IdCargo`, `Setor`, `Cargo`) VALUES
(1, 'Adm', 'Atendente'),
(2, 'Adm', 'Financeiro'),
(3, 'Oficina', 'Mecânico'),
(4, 'Oficina', 'Gerente'),
(5, 'Apoio', 'Limpeza'),
(6, 'Portaria', 'Manobrista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `OS`
--

CREATE TABLE `OS` (
  `IdNome` int NOT NULL,
  `ClienteIdCliente` int DEFAULT NULL,
  `CarroIdCarro` int DEFAULT NULL,
  `Garantia` varchar(15) DEFAULT NULL,
  `IdServico` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `OS`
--

INSERT INTO `OS` (`IdNome`, `ClienteIdCliente`, `CarroIdCarro`, `Garantia`, `IdServico`) VALUES
(1, 3, 2, 'seis meses', NULL),
(2, 2, 5, 'tres meses', NULL),
(3, 6, 1, 'dois meses', NULL),
(4, 5, 3, 'dois meses', NULL),
(5, 1, 4, 'dez dias', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pagamento`
--

CREATE TABLE `Pagamento` (
  `IdPagamento` int NOT NULL,
  `Valor` float DEFAULT NULL,
  `F_Pagamento` enum('Dinheiro','Cartao','PIX') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Servico`
--

CREATE TABLE `Servico` (
  `IdServico` int NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Descricao` varchar(60) DEFAULT NULL,
  `Tempo` float DEFAULT NULL,
  `Valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `Servico`
--

INSERT INTO `Servico` (`IdServico`, `Tipo`, `Descricao`, `Tempo`, `Valor`) VALUES
(1, 'Suspenção', 'Substituição de peça', 1, 100),
(2, 'Freio', 'Substituição de peça', 60, 325),
(3, 'Eletrica', 'Reparo', 2, 70.1),
(4, 'Cambio', 'Substituição de peça', 1.45, 3.05),
(5, 'Pintura', 'Retoque', 45, 300);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Carro`
--
ALTER TABLE `Carro`
  ADD PRIMARY KEY (`IdCarro`),
  ADD KEY `fk_cliente` (`IdCliente`);

--
-- Índices para tabela `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Índices para tabela `Equipe`
--
ALTER TABLE `Equipe`
  ADD PRIMARY KEY (`IdCargo`);

--
-- Índices para tabela `OS`
--
ALTER TABLE `OS`
  ADD PRIMARY KEY (`IdNome`),
  ADD KEY `ClienteIdCliente` (`ClienteIdCliente`),
  ADD KEY `CarroIdCarro` (`CarroIdCarro`),
  ADD KEY `fk_servico` (`IdServico`);

--
-- Índices para tabela `Pagamento`
--
ALTER TABLE `Pagamento`
  ADD PRIMARY KEY (`IdPagamento`);

--
-- Índices para tabela `Servico`
--
ALTER TABLE `Servico`
  ADD PRIMARY KEY (`IdServico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Carro`
--
ALTER TABLE `Carro`
  MODIFY `IdCarro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `IdCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `Equipe`
--
ALTER TABLE `Equipe`
  MODIFY `IdCargo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `OS`
--
ALTER TABLE `OS`
  MODIFY `IdNome` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `Pagamento`
--
ALTER TABLE `Pagamento`
  MODIFY `IdPagamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Servico`
--
ALTER TABLE `Servico`
  MODIFY `IdServico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Carro`
--
ALTER TABLE `Carro`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`);

--
-- Limitadores para a tabela `OS`
--
ALTER TABLE `OS`
  ADD CONSTRAINT `fk_servico` FOREIGN KEY (`IdServico`) REFERENCES `Servico` (`IdServico`),
  ADD CONSTRAINT `OS_ibfk_1` FOREIGN KEY (`ClienteIdCliente`) REFERENCES `Cliente` (`IdCliente`),
  ADD CONSTRAINT `OS_ibfk_2` FOREIGN KEY (`CarroIdCarro`) REFERENCES `Carro` (`IdCarro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
