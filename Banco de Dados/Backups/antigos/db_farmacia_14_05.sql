-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 14/05/2019 às 14:59
-- Versão do servidor: 10.1.38-MariaDB-0+deb9u1
-- Versão do PHP: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_farmacia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
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
  `foto` varchar(255) DEFAULT NULL,
  `user` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `sobrenome`, `cpf`, `sexo`, `estado`, `cidade`, `rua`, `tel_celular`, `tel_fixo`, `tel_recado`, `email`, `casa`, `apto`, `foto`, `user`, `senha`, `status`) VALUES
(3, 'douglas', 'silva', '121212', 'Masculino', 'DF', 'Brasília', 'rua 02', '12', '12', '12', '12@etb.com', 12, 0, 'Logo ETB.jpg', 'douglas', '123', 1),
(4, 'Victor', 'Manuel', '202020', 'Masculino', 'DF', 'Br', 'Rua 03', '121212', '12121212', '21212', 'etb@etb.com', 12, 0, '01-04-19 Diagramas.asta', 'victor', '123', 1),
(5, 'Maria', 'Silva', '1120202', 'Feminino', 'aaaa', 'wwww', 'fsasd', '5555555', '333', '33', 'maria', 1, 2, 'script_db.sql', 'maria', '123', 1),
(6, 'João ', 'Vitor', '08288880620', 'Masculino', 'Decadente', 'Taguatinga', '15', '6455455555', '974946141984', '5956232', '6164196wdytwegdiw@gmail.com', 22, 1, 'Koala.jpg', 'joao', 'joao', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `data_compra` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `fornecedor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
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

--
-- Fazendo dump de dados para tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id`, `nome`, `cnpj`, `localizacao`, `logo`, `user`, `senha`, `status`) VALUES
(1, 'douglas', '1212', 'dsds', 'sds', 'sd', 'sd', 1),
(3, 'dfhfc', 'fgnjhcfg', 'fgtvh', 'xdfgh', 'admin', 'admin', 1),
(4, 'Vítão', 'o + foda', 'minha casa', '+ venenos', 'victor', 'victor', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_compra`
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
-- Estrutura para tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `id` bigint(20) NOT NULL,
  `qtd` double NOT NULL,
  `valor` double NOT NULL,
  `venda_id` bigint(20) NOT NULL,
  `medicamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `item_venda`
--

INSERT INTO `item_venda` (`id`, `qtd`, `valor`, `venda_id`, `medicamento_id`) VALUES
(1, 1, 1.9, 1, 9),
(2, 3, 1.67, 2, 6),
(3, 1, 3.67, 2, 7),
(4, 1, 30, 3, 10),
(5, 1, 3.67, 3, 7),
(6, 1, 34.99, 3, 13),
(7, 20, 1.5, 3, 14),
(8, 1, 500, 3, 11),
(9, 8, 50, 3, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicamento`
--

CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `data_fabricacao` date NOT NULL,
  `data_validade` date NOT NULL,
  `indicacao` varchar(45) NOT NULL,
  `precaucoes` varchar(255) NOT NULL,
  `lote` int(11) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `preco` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `medicamento`
--

INSERT INTO `medicamento` (`id`, `nome`, `data_fabricacao`, `data_validade`, `indicacao`, `precaucoes`, `lote`, `obs`, `fornecedor_id`, `preco`) VALUES
(5, 'Paracetaloka', '2019-05-01', '2019-05-31', 'Uso Pediátrico', 'Manter fora do alcance de crianças de 0-5', 15, '', 1, 2000),
(6, 'Dipinona', '2019-05-13', '2019-05-24', 'Uso Pediátrico', 'Nenhuma', 2, '', 1, 1.67),
(7, 'AS', '2019-05-13', '2019-05-15', 'Uso Pediátrico', 'Nenhum', 12, '', 1, 3.67),
(8, 'Paracetaloka', '2019-05-04', '2019-05-09', 'Uso Adulto', 'Nenhuma', 4, '', 1, 1.56),
(9, 'Anador', '2019-05-04', '2019-05-24', 'Uso Pediátrico', 'Nenhuma', 34, '', 1, 1.9),
(10, 'Durateston', '2019-03-04', '2020-05-08', 'Uso Adulto', 'Não usar se não quiser crescer', 65660, 'Fika Grandi pourra', 4, 30),
(11, 'GH', '2019-05-17', '2020-05-24', 'Uso Adulto', 'Não usar se não quiser crescer ou tiver pré disposição ao câncer.', 21210, 'Cresce e seka', 4, 500),
(12, 'Winstrol', '2019-05-16', '2020-08-15', 'Uso Adulto', 'Magrelo não use', 15421, 'Seca gordura', 4, 50),
(13, 'Deca Durabolin', '2019-05-09', '2021-09-12', 'Uso Adulto', 'Causa retenção', 5466, 'Bullking', 4, 34.99),
(14, 'Seringa', '2019-05-13', '2022-05-14', 'Uso Adulto', 'Objeto perfurante', 1100, 'Usar com cautela', 4, 1.5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `menu`
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
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'Administrador', 'Admin'),
(2, 'Gerente', 'Gerente'),
(4, 'Caixa', 'Realiza  vendas'),
(5, 'Farmacêutico', 'Cuida dos medicamentos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `menu_id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`menu_id`, `perfil_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 4),
(6, 1),
(6, 2),
(7, 1),
(7, 5),
(8, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
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
  `foto` varchar(255) DEFAULT NULL,
  `apto` int(11) DEFAULT '0',
  `casa` int(11) DEFAULT '0',
  `perfil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `sobrenome`, `data_nasc`, `cpf`, `sexo`, `pais`, `estado`, `cidade`, `rua`, `user`, `senha`, `status`, `tel_celular`, `tel_fixo`, `tel_recado`, `email`, `foto`, `apto`, `casa`, `perfil_id`) VALUES
(1, 'Douglas', 'Silva', '2000-02-02', '123', 'Masculino', 'BR', 'DF', 'Brasília', 'Rua 01', 'admin', 'admin', 1, '1212', '1212', '1212', '1212', '1212', 1212, 1212, 1),
(2, 'Wesley', 'Martins', '2019-04-01', '1212', 'Masculino', 'BR', 'DF', 'MER.mwb.bak', 'Rua 02', 'wesley.martins', '123', 1, '1212', '1212', '1212', '121212', 'MER.mwb.bak', 0, 12, 2),
(3, 'Victor', 'Gostosão', '2001-03-04', '08286644410', 'Masculino', 'Brasil', 'Safadão', 'Taguatinga', '19', 'victor', 'victor', 1, '(61)99823-2034', '(61)3333-2298', '(61)99823-2034', 'victormrp.pereira@gmail.com', 'Jellyfish.jpg', 17, 26, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `id` bigint(20) NOT NULL,
  `data_venda` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `venda`
--

INSERT INTO `venda` (`id`, `data_venda`, `data_pagamento`, `data_entrega`, `usuario_id`, `cliente_id`) VALUES
(1, '2019-05-13', '2019-05-13', NULL, 1, 3),
(2, '2019-05-13', '2019-05-13', '2019-05-13', 1, 5),
(3, '2019-05-13', NULL, NULL, 1, 4);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compra_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_compra_fornecedor1_idx` (`fornecedor_id`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `item_compra`
--
ALTER TABLE `item_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_compra_medicamento1_idx` (`medicamento_id`),
  ADD KEY `fk_item_compra_compra1_idx` (`compra_id`);

--
-- Índices de tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_venda_venda1_idx` (`venda_id`),
  ADD KEY `fk_item_venda_medicamento1_idx` (`medicamento_id`);

--
-- Índices de tabela `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Medicamento_Fornecedor1_idx` (`fornecedor_id`);

--
-- Índices de tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD PRIMARY KEY (`menu_id`,`perfil_id`),
  ADD KEY `fk_Menu_has_Perfil_Perfil1_idx` (`perfil_id`),
  ADD KEY `fk_Menu_has_Perfil_Menu1_idx` (`menu_id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Usuario_Perfil1_idx` (`perfil_id`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venda_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_venda_cliente1_idx` (`cliente_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `item_compra`
--
ALTER TABLE `item_compra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de tabela `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_fornecedor1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `item_compra`
--
ALTER TABLE `item_compra`
  ADD CONSTRAINT `fk_item_compra_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_compra_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `fk_item_venda_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_venda_venda1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `fk_Medicamento_Fornecedor1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`);

--
-- Restrições para tabelas `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_Menu_has_Perfil_Menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `fk_Menu_has_Perfil_Perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
