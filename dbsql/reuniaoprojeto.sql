-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 24-Jun-2019 às 21:35
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reuniaoprojeto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `_pauta`
--

CREATE TABLE `_pauta` (
  `id` int(11) NOT NULL,
  `pauta` longtext COLLATE utf8_bin NOT NULL,
  `id_reuniao` int(11) NOT NULL,
  `horario` time NOT NULL,
  `comentario` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `_pauta`
--

INSERT INTO `_pauta` (`id`, `pauta`, `id_reuniao`, `horario`, `comentario`) VALUES
(16, 'Como melhorar a educação no brasil?', 22, '15:56:06', 'Muitas das medidas que poderiam causar grande transformação na sala de aula não acarretariam em gasto algum. Usar de maneira eficiente o tempo em que alunos já estão na escola é uma delas. \r\n\r\nEstudo do Banco Mundial divulgado no ano passado, realizado a partir da observação in loco de pesquisadores da instituição, mostrou que apenas 66% do tempo de sala de aula no Brasil é gasto efetivamente com o ensino.\r\n\r\nOutros 34% são desperdiçados com atividades burocráticas, como chamada, a cópia de deveres de casa ou pedindo disciplina. A cota de ?desperdício? em países da OCDE é de apenas 15%. Usar sabiamente o tempo em sala de aula é uma das mais baratas e eficientes maneiras de melhorar a educação no Brasil.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_reuniao`
--

CREATE TABLE `_reuniao` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `categoria` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `localizacao` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cancelada` tinyint(4) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `hora_inicial` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `hora_final` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `duracao` varchar(5) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `_reuniao`
--

INSERT INTO `_reuniao` (`id`, `titulo`, `categoria`, `localizacao`, `data`, `cancelada`, `id_usuario`, `hora_inicial`, `hora_final`, `duracao`) VALUES
(22, 'USJ', 'USJ', 'Melão', '2019-05-25', 0, NULL, '18:00', '20:00', '2:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_usuario`
--

CREATE TABLE `_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `senha` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `cancelado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `_usuario`
--

INSERT INTO `_usuario` (`id`, `nome`, `senha`, `nivel`, `cancelado`) VALUES
(1, 'admin', 'admin', 1, 0),
(2, 'luandre', '123456', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `_pauta`
--
ALTER TABLE `_pauta`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_Comentarios_Reuniao` (`id_reuniao`);

--
-- Indexes for table `_reuniao`
--
ALTER TABLE `_reuniao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `_usuario`
--
ALTER TABLE `_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `_pauta`
--
ALTER TABLE `_pauta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `_reuniao`
--
ALTER TABLE `_reuniao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `_pauta`
--
ALTER TABLE `_pauta`
  ADD CONSTRAINT `fk_Comentarios_Reuniao` FOREIGN KEY (`id_reuniao`) REFERENCES `_reuniao` (`id`);

--
-- Limitadores para a tabela `_reuniao`
--
ALTER TABLE `_reuniao`
  ADD CONSTRAINT `_reuniao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
