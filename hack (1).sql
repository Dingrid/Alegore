-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Dez-2020 às 22:09
-- Versão do servidor: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hack`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `primeironome` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ultimonome` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cpf` varchar(11) CHARACTER SET utf8 NOT NULL,
  `rg` varchar(9) CHARACTER SET utf8 NOT NULL,
  `endereco` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cidade` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cep` varchar(255) CHARACTER SET utf8 NOT NULL,
  `telefone` varchar(12) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `primeironome`, `ultimonome`, `cpf`, `rg`, `endereco`, `cidade`, `cep`, `telefone`) VALUES
(20, 'Ingrid', 'Souza', '12345678911', '123456789', 'rua da ingrid', 'SP', '1111-111', '123456789111');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `coditem` int(11) NOT NULL,
  `codloja` int(11) NOT NULL,
  `descricao` int(11) NOT NULL,
  `precocusto` int(11) NOT NULL,
  `precovenda` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`coditem`, `codloja`, `descricao`, `precocusto`, `precovenda`) VALUES
(2, 20, 1021, 10, 20),
(2, 20, 1022, 10, 20),
(2, 5, 1024, 10, 20),
(2, 5, 1025, 10, 20),
(1, 5, 2, 10, 20),
(1, 5, 3, 10, 20),
(3, 20, 11, 10, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `coditem` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `fornecedor` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`coditem`, `descricao`, `fornecedor`) VALUES
(2, 'prancha', 'pranchas'),
(1, 'joelheira', 'joel'),
(3, 'secador', 'sec');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `codloja` int(11) NOT NULL,
  `razao` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8 NOT NULL,
  `natureza` varchar(255) CHARACTER SET utf8 NOT NULL,
  `porte` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mei` bit(1) NOT NULL,
  `endereco` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `loja`
--

INSERT INTO `loja` (`codloja`, `razao`, `nome`, `natureza`, `porte`, `mei`, `endereco`) VALUES
(20, 'Loja20', 'virtual', 'eletro', 'medio', b'0', 'virtual'),
(5, 'Loja10', 'fisica', 'eletro', 'medio', b'0', 'virtual');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `codvenda` int(11) NOT NULL,
  `codloja` int(11) NOT NULL,
  `coditem` int(11) NOT NULL,
  `codcliente` int(11) NOT NULL,
  `descricaoprod` int(11) NOT NULL,
  `datavenda` date NOT NULL,
  `dataentrega` date NOT NULL,
  `frete` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`codvenda`, `codloja`, `coditem`, `codcliente`, `descricaoprod`, `datavenda`, `dataentrega`, `frete`) VALUES
(1, 20, 2, 20, 1020, '2020-01-01', '2020-01-10', 11),
(2, 20, 2, 20, 1023, '2020-01-01', '2020-01-10', 11),
(3, 5, 1, 20, 1, '2020-01-01', '2020-01-10', 11),
(4, 20, 2, 20, 10, '2020-01-01', '2020-01-10', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
  ADD KEY `coditem` (`coditem`),
  ADD KEY `codloja` (`codloja`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`coditem`);

--
-- Indexes for table `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`codloja`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`codvenda`),
  ADD KEY `codloja` (`codloja`),
  ADD KEY `coditem` (`coditem`),
  ADD KEY `codcliente` (`codcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
