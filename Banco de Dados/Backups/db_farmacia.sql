-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 19/06/2019 às 19h26min
-- Versão do Servidor: 5.5.16
-- Versão do PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `db_farmacia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `tel_celular` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `casa` int(11) DEFAULT '0',
  `apto` int(11) DEFAULT '0',
  `tel_fixo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `imagem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_imagem1_idx` (`imagem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `sobrenome`, `cpf`, `sexo`, `cidade`, `logradouro`, `tel_celular`, `senha`, `status`, `casa`, `apto`, `tel_fixo`, `email`, `imagem_id`) VALUES
(1, 'Ingrid', 'Carvalho', '321.654.878-90', NULL, 'Recanto das Emas', 'Quadra 604 Conjunto 03', 'xxx', 'xxx', 1, 1, 0, 'xxx', 'xxx', NULL),
(2, 'Alex', 'Vieira', '123.456.789-11', NULL, 'BRASILIA', 'Quadra 604 Conjunto 03', '123', '123', 1, 0, 1, '123', 'silvadouglas328@gmail.com', NULL),
(3, 'Victor', 'Manuel', '111.222.333-44', NULL, 'xxx', 'xxx', 'xxx', '123', 1, 1, 0, 'xxx', 'xxx', NULL),
(4, 'Wesley', 'Martins', '222.222.222-22', NULL, 'xxx', 'xxx', 'xxx', '123', 1, 0, 5, 'xxx', 'xxx', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_compra` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra_fornecedor1_idx` (`fornecedor_id`),
  KEY `fk_compra_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `user` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE IF NOT EXISTS `imagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_compra`
--

CREATE TABLE IF NOT EXISTS `item_compra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qtd` double NOT NULL,
  `valor` double NOT NULL,
  `medicamento_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_compra_medicamento1_idx` (`medicamento_id`),
  KEY `fk_item_compra_compra1_idx` (`compra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE IF NOT EXISTS `item_venda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qtd` double NOT NULL,
  `valor` double NOT NULL,
  `venda_id` bigint(20) NOT NULL,
  `medicamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_venda_venda1_idx` (`venda_id`),
  KEY `fk_item_venda_medicamento1_idx` (`medicamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `item_venda`
--

INSERT INTO `item_venda` (`id`, `qtd`, `valor`, `venda_id`, `medicamento_id`) VALUES
(2, 1, 1200, 2, 1),
(3, 1, 1200, 2, 1),
(6, 1, 12, 5, 2),
(7, 1, 1200, 5, 1),
(8, 1, 1200, 6, 1),
(9, 1, 1200, 6, 1),
(10, 1, 1200, 6, 1),
(11, 1, 12, 6, 2),
(16, 1, 12, 8, 2),
(17, 1, 12, 9, 2),
(18, 1, 12, 10, 2),
(19, 8, 12, 11, 2),
(20, 1, 1.45, 12, 1),
(21, 4, 1.45, 12, 1),
(22, 10, 2.89, 12, 2),
(23, 1, 5.9, 13, 3),
(24, 1, 5.9, 14, 3),
(25, 1, 1.45, 14, 1),
(26, 14, 2.89, 14, 2),
(27, 1, 5.9, 15, 3),
(28, 1, 1.45, 16, 1),
(29, 1, 5.9, 16, 3),
(30, 1, 5.9, 17, 3),
(31, 1, 2.89, 17, 2),
(32, 1, 2.89, 17, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicamento`
--

CREATE TABLE IF NOT EXISTS `medicamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `data_fabricacao` date NOT NULL,
  `data_validade` date NOT NULL,
  `indicacao` varchar(45) NOT NULL,
  `precaucoes` varchar(255) NOT NULL,
  `lote` int(11) NOT NULL,
  `preco` double NOT NULL,
  `laboratorio` varchar(255) NOT NULL,
  `composicao` varchar(255) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `medicamento`
--

INSERT INTO `medicamento` (`id`, `nome`, `data_fabricacao`, `data_validade`, `indicacao`, `precaucoes`, `lote`, `preco`, `laboratorio`, `composicao`, `obs`, `file`) VALUES
(1, 'AS', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 1.45, '12', 'xxx', NULL, 'medicamento2.jpg'),
(2, 'Paracetamol', '2019-06-05', '2019-06-07', 'xxx', 'xxx', 12, 2.89, '1', 'xxx', NULL, 'medicamento4.png'),
(3, 'Aspirina', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 5.9, '12', 'xxx', NULL, 'medicamento1.png'),
(4, 'Dipirona', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 3.56, '12', 'xxx', NULL, 'medicamento10.png'),
(5, 'Doril', '2019-06-05', '2019-06-07', 'xxx', 'xxx', 12, 2.89, '1', 'xxx', NULL, 'medicamento11.jpg'),
(6, 'DoxFlex', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 6.9, '12', 'xxx', NULL, 'medicamento12.jpg'),
(7, 'Ritalina', '2019-06-05', '2019-06-07', 'xxx', 'xxx', 12, 8.9, '1', 'xxx', NULL, 'medicamento13.png'),
(8, 'Anador', '2019-06-05', '2019-06-07', 'xxx', 'xxx', 12, 6.23, '1', 'xxx', NULL, 'medicamento14.png'),
(9, 'Sorrisal', '2019-06-05', '2019-06-07', 'xxx', 'xxx', 12, 3.78, '1', 'xxx', NULL, 'medicamento15.jpg'),
(10, 'Adefovir', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 9.45, '12', 'xxx', NULL, 'medicamento16.jpg'),
(21, 'Neosoro', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 6.89, '12', 'xxx', NULL, 'medicamento17.jpg'),
(22, 'Dorflex', '2019-06-01', '2019-06-29', 'Uso Pediátrico', 'nenhuma', 12, 3, '12', 'xxx', NULL, 'medicamento18.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id`, `nome`, `link`, `icone`) VALUES
(1, 'Início', 'administracao.jsp', 'fa fa-home'),
(2, 'Menus', 'menu.jsp', 'fa fa-list'),
(3, 'Usuários', 'usuario.jsp', 'fa fa-users'),
(4, 'Perfis', 'perfil.jsp', 'fa fa-user'),
(5, 'Clientes', 'cliente.jsp', 'fa fa-user-circle'),
(6, 'Fornecedores', 'fornecedor.jsp', 'fa fa-truck'),
(7, 'Medicamentos', 'medicamento.jsp', 'fa fa-medkit'),
(8, 'Vendas', 'venda.jsp', 'fa fa-dollar'),
(9, 'Relatório', 'relatorio.jsp', 'fa fa-signal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'Administrador', 'Admin'),
(2, 'Caixa', 'Gerencia as vendas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_menu`
--

CREATE TABLE IF NOT EXISTS `perfil_menu` (
  `menu_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`perfil_id`),
  KEY `fk_Menu_has_Perfil_Perfil1_idx` (`perfil_id`),
  KEY `fk_Menu_has_Perfil_Menu1_idx` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`menu_id`, `perfil_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(1, 2),
(5, 2),
(8, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio`
--

CREATE TABLE IF NOT EXISTS `relatorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qtdVendas` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `mes` datetime NOT NULL,
  `ano` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relatorio_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `tel_celular` varchar(45) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `imagem_id` int(11) DEFAULT NULL,
  `tel_fixo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `apto` int(11) DEFAULT '0',
  `casa` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_Usuario_Perfil1_idx` (`perfil_id`),
  KEY `fk_usuario_imagem1` (`imagem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `sobrenome`, `data_nasc`, `cpf`, `sexo`, `cidade`, `logradouro`, `user`, `senha`, `status`, `tel_celular`, `perfil_id`, `imagem_id`, `tel_fixo`, `email`, `apto`, `casa`) VALUES
(1, 'Douglas', 'Silva', '2000-12-12', '101010', 'Masculino', 'Brasília', 'Qd. 604 conj. 03 - Recanto das Emas', 'admin', 'admin', 1, '123', 1, NULL, '123', 'admin@gmail.com', 0, 24),
(2, 'Wesley', 'Martins', '2019-06-02', '202020', 'Masculino', 'BRASILIA', 'Quadra 604 Conjunto 03', 'wesley', '123', 1, '123', 1, NULL, '123', 'wesley@gmail.com', 0, 1),
(3, 'xxx', 'xxx', '2019-06-04', 'xxx', 'Masculino', 'xxx', 'xxx', 'xxx', 'xxx', 1, 'xxx', 1, NULL, 'xxx', 'xxx', 0, 1),
(4, 'Victor', 'Manuel', '2019-06-15', '121212', 'Masculino', 'Brasília', 'Rua 00', 'victor', '123', 1, '123', 2, NULL, '123', 'victor@etb.com', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_venda` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venda_usuario1_idx` (`usuario_id`),
  KEY `fk_venda_cliente1_idx` (`cliente_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `data_venda`, `data_pagamento`, `data_entrega`, `usuario_id`, `cliente_id`) VALUES
(2, '2019-09-15', NULL, NULL, 1, 1),
(3, '2019-06-15', NULL, NULL, 1, 1),
(5, '2019-01-15', NULL, NULL, 1, 1),
(6, '2019-06-15', NULL, NULL, 1, 1),
(8, '2019-06-15', NULL, NULL, 1, 1),
(9, '2019-06-16', '2019-06-16', '2019-06-16', 1, 1),
(10, '2019-06-16', NULL, NULL, NULL, 1),
(11, '2019-06-16', '2019-06-16', '2019-06-16', 4, 2),
(12, '2019-06-16', NULL, NULL, 1, 2),
(13, '2019-06-16', NULL, NULL, 1, 3),
(14, '2019-06-16', NULL, NULL, NULL, 4),
(15, '2019-06-16', '2019-06-16', '2019-06-16', 1, 4),
(16, '2019-06-16', NULL, NULL, NULL, 4),
(17, '2019-06-16', '2019-06-16', '2019-06-16', 1, 4);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_imagem1` FOREIGN KEY (`imagem_id`) REFERENCES `imagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_fornecedor1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `item_compra`
--
ALTER TABLE `item_compra`
  ADD CONSTRAINT `fk_item_compra_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_compra_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `fk_item_venda_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_venda_venda1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_Menu_has_Perfil_Menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `fk_Menu_has_Perfil_Perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`);

--
-- Restrições para a tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD CONSTRAINT `fk_relatorio_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`),
  ADD CONSTRAINT `fk_usuario_imagem1` FOREIGN KEY (`imagem_id`) REFERENCES `imagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
