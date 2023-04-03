-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_local
-- Tempo de geração: 29-Out-2020 às 18:20
-- Versão do servidor: 8.0.1-dmr
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `intellect`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_contas_a_pagars`
--

CREATE TABLE `categorias_contas_a_pagars` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias_contas_a_pagars`
--

INSERT INTO `categorias_contas_a_pagars` (`id`, `nome`, `cor`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'Essencais', '#3E6A91', 'pagamento', '2020-01-14 15:37:12', '2020-01-14 15:37:12'),
(2, 'Compras', '#49325B', 'pagamento', '2020-01-14 15:56:23', '2020-01-14 15:56:23'),
(3, 'Urgencias', '#b21212', 'pagamento', '2020-01-29 13:55:49', '2020-01-29 13:55:49'),
(4, 'Lazer', '#5D2646', 'pagamento', '2020-01-29 13:56:18', '2020-01-29 13:56:18'),
(5, 'Transporte', '#8B9197', 'pagamento', '2020-01-29 13:56:32', '2020-01-29 13:56:32'),
(6, 'Alimentação', '#F76489', 'pagamento', '2020-01-29 13:56:50', '2020-01-29 13:56:50'),
(7, 'Estudos', '#ff8507', 'pagamento', '2020-01-29 13:57:12', '2020-01-29 13:57:12'),
(8, 'Avulsos', '#84BE25', 'pagamento', '2020-01-29 13:57:29', '2020-01-29 13:57:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_a_pagars`
--

CREATE TABLE `contas_a_pagars` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `categorias_contas_a_pagar_id` int(10) UNSIGNED DEFAULT NULL,
  `favorecido` varchar(255) DEFAULT NULL,
  `inicio_data_pagamento` varchar(255) DEFAULT NULL,
  `fim_data_pagamento` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `forma_pagamento` varchar(255) DEFAULT NULL,
  `tipo_conta` varchar(255) DEFAULT NULL,
  `parcelas` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contas_a_pagars`
--

INSERT INTO `contas_a_pagars` (`id`, `user_id`, `categorias_contas_a_pagar_id`, `favorecido`, `inicio_data_pagamento`, `fim_data_pagamento`, `descricao`, `forma_pagamento`, `tipo_conta`, `parcelas`, `created_at`, `updated_at`) VALUES
(90, 49, 1, 'Luz', '2020-10-23', NULL, 'Eletropaulo', 'Dinheiro', 'Fixa', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_pagas`
--

CREATE TABLE `contas_pagas` (
  `id` int(10) UNSIGNED NOT NULL,
  `contas_a_pagar_id` int(11) NOT NULL,
  `data_pagamento` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contas_pagas`
--

INSERT INTO `contas_pagas` (`id`, `contas_a_pagar_id`, `data_pagamento`, `created_at`, `updated_at`) VALUES
(84, 90, '2020-10-23', '2020-10-23 19:18:20', '2020-10-23 19:18:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `name`, `batch`, `migration_time`) VALUES
(7, '20201010195800_users.ts', 1, '2020-10-10 20:23:01'),
(8, '20201014035645_valores_contas_a_pagars.ts', 2, '2020-10-14 04:03:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations_lock`
--

CREATE TABLE `migrations_lock` (
  `index` int(10) UNSIGNED NOT NULL,
  `is_locked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations_lock`
--

INSERT INTO `migrations_lock` (`index`, `is_locked`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'jorge', 'jorgeserranojunior@gmail.com', '$2a$10$cHuvzhAaDDt6n8MeIRp9UuCkKzW.y7FaBT0KOxN3Pu8t6UIoIl6hm', NULL, NULL),
(49, 'Jorgx', 'jorgeserranojunior@hotmail.com', '$2a$10$cHuvzhAaDDt6n8MeIRp9UuCkKzW.y7FaBT0KOxN3Pu8t6UIoIl6hm', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `valores_contas_a_pagars`
--

CREATE TABLE `valores_contas_a_pagars` (
  `id` int(10) UNSIGNED NOT NULL,
  `contas_a_pagar_id` int(11) DEFAULT NULL,
  `data_pagamento` varchar(255) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `valores_contas_a_pagars`
--

INSERT INTO `valores_contas_a_pagars` (`id`, `contas_a_pagar_id`, `data_pagamento`, `valor`, `created_at`, `updated_at`) VALUES
(9, 90, '2020-10-23', 1235, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias_contas_a_pagars`
--
ALTER TABLE `categorias_contas_a_pagars`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas_a_pagars`
--
ALTER TABLE `contas_a_pagars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contas_a_pagars_user_id_foreign_idx` (`user_id`),
  ADD KEY `contas_a_pagars_categoria_id_foreign` (`categorias_contas_a_pagar_id`);

--
-- Índices para tabela `contas_pagas`
--
ALTER TABLE `contas_pagas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations_lock`
--
ALTER TABLE `migrations_lock`
  ADD PRIMARY KEY (`index`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices para tabela `valores_contas_a_pagars`
--
ALTER TABLE `valores_contas_a_pagars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias_contas_a_pagars`
--
ALTER TABLE `categorias_contas_a_pagars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `contas_a_pagars`
--
ALTER TABLE `contas_a_pagars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `contas_pagas`
--
ALTER TABLE `contas_pagas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `migrations_lock`
--
ALTER TABLE `migrations_lock`
  MODIFY `index` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `valores_contas_a_pagars`
--
ALTER TABLE `valores_contas_a_pagars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `contas_a_pagars`
--
ALTER TABLE `contas_a_pagars`
  ADD CONSTRAINT `contas_a_pagars_categoria_id_foreign` FOREIGN KEY (`categorias_contas_a_pagar_id`) REFERENCES `categorias_contas_a_pagars` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `contas_a_pagars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;