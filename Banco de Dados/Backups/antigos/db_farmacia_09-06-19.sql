-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09-Jun-2019 às 23:30
-- Versão do servidor: 10.1.40-MariaDB
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_farmacia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `tel_celular` varchar(45) NOT NULL,
  `tel_fixo` varchar(45) DEFAULT NULL,
  `tel_recado` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `casa` int(11) DEFAULT '0',
  `apto` int(11) DEFAULT '0',
  `user` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `imagem_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `sobrenome`, `cpf`, `sexo`, `estado`, `cidade`, `rua`, `tel_celular`, `tel_fixo`, `tel_recado`, `email`, `casa`, `apto`, `user`, `senha`, `status`, `imagem_id`) VALUES
(2, 'cliente', 'amigo', '101010', 'Masculino', 'Distrito Federal', 'Recanto das Emas', 'Quadra 604 Conjunto 3 casa 24', '1212', '1212', '1212', 'wesleysilva619343@gmail.com', 2, 0, '121212', '121212', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `data_compra` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `user` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_compra`
--

CREATE TABLE `item_compra` (
  `id` bigint(20) NOT NULL,
  `qtd` double NOT NULL,
  `valor` double NOT NULL,
  `medicamento_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `id` bigint(20) NOT NULL,
  `qtd` double NOT NULL,
  `valor` double NOT NULL,
  `venda_id` bigint(20) NOT NULL,
  `medicamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item_venda`
--

INSERT INTO `item_venda` (`id`, `qtd`, `valor`, `venda_id`, `medicamento_id`) VALUES
(1, 1, 0.09, 1, 1),
(2, 1, 0.09, 1, 1),
(3, 1, 0.09, 1, 1),
(4, 1, 0.09, 2, 1),
(5, 15, 0.09, 2, 1),
(6, 1, 0.09, 3, 1),
(7, 1, 0.09, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicamento`
--

CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
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
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `medicamento`
--

INSERT INTO `medicamento` (`id`, `nome`, `data_fabricacao`, `data_validade`, `indicacao`, `precaucoes`, `lote`, `preco`, `laboratorio`, `composicao`, `obs`, `file`) VALUES
(1, 'asas', '2019-06-07', '2019-06-14', 'Uso Pediátrico', 'asas', 8, 0.09, 'asas', 'asas', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(8, 'Vendas', 'venda.jsp', 'fa fa-dollar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'Administrador', 'Admin'),
(2, 'Caixa', 'Gerencia as Vendas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `menu_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL
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
(8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `tel_celular` varchar(45) NOT NULL,
  `tel_fixo` varchar(45) DEFAULT NULL,
  `tel_recado` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `apto` int(11) DEFAULT '0',
  `casa` int(11) DEFAULT '0',
  `imagem_id` int(11) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `sobrenome`, `data_nasc`, `cpf`, `sexo`, `pais`, `estado`, `cidade`, `rua`, `user`, `senha`, `status`, `tel_celular`, `tel_fixo`, `tel_recado`, `email`, `apto`, `casa`, `imagem_id`, `perfil_id`) VALUES
(1, 'Douglas', 'Silva', '2000-12-12', '123', 'Masculino', 'BR', 'DF', 'Brasília', 'Rua 01', 'admin', 'admin', 1, '123', '123', '123', 'etb@etb.com', 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` bigint(20) NOT NULL,
  `data_venda` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `data_venda`, `data_pagamento`, `data_entrega`, `usuario_id`, `cliente_id`) VALUES
(1, '2019-06-09', '2019-06-09', '2019-06-09', 1, 2),
(2, '2019-06-09', '2019-06-09', '2019-06-09', 1, 2),
(3, '2019-06-09', '2019-06-09', '2019-06-09', 1, 2),
(4, '2019-06-09', '2019-06-09', '2019-06-09', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_imagem1_idx` (`imagem_id`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compra_fornecedor1_idx` (`fornecedor_id`),
  ADD KEY `fk_compra_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_compra`
--
ALTER TABLE `item_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_compra_medicamento1_idx` (`medicamento_id`),
  ADD KEY `fk_item_compra_compra1_idx` (`compra_id`);

--
-- Indexes for table `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_venda_venda1_idx` (`venda_id`),
  ADD KEY `fk_item_venda_medicamento1_idx` (`medicamento_id`);

--
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD PRIMARY KEY (`menu_id`,`perfil_id`),
  ADD KEY `fk_Menu_has_Perfil_Perfil1_idx` (`perfil_id`),
  ADD KEY `fk_Menu_has_Perfil_Menu1_idx` (`menu_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Usuario_Perfil1_idx` (`perfil_id`),
  ADD KEY `fk_usuario_imagem1` (`imagem_id`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venda_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_venda_cliente1_idx` (`cliente_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_compra`
--
ALTER TABLE `item_compra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_imagem1` FOREIGN KEY (`imagem_id`) REFERENCES `imagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_fornecedor1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `item_compra`
--
ALTER TABLE `item_compra`
  ADD CONSTRAINT `fk_item_compra_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_compra_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `fk_item_venda_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_venda_venda1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_Menu_has_Perfil_Menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `fk_Menu_has_Perfil_Perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`),
  ADD CONSTRAINT `fk_usuario_imagem1` FOREIGN KEY (`imagem_id`) REFERENCES `imagem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
