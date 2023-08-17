-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/07/2023 às 04:02
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `liga_justica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `cd_atendimento` int(11) NOT NULL,
  `data` date NOT NULL,
  `tempo` time NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `cd_maldade` int(11) NOT NULL,
  `cd_heroi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`cd_atendimento`, `data`, `tempo`, `observacao`, `cd_maldade`, `cd_heroi`) VALUES
(1, '2023-06-15', '00:30:00', 'Falou sobre seus planos de dominar a cidade', 1, 1),
(2, '2023-06-20', '01:00:00', 'Confessou seus crimes anteriores', 2, 2),
(3, '2023-06-25', '00:45:00', 'Demonstrou habilidades de camuflagem', 3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `habilidade`
--

CREATE TABLE `habilidade` (
  `cd_habilidade` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `habilidade`
--

INSERT INTO `habilidade` (`cd_habilidade`, `nome`, `descricao`) VALUES
(1, 'Voo', 'Capacidade de voar'),
(2, 'Força Sobre-Humana', 'Força física ampliada'),
(3, 'Invisibilidade', 'Capacidade de se tornar invisível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `heroi`
--

CREATE TABLE `heroi` (
  `cd_heroi` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `peso` decimal(10,1) DEFAULT NULL,
  `altura` decimal(10,0) DEFAULT NULL,
  `dt_nasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `heroi`
--

INSERT INTO `heroi` (`cd_heroi`, `nome`, `peso`, `altura`, `dt_nasc`) VALUES
(1, 'Homem de Ferro', 100.0, 185, '1970-05-29'),
(2, 'Capitão América', 90.2, 189, '1920-07-04'),
(3, 'Mulher Maravilha', 70.8, 175, '1985-03-22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maldade`
--

CREATE TABLE `maldade` (
  `cd_maldade` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `cd_vilao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `maldade`
--

INSERT INTO `maldade` (`cd_maldade`, `nome`, `descricao`, `cd_vilao`) VALUES
(1, 'Caos Total', 'Causar destruição em massa', 1),
(2, 'Manipulação', 'Controlar a mente das pessoas', 2),
(3, 'Devorador de Mundos', 'Consumir planetas inteiros', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `registro_habilidade`
--

CREATE TABLE `registro_habilidade` (
  `id` int(11) NOT NULL,
  `cd_heroi` int(11) NOT NULL,
  `cd_habilidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `registro_habilidade`
--

INSERT INTO `registro_habilidade` (`id`, `cd_heroi`, `cd_habilidade`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vilao`
--

CREATE TABLE `vilao` (
  `cd_vilao` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `peso` decimal(10,1) DEFAULT NULL,
  `altura` decimal(10,0) DEFAULT NULL,
  `dt_nasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `vilao`
--

INSERT INTO `vilao` (`cd_vilao`, `nome`, `peso`, `altura`, `dt_nasc`) VALUES
(1, 'Coringa', 75.2, 180, '1960-12-25'),
(2, 'Loki', 85.6, 191, '1980-09-14'),
(3, 'Venom', 95.3, 178, '1975-06-30');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`cd_atendimento`),
  ADD KEY `fk_ATENDIMENTO_cd_maldade` (`cd_maldade`),
  ADD KEY `fk_ATENDIMENTO_cd_heroi` (`cd_heroi`);

--
-- Índices de tabela `habilidade`
--
ALTER TABLE `habilidade`
  ADD PRIMARY KEY (`cd_habilidade`);

--
-- Índices de tabela `heroi`
--
ALTER TABLE `heroi`
  ADD PRIMARY KEY (`cd_heroi`);

--
-- Índices de tabela `maldade`
--
ALTER TABLE `maldade`
  ADD PRIMARY KEY (`cd_maldade`),
  ADD KEY `fk_MALDADE_cd_vilao` (`cd_vilao`);

--
-- Índices de tabela `registro_habilidade`
--
ALTER TABLE `registro_habilidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_REGISTRO_HABILIDADE_cd_heroi` (`cd_heroi`),
  ADD KEY `fk_REGISTRO_HABILIDADE_cd_habilidade` (`cd_habilidade`);

--
-- Índices de tabela `vilao`
--
ALTER TABLE `vilao`
  ADD PRIMARY KEY (`cd_vilao`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_ATENDIMENTO_cd_heroi` FOREIGN KEY (`cd_heroi`) REFERENCES `heroi` (`cd_heroi`),
  ADD CONSTRAINT `fk_ATENDIMENTO_cd_maldade` FOREIGN KEY (`cd_maldade`) REFERENCES `maldade` (`cd_maldade`);

--
-- Restrições para tabelas `maldade`
--
ALTER TABLE `maldade`
  ADD CONSTRAINT `fk_MALDADE_cd_vilao` FOREIGN KEY (`cd_vilao`) REFERENCES `vilao` (`cd_vilao`);

--
-- Restrições para tabelas `registro_habilidade`
--
ALTER TABLE `registro_habilidade`
  ADD CONSTRAINT `fk_REGISTRO_HABILIDADE_cd_habilidade` FOREIGN KEY (`cd_habilidade`) REFERENCES `habilidade` (`cd_habilidade`),
  ADD CONSTRAINT `fk_REGISTRO_HABILIDADE_cd_heroi` FOREIGN KEY (`cd_heroi`) REFERENCES `heroi` (`cd_heroi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
