-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2020 às 23:09
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_fejemg`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cores`
--

CREATE TABLE `cores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `federation_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cores`
--

INSERT INTO `cores` (`id`, `name`, `cnpj`, `federation_id`, `created_at`, `updated_at`, `image`, `color`) VALUES
(1, 'Núcleo Norte', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/dd8e', '#0067e2'),
(2, 'Núcleo da Mata', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/dd8g', '#054d4f'),
(3, 'Núcleo Triângulo', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/ddqi', '#fb6e64'),
(4, 'Núcleo Sul', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/dd8d', '#971d6f'),
(5, 'Núcleo Vertentes', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/dd73', '#f9c800'),
(6, 'Núcleo Vale do Aço', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/dd8f', '#ff7200'),
(7, 'Núcleo Central', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/dd74', '#e8306b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `core_goals`
--

CREATE TABLE `core_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `billing` double(9,2) NOT NULL,
  `projects` int(11) NOT NULL,
  `billing_by_member` decimal(10,2) NOT NULL,
  `mandala` tinyint(1) NOT NULL,
  `connected` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ies` int(11) NOT NULL,
  `junior_ies` int(11) NOT NULL,
  `impact` int(11) NOT NULL,
  `nps` int(11) NOT NULL,
  `core_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `core_goals`
--

INSERT INTO `core_goals` (`id`, `year`, `billing`, `projects`, `billing_by_member`, `mandala`, `connected`, `quantity`, `ies`, `junior_ies`, `impact`, `nps`, `core_id`, `created_at`, `updated_at`) VALUES
(1, 2020, 725732.15, 711, '709.42', 1, 18, 38, 4, 4, 363, 60, 3, '2020-10-01 03:00:00', '2020-10-01 03:00:00'),
(2, 2020, 64865.44, 44, '372.79', 1, 2, 8, 1, 1, 18, 31, 1, '2020-10-01 03:00:00', '2020-10-01 03:00:00'),
(3, 2020, 1780081.55, 1080, '1428.64', 1, 27, 57, 7, 7, 584, 55, 2, '2020-10-01 03:00:00', '2020-10-01 03:00:00'),
(4, 2020, 581790.24, 445, '728.15', 1, 16, 33, 3, 3, 224, 70, 4, '2020-10-01 03:00:00', '2020-10-01 03:00:00'),
(5, 2020, 472294.34, 397, '571.78', 1, 17, 37, 3, 3, 167, 55, 5, '2020-10-01 03:00:00', '2020-10-01 03:00:00'),
(6, 2020, 67194.25, 43, '301.32', 1, 4, 9, 3, 3, 20, 46, 6, '2020-10-01 03:00:00', '2020-10-01 03:00:00'),
(7, 2020, 1426232.44, 737, '1222.14', 1, 16, 35, 6, 6, 362, 61, 7, '2020-10-01 03:00:00', '2020-10-01 03:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `degrees`
--

CREATE TABLE `degrees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `degrees`
--

INSERT INTO `degrees` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sistema de Informação - Bacharelado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(2, 'Ciência da Computação - Bacharelado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(3, 'Engenharia Civil - Bacharelado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(4, 'Engenharia de Produção - Bacharelado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(5, 'Matemática - Licenciatura', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(6, 'Engenharia de Alimentos - Bacharelado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(7, 'Administração - Bacharelado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(8, 'Português - Licenciatura', '2020-09-29 22:18:23', '2020-09-29 22:18:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `degree_junior_enterprise`
--

CREATE TABLE `degree_junior_enterprise` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `junior_enterprise_id` bigint(20) NOT NULL,
  `degree_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `degree_junior_enterprise`
--

INSERT INTO `degree_junior_enterprise` (`id`, `junior_enterprise_id`, `degree_id`, `created_at`, `updated_at`) VALUES
(1, 9, 8, NULL, NULL),
(2, 10, 2, NULL, NULL),
(3, 11, 5, NULL, NULL),
(4, 12, 3, NULL, NULL),
(5, 13, 7, NULL, NULL),
(6, 14, 3, NULL, NULL),
(7, 15, 4, NULL, NULL),
(8, 16, 7, NULL, NULL),
(9, 16, 1, NULL, NULL),
(10, 17, 1, NULL, NULL),
(11, 17, 2, NULL, NULL),
(12, 18, 6, NULL, NULL),
(13, 19, 6, NULL, NULL),
(14, 20, 3, NULL, NULL),
(15, 21, 3, NULL, NULL),
(16, 22, 5, NULL, NULL),
(17, 23, 7, NULL, NULL),
(18, 24, 7, NULL, NULL),
(19, 25, 3, NULL, NULL),
(20, 26, 3, NULL, NULL),
(21, 27, 7, NULL, NULL),
(22, 28, 4, NULL, NULL),
(23, 29, 7, NULL, NULL),
(24, 30, 7, NULL, NULL),
(25, 31, 7, NULL, NULL),
(26, 34, 4, NULL, NULL),
(27, 35, 3, NULL, NULL),
(28, 36, 3, NULL, NULL),
(29, 37, 7, NULL, NULL),
(30, 38, 6, NULL, NULL),
(31, 39, 4, NULL, NULL),
(32, 40, 7, NULL, NULL),
(33, 41, 7, NULL, NULL),
(34, 42, 1, NULL, NULL),
(35, 43, 7, NULL, NULL),
(36, 44, 3, NULL, NULL),
(37, 45, 2, NULL, NULL),
(38, 46, 7, NULL, NULL),
(39, 47, 4, NULL, NULL),
(40, 48, 6, NULL, NULL),
(41, 49, 3, NULL, NULL),
(42, 50, 7, NULL, NULL),
(43, 51, 7, NULL, NULL),
(44, 52, 6, NULL, NULL),
(45, 53, 1, NULL, NULL),
(46, 54, 4, NULL, NULL),
(47, 55, 5, NULL, NULL),
(48, 56, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `federations`
--

CREATE TABLE `federations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `federations`
--

INSERT INTO `federations` (`id`, `name`, `cnpj`, `created_at`, `updated_at`) VALUES
(1, 'FEJEMG', '01.328.030/0001-94', '2020-09-29 22:18:23', '2020-09-29 22:18:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `federation_goals`
--

CREATE TABLE `federation_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `billing` decimal(11,2) NOT NULL,
  `projects` int(11) NOT NULL,
  `ejs` int(11) NOT NULL,
  `mandala` tinyint(1) NOT NULL,
  `connected` int(11) NOT NULL,
  `billing_by_member` decimal(11,2) NOT NULL,
  `ies` int(11) NOT NULL,
  `junior_ies` int(11) NOT NULL,
  `impact` int(11) NOT NULL,
  `nps` int(11) NOT NULL,
  `federation_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `federation_goals`
--

INSERT INTO `federation_goals` (`id`, `year`, `billing`, `projects`, `ejs`, `mandala`, `connected`, `billing_by_member`, `ies`, `junior_ies`, `impact`, `nps`, `federation_id`, `created_at`, `updated_at`) VALUES
(1, 2020, '5118190.41', 3457, 219, 0, 101, '937.74', 37, 20, 1738, 57, 1, '2020-10-12 03:00:00', '2020-10-12 03:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `foundations`
--

CREATE TABLE `foundations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ies_junior` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `foundations`
--

INSERT INTO `foundations` (`id`, `name`, `ies_junior`, `created_at`, `updated_at`) VALUES
(1, 'UFV', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(2, 'UFMG', 0, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(3, 'UFU', 0, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(4, 'UFJF', 0, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(5, 'UFTM', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(6, 'UNIFEI', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(7, 'UFLA', 0, '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(8, 'UFSJ', 1, '2020-10-07 03:00:00', '2020-10-07 03:00:00'),
(9, 'UFOP', 1, '2020-10-07 03:00:00', '2020-10-07 03:00:00'),
(10, 'PUC', 0, '2020-10-07 03:00:00', '2020-10-07 03:00:00'),
(11, 'UFVJM', 0, NULL, NULL),
(12, 'UNIMONTES', 0, NULL, NULL),
(13, 'Faculdade Machado Sobrinho', 1, NULL, NULL),
(14, 'Faculdade Metodista Granbery', 0, NULL, NULL),
(15, 'Fundação João Pinheiro', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `imageable_id` int(10) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `junior_enterprises`
--

CREATE TABLE `junior_enterprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `associated_since` date NOT NULL,
  `cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `members` int(11) NOT NULL,
  `foundation_id` bigint(20) NOT NULL,
  `core_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `junior_enterprises`
--

INSERT INTO `junior_enterprises` (`id`, `name`, `email`, `about`, `associated_since`, `cnpj`, `website`, `members`, `foundation_id`, `core_id`, `created_at`, `updated_at`) VALUES
(1, 'InfoAlto Empresa Júnior', 'contato@infoalto.com.br', 'Empresa Júnior de Sistemas de Informação da UFV-CRP', '2020-09-29', '00.000.000/0000-00', 'www.site.com.br', 40, 1, 3, '2020-09-29 22:18:51', '2020-09-29 22:18:51'),
(2, 'Mais Consultoria', 'contato@mais.com.br', 'Empresa Junior de Engenharia de Produção', '2020-09-29', '00.000.000/0000-00', 'www.site.com.br', 28, 4, 2, '2020-09-29 22:18:51', '2020-09-29 22:18:51'),
(5, 'Projet Consultoria Jr', 'contato@Projet.com.br', 'Empresa Junior de Engenharia de Produção', '2020-09-29', '00.000.000/0000-00', 'www.site.com.br', 40, 1, 5, '2020-09-29 22:18:51', '2020-09-29 22:18:51'),
(9, 'Cria UFMG', 'contato@cria.com.br', 'Empresa Júnior de Design da UFMG', '2018-06-08', '00000000', 'www.cria.com.br', 43, 2, 7, '2020-10-07 18:45:28', '2020-10-07 18:45:28'),
(10, 'Code', 'contato@code.com', 'Empresa Júnior de Computação da UFJF', '2016-01-01', '00000000', 'www.code.com.br', 32, 4, 2, '2020-10-07 18:46:14', '2020-10-07 18:46:14'),
(11, 'Mosaico', 'contato@mosaico.com', 'Empresa Júnior de Comunicação da UFSJ', '2017-01-01', '000000000', 'www.mosaico.com', 24, 8, 5, '2020-10-07 18:49:11', '2020-10-07 18:49:11'),
(12, 'Emas Jr. Consultoria', 'contato@emas.com', 'Empresa Júnior de Engenharia Civil da UFMG', '2010-01-01', '0000000', 'www.emasjr.com.br', 54, 2, 7, '2020-10-07 18:49:59', '2020-10-07 18:49:59'),
(13, 'Ecofarma', 'contato@ecofarma.com', 'Empresa Junior de Farmacia da UFJF', '2017-01-01', '000000000', 'www.ecofarmajr.com.br', 32, 4, 2, '2020-10-07 18:51:08', '2020-10-07 18:51:08'),
(14, 'Porte Empresa Júnior', 'contato@portejr.com.br', 'Empresa Júnior de Engenharia Civil e Arquitetura da UFJF', '2010-01-01', '0000000', 'www.portejr.com', 32, 4, 2, '2020-10-07 18:52:35', '2020-10-07 18:52:35'),
(15, 'Soluções Consultoria', 'contato@sol.com.br', 'Empresa Júnior de Produção da UFV', '2014-01-01', '00000000', 'www.solucoes.com.br', 58, 1, 2, '2020-10-07 18:53:44', '2020-10-07 18:53:44'),
(16, 'UNIFEI Jr', 'contato@unifeijr.com', 'Empresa Junior de Tecnlogia e Gestão da UNIFEI', '2015-01-01', '000000', 'www.unifeijr.com', 78, 6, 4, '2020-10-07 18:54:59', '2020-10-07 18:54:59'),
(17, 'UFMG Informática Júnior', 'contato@ijunior.com', 'Empresa Júnior de Computação da UFMG', '2010-01-01', '000000000', 'www.ijunior.com', 45, 2, 7, '2020-10-07 18:56:12', '2020-10-07 18:56:12'),
(18, 'Alimentos Jr', 'contato@alimentosjr.com', 'Empresa Junior de Alimentos da UFV-Viçosa', '2015-01-01', '000000000', 'www.alimentosjr.com', 35, 1, 2, '2020-10-07 18:57:02', '2020-10-07 18:57:02'),
(19, 'ConsultEQ', 'contato@consulteq.com.br', 'Empresa Júnior de Engenharia Quimica da UFU', '2018-01-01', '00000000', 'www.consulteq.com', 57, 3, 3, '2020-10-07 18:58:00', '2020-10-07 18:58:00'),
(20, 'Ideal Consultoria e Empreendimentos', 'contato@ideal.com.br', 'Empresa Júnior de Engenharia Civil da USFJ', '2008-01-01', '000000000', 'www.ideal.com', 65, 8, 5, '2020-10-07 18:58:55', '2020-10-07 18:58:55'),
(21, 'CONSELT', 'contato@conselt.com.br', 'Empresa Júnior de Engenharia Eletrica da UFU', '2016-01-01', '00000000', 'www.conselt.com', 15, 3, 3, '2020-10-07 18:59:43', '2020-10-07 18:59:43'),
(22, 'Meta Consultoria', 'contato@meta.com', 'Empresa Júnior de Automação da UFU', '2018-01-01', '00000000', 'www.meta.com.br', 23, 3, 7, '2020-10-07 19:00:27', '2020-10-07 19:00:27'),
(23, 'Apoio Consultoria Jr', 'contato@apoio.com', 'Empresa Júnior de Adm da UFU', '2016-01-01', '00000000', 'www.apoio.com', 28, 3, 3, '2020-10-07 19:01:50', '2020-10-07 19:01:50'),
(24, 'UP Consultoria Jr', 'contato@up.com.br', 'Empresa Junior de Gestão da UNIFEI - Itabira', '2017-01-01', '00000000', 'www.upconsultoriajr.com', 32, 6, 6, '2020-10-07 19:21:27', '2020-10-07 19:21:27'),
(25, 'Arq Jr.', 'contato@arq.com.br', 'Empresa júnior de arquitetura da UFOP', '2014-01-01', '0000000', 'www.arqjr.com.br', 14, 9, 5, '2020-10-07 19:23:18', '2020-10-07 19:23:18'),
(26, 'Via Jr', 'contato@viajr.com.br', 'Empresa Junior de Engenharia Civil da UFU', '2016-01-01', '0000000', 'www.viajr.com.br', 43, 3, 3, '2020-10-07 19:24:48', '2020-10-07 19:24:48'),
(27, 'PUC Consultoria Jr', 'contato@puc.com.br', 'Empresa Júnior de Gestão da PUC-MG', '2017-01-01', '0000000', 'www.pucjr.com.br', 34, 10, 7, '2020-10-07 19:25:46', '2020-10-07 19:25:46'),
(28, 'PJ Consultoria', 'contato@pj.com.br', 'Empresa Júnior de Engenharia de Produção da UFMG', '2008-01-01', '0000000', 'www.pj.com.br', 65, 2, 7, '2020-10-07 19:27:21', '2020-10-07 19:27:21'),
(29, 'Campic Consultoria Jr', 'contato@campic.com.br', 'Empresa Júnior de Coop. da UFV', '2016-01-01', '00000000', 'www.campic.com', 23, 1, 2, '2020-10-07 19:32:25', '2020-10-07 19:32:25'),
(30, 'Terra Jr', 'contato@terra.com.br', 'Empresa Júnior de Agropecuária', '2009-01-01', '0000000', 'www.terrajr.com.br', 22, 6, 4, '2020-10-07 19:34:14', '2020-10-07 19:34:14'),
(31, 'Consea Jr', 'contato@conseja.com.br', 'Empresa Júnior de Consultoria da UFLA', '2018-01-01', '0000000', 'www.conseajr.com.br', 32, 7, 4, '2020-10-07 21:19:29', '2020-10-07 21:19:29'),
(32, 'Civil Júnior', 'contato@civil.com', 'Empresa Júnior de Engenharia Civil da UFOP', '2008-01-01', '00000000', 'www.civiljr.com', 32, 9, 5, '2020-10-07 21:38:19', '2020-10-07 21:38:19'),
(33, 'UCJ', 'contato@ucj.com.br', 'Empresa Júnior de Contabeis e Economia da UFMG', '2004-01-01', '00000000', 'www.ucj.com', 80, 2, 7, '2020-10-07 21:44:38', '2020-10-07 21:44:38'),
(34, 'Projep', 'contato@projep.com.br', 'Empresa Júnior de Produção da UFTM', '2011-01-01', '00000000', 'www.projepjr.com.br', 34, 5, 3, '2020-10-07 21:46:45', '2020-10-07 21:46:45'),
(35, 'Melius Jr', 'contato@meliusjr.com.br', 'Empresa Júnior de Engenharia da UFVJM', '2017-01-01', '000000000', 'www.meliusjr.com.br', 26, 11, 1, '2020-10-10 03:38:25', '2020-10-10 03:38:25'),
(36, 'Metrus Jr', 'contato@metrusjr.com.br', 'Empresa Júnior de Engenharia de Montes Claros', '2007-01-01', '000000', 'www.metrusjr.com.br', 14, 12, 1, '2020-10-10 03:44:58', '2020-10-10 03:44:58'),
(37, 'ACPE Consultoria Jr', 'contato@acpejr.com.br', 'Empresa Júnior de Economica da UFU', '2015-01-01', '0000000', 'www.acpe.com.br', 21, 3, 3, '2020-10-16 01:40:58', '2020-10-16 01:40:58'),
(38, 'AJEA', 'contato@ejea.com.br', 'Empresa Júnior de Alimentos da UFTM', '2017-01-01', '000000', 'www.ajea.com.br', 17, 5, 3, '2020-10-16 01:49:08', '2020-10-16 01:49:08'),
(39, 'ATP Jr.: Consultoria em Bioprocessos', 'contato@atp.com', 'Empresa Junior de Bioprocessos da UFSJ', '2018-01-01', '0000000', 'www.atpjr.com.br', 23, 8, 5, '2020-10-18 21:14:03', '2020-10-18 21:14:03'),
(40, 'Masci Consultoria Jr', 'contato@masci.com', 'Empresa Júnior de Gestão da MASCI', '2020-01-01', '000000000', 'www.masci.com', 34, 13, 2, '2020-10-18 21:24:22', '2020-10-18 21:24:22'),
(41, 'CECCO Consultoria Contábil', 'contato@cecco.com', 'Empresa Júnior de Contábeis da UFV - Viçosa', '2013-01-01', '000000000', 'www.cecco.com', 21, 1, 2, '2020-10-18 21:32:16', '2020-10-18 21:32:16'),
(42, 'Linked Informatica Jr', 'contato@linked.com.br', 'EMpresa Júnior de Computação da UFSJ', '2018-01-01', '000000', 'www.linked.com.br', 8, 8, 5, '2020-10-18 21:46:04', '2020-10-18 21:46:04'),
(43, 'Granbery Consultoria', 'contato@gc.com', 'Empresa Júnior de Gestão da GC', '2014-01-01', '000000', 'www.gc.com.br', 6, 14, 2, '2020-10-18 21:51:32', '2020-10-18 21:51:32'),
(44, 'Arché Empresa Júnior', 'contato@arche.com.br', 'Empresa Júnior de Arquitetura da UFSJ', '2017-01-01', '000000', 'www.arche.com.br', 20, 8, 5, '2020-10-18 22:03:07', '2020-10-18 22:03:07'),
(45, 'No Bugs', 'contato@nobugs.com.br', 'Empresa Júnior de Computação da UFV', '2010-01-01', '000000', 'www.nobugs.com', 20, 1, 2, '2020-10-18 22:08:41', '2020-10-18 22:08:41'),
(46, 'João Pinheiro Jr', 'contato@jpj.com.br', 'Empresa Júnior da Fundação João Pinheiro', '2010-01-01', '000000', 'www.jpj.com.br', 21, 15, 7, '2020-10-18 22:18:11', '2020-10-18 22:18:11'),
(47, 'Colucci Consultoria Jurídica Júnior', 'contato@colluci.com', 'Empresa Júnior de Direito da UFJF', '2017-01-01', '000000', 'www.colluci.com', 17, 4, 2, '2020-10-18 22:23:14', '2020-10-18 22:23:14'),
(48, 'Farmácia Jr Consultoria', 'contato@farmacia.ufmg.com', 'Empresa Júnior de Farmácia da UFMG', '2013-01-01', '000000', 'www.farmacia.ufmg.com', 21, 2, 7, '2020-10-18 23:19:30', '2020-10-18 23:19:30'),
(49, 'EJEL', 'contato@eje.com', 'Empresa Júnior de Engenharia Eletrica', '2018-01-01', '0000000', 'www.ejel.com', 13, 8, 5, '2020-10-18 23:26:08', '2020-10-18 23:26:08'),
(50, 'UFLA Júnior Consultoria Administrativa', 'contato@uflajr.com', 'Empresa Júnior de Consultoria da UFLA', '2013-01-01', '0000000000', 'www.uflajr.com', 18, 7, 4, '2020-10-18 23:37:23', '2020-10-18 23:37:23'),
(51, 'SEC Jr. Consultoria', 'contato@sec.com.br', 'Empresa Júnior de Secretariado da UFV', '2018-01-01', '00000000', 'www.secjr.com', 15, 1, 2, '2020-10-18 23:42:22', '2020-10-18 23:42:22'),
(52, 'TRIEQ', 'contato@trieq.com', 'Empresa Júnior de Engenharia Quimica da UFTM', '2016-01-01', '00000000', 'www.trieq.com', 23, 5, 3, '2020-10-18 23:47:01', '2020-10-18 23:47:01'),
(53, 'Visão', 'contato@visao.com', 'Empresa Júnior de Sistemas da UFOP', '2017-01-01', '000000', 'www.visao.com.br', 16, 9, 6, '2020-10-18 23:52:17', '2020-10-18 23:52:17'),
(54, 'Sênior Consultoria Ambiental', 'contato@senior.com.br', 'Empresa Júnior de Engenharia Ambielntal', '2016-01-01', '0000000', 'www.senior.com.br', 10, 9, 6, '2020-10-18 23:55:12', '2020-10-18 23:55:12'),
(55, 'Aspecto Empreendimento CriativFEJEMG', 'contato@aspecto.com', 'Empresa Júnior de Moda e Design da UFMG', '2017-01-01', '00000000', 'www.aspecto.com', 19, 4, 2, '2020-10-18 23:58:54', '2020-10-18 23:58:54'),
(56, 'Impacto Jr', 'contato@impacto.com.br', 'Empresa Júnior de Engenharia Mecânica da UFJG', '2013-01-01', '00000000', 'www.impactojr.com', 10, 4, 2, '2020-10-19 00:05:37', '2020-10-19 00:05:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `junior_enterprise_goals`
--

CREATE TABLE `junior_enterprise_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `billing` decimal(8,2) NOT NULL,
  `projects` int(11) NOT NULL,
  `members_performing` int(11) NOT NULL,
  `shared_actions` int(11) NOT NULL,
  `members_events` int(11) NOT NULL,
  `nps` int(11) NOT NULL,
  `impact_projects` int(11) NOT NULL,
  `junior_enterprise_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `members_performing_goal` int(11) NOT NULL,
  `current_nps` int(11) NOT NULL,
  `cluster` int(11) NOT NULL,
  `current_members_events` int(11) NOT NULL,
  `current_impact_projects` int(11) NOT NULL,
  `current_shared_actions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `junior_enterprise_goals`
--

INSERT INTO `junior_enterprise_goals` (`id`, `year`, `billing`, `projects`, `members_performing`, `shared_actions`, `members_events`, `nps`, `impact_projects`, `junior_enterprise_id`, `created_at`, `updated_at`, `members_performing_goal`, `current_nps`, `cluster`, `current_members_events`, `current_impact_projects`, `current_shared_actions`) VALUES
(1, 2020, '13000.00', 8, 92, 1, 80, 0, 3, 1, '2020-03-07 00:19:20', '2020-10-08 01:04:49', 75, 50, 3, 80, 1, 3),
(2, 2020, '237000.00', 65, 100, 6, 80, 100, 8, 2, '2020-09-29 22:43:26', '2020-10-07 19:17:52', 75, 80, 5, 0, 0, 0),
(3, 2020, '236700.00', 40, 75, 5, 75, 76, 16, 3, '2020-09-29 22:43:26', '2020-09-29 22:43:26', 76, 100, 2, 0, 0, 0),
(4, 2020, '160000.00', 90, 70, 5, 75, 50, 23, 4, '2020-09-29 22:43:26', '2020-09-29 22:43:26', 78, 89, 3, 0, 0, 0),
(5, 2020, '71400.00', 16, 85, 1, 80, 100, 7, 5, '2020-09-29 22:43:26', '2020-10-07 22:35:42', 75, 80, 4, 0, 0, 0),
(10, 2020, '66300.00', 70, 100, 10, 80, 76, 35, 9, '2020-10-07 18:45:28', '2020-10-07 19:15:45', 75, 75, 3, 83, 39, 0),
(11, 2020, '30000.00', 10, 93, 3, 80, 100, 5, 10, '2020-10-07 18:46:15', '2020-10-08 00:48:48', 72, 75, 1, 86, 1, 0),
(12, 2020, '9000.00', 10, 100, 1, 56, 100, 4, 11, '2020-10-07 18:49:11', '2020-10-07 23:08:45', 75, 50, 1, 71, 2, 2),
(13, 2020, '167500.00', 75, 96, 7, 80, 92, 40, 12, '2020-10-07 18:49:59', '2020-10-18 22:39:26', 75, 80, 5, 76, 34, 12),
(14, 2020, '23400.00', 38, 87, 3, 80, 100, 20, 13, '2020-10-07 18:51:08', '2020-10-18 22:41:58', 75, 80, 3, 78, 11, 4),
(15, 2020, '375000.00', 70, 90, 3, 80, 90, 37, 14, '2020-10-07 18:52:35', '2020-10-18 22:46:11', 75, 80, 5, 69, 43, 5),
(16, 2020, '37385.58', 8, 78, 1, 76, 100, 0, 15, '2020-10-07 18:53:45', '2020-10-14 18:43:03', 75, 50, 4, 0, 0, 0),
(17, 2020, '74500.00', 18, 100, 4, 80, 100, 11, 16, '2020-10-07 18:54:59', '2020-10-18 22:50:22', 75, 60, 5, 90, 13, 6),
(18, 2020, '28000.00', 11, 69, 2, 70, 100, 7, 17, '2020-10-07 18:56:12', '2020-10-18 22:53:09', 60, 80, 1, 85, 7, 1),
(19, 2020, '78200.00', 35, 100, 1, 80, 100, 19, 18, '2020-10-07 18:57:02', '2020-10-18 23:07:31', 75, 80, 5, 94, 21, 3),
(20, 2020, '27500.00', 10, 90, 2, 80, 66, 4, 19, '2020-10-07 18:58:00', '2020-10-08 01:37:51', 75, 50, 2, 84, 5, 2),
(21, 2020, '57000.00', 45, 100, 3, 74, 100, 18, 20, '2020-10-07 18:58:55', '2020-10-18 23:14:13', 75, 60, 4, 80, 12, 4),
(22, 2020, '27000.00', 17, 92, 2, 56, 90, 9, 21, '2020-10-07 18:59:43', '2020-10-08 01:32:19', 75, 80, 3, 77, 10, 2),
(23, 2020, '37500.00', 26, 65, 2, 68, 100, 14, 22, '2020-10-07 19:00:27', '2020-10-18 23:16:43', 75, 80, 3, 62, 1, 2),
(24, 2020, '106000.00', 25, 100, 1, 80, 90, 12, 23, '2020-10-07 19:01:50', '2020-10-08 01:17:41', 75, 80, 5, 97, 13, 1),
(25, 2020, '24000.00', 8, 93, 1, 80, 100, 3, 24, '2020-10-07 19:21:27', '2020-10-10 04:07:05', 75, 55, 3, 89, 4, 2),
(26, 2020, '0.00', 0, 0, 0, 0, 0, 0, 25, '2020-10-07 19:23:18', '2020-10-07 19:23:18', 0, 0, 1, 0, 0, 0),
(27, 2020, '24800.00', 22, 71, 2, 80, 100, 12, 26, '2020-10-07 19:24:48', '2020-10-08 01:43:11', 75, 80, 2, 83, 8, 2),
(28, 2020, '57000.00', 17, 63, 3, 47, 75, 0, 27, '2020-10-07 19:25:46', '2020-10-07 19:28:48', 75, 76, 2, 0, 0, 0),
(29, 2020, '150600.00', 37, 74, 1, 54, 100, 0, 28, '2020-10-07 19:27:22', '2020-10-07 19:31:07', 74, 70, 4, 0, 0, 0),
(30, 2020, '14200.00', 9, 100, 1, 76, 100, 0, 29, '2020-10-07 19:32:25', '2020-10-07 19:33:05', 775, 75, 1, 0, 0, 0),
(31, 2020, '47269.23', 50, 74, 1, 80, 80, 0, 30, '2020-10-07 19:34:14', '2020-10-07 19:35:09', 75, 80, 3, 0, 0, 0),
(32, 2020, '30054.00', 30, 47, 3, 65, 60, 0, 31, '2020-10-07 21:19:29', '2020-10-07 21:36:47', 75, 100, 1, 0, 0, 0),
(33, 2020, '27165.00', 28, 95, 5, 70, 100, 0, 32, '2020-10-07 21:38:19', '2020-10-07 21:41:57', 75, 78, 2, 0, 0, 0),
(34, 2020, '307588.31', 81, 82, 2, 80, 81, 0, 33, '2020-10-07 21:44:38', '2020-10-07 21:52:16', 75, 70, 5, 27, 0, 0),
(35, 2020, '40000.00', 16, 100, 1, 80, 100, 9, 34, '2020-10-07 21:46:45', '2020-10-08 01:41:43', 75, 100, 3, 96, 9, 1),
(36, 2020, '7501.07', 3, 78, 1, 51, 10, 2, 35, '2020-10-10 03:38:25', '2020-10-10 03:40:49', 75, 50, 1, 43, 25, 0),
(37, 2020, '30000.00', 25, 83, 1, 80, 100, 9, 36, '2020-10-10 03:44:58', '2020-10-10 03:46:18', 75, 50, 1, 71, 5, 1),
(38, 2020, '46200.00', 30, 100, 1, 80, 100, 16, 37, '2020-10-16 01:40:59', '2020-10-16 01:42:51', 75, 100, 3, 86, 23, 5),
(39, 2020, '15481.30', 25, 100, 3, 80, 71, 13, 38, '2020-10-16 01:49:08', '2020-10-16 01:50:22', 75, 80, 2, 95, 9, 4),
(40, 2020, '6000.00', 8, 96, 2, 68, 100, 5, 39, '2020-10-18 21:14:03', '2020-10-18 21:16:51', 75, 80, 1, 93, 14, 2),
(41, 2020, '60000.00', 18, 85, 2, 70, 100, 9, 40, '2020-10-18 21:24:22', '2020-10-18 21:26:26', 75, 70, 4, 21, 4, 1),
(42, 2020, '27152.68', 69, 64, 1, 35, 85, 55, 41, '2020-10-18 21:32:16', '2020-10-18 21:42:21', 75, 80, 1, 29, 71, 1),
(43, 2020, '9600.00', 8, 20, 2, 80, 0, 4, 42, '2020-10-18 21:46:04', '2020-10-18 21:46:50', 60, 70, 1, 0, 0, 0),
(44, 2020, '3000.00', 5, 70, 2, 50, 100, 3, 43, '2020-10-18 21:51:33', '2020-10-18 21:53:50', 70, 80, 1, 30, 1, 0),
(45, 2020, '38150.00', 20, 89, 2, 80, 100, 10, 44, '2020-10-18 22:03:07', '2020-10-18 22:03:49', 80, 75, 3, 86, 10, 1),
(46, 2020, '64260.46', 6, 100, 1, 72, 100, 2, 45, '2020-10-18 22:08:41', '2020-10-18 22:10:00', 75, 50, 3, 81, 20, 2),
(47, 2020, '44165.25', 6, 70, 1, 80, 66, 2, 46, '2020-10-18 22:18:11', '2020-10-18 22:20:31', 75, 50, 3, 82, 4, 2),
(48, 2020, '51000.00', 45, 100, 5, 80, 93, 15, 47, '2020-10-18 22:23:14', '2020-10-18 22:31:31', 75, 50, 4, 100, 14, 7),
(49, 2020, '28150.00', 23, 100, 4, 80, 100, 12, 48, '2020-10-18 23:19:30', '2020-10-18 23:22:52', 75, 80, 3, 86, 5, 4),
(50, 2020, '17000.00', 18, 85, 1, 80, 100, 10, 49, '2020-10-18 23:26:09', '2020-10-18 23:34:17', 75, 80, 3, 75, 4, 0),
(51, 2020, '32500.00', 6, 85, 4, 36, 100, 10, 50, '2020-10-18 23:37:23', '2020-10-18 23:38:13', 75, 80, 3, 45, 10, 4),
(52, 2020, '9000.00', 20, 100, 1, 56, 66, 7, 51, '2020-10-18 23:42:22', '2020-10-18 23:43:18', 75, 27, 1, 64, 9, 1),
(53, 2020, '13000.00', 11, 82, 2, 80, 71, 6, 52, '2020-10-18 23:47:02', '2020-10-18 23:47:56', 75, 80, 2, 76, 5, 2),
(54, 2020, '6480.00', 4, 81, 1, 80, 0, 2, 53, '2020-10-18 23:52:17', '2020-10-18 23:53:05', 75, 50, 1, 81, 0, 1),
(55, 2020, '1080.00', 2, 90, 1, 80, 100, 1, 54, '2020-10-18 23:55:12', '2020-10-18 23:55:59', 75, 50, 1, 70, 2, 1),
(56, 2020, '27695.00', 45, 100, 7, 80, 100, 18, 55, '2020-10-18 23:58:54', '2020-10-19 00:00:07', 75, 60, 3, 82, 26, 3),
(57, 2020, '70000.00', 25, 72, 2, 80, 85, 15, 56, '2020-10-19 00:05:37', '2020-10-19 00:06:38', 75, 50, 5, 83, 13, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `junior_enterprise_project`
--

CREATE TABLE `junior_enterprise_project` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `junior_enterprise_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `junior_enterprise_project`
--

INSERT INTO `junior_enterprise_project` (`id`, `junior_enterprise_id`, `project_id`, `created_at`, `updated_at`) VALUES
(41, 30, 13, NULL, NULL),
(42, 30, 14, NULL, NULL),
(43, 30, 15, NULL, NULL),
(44, 30, 16, NULL, NULL),
(45, 30, 17, NULL, NULL),
(46, 30, 18, NULL, NULL),
(47, 30, 19, NULL, NULL),
(48, 31, 1, NULL, NULL),
(49, 31, 2, NULL, NULL),
(50, 31, 3, NULL, NULL),
(51, 31, 4, NULL, NULL),
(52, 31, 5, NULL, NULL),
(53, 31, 6, NULL, NULL),
(54, 31, 7, NULL, NULL),
(55, 31, 8, NULL, NULL),
(56, 31, 9, NULL, NULL),
(57, 31, 10, NULL, NULL),
(58, 31, 11, NULL, NULL),
(59, 31, 12, NULL, NULL),
(60, 30, 1, NULL, NULL),
(61, 30, 2, NULL, NULL),
(62, 30, 3, NULL, NULL),
(63, 30, 4, NULL, NULL),
(64, 30, 5, NULL, NULL),
(65, 30, 6, NULL, NULL),
(66, 30, 7, NULL, NULL),
(67, 30, 8, NULL, NULL),
(68, 30, 9, NULL, NULL),
(69, 30, 10, NULL, NULL),
(70, 30, 11, NULL, NULL),
(71, 30, 12, NULL, NULL),
(72, 31, 39, NULL, NULL),
(73, 31, 40, NULL, NULL),
(74, 31, 41, NULL, NULL),
(75, 31, 42, NULL, NULL),
(76, 31, 43, NULL, NULL),
(77, 31, 44, NULL, NULL),
(78, 31, 45, NULL, NULL),
(79, 32, 1, NULL, NULL),
(80, 32, 2, NULL, NULL),
(81, 32, 3, NULL, NULL),
(82, 32, 4, NULL, NULL),
(83, 32, 5, NULL, NULL),
(84, 32, 6, NULL, NULL),
(85, 32, 7, NULL, NULL),
(86, 32, 8, NULL, NULL),
(87, 32, 9, NULL, NULL),
(88, 32, 10, NULL, NULL),
(89, 32, 11, NULL, NULL),
(90, 32, 12, NULL, NULL),
(91, 34, 1, NULL, NULL),
(92, 34, 2, NULL, NULL),
(93, 34, 3, NULL, NULL),
(94, 34, 4, NULL, NULL),
(95, 34, 5, NULL, NULL),
(96, 34, 6, NULL, NULL),
(97, 34, 7, NULL, NULL),
(98, 34, 8, NULL, NULL),
(99, 34, 9, NULL, NULL),
(100, 34, 10, NULL, NULL),
(101, 34, 11, NULL, NULL),
(102, 34, 12, NULL, NULL),
(103, 33, 1, NULL, NULL),
(104, 33, 2, NULL, NULL),
(105, 33, 3, NULL, NULL),
(106, 33, 4, NULL, NULL),
(107, 33, 5, NULL, NULL),
(108, 33, 6, NULL, NULL),
(109, 33, 7, NULL, NULL),
(110, 33, 8, NULL, NULL),
(111, 33, 9, NULL, NULL),
(112, 33, 10, NULL, NULL),
(113, 33, 11, NULL, NULL),
(114, 33, 12, NULL, NULL),
(115, 33, 46, NULL, NULL),
(116, 33, 47, NULL, NULL),
(117, 33, 48, NULL, NULL),
(118, 33, 49, NULL, NULL),
(119, 33, 50, NULL, NULL),
(120, 33, 51, NULL, NULL),
(121, 33, 52, NULL, NULL),
(122, 33, 53, NULL, NULL),
(123, 33, 54, NULL, NULL),
(124, 33, 55, NULL, NULL),
(125, 1, 1, NULL, NULL),
(126, 1, 2, NULL, NULL),
(127, 1, 3, NULL, NULL),
(128, 1, 4, NULL, NULL),
(129, 1, 5, NULL, NULL),
(130, 1, 6, NULL, NULL),
(131, 1, 7, NULL, NULL),
(132, 1, 8, NULL, NULL),
(133, 1, 9, NULL, NULL),
(134, 1, 10, NULL, NULL),
(135, 1, 11, NULL, NULL),
(136, 1, 12, NULL, NULL),
(137, 2, 1, NULL, NULL),
(138, 2, 2, NULL, NULL),
(139, 2, 3, NULL, NULL),
(140, 2, 4, NULL, NULL),
(141, 2, 5, NULL, NULL),
(142, 2, 6, NULL, NULL),
(143, 2, 7, NULL, NULL),
(144, 2, 8, NULL, NULL),
(145, 2, 9, NULL, NULL),
(146, 2, 10, NULL, NULL),
(147, 2, 11, NULL, NULL),
(148, 2, 12, NULL, NULL),
(149, 5, 1, NULL, NULL),
(150, 5, 2, NULL, NULL),
(151, 5, 3, NULL, NULL),
(152, 5, 4, NULL, NULL),
(153, 5, 5, NULL, NULL),
(154, 5, 6, NULL, NULL),
(155, 5, 7, NULL, NULL),
(156, 5, 8, NULL, NULL),
(157, 5, 9, NULL, NULL),
(158, 5, 10, NULL, NULL),
(159, 5, 11, NULL, NULL),
(160, 5, 12, NULL, NULL),
(161, 9, 1, NULL, NULL),
(162, 9, 2, NULL, NULL),
(163, 9, 3, NULL, NULL),
(164, 9, 4, NULL, NULL),
(165, 9, 5, NULL, NULL),
(166, 9, 6, NULL, NULL),
(167, 9, 7, NULL, NULL),
(168, 9, 8, NULL, NULL),
(169, 9, 9, NULL, NULL),
(170, 9, 10, NULL, NULL),
(171, 9, 11, NULL, NULL),
(172, 9, 12, NULL, NULL),
(173, 10, 1, NULL, NULL),
(174, 10, 2, NULL, NULL),
(175, 10, 3, NULL, NULL),
(176, 10, 4, NULL, NULL),
(177, 10, 5, NULL, NULL),
(178, 10, 6, NULL, NULL),
(179, 10, 7, NULL, NULL),
(180, 10, 8, NULL, NULL),
(181, 10, 9, NULL, NULL),
(182, 10, 10, NULL, NULL),
(183, 10, 11, NULL, NULL),
(184, 10, 12, NULL, NULL),
(185, 11, 1, NULL, NULL),
(186, 11, 2, NULL, NULL),
(187, 11, 3, NULL, NULL),
(188, 11, 4, NULL, NULL),
(189, 11, 5, NULL, NULL),
(190, 11, 6, NULL, NULL),
(191, 11, 7, NULL, NULL),
(192, 11, 8, NULL, NULL),
(193, 11, 9, NULL, NULL),
(194, 11, 10, NULL, NULL),
(195, 11, 11, NULL, NULL),
(196, 11, 12, NULL, NULL),
(197, 12, 1, NULL, NULL),
(198, 12, 2, NULL, NULL),
(199, 12, 3, NULL, NULL),
(200, 12, 4, NULL, NULL),
(201, 12, 5, NULL, NULL),
(202, 12, 6, NULL, NULL),
(203, 12, 7, NULL, NULL),
(204, 12, 8, NULL, NULL),
(205, 12, 9, NULL, NULL),
(206, 12, 10, NULL, NULL),
(207, 12, 11, NULL, NULL),
(208, 12, 12, NULL, NULL),
(209, 13, 1, NULL, NULL),
(210, 13, 2, NULL, NULL),
(211, 13, 3, NULL, NULL),
(212, 13, 4, NULL, NULL),
(213, 13, 5, NULL, NULL),
(214, 13, 6, NULL, NULL),
(215, 13, 7, NULL, NULL),
(216, 13, 8, NULL, NULL),
(217, 13, 9, NULL, NULL),
(218, 13, 10, NULL, NULL),
(219, 13, 11, NULL, NULL),
(220, 13, 12, NULL, NULL),
(221, 14, 1, NULL, NULL),
(222, 14, 2, NULL, NULL),
(223, 14, 3, NULL, NULL),
(224, 14, 4, NULL, NULL),
(225, 14, 5, NULL, NULL),
(226, 14, 6, NULL, NULL),
(227, 14, 7, NULL, NULL),
(228, 14, 8, NULL, NULL),
(229, 14, 9, NULL, NULL),
(230, 14, 10, NULL, NULL),
(231, 14, 11, NULL, NULL),
(232, 14, 12, NULL, NULL),
(233, 15, 1, NULL, NULL),
(234, 15, 2, NULL, NULL),
(235, 15, 3, NULL, NULL),
(236, 15, 4, NULL, NULL),
(237, 15, 5, NULL, NULL),
(238, 15, 6, NULL, NULL),
(239, 15, 7, NULL, NULL),
(240, 15, 8, NULL, NULL),
(241, 15, 9, NULL, NULL),
(242, 15, 10, NULL, NULL),
(243, 15, 11, NULL, NULL),
(244, 15, 12, NULL, NULL),
(245, 16, 1, NULL, NULL),
(246, 16, 2, NULL, NULL),
(247, 16, 3, NULL, NULL),
(248, 16, 4, NULL, NULL),
(249, 16, 5, NULL, NULL),
(250, 16, 6, NULL, NULL),
(251, 16, 7, NULL, NULL),
(252, 16, 8, NULL, NULL),
(253, 16, 9, NULL, NULL),
(254, 16, 10, NULL, NULL),
(255, 16, 11, NULL, NULL),
(256, 16, 12, NULL, NULL),
(257, 17, 1, NULL, NULL),
(258, 17, 2, NULL, NULL),
(259, 17, 3, NULL, NULL),
(260, 17, 4, NULL, NULL),
(261, 17, 5, NULL, NULL),
(262, 17, 6, NULL, NULL),
(263, 17, 7, NULL, NULL),
(264, 17, 8, NULL, NULL),
(265, 17, 9, NULL, NULL),
(266, 17, 10, NULL, NULL),
(267, 17, 11, NULL, NULL),
(268, 17, 12, NULL, NULL),
(269, 18, 1, NULL, NULL),
(270, 18, 2, NULL, NULL),
(271, 18, 3, NULL, NULL),
(272, 18, 4, NULL, NULL),
(273, 18, 5, NULL, NULL),
(274, 18, 6, NULL, NULL),
(275, 18, 7, NULL, NULL),
(276, 18, 8, NULL, NULL),
(277, 18, 9, NULL, NULL),
(278, 18, 10, NULL, NULL),
(279, 18, 11, NULL, NULL),
(280, 18, 12, NULL, NULL),
(281, 19, 1, NULL, NULL),
(282, 19, 2, NULL, NULL),
(283, 19, 3, NULL, NULL),
(284, 19, 4, NULL, NULL),
(285, 19, 5, NULL, NULL),
(286, 19, 6, NULL, NULL),
(287, 19, 7, NULL, NULL),
(288, 19, 8, NULL, NULL),
(289, 19, 9, NULL, NULL),
(290, 19, 10, NULL, NULL),
(291, 19, 11, NULL, NULL),
(292, 19, 12, NULL, NULL),
(293, 20, 1, NULL, NULL),
(294, 20, 2, NULL, NULL),
(295, 20, 3, NULL, NULL),
(296, 20, 4, NULL, NULL),
(297, 20, 5, NULL, NULL),
(298, 20, 6, NULL, NULL),
(299, 20, 7, NULL, NULL),
(300, 20, 8, NULL, NULL),
(301, 20, 9, NULL, NULL),
(302, 20, 10, NULL, NULL),
(303, 20, 11, NULL, NULL),
(304, 20, 12, NULL, NULL),
(305, 21, 1, NULL, NULL),
(306, 21, 2, NULL, NULL),
(307, 21, 3, NULL, NULL),
(308, 21, 4, NULL, NULL),
(309, 21, 5, NULL, NULL),
(310, 21, 6, NULL, NULL),
(311, 21, 7, NULL, NULL),
(312, 21, 8, NULL, NULL),
(313, 21, 9, NULL, NULL),
(314, 21, 10, NULL, NULL),
(315, 21, 11, NULL, NULL),
(316, 21, 12, NULL, NULL),
(317, 22, 1, NULL, NULL),
(318, 22, 2, NULL, NULL),
(319, 22, 3, NULL, NULL),
(320, 22, 4, NULL, NULL),
(321, 22, 5, NULL, NULL),
(322, 22, 6, NULL, NULL),
(323, 22, 7, NULL, NULL),
(324, 22, 8, NULL, NULL),
(325, 22, 9, NULL, NULL),
(326, 22, 10, NULL, NULL),
(327, 22, 11, NULL, NULL),
(328, 22, 12, NULL, NULL),
(329, 23, 1, NULL, NULL),
(330, 23, 2, NULL, NULL),
(331, 23, 3, NULL, NULL),
(332, 23, 4, NULL, NULL),
(333, 23, 5, NULL, NULL),
(334, 23, 6, NULL, NULL),
(335, 23, 7, NULL, NULL),
(336, 23, 8, NULL, NULL),
(337, 23, 9, NULL, NULL),
(338, 23, 10, NULL, NULL),
(339, 23, 11, NULL, NULL),
(340, 23, 12, NULL, NULL),
(341, 24, 1, NULL, NULL),
(342, 24, 2, NULL, NULL),
(343, 24, 3, NULL, NULL),
(344, 24, 4, NULL, NULL),
(345, 24, 5, NULL, NULL),
(346, 24, 6, NULL, NULL),
(347, 24, 7, NULL, NULL),
(348, 24, 8, NULL, NULL),
(349, 24, 9, NULL, NULL),
(350, 24, 10, NULL, NULL),
(351, 24, 11, NULL, NULL),
(352, 24, 12, NULL, NULL),
(353, 25, 1, NULL, NULL),
(354, 25, 2, NULL, NULL),
(355, 25, 3, NULL, NULL),
(356, 25, 4, NULL, NULL),
(357, 25, 5, NULL, NULL),
(358, 25, 6, NULL, NULL),
(359, 25, 7, NULL, NULL),
(360, 25, 8, NULL, NULL),
(361, 25, 9, NULL, NULL),
(362, 25, 10, NULL, NULL),
(363, 25, 11, NULL, NULL),
(364, 25, 12, NULL, NULL),
(365, 26, 1, NULL, NULL),
(366, 26, 2, NULL, NULL),
(367, 26, 3, NULL, NULL),
(368, 26, 4, NULL, NULL),
(369, 26, 5, NULL, NULL),
(370, 26, 6, NULL, NULL),
(371, 26, 7, NULL, NULL),
(372, 26, 8, NULL, NULL),
(373, 26, 9, NULL, NULL),
(374, 26, 10, NULL, NULL),
(375, 26, 11, NULL, NULL),
(376, 26, 12, NULL, NULL),
(377, 27, 1, NULL, NULL),
(378, 27, 2, NULL, NULL),
(379, 27, 3, NULL, NULL),
(380, 27, 4, NULL, NULL),
(381, 27, 5, NULL, NULL),
(382, 27, 6, NULL, NULL),
(383, 27, 7, NULL, NULL),
(384, 27, 8, NULL, NULL),
(385, 27, 9, NULL, NULL),
(386, 27, 10, NULL, NULL),
(387, 27, 11, NULL, NULL),
(388, 27, 12, NULL, NULL),
(389, 28, 1, NULL, NULL),
(390, 28, 2, NULL, NULL),
(391, 28, 3, NULL, NULL),
(392, 28, 4, NULL, NULL),
(393, 28, 5, NULL, NULL),
(394, 28, 6, NULL, NULL),
(395, 28, 7, NULL, NULL),
(396, 28, 8, NULL, NULL),
(397, 28, 9, NULL, NULL),
(398, 28, 10, NULL, NULL),
(399, 28, 11, NULL, NULL),
(400, 28, 12, NULL, NULL),
(401, 29, 1, NULL, NULL),
(402, 29, 2, NULL, NULL),
(403, 29, 3, NULL, NULL),
(404, 29, 4, NULL, NULL),
(405, 29, 5, NULL, NULL),
(406, 29, 6, NULL, NULL),
(407, 29, 7, NULL, NULL),
(408, 29, 8, NULL, NULL),
(409, 29, 9, NULL, NULL),
(410, 29, 10, NULL, NULL),
(411, 29, 11, NULL, NULL),
(412, 29, 12, NULL, NULL),
(413, 1, 56, NULL, NULL),
(414, 1, 57, NULL, NULL),
(415, 1, 58, NULL, NULL),
(416, 1, 59, NULL, NULL),
(417, 2, 60, NULL, NULL),
(418, 2, 61, NULL, NULL),
(419, 2, 62, NULL, NULL),
(420, 2, 63, NULL, NULL),
(421, 2, 64, NULL, NULL),
(422, 2, 65, NULL, NULL),
(423, 2, 66, NULL, NULL),
(424, 2, 67, NULL, NULL),
(425, 2, 68, NULL, NULL),
(426, 2, 69, NULL, NULL),
(427, 5, 70, NULL, NULL),
(428, 5, 71, NULL, NULL),
(429, 5, 72, NULL, NULL),
(430, 5, 73, NULL, NULL),
(431, 5, 74, NULL, NULL),
(432, 5, 75, NULL, NULL),
(433, 9, 76, NULL, NULL),
(434, 9, 77, NULL, NULL),
(435, 9, 78, NULL, NULL),
(436, 9, 79, NULL, NULL),
(437, 9, 80, NULL, NULL),
(438, 9, 81, NULL, NULL),
(439, 9, 82, NULL, NULL),
(440, 9, 83, NULL, NULL),
(441, 9, 84, NULL, NULL),
(442, 10, 85, NULL, NULL),
(443, 10, 86, NULL, NULL),
(444, 10, 87, NULL, NULL),
(445, 10, 88, NULL, NULL),
(446, 10, 89, NULL, NULL),
(447, 10, 90, NULL, NULL),
(448, 10, 91, NULL, NULL),
(449, 10, 92, NULL, NULL),
(450, 10, 93, NULL, NULL),
(451, 11, 94, NULL, NULL),
(452, 11, 95, NULL, NULL),
(453, 11, 96, NULL, NULL),
(454, 11, 97, NULL, NULL),
(455, 11, 98, NULL, NULL),
(456, 23, 99, NULL, NULL),
(457, 23, 100, NULL, NULL),
(458, 23, 101, NULL, NULL),
(459, 23, 102, NULL, NULL),
(460, 23, 103, NULL, NULL),
(461, 23, 104, NULL, NULL),
(462, 23, 105, NULL, NULL),
(463, 23, 106, NULL, NULL),
(464, 21, 107, NULL, NULL),
(465, 21, 108, NULL, NULL),
(466, 21, 109, NULL, NULL),
(467, 21, 110, NULL, NULL),
(468, 21, 111, NULL, NULL),
(469, 21, 112, NULL, NULL),
(470, 21, 113, NULL, NULL),
(471, 19, 114, NULL, NULL),
(472, 19, 115, NULL, NULL),
(473, 19, 116, NULL, NULL),
(474, 19, 117, NULL, NULL),
(475, 19, 118, NULL, NULL),
(476, 34, 119, NULL, NULL),
(477, 34, 120, NULL, NULL),
(478, 34, 121, NULL, NULL),
(479, 34, 122, NULL, NULL),
(480, 34, 123, NULL, NULL),
(481, 34, 124, NULL, NULL),
(482, 34, 125, NULL, NULL),
(483, 34, 126, NULL, NULL),
(484, 26, 127, NULL, NULL),
(485, 26, 128, NULL, NULL),
(486, 26, 129, NULL, NULL),
(487, 26, 130, NULL, NULL),
(488, 26, 131, NULL, NULL),
(489, 35, 1, NULL, NULL),
(490, 35, 2, NULL, NULL),
(491, 35, 3, NULL, NULL),
(492, 35, 4, NULL, NULL),
(493, 35, 5, NULL, NULL),
(494, 35, 6, NULL, NULL),
(495, 35, 7, NULL, NULL),
(496, 35, 8, NULL, NULL),
(497, 35, 9, NULL, NULL),
(498, 35, 10, NULL, NULL),
(499, 35, 11, NULL, NULL),
(500, 35, 12, NULL, NULL),
(501, 35, 132, NULL, NULL),
(502, 35, 133, NULL, NULL),
(503, 35, 134, NULL, NULL),
(504, 36, 1, NULL, NULL),
(505, 36, 2, NULL, NULL),
(506, 36, 3, NULL, NULL),
(507, 36, 4, NULL, NULL),
(508, 36, 5, NULL, NULL),
(509, 36, 6, NULL, NULL),
(510, 36, 7, NULL, NULL),
(511, 36, 8, NULL, NULL),
(512, 36, 9, NULL, NULL),
(513, 36, 10, NULL, NULL),
(514, 36, 11, NULL, NULL),
(515, 36, 12, NULL, NULL),
(516, 36, 135, NULL, NULL),
(517, 36, 136, NULL, NULL),
(518, 36, 137, NULL, NULL),
(519, 36, 138, NULL, NULL),
(520, 36, 139, NULL, NULL),
(521, 36, 140, NULL, NULL),
(522, 36, 141, NULL, NULL),
(523, 24, 142, NULL, NULL),
(524, 24, 143, NULL, NULL),
(525, 24, 144, NULL, NULL),
(526, 24, 145, NULL, NULL),
(527, 24, 146, NULL, NULL),
(528, 24, 147, NULL, NULL),
(529, 15, 148, NULL, NULL),
(530, 15, 149, NULL, NULL),
(531, 15, 150, NULL, NULL),
(532, 15, 151, NULL, NULL),
(533, 15, 152, NULL, NULL),
(534, 15, 153, NULL, NULL),
(535, 37, 1, NULL, NULL),
(536, 37, 2, NULL, NULL),
(537, 37, 3, NULL, NULL),
(538, 37, 4, NULL, NULL),
(539, 37, 5, NULL, NULL),
(540, 37, 6, NULL, NULL),
(541, 37, 7, NULL, NULL),
(542, 37, 8, NULL, NULL),
(543, 37, 9, NULL, NULL),
(544, 37, 10, NULL, NULL),
(545, 37, 11, NULL, NULL),
(546, 37, 12, NULL, NULL),
(547, 37, 154, NULL, NULL),
(548, 37, 155, NULL, NULL),
(549, 37, 156, NULL, NULL),
(550, 37, 157, NULL, NULL),
(551, 37, 158, NULL, NULL),
(552, 37, 159, NULL, NULL),
(553, 37, 160, NULL, NULL),
(554, 37, 161, NULL, NULL),
(555, 38, 1, NULL, NULL),
(556, 38, 2, NULL, NULL),
(557, 38, 3, NULL, NULL),
(558, 38, 4, NULL, NULL),
(559, 38, 5, NULL, NULL),
(560, 38, 6, NULL, NULL),
(561, 38, 7, NULL, NULL),
(562, 38, 8, NULL, NULL),
(563, 38, 9, NULL, NULL),
(564, 38, 10, NULL, NULL),
(565, 38, 11, NULL, NULL),
(566, 38, 12, NULL, NULL),
(567, 38, 162, NULL, NULL),
(568, 38, 163, NULL, NULL),
(569, 38, 164, NULL, NULL),
(570, 38, 165, NULL, NULL),
(571, 38, 166, NULL, NULL),
(572, 38, 167, NULL, NULL),
(573, 39, 1, NULL, NULL),
(574, 39, 2, NULL, NULL),
(575, 39, 3, NULL, NULL),
(576, 39, 4, NULL, NULL),
(577, 39, 5, NULL, NULL),
(578, 39, 6, NULL, NULL),
(579, 39, 7, NULL, NULL),
(580, 39, 8, NULL, NULL),
(581, 39, 9, NULL, NULL),
(582, 39, 10, NULL, NULL),
(583, 39, 11, NULL, NULL),
(584, 39, 12, NULL, NULL),
(585, 39, 168, NULL, NULL),
(586, 39, 169, NULL, NULL),
(587, 39, 170, NULL, NULL),
(588, 39, 171, NULL, NULL),
(589, 40, 1, NULL, NULL),
(590, 40, 2, NULL, NULL),
(591, 40, 3, NULL, NULL),
(592, 40, 4, NULL, NULL),
(593, 40, 5, NULL, NULL),
(594, 40, 6, NULL, NULL),
(595, 40, 7, NULL, NULL),
(596, 40, 8, NULL, NULL),
(597, 40, 9, NULL, NULL),
(598, 40, 10, NULL, NULL),
(599, 40, 11, NULL, NULL),
(600, 40, 12, NULL, NULL),
(601, 40, 172, NULL, NULL),
(602, 40, 173, NULL, NULL),
(603, 40, 174, NULL, NULL),
(604, 40, 175, NULL, NULL),
(606, 40, 177, NULL, NULL),
(607, 41, 1, NULL, NULL),
(608, 41, 2, NULL, NULL),
(609, 41, 3, NULL, NULL),
(610, 41, 4, NULL, NULL),
(611, 41, 5, NULL, NULL),
(612, 41, 6, NULL, NULL),
(613, 41, 7, NULL, NULL),
(614, 41, 8, NULL, NULL),
(615, 41, 9, NULL, NULL),
(616, 41, 10, NULL, NULL),
(617, 41, 11, NULL, NULL),
(618, 41, 12, NULL, NULL),
(619, 41, 178, NULL, NULL),
(620, 41, 179, NULL, NULL),
(621, 41, 180, NULL, NULL),
(622, 41, 181, NULL, NULL),
(623, 41, 182, NULL, NULL),
(624, 41, 183, NULL, NULL),
(625, 41, 184, NULL, NULL),
(626, 41, 185, NULL, NULL),
(627, 41, 186, NULL, NULL),
(628, 42, 1, NULL, NULL),
(629, 42, 2, NULL, NULL),
(630, 42, 3, NULL, NULL),
(631, 42, 4, NULL, NULL),
(632, 42, 5, NULL, NULL),
(633, 42, 6, NULL, NULL),
(634, 42, 7, NULL, NULL),
(635, 42, 8, NULL, NULL),
(636, 42, 9, NULL, NULL),
(637, 42, 10, NULL, NULL),
(638, 42, 11, NULL, NULL),
(639, 42, 12, NULL, NULL),
(640, 42, 187, NULL, NULL),
(641, 43, 1, NULL, NULL),
(642, 43, 2, NULL, NULL),
(643, 43, 3, NULL, NULL),
(644, 43, 4, NULL, NULL),
(645, 43, 5, NULL, NULL),
(646, 43, 6, NULL, NULL),
(647, 43, 7, NULL, NULL),
(648, 43, 8, NULL, NULL),
(649, 43, 9, NULL, NULL),
(650, 43, 10, NULL, NULL),
(651, 43, 11, NULL, NULL),
(652, 43, 12, NULL, NULL),
(653, 43, 188, NULL, NULL),
(654, 43, 189, NULL, NULL),
(655, 43, 190, NULL, NULL),
(656, 44, 1, NULL, NULL),
(657, 44, 2, NULL, NULL),
(658, 44, 3, NULL, NULL),
(659, 44, 4, NULL, NULL),
(660, 44, 5, NULL, NULL),
(661, 44, 6, NULL, NULL),
(662, 44, 7, NULL, NULL),
(663, 44, 8, NULL, NULL),
(664, 44, 9, NULL, NULL),
(665, 44, 10, NULL, NULL),
(666, 44, 11, NULL, NULL),
(667, 44, 12, NULL, NULL),
(668, 44, 191, NULL, NULL),
(669, 44, 192, NULL, NULL),
(670, 44, 193, NULL, NULL),
(671, 44, 194, NULL, NULL),
(672, 44, 195, NULL, NULL),
(673, 44, 196, NULL, NULL),
(674, 44, 197, NULL, NULL),
(675, 45, 1, NULL, NULL),
(676, 45, 2, NULL, NULL),
(677, 45, 3, NULL, NULL),
(678, 45, 4, NULL, NULL),
(679, 45, 5, NULL, NULL),
(680, 45, 6, NULL, NULL),
(681, 45, 7, NULL, NULL),
(682, 45, 8, NULL, NULL),
(683, 45, 9, NULL, NULL),
(684, 45, 10, NULL, NULL),
(685, 45, 11, NULL, NULL),
(686, 45, 12, NULL, NULL),
(687, 45, 198, NULL, NULL),
(688, 45, 199, NULL, NULL),
(689, 45, 200, NULL, NULL),
(690, 45, 201, NULL, NULL),
(691, 45, 202, NULL, NULL),
(692, 45, 203, NULL, NULL),
(693, 45, 204, NULL, NULL),
(694, 45, 205, NULL, NULL),
(695, 46, 1, NULL, NULL),
(696, 46, 2, NULL, NULL),
(697, 46, 3, NULL, NULL),
(698, 46, 4, NULL, NULL),
(699, 46, 5, NULL, NULL),
(700, 46, 6, NULL, NULL),
(701, 46, 7, NULL, NULL),
(702, 46, 8, NULL, NULL),
(703, 46, 9, NULL, NULL),
(704, 46, 10, NULL, NULL),
(705, 46, 11, NULL, NULL),
(706, 46, 12, NULL, NULL),
(707, 46, 206, NULL, NULL),
(708, 46, 207, NULL, NULL),
(709, 46, 208, NULL, NULL),
(710, 46, 209, NULL, NULL),
(711, 46, 210, NULL, NULL),
(712, 46, 211, NULL, NULL),
(713, 47, 1, NULL, NULL),
(714, 47, 2, NULL, NULL),
(715, 47, 3, NULL, NULL),
(716, 47, 4, NULL, NULL),
(717, 47, 5, NULL, NULL),
(718, 47, 6, NULL, NULL),
(719, 47, 7, NULL, NULL),
(720, 47, 8, NULL, NULL),
(721, 47, 9, NULL, NULL),
(722, 47, 10, NULL, NULL),
(723, 47, 11, NULL, NULL),
(724, 47, 12, NULL, NULL),
(725, 47, 212, NULL, NULL),
(726, 47, 213, NULL, NULL),
(727, 47, 214, NULL, NULL),
(728, 47, 215, NULL, NULL),
(729, 47, 216, NULL, NULL),
(730, 47, 217, NULL, NULL),
(731, 47, 218, NULL, NULL),
(732, 47, 219, NULL, NULL),
(733, 12, 220, NULL, NULL),
(734, 12, 221, NULL, NULL),
(735, 12, 222, NULL, NULL),
(736, 12, 223, NULL, NULL),
(737, 12, 224, NULL, NULL),
(738, 12, 225, NULL, NULL),
(739, 12, 226, NULL, NULL),
(740, 12, 227, NULL, NULL),
(741, 12, 228, NULL, NULL),
(742, 13, 229, NULL, NULL),
(743, 13, 230, NULL, NULL),
(744, 13, 231, NULL, NULL),
(745, 13, 232, NULL, NULL),
(746, 13, 233, NULL, NULL),
(747, 13, 234, NULL, NULL),
(748, 13, 235, NULL, NULL),
(749, 13, 236, NULL, NULL),
(750, 13, 237, NULL, NULL),
(751, 14, 238, NULL, NULL),
(752, 14, 239, NULL, NULL),
(753, 14, 240, NULL, NULL),
(754, 14, 241, NULL, NULL),
(755, 14, 242, NULL, NULL),
(756, 14, 243, NULL, NULL),
(757, 14, 244, NULL, NULL),
(758, 14, 245, NULL, NULL),
(759, 14, 246, NULL, NULL),
(760, 16, 247, NULL, NULL),
(761, 16, 248, NULL, NULL),
(762, 16, 249, NULL, NULL),
(763, 16, 250, NULL, NULL),
(764, 16, 251, NULL, NULL),
(765, 16, 252, NULL, NULL),
(766, 16, 253, NULL, NULL),
(767, 16, 254, NULL, NULL),
(768, 16, 255, NULL, NULL),
(769, 17, 256, NULL, NULL),
(770, 17, 257, NULL, NULL),
(771, 17, 258, NULL, NULL),
(772, 17, 259, NULL, NULL),
(773, 17, 260, NULL, NULL),
(774, 18, 261, NULL, NULL),
(775, 18, 262, NULL, NULL),
(776, 18, 263, NULL, NULL),
(777, 18, 264, NULL, NULL),
(778, 18, 265, NULL, NULL),
(779, 18, 266, NULL, NULL),
(780, 18, 267, NULL, NULL),
(781, 18, 268, NULL, NULL),
(782, 18, 269, NULL, NULL),
(783, 18, 270, NULL, NULL),
(784, 20, 271, NULL, NULL),
(785, 20, 272, NULL, NULL),
(786, 20, 273, NULL, NULL),
(787, 20, 274, NULL, NULL),
(788, 20, 275, NULL, NULL),
(789, 20, 276, NULL, NULL),
(790, 20, 277, NULL, NULL),
(791, 20, 278, NULL, NULL),
(792, 20, 279, NULL, NULL),
(793, 20, 280, NULL, NULL),
(794, 22, 281, NULL, NULL),
(795, 22, 282, NULL, NULL),
(796, 22, 283, NULL, NULL),
(797, 22, 284, NULL, NULL),
(798, 22, 285, NULL, NULL),
(799, 48, 1, NULL, NULL),
(800, 48, 2, NULL, NULL),
(801, 48, 3, NULL, NULL),
(802, 48, 4, NULL, NULL),
(803, 48, 5, NULL, NULL),
(804, 48, 6, NULL, NULL),
(805, 48, 7, NULL, NULL),
(806, 48, 8, NULL, NULL),
(807, 48, 9, NULL, NULL),
(808, 48, 10, NULL, NULL),
(809, 48, 11, NULL, NULL),
(810, 48, 12, NULL, NULL),
(811, 48, 286, NULL, NULL),
(812, 48, 287, NULL, NULL),
(813, 48, 288, NULL, NULL),
(814, 48, 289, NULL, NULL),
(815, 48, 290, NULL, NULL),
(816, 48, 291, NULL, NULL),
(817, 48, 292, NULL, NULL),
(818, 49, 1, NULL, NULL),
(819, 49, 2, NULL, NULL),
(820, 49, 3, NULL, NULL),
(821, 49, 4, NULL, NULL),
(822, 49, 5, NULL, NULL),
(823, 49, 6, NULL, NULL),
(824, 49, 7, NULL, NULL),
(825, 49, 8, NULL, NULL),
(826, 49, 9, NULL, NULL),
(827, 49, 10, NULL, NULL),
(828, 49, 11, NULL, NULL),
(829, 49, 12, NULL, NULL),
(830, 49, 293, NULL, NULL),
(831, 49, 294, NULL, NULL),
(832, 49, 295, NULL, NULL),
(833, 49, 296, NULL, NULL),
(834, 49, 297, NULL, NULL),
(835, 50, 1, NULL, NULL),
(836, 50, 2, NULL, NULL),
(837, 50, 3, NULL, NULL),
(838, 50, 4, NULL, NULL),
(839, 50, 5, NULL, NULL),
(840, 50, 6, NULL, NULL),
(841, 50, 7, NULL, NULL),
(842, 50, 8, NULL, NULL),
(843, 50, 9, NULL, NULL),
(844, 50, 10, NULL, NULL),
(845, 50, 11, NULL, NULL),
(846, 50, 12, NULL, NULL),
(847, 50, 298, NULL, NULL),
(848, 50, 299, NULL, NULL),
(849, 50, 300, NULL, NULL),
(850, 50, 301, NULL, NULL),
(851, 50, 302, NULL, NULL),
(852, 50, 303, NULL, NULL),
(853, 51, 1, NULL, NULL),
(854, 51, 2, NULL, NULL),
(855, 51, 3, NULL, NULL),
(856, 51, 4, NULL, NULL),
(857, 51, 5, NULL, NULL),
(858, 51, 6, NULL, NULL),
(859, 51, 7, NULL, NULL),
(860, 51, 8, NULL, NULL),
(861, 51, 9, NULL, NULL),
(862, 51, 10, NULL, NULL),
(863, 51, 11, NULL, NULL),
(864, 51, 12, NULL, NULL),
(865, 51, 304, NULL, NULL),
(866, 51, 305, NULL, NULL),
(867, 51, 306, NULL, NULL),
(868, 51, 307, NULL, NULL),
(869, 51, 308, NULL, NULL),
(870, 51, 309, NULL, NULL),
(871, 52, 1, NULL, NULL),
(872, 52, 2, NULL, NULL),
(873, 52, 3, NULL, NULL),
(874, 52, 4, NULL, NULL),
(875, 52, 5, NULL, NULL),
(876, 52, 6, NULL, NULL),
(877, 52, 7, NULL, NULL),
(878, 52, 8, NULL, NULL),
(879, 52, 9, NULL, NULL),
(880, 52, 10, NULL, NULL),
(881, 52, 11, NULL, NULL),
(882, 52, 12, NULL, NULL),
(883, 52, 310, NULL, NULL),
(884, 52, 311, NULL, NULL),
(885, 52, 312, NULL, NULL),
(886, 52, 313, NULL, NULL),
(887, 52, 314, NULL, NULL),
(888, 52, 315, NULL, NULL),
(889, 53, 1, NULL, NULL),
(890, 53, 2, NULL, NULL),
(891, 53, 3, NULL, NULL),
(892, 53, 4, NULL, NULL),
(893, 53, 5, NULL, NULL),
(894, 53, 6, NULL, NULL),
(895, 53, 7, NULL, NULL),
(896, 53, 8, NULL, NULL),
(897, 53, 9, NULL, NULL),
(898, 53, 10, NULL, NULL),
(899, 53, 11, NULL, NULL),
(900, 53, 12, NULL, NULL),
(901, 53, 316, NULL, NULL),
(902, 53, 317, NULL, NULL),
(903, 53, 318, NULL, NULL),
(904, 54, 1, NULL, NULL),
(905, 54, 2, NULL, NULL),
(906, 54, 3, NULL, NULL),
(907, 54, 4, NULL, NULL),
(908, 54, 5, NULL, NULL),
(909, 54, 6, NULL, NULL),
(910, 54, 7, NULL, NULL),
(911, 54, 8, NULL, NULL),
(912, 54, 9, NULL, NULL),
(913, 54, 10, NULL, NULL),
(914, 54, 11, NULL, NULL),
(915, 54, 12, NULL, NULL),
(916, 54, 319, NULL, NULL),
(917, 54, 320, NULL, NULL),
(918, 54, 321, NULL, NULL),
(919, 55, 1, NULL, NULL),
(920, 55, 2, NULL, NULL),
(921, 55, 3, NULL, NULL),
(922, 55, 4, NULL, NULL),
(923, 55, 5, NULL, NULL),
(924, 55, 6, NULL, NULL),
(925, 55, 7, NULL, NULL),
(926, 55, 8, NULL, NULL),
(927, 55, 9, NULL, NULL),
(928, 55, 10, NULL, NULL),
(929, 55, 11, NULL, NULL),
(930, 55, 12, NULL, NULL),
(931, 55, 322, NULL, NULL),
(932, 55, 323, NULL, NULL),
(933, 55, 324, NULL, NULL),
(934, 55, 325, NULL, NULL),
(935, 55, 326, NULL, NULL),
(936, 55, 327, NULL, NULL),
(937, 56, 1, NULL, NULL),
(938, 56, 2, NULL, NULL),
(939, 56, 3, NULL, NULL),
(940, 56, 4, NULL, NULL),
(941, 56, 5, NULL, NULL),
(942, 56, 6, NULL, NULL),
(943, 56, 7, NULL, NULL),
(944, 56, 8, NULL, NULL),
(945, 56, 9, NULL, NULL),
(946, 56, 10, NULL, NULL),
(947, 56, 11, NULL, NULL),
(948, 56, 12, NULL, NULL),
(949, 56, 328, NULL, NULL),
(950, 56, 329, NULL, NULL),
(951, 56, 330, NULL, NULL),
(952, 56, 331, NULL, NULL),
(953, 56, 332, NULL, NULL),
(954, 56, 333, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `junior_enterprise_service`
--

CREATE TABLE `junior_enterprise_service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `junior_enterprise_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `junior_enterprise_service`
--

INSERT INTO `junior_enterprise_service` (`id`, `junior_enterprise_id`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 9, 10, NULL, NULL),
(2, 10, 2, NULL, NULL),
(3, 10, 1, NULL, NULL),
(4, 11, 10, NULL, NULL),
(5, 12, 7, NULL, NULL),
(6, 13, 8, NULL, NULL),
(7, 14, 7, NULL, NULL),
(8, 14, 5, NULL, NULL),
(9, 15, 8, NULL, NULL),
(10, 15, 9, NULL, NULL),
(11, 16, 2, NULL, NULL),
(12, 16, 9, NULL, NULL),
(13, 17, 2, NULL, NULL),
(14, 17, 1, NULL, NULL),
(15, 18, 11, NULL, NULL),
(16, 19, 11, NULL, NULL),
(17, 20, 4, NULL, NULL),
(18, 20, 5, NULL, NULL),
(19, 21, 6, NULL, NULL),
(20, 22, 5, NULL, NULL),
(21, 23, 10, NULL, NULL),
(22, 24, 9, NULL, NULL),
(23, 25, 4, NULL, NULL),
(24, 26, 5, NULL, NULL),
(25, 27, 10, NULL, NULL),
(26, 28, 8, NULL, NULL),
(27, 29, 6, NULL, NULL),
(28, 30, 6, NULL, NULL),
(29, 31, 10, NULL, NULL),
(30, 34, 9, NULL, NULL),
(31, 35, 5, NULL, NULL),
(32, 36, 5, NULL, NULL),
(33, 37, 8, NULL, NULL),
(34, 38, 11, NULL, NULL),
(35, 39, 11, NULL, NULL),
(36, 40, 8, NULL, NULL),
(37, 41, 9, NULL, NULL),
(38, 42, 1, NULL, NULL),
(39, 43, 10, NULL, NULL),
(40, 44, 4, NULL, NULL),
(41, 45, 2, NULL, NULL),
(42, 46, 8, NULL, NULL),
(43, 47, 5, NULL, NULL),
(44, 48, 4, NULL, NULL),
(45, 49, 5, NULL, NULL),
(46, 50, 10, NULL, NULL),
(47, 51, 10, NULL, NULL),
(48, 52, 5, NULL, NULL),
(49, 53, 1, NULL, NULL),
(50, 54, 6, NULL, NULL),
(51, 55, 4, NULL, NULL),
(52, 56, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_11_14_164634_create_federations_table', 1),
(10, '2019_11_14_165108_create_images_table', 1),
(11, '2019_11_14_165238_create_cores_table', 1),
(12, '2019_11_14_165549_create_junior_enterprises_table', 1),
(13, '2019_11_14_165731_create_projects_table', 1),
(14, '2019_11_14_170322_create_federation_goals_table', 1),
(15, '2019_11_14_170423_create_core_goals_table', 1),
(16, '2019_11_14_170714_create_junior_enterprise_goals_table', 1),
(17, '2019_11_14_170857_create_ods_table', 1),
(18, '2019_11_14_172722_create_foundations_table', 1),
(19, '2019_11_14_173924_create_services_table', 1),
(20, '2019_11_14_174209_create_degrees_table', 1),
(21, '2019_11_14_185615_create_junior_enterprise_service_table', 1),
(22, '2019_11_14_190150_create_ods_project_table', 1),
(23, '2019_11_14_191435_create_degree_junior_enterprise_table', 1),
(24, '2019_11_20_010204_create_junior_enterprise_projects_table', 1),
(25, '2020_01_21_174831_add_image_table_users', 1),
(26, '2020_02_13_193200_add_image_table_cores', 1),
(27, '2020_02_14_232350_add-members_performing_table_junior_enterprise_goals', 1),
(28, '2020_02_14_232643_add_current_nps_table_junior_enterprise_goals', 1),
(29, '2020_02_15_215133_add_cluster_table_junior_enterprise_goals', 1),
(30, '2020_02_16_145152_add_current_members_event_table_junior_enterprise_goals', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('02972de50d54229c0c49aadc69bf8623b4be314dd83eae840aa683afd7fc9220b156994b3d619f0c', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-10 04:29:11', '2020-10-10 04:29:11', '2021-10-10 01:29:11'),
('1764f88b81ef9766bd826ddc04de8d316f58a4c023879f328a5882192454838f8282d10018a25c1d', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-06 17:34:35', '2020-10-06 17:34:35', '2021-10-06 14:34:35'),
('2684b97b01b1acb3d11a07480fd5f0cc951a0a9a082b4d969a5aeeb5053dfd3c74f34feeb457d195', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-13 22:21:29', '2020-10-13 22:21:29', '2021-10-13 19:21:29'),
('288b5b0a1e47529d5d4bafb6b08b0bcc36db8429f82cb18266d1d2cfd02ef520da76927995dd4f63', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-16 19:22:52', '2020-10-16 19:22:52', '2021-10-16 16:22:52'),
('408f8c9dd2a7e25c11821c915e5b8f30bb85e0e26ef97597a2f30ed18048f38da3ebf133ef225c08', 1, 1, 'matheus@email.com', '[]', 0, '2020-09-29 22:31:05', '2020-09-29 22:31:05', '2021-09-29 19:31:05'),
('4229a3204973badc7a944f9f95400792ecdeee5d88ac821470780387c9da4ae5e34dbd8c60d5c9ea', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-16 16:38:01', '2020-10-16 16:38:01', '2021-10-16 13:38:01'),
('6243d1edc1ef0968b4eca97d3f19bc83f7321eacbf29241890830c1677e64702b2efcd0fe3c2a390', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-01 20:38:03', '2020-10-01 20:38:03', '2021-10-01 17:38:03'),
('64b7a35329788eca63f0c604ca6e835754a38e8d37ec2dd60646cd1683b40d7c092315fe2ecbba1a', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-17 01:26:34', '2020-10-17 01:26:34', '2021-10-16 22:26:34'),
('6572dad94a2cb635bc5233bab58c94b59ada9d6af1a3ff24994bb32d9f119476d6d1f31634f7ec9f', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-17 01:26:53', '2020-10-17 01:26:53', '2021-10-16 22:26:53'),
('71808ead0b164cf506df426ed6154657ba08d49bf3e888e374a16a587f8c145c4340d93d6a0ebf8f', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-13 04:23:27', '2020-10-13 04:23:27', '2021-10-13 01:23:27'),
('766372758169b9be2c7835964a2846018f3dc202b3f688804c00a7d02add569a46b6af0a87452acc', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-07 17:39:17', '2020-10-07 17:39:17', '2021-10-07 14:39:17'),
('77f27fcdb496a21f1148a32f02ae83cdf0c743352d90b41eca8f1eef4d470a2f383472cef416a3cf', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-18 21:12:35', '2020-10-18 21:12:35', '2021-10-18 18:12:35'),
('7ad0d9c4140d2c4672c60503beda045838429b3bbe50fff278937aa682cfd44628f0dea4ebe2e22c', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-02 17:43:19', '2020-10-02 17:43:19', '2021-10-02 14:43:19'),
('9563530d15a517ef9c4ffe069b31f05994d36d484619cc9671611b4cd2ee345fde126f6a7624ae6f', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-16 16:33:59', '2020-10-16 16:33:59', '2021-10-16 13:33:59'),
('97d8362b1ac405488825493eee3b727075151eadbe2b5aa20d714ce28fd89aea982aa0377eb86b8e', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-15 20:59:44', '2020-10-15 20:59:44', '2021-10-15 17:59:44'),
('ade8a1647a91ede85b64b335f6c3df0eb7a091e5ec1cb33b4d1c83f2fffe848cbf7b10b5c524aa1b', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-01 23:42:00', '2020-10-01 23:42:00', '2021-10-01 20:42:00'),
('b3a599189ce96ed06ccfe10135e8458c4685a9c31c6672c68840453c6bfd932411bb356d03f17b81', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-17 01:40:28', '2020-10-17 01:40:28', '2021-10-16 22:40:28'),
('b9b2578e84df3a87016300a285925614dee75dd2ca2bd30969a664a3b0cc279e4054c14d4d4bb321', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-13 22:20:56', '2020-10-13 22:20:56', '2021-10-13 19:20:56'),
('be51fd00f83079c93ddbab57aeec445170ef13d6261eb566a7997493a9b8afdf9dc75628fccc43e0', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-10 04:28:32', '2020-10-10 04:28:32', '2021-10-10 01:28:32'),
('c71b69e9799c801c3aa5cd6aec98c400856411368b78c5752d442b1a60bda712554b3796b758150f', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-13 16:56:58', '2020-10-13 16:56:58', '2021-10-13 13:56:58'),
('c74bca24a75fe834074a44229b0279d52bb25bf61ae47d0ef0823cb72a45bd5515030134a8fc0f61', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-14 16:57:45', '2020-10-14 16:57:45', '2021-10-14 13:57:45'),
('c952eca718fbb923541761842d8e45a27d1835ff8434c968e4d1b3b263cab2400a1f4f1fc84bcd51', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-17 01:41:13', '2020-10-17 01:41:13', '2021-10-16 22:41:13'),
('ceb6a8bc64dafd3b796f692b43a6d76d3f821d9f65507379373db5364687cfe65bad8a875743c6e4', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-13 19:30:18', '2020-10-13 19:30:18', '2021-10-13 16:30:18'),
('cfe07e8beeca0463a3d2e6953e639b421ecb610449abbe367900f9eb1897de6d4fdfcacef18761f4', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-10 03:11:37', '2020-10-10 03:11:37', '2021-10-10 00:11:37'),
('cffa0b5a4c1f0c41ade3666218842d67aebdea3a348991e57012ccbc68cb2e52ec8750d794bd341e', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-15 17:20:10', '2020-10-15 17:20:10', '2021-10-15 14:20:10'),
('d37477cbc92b917bb273c42377ec32c0f23bfceb562bbd08c4bd47e6afddd136cb5ac893220f2729', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-01 23:21:42', '2020-10-01 23:21:42', '2021-10-01 20:21:42'),
('e30d7af6304784e89063b152516684e591e490646c344b96a5b2fbded62b3cf5d05dc64e87cab42d', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-14 20:45:23', '2020-10-14 20:45:23', '2021-10-14 17:45:23'),
('e7c3ca99aca912a2781628cbbf736c7ddf9a055e900fa8b684e5012e38a4fc30e556c6688a23a8f7', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-17 01:23:37', '2020-10-17 01:23:37', '2021-10-16 22:23:37'),
('eb4a64b44c1d6c1b2db3b466a8585948f083469bb0b40b68999024414985645169f7aad4f0c972f9', 1, 1, 'matheus@email.com', '[]', 0, '2020-09-29 22:30:42', '2020-09-29 22:30:42', '2021-09-29 19:30:42'),
('eed641af7769893b50f198770eb3e5aedcae2c7b57c2809f3caa05e1656d92299541e4c912beb59f', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-16 16:39:55', '2020-10-16 16:39:55', '2021-10-16 13:39:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '1mkZTFiH8LGecVT7i1H0pc2k56oouCP9Y0dpb1S9', 'http://localhost', 1, 0, 0, '2020-09-29 22:30:07', '2020-09-29 22:30:07'),
(2, NULL, 'Laravel Password Grant Client', 'kJAP1xKiXkUHmmRrcnc9I0cUGvn3wd9E1wWVhIO6', 'http://localhost', 0, 1, 0, '2020-09-29 22:30:07', '2020-09-29 22:30:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-09-29 22:30:07', '2020-09-29 22:30:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ods`
--

CREATE TABLE `ods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ods_project`
--

CREATE TABLE `ods_project` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `signature_date` date NOT NULL,
  `due_date` date NOT NULL,
  `working_days` int(11) NOT NULL,
  `project_quantity` int(11) NOT NULL,
  `billing` decimal(10,2) NOT NULL,
  `legal_person` tinyint(1) NOT NULL,
  `shared_action` tinyint(1) DEFAULT NULL,
  `guidance` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `projects`
--

INSERT INTO `projects` (`id`, `signature_date`, `due_date`, `working_days`, `project_quantity`, `billing`, `legal_person`, `shared_action`, `guidance`, `created_at`, `updated_at`) VALUES
(1, '2020-01-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 03:00:00', '2020-10-07 03:00:00'),
(2, '2020-02-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(3, '2020-03-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(4, '2020-04-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(5, '2020-05-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(6, '2020-06-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(7, '2020-07-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(8, '2020-08-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(9, '2020-09-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(10, '2020-10-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(11, '2020-11-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(12, '2020-12-01', '2020-01-01', 0, 0, '0.00', 0, 0, 0, '2020-10-07 06:00:00', '2020-10-07 06:00:00'),
(13, '2020-01-07', '2020-10-07', 20, 9, '10373.03', 0, 1, 1, '2020-10-07 20:51:48', '2020-10-07 20:51:48'),
(14, '2020-02-01', '2020-02-06', 5, 1, '350.00', 1, 1, 1, '2020-10-07 20:56:51', '2020-10-07 20:56:51'),
(15, '2020-05-01', '2020-05-07', 5, 1, '280.00', 0, 1, 1, '2020-10-07 20:58:57', '2020-10-07 20:58:57'),
(16, '2020-06-01', '2020-06-07', 5, 24, '4516.79', 0, 1, 1, '2020-10-07 20:59:40', '2020-10-07 20:59:40'),
(17, '2020-07-01', '2020-08-07', 5, 10, '1676.39', 0, 1, 1, '2020-10-07 21:00:59', '2020-10-07 21:00:59'),
(18, '2020-08-01', '2020-08-07', 5, 9, '15380.00', 0, 0, 1, '2020-10-07 21:03:44', '2020-10-07 21:03:44'),
(19, '2020-09-01', '2020-09-01', 5, 21, '9869.08', 0, 1, 1, '2020-10-07 21:06:16', '2020-10-07 21:06:16'),
(39, '2020-01-01', '2020-01-07', 5, 1, '1953.10', 0, 1, 1, '2020-10-07 21:27:08', '2020-10-07 21:27:08'),
(40, '2020-03-01', '2020-03-07', 5, 3, '5399.98', 0, 1, 1, '2020-10-07 21:28:00', '2020-10-07 21:28:00'),
(41, '2020-04-01', '2020-04-07', 5, 1, '100.00', 0, 1, 1, '2020-10-07 21:28:40', '2020-10-07 21:28:40'),
(42, '2020-06-01', '2020-06-07', 5, 11, '512.00', 0, NULL, NULL, '2020-10-07 21:30:20', '2020-10-07 21:30:20'),
(43, '2020-07-01', '2020-07-07', 3, 1, '2.00', 0, NULL, NULL, '2020-10-07 21:35:02', '2020-10-07 21:35:02'),
(44, '2020-08-01', '2020-08-07', 5, 74, '5960.00', 0, NULL, NULL, '2020-10-07 21:35:41', '2020-10-07 21:35:41'),
(45, '2020-10-01', '2020-10-07', 5, 5, '400.00', 0, NULL, NULL, '2020-10-07 21:36:28', '2020-10-07 21:36:28'),
(46, '2020-01-01', '2020-01-07', 5, 5, '13600.00', 0, NULL, NULL, '2020-10-07 21:59:23', '2020-10-07 21:59:23'),
(47, '2020-02-01', '2020-02-07', 5, 7, '12400.00', 0, NULL, NULL, '2020-10-07 22:00:19', '2020-10-07 22:00:19'),
(48, '2020-03-01', '2020-03-03', 5, 20, '38500.00', 0, NULL, NULL, '2020-10-07 22:01:01', '2020-10-07 22:01:01'),
(49, '2020-04-01', '2020-04-07', 5, 8, '18400.00', 0, NULL, NULL, '2020-10-07 22:01:25', '2020-10-07 22:01:25'),
(50, '2020-05-01', '2020-05-07', 5, 22, '34850.00', 0, NULL, NULL, '2020-10-07 22:02:21', '2020-10-07 22:02:21'),
(51, '2020-06-01', '2020-06-07', 5, 18, '22400.00', 0, NULL, NULL, '2020-10-07 22:03:16', '2020-10-07 22:03:16'),
(52, '2020-07-01', '2020-07-07', 5, 13, '24800.00', 0, NULL, NULL, '2020-10-07 22:03:44', '2020-10-07 22:03:44'),
(53, '2020-08-01', '2020-08-01', 5, 6, '8000.00', 0, NULL, NULL, '2020-10-07 22:04:21', '2020-10-07 22:04:21'),
(54, '2020-09-01', '2020-09-07', 5, 28, '46950.00', 0, NULL, NULL, '2020-10-07 22:04:54', '2020-10-07 22:04:54'),
(55, '2020-10-01', '2020-10-07', 5, 8, '15650.00', 0, NULL, NULL, '2020-10-07 22:05:17', '2020-10-07 22:05:17'),
(56, '2020-01-01', '2020-01-07', 5, 1, '3000.00', 0, NULL, NULL, '2020-10-07 22:16:45', '2020-10-07 22:16:45'),
(57, '2020-07-01', '2020-07-01', 5, 1, '1340.00', 0, NULL, NULL, '2020-10-07 22:17:07', '2020-10-07 22:17:07'),
(58, '2020-08-01', '2020-08-07', 5, 3, '2639.31', 0, NULL, NULL, '2020-10-07 22:17:43', '2020-10-07 22:17:43'),
(59, '2020-09-01', '2020-09-01', 5, 4, '8552.40', 0, NULL, NULL, '2020-10-07 22:18:26', '2020-10-07 22:18:26'),
(60, '2020-01-01', '2020-01-07', 5, 8, '38040.00', 0, NULL, NULL, '2020-10-07 22:20:45', '2020-10-07 22:20:45'),
(61, '2020-02-01', '2020-02-07', 5, 2, '5900.00', 0, NULL, NULL, '2020-10-07 22:23:50', '2020-10-07 22:23:50'),
(62, '2020-03-01', '2020-03-07', 5, 13, '56721.88', 0, NULL, NULL, '2020-10-07 22:25:11', '2020-10-07 22:25:11'),
(63, '2020-04-01', '2020-04-07', 5, 35, '7540.00', 0, NULL, NULL, '2020-10-07 22:27:22', '2020-10-07 22:27:22'),
(64, '2020-05-01', '2020-05-01', 5, 31, '7721.00', 0, NULL, NULL, '2020-10-07 22:28:47', '2020-10-07 22:28:47'),
(65, '2020-06-01', '2020-06-07', 5, 5, '17365.00', 0, NULL, NULL, '2020-10-07 22:29:06', '2020-10-07 22:29:06'),
(66, '2020-07-01', '2020-07-07', 5, 84, '95487.74', 0, NULL, NULL, '2020-10-07 22:29:35', '2020-10-07 22:29:35'),
(67, '2020-08-01', '2020-08-07', 5, 11, '38520.08', 0, NULL, NULL, '2020-10-07 22:30:14', '2020-10-07 22:30:14'),
(68, '2020-09-01', '2020-09-07', 5, 11, '41904.24', 0, NULL, NULL, '2020-10-07 22:30:56', '2020-10-07 22:30:56'),
(69, '2020-10-01', '2020-10-07', 5, 5, '22488.03', 0, NULL, NULL, '2020-10-07 22:31:24', '2020-10-07 22:31:24'),
(70, '2020-01-01', '2020-01-07', 5, 2, '3490.00', 0, NULL, NULL, '2020-10-07 22:32:50', '2020-10-07 22:32:50'),
(71, '2020-05-01', '2020-05-07', 5, 1, '1300.00', 0, NULL, NULL, '2020-10-07 22:33:06', '2020-10-07 22:33:06'),
(72, '2020-06-01', '2020-06-07', 5, 2, '2602.40', 0, NULL, NULL, '2020-10-07 22:33:47', '2020-10-07 22:33:47'),
(73, '2020-07-01', '2020-07-07', 5, 4, '8159.65', 0, NULL, NULL, '2020-10-07 22:34:17', '2020-10-07 22:34:17'),
(74, '2020-08-01', '2020-08-07', 5, 3, '4659.58', 0, NULL, NULL, '2020-10-07 22:34:41', '2020-10-07 22:34:41'),
(75, '2020-09-01', '2020-09-07', 5, 1, '1814.60', 0, NULL, NULL, '2020-10-07 22:35:09', '2020-10-07 22:35:09'),
(76, '2020-01-01', '2020-01-07', 5, 10, '6300.00', 0, NULL, NULL, '2020-10-07 22:37:03', '2020-10-07 22:37:03'),
(77, '2020-02-01', '2020-02-07', 5, 7, '5040.00', 0, NULL, NULL, '2020-10-07 22:37:22', '2020-10-07 22:37:22'),
(78, '2020-03-01', '2020-03-07', 5, 5, '10670.00', 0, NULL, NULL, '2020-10-07 22:37:45', '2020-10-07 22:37:45'),
(79, '2020-04-01', '2020-04-07', 5, 8, '3750.00', 0, NULL, NULL, '2020-10-07 22:38:16', '2020-10-07 22:38:16'),
(80, '2020-05-01', '2020-05-07', 5, 10, '7420.00', 0, NULL, NULL, '2020-10-07 22:38:37', '2020-10-07 22:38:37'),
(81, '2020-06-01', '2020-06-07', 5, 12, '7014.00', 0, NULL, NULL, '2020-10-07 22:39:05', '2020-10-07 22:39:05'),
(82, '2020-07-01', '2020-07-07', 5, 12, '7685.00', 0, NULL, NULL, '2020-10-07 22:39:20', '2020-10-07 22:39:20'),
(83, '2020-08-01', '2020-08-07', 5, 9, '9450.00', 0, NULL, NULL, '2020-10-07 22:39:54', '2020-10-07 22:39:54'),
(84, '2020-09-01', '2020-09-07', 5, 13, '11695.00', 0, NULL, NULL, '2020-10-07 22:40:19', '2020-10-07 22:40:19'),
(85, '2020-01-01', '2020-01-07', 5, 3, '5168.00', 0, NULL, NULL, '2020-10-07 22:43:25', '2020-10-07 22:43:25'),
(86, '2020-02-01', '2020-02-07', 5, 1, '2000.00', 0, NULL, NULL, '2020-10-07 22:43:40', '2020-10-07 22:43:40'),
(87, '2020-03-01', '2020-03-07', 5, 1, '1760.00', 0, NULL, NULL, '2020-10-07 22:43:53', '2020-10-07 22:43:53'),
(88, '2020-04-01', '2020-04-07', 5, 3, '4385.60', 0, NULL, NULL, '2020-10-07 22:44:14', '2020-10-07 22:44:14'),
(89, '2020-05-01', '2020-05-07', 5, 2, '3208.00', 0, NULL, NULL, '2020-10-07 22:44:31', '2020-10-07 22:44:31'),
(90, '2020-06-01', '2020-06-07', 5, 4, '14584.00', 0, NULL, NULL, '2020-10-07 22:44:54', '2020-10-07 22:44:54'),
(91, '2020-07-01', '2020-07-07', 5, 2, '2851.20', 0, NULL, NULL, '2020-10-07 22:45:15', '2020-10-07 22:45:15'),
(92, '2020-08-01', '2020-08-07', 5, 4, '12369.90', 0, NULL, NULL, '2020-10-07 22:45:39', '2020-10-07 22:45:39'),
(93, '2020-09-01', '2020-09-07', 5, 3, '7077.60', 0, NULL, NULL, '2020-10-07 22:45:57', '2020-10-07 22:45:57'),
(94, '2020-01-01', '2020-01-07', 5, 2, '540.62', 0, NULL, NULL, '2020-10-07 22:49:32', '2020-10-07 22:49:32'),
(95, '2020-05-01', '2020-05-07', 5, 1, '295.70', 0, NULL, NULL, '2020-10-07 22:49:53', '2020-10-07 22:49:53'),
(96, '2020-07-01', '2020-07-07', 5, 2, '1620.00', 0, NULL, NULL, '2020-10-07 22:50:11', '2020-10-07 22:50:11'),
(97, '2020-08-01', '2020-08-07', 5, 8, '3146.34', 0, NULL, NULL, '2020-10-07 22:50:33', '2020-10-07 22:50:33'),
(98, '2020-09-01', '2020-09-07', 5, 4, '2101.72', 0, NULL, NULL, '2020-10-07 22:50:49', '2020-10-07 22:50:49'),
(99, '2020-01-01', '2020-01-07', 5, 3, '11300.00', 0, NULL, NULL, '2020-10-08 01:13:32', '2020-10-08 01:13:32'),
(100, '2020-02-01', '2020-02-07', 5, 2, '5900.00', 0, NULL, NULL, '2020-10-08 01:13:57', '2020-10-08 01:13:57'),
(101, '2020-03-01', '2020-03-07', 5, 4, '17100.00', 0, NULL, NULL, '2020-10-08 01:14:16', '2020-10-08 01:14:16'),
(102, '2020-06-01', '2020-06-07', 5, 4, '8700.00', 0, NULL, NULL, '2020-10-08 01:14:45', '2020-10-08 01:14:45'),
(103, '2020-07-01', '2020-07-07', 5, 1, '200.00', 0, NULL, NULL, '2020-10-08 01:15:03', '2020-10-08 01:15:03'),
(104, '2020-08-01', '2020-08-07', 5, 4, '9513.50', 0, NULL, NULL, '2020-10-08 01:15:27', '2020-10-08 01:15:27'),
(105, '2020-09-01', '2020-09-07', 5, 5, '15300.00', 0, NULL, NULL, '2020-10-08 01:15:45', '2020-10-08 01:15:45'),
(106, '2020-10-01', '2020-10-07', 5, 2, '7200.00', 0, NULL, NULL, '2020-10-08 01:16:02', '2020-10-08 01:16:02'),
(107, '2020-01-01', '2020-01-07', 5, 3, '4673.75', 0, NULL, NULL, '2020-10-08 01:29:40', '2020-10-08 01:29:40'),
(108, '2020-03-01', '2020-03-07', 5, 1, '1000.00', 0, NULL, NULL, '2020-10-08 01:29:59', '2020-10-08 01:29:59'),
(109, '2020-05-01', '2020-05-07', 5, 1, '3205.38', 0, NULL, NULL, '2020-10-08 01:30:16', '2020-10-08 01:30:16'),
(110, '2020-06-01', '2020-06-07', 5, 1, '1315.00', 0, NULL, NULL, '2020-10-08 01:30:34', '2020-10-08 01:30:34'),
(111, '2020-07-01', '2020-07-07', 5, 2, '2564.76', 0, NULL, NULL, '2020-10-08 01:31:04', '2020-10-08 01:31:04'),
(112, '2020-08-01', '2020-08-07', 5, 5, '10010.40', 0, NULL, NULL, '2020-10-08 01:31:24', '2020-10-08 01:31:24'),
(113, '2020-09-01', '2020-09-07', 5, 4, '5388.71', 0, NULL, NULL, '2020-10-08 01:31:41', '2020-10-08 01:31:41'),
(114, '2020-01-01', '2020-01-07', 5, 1, '1500.00', 0, NULL, NULL, '2020-10-08 01:35:18', '2020-10-08 01:35:18'),
(115, '2020-03-01', '2020-03-07', 5, 3, '2793.00', 0, NULL, NULL, '2020-10-08 01:35:38', '2020-10-08 01:35:38'),
(116, '2020-07-01', '2020-07-07', 5, 1, '4208.14', 0, NULL, NULL, '2020-10-08 01:36:02', '2020-10-08 01:36:02'),
(117, '2020-08-01', '2020-08-07', 5, 5, '6773.82', 0, NULL, NULL, '2020-10-08 01:36:20', '2020-10-08 01:36:20'),
(118, '2020-09-01', '2020-09-07', 5, 1, '1680.44', 0, NULL, NULL, '2020-10-08 01:36:37', '2020-10-08 01:36:37'),
(119, '2020-01-01', '2020-01-07', 5, 1, '3100.00', 0, 0, NULL, '2020-10-08 01:38:35', '2020-10-08 01:38:35'),
(120, '2020-02-01', '2020-02-07', 5, 1, '1362.37', 0, NULL, NULL, '2020-10-08 01:39:05', '2020-10-08 01:39:05'),
(121, '2020-03-01', '2020-03-07', 5, 1, '2800.00', 0, NULL, NULL, '2020-10-08 01:39:25', '2020-10-08 01:39:25'),
(122, '2020-04-01', '2020-04-07', 5, 1, '1665.94', 0, NULL, NULL, '2020-10-08 01:39:44', '2020-10-08 01:39:44'),
(123, '2020-06-01', '2020-06-07', 5, 1, '3360.00', 0, NULL, NULL, '2020-10-08 01:40:04', '2020-10-08 01:40:04'),
(124, '2020-07-01', '2020-07-07', 5, 1, '3545.00', 0, NULL, NULL, '2020-10-08 01:40:26', '2020-10-08 01:40:26'),
(125, '2020-08-01', '2020-08-07', 5, 2, '3170.00', 0, NULL, NULL, '2020-10-08 01:40:44', '2020-10-08 01:40:44'),
(126, '2020-09-01', '2020-09-07', 5, 9, '21730.34', 0, NULL, NULL, '2020-10-08 01:41:01', '2020-10-08 01:41:01'),
(127, '2020-03-01', '2020-03-07', 5, 1, '700.00', 0, 0, NULL, '2020-10-08 01:43:43', '2020-10-08 01:43:43'),
(128, '2020-06-01', '2020-06-07', 5, 1, '1140.00', 0, NULL, NULL, '2020-10-08 01:44:11', '2020-10-08 01:44:11'),
(129, '2020-07-01', '2020-07-07', 5, 2, '6700.00', 0, NULL, NULL, '2020-10-08 01:45:05', '2020-10-08 01:45:05'),
(130, '2020-08-01', '2020-08-07', 5, 9, '3730.00', 0, NULL, NULL, '2020-10-08 01:45:22', '2020-10-08 01:45:22'),
(131, '2020-09-01', '2020-09-07', 5, 9, '7400.00', 0, NULL, NULL, '2020-10-08 01:45:45', '2020-10-08 01:45:45'),
(132, '2020-07-01', '2020-07-07', 5, 3, '3365.00', 0, NULL, NULL, '2020-10-10 03:41:37', '2020-10-10 03:41:37'),
(133, '2020-08-01', '2020-08-07', 5, 6, '1887.12', 0, NULL, NULL, '2020-10-10 03:42:03', '2020-10-10 03:42:03'),
(134, '2020-09-01', '2020-09-07', 5, 3, '373.69', 0, NULL, NULL, '2020-10-10 03:42:29', '2020-10-10 03:42:29'),
(135, '2020-02-01', '2020-02-07', 5, 4, '11100.00', 0, NULL, NULL, '2020-10-10 03:47:13', '2020-10-10 03:47:13'),
(136, '2020-03-01', '2020-03-07', 5, 1, '768.00', 0, NULL, NULL, '2020-10-10 03:48:09', '2020-10-10 03:48:09'),
(137, '2020-04-01', '2020-04-07', 5, 1, '300.00', 0, NULL, NULL, '2020-10-10 03:48:33', '2020-10-10 03:48:33'),
(138, '2020-05-01', '2020-05-07', 5, 4, '6000.00', 0, NULL, NULL, '2020-10-10 03:48:59', '2020-10-10 03:48:59'),
(139, '2020-06-01', '2020-06-07', 5, 2, '1115.00', 0, NULL, NULL, '2020-10-10 03:49:41', '2020-10-10 03:49:41'),
(140, '2020-07-01', '2020-07-07', 5, 1, '25.00', 0, NULL, NULL, '2020-10-10 03:50:14', '2020-10-10 03:50:14'),
(141, '2020-09-01', '2020-09-07', 5, 12, '8654.25', 0, NULL, NULL, '2020-10-10 03:50:48', '2020-10-10 03:50:48'),
(142, '2020-03-01', '2020-03-07', 5, 2, '3000.00', 0, NULL, NULL, '2020-10-10 04:03:18', '2020-10-10 04:03:18'),
(143, '2020-04-01', '2020-04-07', 5, 2, '2066.46', 0, NULL, NULL, '2020-10-10 04:03:53', '2020-10-10 04:03:53'),
(144, '2020-06-01', '2020-06-07', 5, 3, '4388.64', 0, NULL, NULL, '2020-10-10 04:04:22', '2020-10-10 04:04:22'),
(145, '2020-07-01', '2020-07-07', 5, 1, '1749.99', 0, NULL, NULL, '2020-10-10 04:04:53', '2020-10-10 04:04:53'),
(146, '2020-08-01', '2020-08-07', 5, 3, '7911.12', 0, NULL, NULL, '2020-10-10 04:05:22', '2020-10-10 04:05:22'),
(147, '2020-09-01', '2020-09-07', 5, 2, '6333.96', 0, NULL, NULL, '2020-10-10 04:05:54', '2020-10-10 04:05:54'),
(148, '2020-02-01', '2020-02-07', 5, 1, '12000.00', 0, NULL, NULL, '2020-10-14 18:33:48', '2020-10-14 18:33:48'),
(149, '2020-06-01', '2020-06-07', 5, 2, '3848.00', 0, NULL, NULL, '2020-10-14 18:34:14', '2020-10-14 18:34:14'),
(150, '2020-07-01', '2020-07-07', 5, 3, '4300.00', 0, NULL, NULL, '2020-10-14 18:34:36', '2020-10-14 18:34:36'),
(151, '2020-08-01', '2020-08-07', 5, 3, '3790.00', 0, NULL, NULL, '2020-10-14 18:35:05', '2020-10-14 18:35:05'),
(152, '2020-09-01', '2020-09-07', 5, 4, '5600.00', 0, 0, NULL, '2020-10-14 18:35:50', '2020-10-14 18:35:50'),
(153, '2020-10-01', '2020-10-07', 5, 1, '1600.00', 0, NULL, NULL, '2020-10-14 18:36:22', '2020-10-14 18:36:22'),
(154, '2020-01-01', '2020-07-01', 5, 2, '4700.00', 0, NULL, NULL, '2020-10-16 01:43:24', '2020-10-16 01:43:24'),
(155, '2020-02-01', '2020-02-07', 5, 3, '5681.99', 0, NULL, NULL, '2020-10-16 01:43:56', '2020-10-16 01:43:56'),
(156, '2020-03-01', '2020-03-07', 5, 2, '4500.00', 0, NULL, NULL, '2020-10-16 01:44:18', '2020-10-16 01:44:18'),
(157, '2020-05-01', '2020-05-07', 5, 2, '1400.00', 0, NULL, NULL, '2020-10-16 01:45:02', '2020-10-16 01:45:02'),
(158, '2020-06-01', '2020-06-07', 5, 10, '7161.87', 0, NULL, NULL, '2020-10-16 01:45:33', '2020-10-16 01:45:33'),
(159, '2020-07-01', '2020-07-07', 5, 5, '8174.26', 0, NULL, NULL, '2020-10-16 01:46:28', '2020-10-16 01:46:28'),
(160, '2020-08-01', '2020-08-07', 5, 1, '1890.31', 0, NULL, NULL, '2020-10-16 01:47:01', '2020-10-16 01:47:01'),
(161, '2020-09-01', '2020-09-07', 5, 4, '7797.99', 0, NULL, NULL, '2020-10-16 01:47:20', '2020-10-16 01:47:20'),
(162, '2020-01-01', '2020-01-07', 5, 2, '389.02', 0, NULL, NULL, '2020-10-16 01:51:04', '2020-10-16 01:51:04'),
(163, '2020-02-01', '2020-02-07', 5, 3, '495.78', 0, NULL, NULL, '2020-10-16 01:51:35', '2020-10-16 01:51:35'),
(164, '2020-06-01', '2020-06-07', 5, 8, '5293.50', 0, NULL, NULL, '2020-10-16 01:52:14', '2020-10-16 01:52:14'),
(165, '2020-07-01', '2020-07-07', 5, 4, '6120.00', 0, NULL, NULL, '2020-10-16 01:52:37', '2020-10-16 01:52:37'),
(166, '2020-08-01', '2020-08-07', 5, 2, '610.66', 0, NULL, NULL, '2020-10-16 01:52:59', '2020-10-16 01:52:59'),
(167, '2020-09-01', '2020-09-07', 5, 2, '610.66', 0, NULL, NULL, '2020-10-16 01:53:27', '2020-10-16 01:53:27'),
(168, '2020-06-01', '2020-06-07', 5, 3, '1413.66', 0, NULL, NULL, '2020-10-18 21:19:03', '2020-10-18 21:19:03'),
(169, '2020-07-01', '2020-07-07', 5, 2, '2090.00', 0, NULL, NULL, '2020-10-18 21:19:47', '2020-10-18 21:19:47'),
(170, '2020-08-01', '2020-08-07', 5, 2, '1128.90', 0, NULL, NULL, '2020-10-18 21:20:17', '2020-10-18 21:20:17'),
(171, '2020-09-01', '2020-09-07', 5, 11, '3763.12', 0, NULL, NULL, '2020-10-18 21:20:47', '2020-10-18 21:20:47'),
(172, '2020-01-01', '2020-01-07', 5, 1, '3324.15', 0, NULL, NULL, '2020-10-18 21:27:09', '2020-10-18 21:27:09'),
(173, '2020-02-01', '2020-02-07', 5, 1, '2560.30', 0, NULL, NULL, '2020-10-18 21:28:11', '2020-10-18 21:28:11'),
(174, '2020-03-01', '2020-03-07', 5, 1, '1200.00', 0, NULL, NULL, '2020-10-18 21:29:09', '2020-10-18 21:29:09'),
(175, '2020-04-01', '2020-04-07', 5, 1, '2000.00', 0, NULL, NULL, '2020-10-18 21:29:32', '2020-10-18 21:29:32'),
(177, '2020-09-01', '2020-09-07', 5, 2, '3705.88', 0, NULL, NULL, '2020-10-18 21:30:43', '2020-10-18 21:30:43'),
(178, '2020-01-01', '2020-07-01', 5, 4, '1065.00', 0, NULL, NULL, '2020-10-18 21:42:40', '2020-10-18 21:42:40'),
(179, '2020-02-01', '2020-02-01', 5, 4, '2331.00', 0, NULL, NULL, '2020-10-18 21:42:54', '2020-10-18 21:42:54'),
(180, '2020-03-01', '2020-03-01', 5, 14, '1837.56', 0, NULL, NULL, '2020-10-18 21:43:10', '2020-10-18 21:43:10'),
(181, '2020-04-01', '2020-04-07', 5, 11, '760.00', 0, NULL, NULL, '2020-10-18 21:43:24', '2020-10-18 21:43:24'),
(182, '2020-05-01', '2020-05-07', 5, 4, '460.00', 0, NULL, NULL, '2020-10-18 21:43:34', '2020-10-18 21:43:34'),
(183, '2020-06-01', '2020-06-07', 5, 16, '4574.82', 0, NULL, NULL, '2020-10-18 21:43:50', '2020-10-18 21:43:50'),
(184, '2020-07-01', '2020-07-07', 5, 1, '420.00', 0, NULL, NULL, '2020-10-18 21:43:58', '2020-10-18 21:43:58'),
(185, '2020-08-01', '2020-08-07', 5, 7, '7756.40', 0, NULL, NULL, '2020-10-18 21:44:16', '2020-10-18 21:44:16'),
(186, '2020-09-01', '2020-09-07', 5, 1, '300.00', 0, NULL, NULL, '2020-10-18 21:44:24', '2020-10-18 21:44:24'),
(187, '2020-06-01', '2020-06-07', 5, 1, '1491.75', 0, NULL, NULL, '2020-10-18 21:49:19', '2020-10-18 21:49:19'),
(188, '2020-07-01', '2020-07-07', 5, 1, '1200.00', 0, NULL, NULL, '2020-10-18 22:00:28', '2020-10-18 22:00:28'),
(189, '2020-09-01', '2020-09-07', 5, 6, '2250.00', 0, NULL, NULL, '2020-10-18 22:01:02', '2020-10-18 22:01:02'),
(190, '2020-10-01', '2020-10-07', 5, 6, '5030.00', 0, NULL, NULL, '2020-10-18 22:01:13', '2020-10-18 22:01:13'),
(191, '2020-01-01', '2020-01-07', 5, 1, '1500.00', 0, NULL, NULL, '2020-10-18 22:04:19', '2020-10-18 22:04:19'),
(192, '2020-03-01', '2020-03-07', 5, 1, '2500.00', 0, NULL, NULL, '2020-10-18 22:04:37', '2020-10-18 22:04:37'),
(193, '2020-04-01', '2020-04-07', 5, 1, '2900.00', 0, NULL, NULL, '2020-10-18 22:04:46', '2020-10-18 22:04:46'),
(194, '2020-06-01', '2020-06-07', 5, 1, '900.00', 0, NULL, NULL, '2020-10-18 22:06:02', '2020-10-18 22:06:02'),
(195, '2020-07-01', '2020-07-07', 5, 3, '1230.00', 0, NULL, NULL, '2020-10-18 22:06:16', '2020-10-18 22:06:16'),
(196, '2020-08-01', '2020-08-07', 5, 5, '3001.00', 0, NULL, NULL, '2020-10-18 22:06:23', '2020-10-18 22:06:23'),
(197, '2020-09-01', '2020-09-07', 5, 5, '23163.42', 0, NULL, NULL, '2020-10-18 22:06:36', '2020-10-18 22:06:36'),
(198, '2020-01-01', '2020-01-07', 5, 1, '3024.00', 0, NULL, NULL, '2020-10-18 22:10:29', '2020-10-18 22:10:29'),
(199, '2020-03-01', '2020-03-07', 5, 6, '5069.67', 0, NULL, NULL, '2020-10-18 22:11:17', '2020-10-18 22:11:17'),
(200, '2020-04-01', '2020-04-07', 5, 2, '3665.00', 0, NULL, NULL, '2020-10-18 22:11:27', '2020-10-18 22:11:27'),
(201, '2020-05-01', '2020-05-07', 5, 6, '22448.35', 0, NULL, NULL, '2020-10-18 22:12:31', '2020-10-18 22:12:31'),
(202, '2020-06-01', '2020-06-07', 5, 1, '800.00', 0, NULL, NULL, '2020-10-18 22:12:41', '2020-10-18 22:12:41'),
(203, '2020-07-01', '2020-07-06', 5, 5, '8004.00', 0, NULL, NULL, '2020-10-18 22:14:24', '2020-10-18 22:14:24'),
(204, '2020-08-01', '2020-08-06', 5, 3, '8145.00', 0, NULL, NULL, '2020-10-18 22:14:36', '2020-10-18 22:14:36'),
(205, '2020-09-01', '2020-09-06', 5, 9, '52100.00', 0, NULL, NULL, '2020-10-18 22:14:47', '2020-10-18 22:14:47'),
(206, '2020-02-01', '2020-02-07', 5, 1, '7500.00', 0, NULL, NULL, '2020-10-18 22:20:51', '2020-10-18 22:20:51'),
(207, '2020-05-01', '2020-05-07', 5, 1, '600.00', 0, NULL, NULL, '2020-10-18 22:21:03', '2020-10-18 22:21:03'),
(208, '2020-06-01', '2020-06-07', 5, 2, '1330.00', 0, NULL, NULL, '2020-10-18 22:21:13', '2020-10-18 22:21:13'),
(209, '2020-07-01', '2020-07-07', 5, 1, '600.00', 0, NULL, NULL, '2020-10-18 22:21:22', '2020-10-18 22:21:22'),
(210, '2020-08-01', '2020-08-07', 5, 1, '2500.00', 0, NULL, NULL, '2020-10-18 22:21:33', '2020-10-18 22:21:33'),
(211, '2020-09-01', '2020-09-07', 5, 5, '32500.00', 0, NULL, NULL, '2020-10-18 22:21:44', '2020-10-18 22:21:44'),
(212, '2020-01-01', '2020-01-07', 5, 4, '4300.00', 0, NULL, NULL, '2020-10-18 22:32:17', '2020-10-18 22:32:17'),
(213, '2020-02-01', '2020-02-07', 5, 4, '4740.00', 0, NULL, NULL, '2020-10-18 22:32:30', '2020-10-18 22:32:30'),
(214, '2020-03-01', '2020-03-07', 5, 8, '6720.00', 0, NULL, NULL, '2020-10-18 22:32:46', '2020-10-18 22:32:46'),
(215, '2020-04-01', '2020-04-07', 5, 3, '2250.00', 0, NULL, NULL, '2020-10-18 22:33:31', '2020-10-18 22:33:31'),
(216, '2020-05-01', '2020-05-07', 5, 4, '4450.00', 0, NULL, NULL, '2020-10-18 22:33:40', '2020-10-18 22:33:40'),
(217, '2020-07-01', '2020-07-07', 5, 7, '9620.00', 0, NULL, NULL, '2020-10-18 22:33:58', '2020-10-18 22:33:58'),
(218, '2020-08-01', '2020-08-07', 5, 2, '1920.00', 0, NULL, NULL, '2020-10-18 22:34:09', '2020-10-18 22:34:09'),
(219, '2020-09-01', '2020-09-07', 5, 17, '18950.00', 0, NULL, NULL, '2020-10-18 22:34:19', '2020-10-18 22:34:19'),
(220, '2020-01-01', '2020-01-07', 5, 5, '8625.00', 0, NULL, NULL, '2020-10-18 22:36:52', '2020-10-18 22:36:52'),
(221, '2020-02-01', '2020-02-07', 5, 5, '6850.00', 0, NULL, NULL, '2020-10-18 22:37:00', '2020-10-18 22:37:00'),
(222, '2020-03-01', '2020-03-07', 5, 6, '15758.00', 0, NULL, NULL, '2020-10-18 22:37:10', '2020-10-18 22:37:10'),
(223, '2020-04-01', '2020-04-07', 5, 7, '10695.00', 0, NULL, NULL, '2020-10-18 22:37:32', '2020-10-18 22:37:32'),
(224, '2020-05-01', '2020-05-07', 5, 8, '13948.00', 0, NULL, NULL, '2020-10-18 22:37:48', '2020-10-18 22:37:48'),
(225, '2020-06-01', '2020-06-07', 5, 3, '4160.00', 0, NULL, NULL, '2020-10-18 22:38:14', '2020-10-18 22:38:14'),
(226, '2020-07-01', '2020-07-07', 5, 33, '53778.00', 0, NULL, NULL, '2020-10-18 22:38:26', '2020-10-18 22:38:26'),
(227, '2020-08-01', '2020-08-07', 5, 16, '38347.00', 0, NULL, NULL, '2020-10-18 22:38:36', '2020-10-18 22:38:36'),
(228, '2020-09-01', '2020-09-07', 5, 7, '15383.50', 0, NULL, NULL, '2020-10-18 22:38:53', '2020-10-18 22:38:53'),
(229, '2020-01-01', '2020-01-07', 5, 1, '6048.00', 0, NULL, NULL, '2020-10-18 22:40:07', '2020-10-18 22:40:07'),
(230, '2020-03-01', '2020-03-07', 5, 2, '1000.00', 0, NULL, NULL, '2020-10-18 22:40:21', '2020-10-18 22:40:21'),
(231, '2020-04-01', '2020-04-07', 5, 3, '750.00', 0, NULL, NULL, '2020-10-18 22:40:30', '2020-10-18 22:40:30'),
(232, '2020-05-01', '2020-05-07', 5, 2, '925.00', 0, NULL, NULL, '2020-10-18 22:40:38', '2020-10-18 22:40:38'),
(233, '2020-06-01', '2020-06-07', 5, 4, '1426.00', 0, NULL, NULL, '2020-10-18 22:40:46', '2020-10-18 22:40:46'),
(234, '2020-07-01', '2020-07-07', 5, 7, '4750.00', 0, NULL, NULL, '2020-10-18 22:40:55', '2020-10-18 22:40:55'),
(235, '2020-08-01', '2020-08-07', 5, 9, '6820.00', 0, NULL, NULL, '2020-10-18 22:41:05', '2020-10-18 22:41:05'),
(236, '2020-09-01', '2020-09-07', 5, 13, '6345.00', 0, NULL, NULL, '2020-10-18 22:41:15', '2020-10-18 22:41:15'),
(237, '2020-10-01', '2020-10-07', 5, 6, '3355.00', 0, NULL, NULL, '2020-10-18 22:41:24', '2020-10-18 22:41:24'),
(238, '2020-01-01', '2020-01-07', 5, 6, '8626.82', 0, NULL, NULL, '2020-10-18 22:43:07', '2020-10-18 22:43:07'),
(239, '2020-02-01', '2020-02-07', 5, 14, '31910.00', 0, NULL, NULL, '2020-10-18 22:43:42', '2020-10-18 22:43:42'),
(240, '2020-03-01', '2020-03-07', 5, 14, '51062.61', 0, NULL, NULL, '2020-10-18 22:43:53', '2020-10-18 22:43:53'),
(241, '2020-05-01', '2020-05-07', 5, 5, '12415.00', 0, NULL, NULL, '2020-10-18 22:44:21', '2020-10-18 22:44:21'),
(242, '2020-06-01', '2020-06-07', 5, 1, '2500.00', 0, NULL, NULL, '2020-10-18 22:44:27', '2020-10-18 22:44:27'),
(243, '2020-07-01', '2020-07-07', 5, 8, '39555.00', 0, NULL, NULL, '2020-10-18 22:44:36', '2020-10-18 22:44:36'),
(244, '2020-08-01', '2020-08-07', 5, 12, '31315.00', 0, NULL, NULL, '2020-10-18 22:44:45', '2020-10-18 22:44:45'),
(245, '2020-09-01', '2020-09-07', 5, 9, '33770.00', 0, NULL, NULL, '2020-10-18 22:45:11', '2020-10-18 22:45:11'),
(246, '2020-10-01', '2020-10-07', 5, 3, '6000.00', 0, NULL, NULL, '2020-10-18 22:45:20', '2020-10-18 22:45:20'),
(247, '2020-01-01', '2020-01-07', 5, 3, '6497.00', 0, NULL, NULL, '2020-10-18 22:48:41', '2020-10-18 22:48:41'),
(248, '2020-03-01', '2020-03-07', 5, 2, '4470.00', 0, NULL, NULL, '2020-10-18 22:48:52', '2020-10-18 22:48:52'),
(249, '2020-04-01', '2020-04-07', 5, 1, '800.00', 0, NULL, NULL, '2020-10-18 22:48:59', '2020-10-18 22:48:59'),
(250, '2020-05-01', '2020-05-07', 5, 2, '1500.00', 0, NULL, NULL, '2020-10-18 22:49:11', '2020-10-18 22:49:11'),
(251, '2020-06-01', '2020-06-07', 5, 1, '900.00', 0, NULL, NULL, '2020-10-18 22:49:17', '2020-10-18 22:49:17'),
(252, '2020-07-01', '2020-07-07', 5, 7, '9560.00', 0, NULL, NULL, '2020-10-18 22:49:31', '2020-10-18 22:49:31'),
(253, '2020-08-01', '2020-08-07', 5, 1, '900.00', 0, NULL, NULL, '2020-10-18 22:49:39', '2020-10-18 22:49:39'),
(254, '2020-09-01', '2020-09-07', 5, 12, '41890.00', 0, NULL, NULL, '2020-10-18 22:49:50', '2020-10-18 22:49:50'),
(255, '2020-10-01', '2020-10-07', 5, 4, '13100.00', 0, NULL, NULL, '2020-10-18 22:49:58', '2020-10-18 22:49:58'),
(256, '2020-04-01', '2020-04-07', 5, 1, '2750.00', 0, NULL, NULL, '2020-10-18 22:52:01', '2020-10-18 22:52:01'),
(257, '2020-05-01', '2020-05-07', 5, 5, '11200.00', 0, NULL, NULL, '2020-10-18 22:52:11', '2020-10-18 22:52:11'),
(258, '2020-06-01', '2020-06-07', 5, 2, '3957.50', 0, NULL, NULL, '2020-10-18 22:52:20', '2020-10-18 22:52:20'),
(259, '2020-07-01', '2020-07-07', 5, 3, '2205.00', 0, NULL, NULL, '2020-10-18 22:52:29', '2020-10-18 22:52:29'),
(260, '2020-09-01', '2020-09-07', 5, 7, '4899.90', 0, NULL, NULL, '2020-10-18 22:52:44', '2020-10-18 22:52:44'),
(261, '2020-01-01', '2020-01-07', 5, 1, '526.78', 0, NULL, NULL, '2020-10-18 22:56:26', '2020-10-18 22:56:26'),
(262, '2020-02-01', '2020-02-07', 5, 1, '380.00', 0, NULL, NULL, '2020-10-18 23:00:30', '2020-10-18 23:00:30'),
(263, '2020-03-01', '2020-03-07', 5, 5, '8837.94', 0, NULL, NULL, '2020-10-18 23:02:48', '2020-10-18 23:02:48'),
(264, '2020-05-01', '2020-05-07', 5, 10, '19976.79', 0, NULL, NULL, '2020-10-18 23:03:03', '2020-10-18 23:03:03'),
(265, '2020-06-01', '2020-06-07', 5, 5, '9048.07', 0, NULL, NULL, '2020-10-18 23:03:13', '2020-10-18 23:03:13'),
(266, '2020-07-01', '2020-07-07', 5, 15, '22161.59', 0, NULL, NULL, '2020-10-18 23:03:25', '2020-10-18 23:03:25'),
(268, '2020-08-01', '2020-08-07', 5, 8, '16261.69', 0, NULL, NULL, '2020-10-18 23:06:36', '2020-10-18 23:06:36'),
(269, '2020-09-01', '2020-09-07', 5, 29, '61858.75', 0, NULL, NULL, '2020-10-18 23:06:51', '2020-10-18 23:06:51'),
(270, '2020-10-01', '2020-10-07', 5, 17, '16548.08', 0, NULL, NULL, '2020-10-18 23:07:05', '2020-10-18 23:07:05'),
(271, '2020-01-01', '2020-01-07', 5, 18, '14635.00', 0, NULL, NULL, '2020-10-18 23:08:26', '2020-10-18 23:08:26'),
(272, '2020-02-01', '2020-02-07', 5, 15, '13218.00', 0, NULL, NULL, '2020-10-18 23:08:34', '2020-10-18 23:08:34'),
(273, '2020-03-01', '2020-03-07', 5, 1, '1350.00', 0, NULL, NULL, '2020-10-18 23:08:42', '2020-10-18 23:08:42'),
(274, '2020-04-01', '2020-04-07', 5, 10, '7515.00', 0, NULL, NULL, '2020-10-18 23:08:50', '2020-10-18 23:08:50'),
(275, '2020-05-01', '2020-05-07', 5, 5, '12000.00', 0, NULL, NULL, '2020-10-18 23:08:58', '2020-10-18 23:08:58'),
(276, '2020-06-01', '2020-06-07', 5, 3, '3350.00', 0, NULL, NULL, '2020-10-18 23:13:10', '2020-10-18 23:13:10'),
(277, '2020-07-01', '2020-07-07', 5, 2, '4500.00', 0, NULL, NULL, '2020-10-18 23:13:23', '2020-10-18 23:13:23'),
(278, '2020-08-01', '2020-08-07', 5, 9, '3415.00', 0, NULL, NULL, '2020-10-18 23:13:31', '2020-10-18 23:13:31'),
(279, '2020-09-01', '2020-09-07', 5, 1, '600.00', 0, NULL, NULL, '2020-10-18 23:13:40', '2020-10-18 23:13:40'),
(280, '2020-10-01', '2020-10-07', 5, 5, '3500.00', 0, NULL, NULL, '2020-10-18 23:13:48', '2020-10-18 23:13:48'),
(281, '2020-01-01', '2020-01-07', 5, 2, '1900.00', 0, NULL, NULL, '2020-10-18 23:15:33', '2020-10-18 23:15:33'),
(282, '2020-02-01', '2020-02-07', 5, 3, '4354.08', 0, NULL, NULL, '2020-10-18 23:15:43', '2020-10-18 23:15:43'),
(283, '2020-03-01', '2020-03-07', 5, 3, '4096.84', 0, NULL, NULL, '2020-10-18 23:15:51', '2020-10-18 23:15:51'),
(284, '2020-08-01', '2020-08-07', 5, 1, '450.00', 0, NULL, NULL, '2020-10-18 23:16:11', '2020-10-18 23:16:11'),
(285, '2020-10-01', '2020-10-07', 5, 2, '384.42', 0, NULL, NULL, '2020-10-18 23:16:21', '2020-10-18 23:16:21'),
(286, '2020-01-01', '2020-01-07', 5, 1, '360.00', 0, NULL, NULL, '2020-10-18 23:23:52', '2020-10-18 23:23:52'),
(287, '2020-02-01', '2020-02-07', 5, 3, '1580.00', 0, NULL, NULL, '2020-10-18 23:23:59', '2020-10-18 23:23:59'),
(288, '2020-04-01', '2020-04-07', 5, 2, '360.00', 0, NULL, NULL, '2020-10-18 23:24:11', '2020-10-18 23:24:11'),
(289, '2020-05-01', '2020-05-07', 5, 2, '1040.00', 0, NULL, NULL, '2020-10-18 23:24:19', '2020-10-18 23:24:19'),
(290, '2020-06-01', '2020-06-07', 5, 3, '9999.96', 0, NULL, NULL, '2020-10-18 23:24:31', '2020-10-18 23:24:31'),
(291, '2020-07-01', '2020-07-07', 5, 2, '280.00', 0, NULL, NULL, '2020-10-18 23:24:37', '2020-10-18 23:24:37'),
(292, '2020-09-01', '2020-09-07', 5, 6, '3866.00', 0, NULL, NULL, '2020-10-18 23:24:46', '2020-10-18 23:24:46'),
(293, '2020-01-01', '2020-01-07', 5, 1, '600.00', 0, NULL, NULL, '2020-10-18 23:34:54', '2020-10-18 23:34:54'),
(294, '2020-03-01', '2020-03-07', 5, 1, '1500.00', 0, NULL, NULL, '2020-10-18 23:35:03', '2020-10-18 23:35:03'),
(295, '2020-06-01', '2020-06-07', 5, 2, '1000.00', 0, NULL, NULL, '2020-10-18 23:35:11', '2020-10-18 23:35:11'),
(296, '2020-08-01', '2020-08-07', 5, 4, '6900.00', 0, NULL, NULL, '2020-10-18 23:35:20', '2020-10-18 23:35:20'),
(297, '2020-09-01', '2020-09-07', 5, 1, '500.00', 0, NULL, NULL, '2020-10-18 23:35:29', '2020-10-18 23:35:29'),
(298, '2020-01-01', '2020-01-07', 5, 1, '4950.00', 0, NULL, NULL, '2020-10-18 23:39:17', '2020-10-18 23:39:17'),
(299, '2020-02-01', '2020-02-07', 5, 3, '6100.00', 0, NULL, NULL, '2020-10-18 23:39:24', '2020-10-18 23:39:24'),
(300, '2020-04-01', '2020-04-07', 5, 1, '2600.00', 0, NULL, NULL, '2020-10-18 23:39:35', '2020-10-18 23:39:35'),
(301, '2020-08-01', '2020-08-07', 5, 7, '4400.00', 0, NULL, NULL, '2020-10-18 23:39:46', '2020-10-18 23:39:46'),
(302, '2020-09-01', '2020-09-07', 5, 8, '7164.00', 0, NULL, NULL, '2020-10-18 23:39:55', '2020-10-18 23:39:55'),
(303, '2020-10-01', '2020-10-07', 5, 1, '1500.00', 0, NULL, NULL, '2020-10-18 23:40:03', '2020-10-18 23:40:03'),
(304, '2020-01-01', '2020-01-07', 5, 2, '734.61', 0, NULL, NULL, '2020-10-18 23:43:57', '2020-10-18 23:43:57'),
(305, '2020-06-01', '2020-06-07', 5, 3, '549.48', 0, NULL, NULL, '2020-10-18 23:44:08', '2020-10-18 23:44:08'),
(306, '2020-07-01', '2020-07-07', 5, 6, '1564.50', 0, NULL, NULL, '2020-10-18 23:44:21', '2020-10-18 23:44:21'),
(307, '2020-08-01', '2020-08-07', 5, 1, '2200.00', 0, NULL, NULL, '2020-10-18 23:44:30', '2020-10-18 23:44:30'),
(308, '2020-09-01', '2020-09-07', 5, 4, '3357.60', 0, NULL, NULL, '2020-10-18 23:44:42', '2020-10-18 23:44:42'),
(309, '2020-10-01', '2020-10-07', 5, 5, '1493.40', 0, NULL, NULL, '2020-10-18 23:44:52', '2020-10-18 23:44:52'),
(310, '2020-01-01', '2020-01-07', 3, 1, '1300.00', 0, NULL, NULL, '2020-10-18 23:48:56', '2020-10-18 23:48:56'),
(311, '2020-02-01', '2020-02-07', 3, 1, '2500.00', 0, NULL, NULL, '2020-10-18 23:49:02', '2020-10-18 23:49:02'),
(312, '2020-05-01', '2020-05-07', 3, 2, '2925.00', 0, NULL, NULL, '2020-10-18 23:49:12', '2020-10-18 23:49:12'),
(313, '2020-07-01', '2020-07-07', 3, 1, '1000.00', 0, NULL, NULL, '2020-10-18 23:49:19', '2020-10-18 23:49:19'),
(314, '2020-09-01', '2020-09-07', 3, 6, '3825.00', 0, NULL, NULL, '2020-10-18 23:49:28', '2020-10-18 23:49:28'),
(315, '2020-10-01', '2020-10-07', 3, 2, '1450.00', 0, NULL, NULL, '2020-10-18 23:49:37', '2020-10-18 23:49:37'),
(316, '2020-06-01', '2020-06-07', 5, 2, '400.00', 0, NULL, NULL, '2020-10-18 23:53:26', '2020-10-18 23:53:26'),
(317, '2020-07-01', '2020-07-07', 5, 3, '5000.00', 0, NULL, NULL, '2020-10-18 23:53:35', '2020-10-18 23:53:35'),
(318, '2020-09-01', '2020-09-07', 5, 3, '2306.50', 0, NULL, NULL, '2020-10-18 23:53:47', '2020-10-18 23:53:47'),
(319, '2020-06-01', '2020-06-07', 5, 1, '950.00', 0, NULL, NULL, '2020-10-18 23:56:48', '2020-10-18 23:56:48'),
(320, '2020-07-01', '2020-07-07', 5, 1, '400.00', 0, NULL, NULL, '2020-10-18 23:56:55', '2020-10-18 23:56:55'),
(321, '2020-09-01', '2020-09-07', 5, 2, '1950.00', 0, NULL, NULL, '2020-10-18 23:57:04', '2020-10-18 23:57:04'),
(322, '2020-03-01', '2020-03-07', 5, 8, '3100.00', 0, NULL, NULL, '2020-10-19 00:03:08', '2020-10-19 00:03:08'),
(323, '2020-06-01', '2020-06-07', 5, 5, '1318.00', 0, NULL, NULL, '2020-10-19 00:03:18', '2020-10-19 00:03:18'),
(324, '2020-07-01', '2020-07-07', 5, 8, '1661.50', 0, NULL, NULL, '2020-10-19 00:03:28', '2020-10-19 00:03:28'),
(325, '2020-08-01', '2020-08-07', 5, 20, '6280.00', 0, NULL, NULL, '2020-10-19 00:03:39', '2020-10-19 00:03:39'),
(326, '2020-09-01', '2020-09-07', 5, 8, '3160.00', 0, NULL, NULL, '2020-10-19 00:03:50', '2020-10-19 00:03:50'),
(327, '2020-10-01', '0001-10-07', 5, 3, '2575.00', 0, NULL, NULL, '2020-10-19 00:04:00', '2020-10-19 00:04:00'),
(328, '2020-01-01', '2020-01-07', 5, 3, '30000.00', 0, NULL, NULL, '2020-10-19 00:07:13', '2020-10-19 00:07:13'),
(329, '2020-04-01', '2020-04-07', 5, 3, '100.00', 0, NULL, NULL, '2020-10-19 00:07:23', '2020-10-19 00:07:23'),
(330, '2020-05-01', '2020-05-07', 5, 1, '500.00', 0, NULL, NULL, '2020-10-19 00:07:31', '2020-10-19 00:07:31'),
(331, '2020-06-01', '2020-06-07', 5, 7, '1450.00', 0, NULL, NULL, '2020-10-19 00:07:39', '2020-10-19 00:07:39'),
(332, '2020-07-01', '2020-07-07', 5, 6, '13700.00', 0, NULL, NULL, '2020-10-19 00:07:49', '2020-10-19 00:07:49'),
(333, '2020-09-01', '2020-09-07', 5, 2, '800.00', 0, NULL, NULL, '2020-10-19 00:08:00', '2020-10-19 00:08:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `services`
--

INSERT INTO `services` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Desenvolvimento de Aplicativos', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(2, 'Desenvolvimento de Software', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(3, 'Criação de Sites', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(4, 'Maquete Eletrônica', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(5, 'Projeto Estrutural', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(6, 'Aula Particular', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(7, 'Projeto Arquitetônico', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(8, 'Planejamento Estratégico', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(9, 'Gestão de Qualidade', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(10, 'Pesquisa de Mercado', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(11, 'Manual de Boas Práticas', '2020-09-29 22:18:23', '2020-09-29 22:18:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Matheus Cândido', 'matheus@email.com', '$2y$10$/0R2ml6El2f9qcpgSeSxg.OTq5iFa.9rU7wLw8nEdKWEgBlxJRg52', NULL, '2020-09-29 22:30:41', '2020-09-29 22:30:41', '/profiles/default.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cores`
--
ALTER TABLE `cores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `core_goals`
--
ALTER TABLE `core_goals`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `degree_junior_enterprise`
--
ALTER TABLE `degree_junior_enterprise`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `federations`
--
ALTER TABLE `federations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `federation_goals`
--
ALTER TABLE `federation_goals`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `foundations`
--
ALTER TABLE `foundations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_imageable_id_imageable_type_index` (`imageable_id`,`imageable_type`);

--
-- Índices para tabela `junior_enterprises`
--
ALTER TABLE `junior_enterprises`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `junior_enterprise_goals`
--
ALTER TABLE `junior_enterprise_goals`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `junior_enterprise_project`
--
ALTER TABLE `junior_enterprise_project`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `junior_enterprise_service`
--
ALTER TABLE `junior_enterprise_service`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Índices para tabela `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Índices para tabela `ods`
--
ALTER TABLE `ods`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ods_project`
--
ALTER TABLE `ods_project`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cores`
--
ALTER TABLE `cores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `core_goals`
--
ALTER TABLE `core_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `degree_junior_enterprise`
--
ALTER TABLE `degree_junior_enterprise`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `federations`
--
ALTER TABLE `federations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `federation_goals`
--
ALTER TABLE `federation_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `foundations`
--
ALTER TABLE `foundations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `junior_enterprises`
--
ALTER TABLE `junior_enterprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `junior_enterprise_goals`
--
ALTER TABLE `junior_enterprise_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de tabela `junior_enterprise_project`
--
ALTER TABLE `junior_enterprise_project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=955;

--
-- AUTO_INCREMENT de tabela `junior_enterprise_service`
--
ALTER TABLE `junior_enterprise_service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ods`
--
ALTER TABLE `ods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ods_project`
--
ALTER TABLE `ods_project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT de tabela `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
