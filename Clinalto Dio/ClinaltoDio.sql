-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-142725-db.mysql-142725:11543
-- Tempo de geração: 02-Set-2023 às 22:16
-- Versão do servidor: 8.0.26
-- versão do PHP: 7.2.34

-- Criando Banco de dados: ClinaltoDio --
CREATE DATABASE IF NOT EXISTS ClinaltoDio;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Criando tabela Carro --
CREATE TABLE `Carro` (
  `IdCarro` int NOT NULL,
  `Marca` varchar(10) DEFAULT NULL,
  `Modelo` varchar(10) DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `Cor` varchar(10) DEFAULT NULL,
  `IdCliente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Persistindo dados na tabela Carro --
INSERT INTO `Carro` (`IdCarro`, `Marca`, `Modelo`, `Ano`, `Cor`, `IdCliente`) VALUES
(1, 'Ford', 'Belina', 2005, 'P.fosco', NULL),
(2, 'Chevrolet', 'Onix', 2020, 'Branco', NULL),
(3, 'Volkswagen', 'Fusca', 2023, 'Pretinho', NULL),
(4, 'Toyota', 'Corolla', 2018, 'Branco', NULL),
(5, 'Honda', 'Acord', 2017, 'Vermelho', NULL),
(6, 'Nissan', 'Sentra', 2020, 'Cinza', NULL);

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Criando tabela Cliente --
CREATE TABLE `Cliente` (
  `IdCliente` int NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Cel` varchar(10) DEFAULT NULL,
  `Endereco` varchar(40) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Persistindo dados na tabela Cliente --
INSERT INTO `Cliente` (`IdCliente`, `CPF`, `Cel`, `Endereco`, `Nome`) VALUES
(1, '12345678901', '99999-9901', 'Rua A, 123', 'Marina Silva'),
(2, '12345678902', '99999-9902', 'Avenida B, 456', 'João Doria'),
(3, '12345678903', '99999-9903', 'Rua C, 789', 'Jair Mesias'),
(4, '12345678904', '99999-9904', 'Avenida D, 1011', 'Pedro Bial'),
(5, '12345678905', '99999-9905', 'Rua E, 1213', 'Dj Kevinho'),
(6, '12345678906', '99999-9906', 'Avenida F, 1415', 'Pablo Vitar'),
(7, '12345678907', '99999-9907', 'Rua G, 1617', 'Hebe Camargo');

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Criando tabela Equipe --
CREATE TABLE `Equipe` (
  `IdCargo` int NOT NULL,
  `Setor` varchar(15) DEFAULT NULL,
  `Cargo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Persistindo dados na tabela Equipe --
INSERT INTO `Equipe` (`IdCargo`, `Setor`, `Cargo`) VALUES
(1, 'Adm', 'Atendente'),
(2, 'Adm', 'Financeiro'),
(3, 'Oficina', 'Mecânico'),
(4, 'Oficina', 'Gerente'),
(5, 'Apoio', 'Limpeza'),
(6, 'Portaria', 'Manobrista');

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Criando a tabela OS --
CREATE TABLE `OS` (
  `IdNome` int NOT NULL,
  `CarroIdNome` int DEFAULT NULL,
  `Garantia` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Persistindo dados na tabela OS --
INSERT INTO `OS` (`IdNome`, `CarroIdNome`, `Garantia`) VALUES
(1, 3, '3'),
(3, 2, '2'),
(4, 6, '3'),
(5, 5, '6'),
(6, 1, '2');

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Criando a tabela Pagamento --
CREATE TABLE `Pagamento` (
  `IdPagamento` int NOT NULL,
  `Valor` float DEFAULT NULL,
  `F_Pagamento` enum('Dinheiro','Cartao','PIX') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Criando a tabela Servico --
CREATE TABLE `Servico` (
  `IdServico` int NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Descricao` varchar(60) DEFAULT NULL,
  `Tempo` float DEFAULT NULL,
  `Valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- Persistindo dados na tabela Servico --
INSERT INTO `Servico` (`IdServico`, `Tipo`, `Descricao`, `Tempo`, `Valor`) VALUES
(1, 'Suspenção', 'Substituição de peça', 1, 100),
(2, 'Freio', 'Substituição de peça', 60, 325),
(3, 'Eletrica', 'Reparo', 2, 70.1),
(4, 'Cambio', 'Substituição de peça', 1.45, 3.05),
(5, 'Pintura', 'Retoque', 45, 300);

--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

-- Algumas consultas basicas --

SELECT Cliente.Nome AS NomeCliente, Carro.Modelo AS ModeloCarro
FROM OS
JOIN Cliente ON OS.ClienteIdCliente = Cliente.IdCliente
JOIN Carro ON OS.CarroIdCarro = Carro.IdCarro;

Onix - Jair Mesias
Acord - João Doria
Belina - Pablo Vitar
Fusca - Dj Kevinho
Corolla - Marina Silva

