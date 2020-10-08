-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Out-2020 às 23:42
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
(1, 'Núcleo Norte', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', NULL, ''),
(2, 'Núcleo da Mata', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', NULL, ''),
(3, 'Núcleo Triângulo', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', 'https://hmp.me/ddqi', '#fb6e64'),
(4, 'Núcleo Sul', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', NULL, ''),
(5, 'Núcleo Vertentes', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', NULL, ''),
(6, 'Núcleo Vale do Aço', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', NULL, ''),
(7, 'Núcleo Central', '00.000.000/0000-00', 1, '2020-09-29 22:18:23', '2020-09-29 22:18:23', NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `core_goals`
--

CREATE TABLE `core_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `billing` double(9,2) NOT NULL,
  `projects` int(11) NOT NULL,
  `growth` int(11) NOT NULL,
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

INSERT INTO `core_goals` (`id`, `year`, `billing`, `projects`, `growth`, `mandala`, `connected`, `quantity`, `ies`, `junior_ies`, `impact`, `nps`, `core_id`, `created_at`, `updated_at`) VALUES
(1, 2020, 1000000.00, 600, 0, 0, 0, 0, 0, 0, 0, 0, 3, '2020-10-01 03:00:00', '2020-10-01 03:00:00');

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
(26, 34, 4, NULL, NULL);

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
  `growth` int(11) NOT NULL,
  `mandala` tinyint(1) NOT NULL,
  `connected` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ies` int(11) NOT NULL,
  `junior_ies` int(11) NOT NULL,
  `impact` int(11) NOT NULL,
  `nps` int(11) NOT NULL,
  `federation_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foundations`
--

CREATE TABLE `foundations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `foundations`
--

INSERT INTO `foundations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'UFV', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(2, 'UFMG', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(3, 'UFU', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(4, 'UFJF', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(5, 'UFTM', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(6, 'UNIFEI', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(7, 'UFLA', '2020-09-29 22:18:23', '2020-09-29 22:18:23'),
(8, 'UFSJ', '2020-10-07 03:00:00', '2020-10-07 03:00:00'),
(9, 'UFOP', '2020-10-07 03:00:00', '2020-10-07 03:00:00'),
(10, 'PUC', '2020-10-07 03:00:00', '2020-10-07 03:00:00');

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
(5, 'Projet Consultoria Jr', 'contato@Projet.com.br', 'Empresa Junior de Engenharia de Produção', '2020-09-29', '00.000.000/0000-00', 'www.site.com.br', 40, 1, 2, '2020-09-29 22:18:51', '2020-09-29 22:18:51'),
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
(34, 'Projep', 'contato@projep.com.br', 'Empresa Júnior de Produção da UFTM', '2011-01-01', '00000000', 'www.projepjr.com.br', 34, 5, 3, '2020-10-07 21:46:45', '2020-10-07 21:46:45');

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
(13, 2020, '167500.00', 75, 94, 7, 80, 92, 0, 12, '2020-10-07 18:49:59', '2020-10-07 19:13:18', 75, 80, 5, 0, 0, 0),
(14, 2020, '23400.00', 38, 87, 3, 80, 100, 0, 13, '2020-10-07 18:51:08', '2020-10-07 19:12:28', 75, 80, 3, 0, 0, 0),
(15, 2020, '375000.00', 70, 89, 3, 80, 90, 0, 14, '2020-10-07 18:52:35', '2020-10-07 19:11:47', 75, 80, 5, 0, 0, 0),
(16, 2020, '37400.00', 8, 78, 1, 76, 100, 0, 15, '2020-10-07 18:53:45', '2020-10-07 19:10:44', 75, 50, 4, 0, 0, 0),
(17, 2020, '74500.00', 18, 100, 4, 80, 100, 0, 16, '2020-10-07 18:54:59', '2020-10-07 19:09:55', 75, 60, 5, 0, 0, 0),
(18, 2020, '28000.00', 11, 69, 2, 70, 100, 0, 17, '2020-10-07 18:56:12', '2020-10-07 19:08:39', 60, 80, 1, 0, 0, 0),
(19, 2020, '78200.00', 35, 100, 1, 80, 100, 0, 18, '2020-10-07 18:57:02', '2020-10-07 19:07:54', 75, 80, 5, 0, 0, 0),
(20, 2020, '27500.00', 10, 90, 2, 80, 66, 4, 19, '2020-10-07 18:58:00', '2020-10-08 01:37:51', 75, 50, 2, 84, 5, 2),
(21, 2020, '57000.00', 45, 100, 3, 74, 100, 0, 20, '2020-10-07 18:58:55', '2020-10-07 19:05:41', 75, 60, 4, 0, 0, 0),
(22, 2020, '27000.00', 17, 92, 2, 56, 90, 9, 21, '2020-10-07 18:59:43', '2020-10-08 01:32:19', 75, 80, 3, 77, 10, 2),
(23, 2020, '37500.00', 26, 65, 2, 68, 100, 0, 22, '2020-10-07 19:00:27', '2020-10-07 19:03:32', 75, 80, 3, 0, 0, 0),
(24, 2020, '106000.00', 25, 100, 1, 80, 90, 12, 23, '2020-10-07 19:01:50', '2020-10-08 01:17:41', 75, 80, 5, 97, 13, 1),
(25, 2020, '24000.00', 8, 93, 1, 80, 100, 0, 24, '2020-10-07 19:21:27', '2020-10-07 19:21:58', 75, 55, 3, 0, 0, 0),
(26, 2020, '0.00', 0, 0, 0, 0, 0, 0, 25, '2020-10-07 19:23:18', '2020-10-07 19:23:18', 0, 0, 1, 0, 0, 0),
(27, 2020, '24800.00', 22, 71, 2, 80, 100, 12, 26, '2020-10-07 19:24:48', '2020-10-08 01:43:11', 75, 80, 2, 83, 8, 2),
(28, 2020, '57000.00', 17, 63, 3, 47, 75, 0, 27, '2020-10-07 19:25:46', '2020-10-07 19:28:48', 75, 76, 2, 0, 0, 0),
(29, 2020, '150600.00', 37, 74, 1, 54, 100, 0, 28, '2020-10-07 19:27:22', '2020-10-07 19:31:07', 74, 70, 4, 0, 0, 0),
(30, 2020, '14200.00', 9, 100, 1, 76, 100, 0, 29, '2020-10-07 19:32:25', '2020-10-07 19:33:05', 775, 75, 1, 0, 0, 0),
(31, 2020, '47269.23', 50, 74, 1, 80, 80, 0, 30, '2020-10-07 19:34:14', '2020-10-07 19:35:09', 75, 80, 3, 0, 0, 0),
(32, 2020, '30054.00', 30, 47, 3, 65, 60, 0, 31, '2020-10-07 21:19:29', '2020-10-07 21:36:47', 75, 100, 1, 0, 0, 0),
(33, 2020, '27165.00', 28, 95, 5, 70, 100, 0, 32, '2020-10-07 21:38:19', '2020-10-07 21:41:57', 75, 78, 2, 0, 0, 0),
(34, 2020, '307588.31', 81, 82, 2, 80, 81, 0, 33, '2020-10-07 21:44:38', '2020-10-07 21:52:16', 75, 70, 5, 27, 0, 0),
(35, 2020, '40000.00', 16, 100, 1, 80, 100, 9, 34, '2020-10-07 21:46:45', '2020-10-08 01:41:43', 75, 100, 3, 96, 9, 1);

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
(488, 26, 131, NULL, NULL);

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
(30, 34, 9, NULL, NULL);

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
('1764f88b81ef9766bd826ddc04de8d316f58a4c023879f328a5882192454838f8282d10018a25c1d', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-06 17:34:35', '2020-10-06 17:34:35', '2021-10-06 14:34:35'),
('408f8c9dd2a7e25c11821c915e5b8f30bb85e0e26ef97597a2f30ed18048f38da3ebf133ef225c08', 1, 1, 'matheus@email.com', '[]', 0, '2020-09-29 22:31:05', '2020-09-29 22:31:05', '2021-09-29 19:31:05'),
('6243d1edc1ef0968b4eca97d3f19bc83f7321eacbf29241890830c1677e64702b2efcd0fe3c2a390', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-01 20:38:03', '2020-10-01 20:38:03', '2021-10-01 17:38:03'),
('766372758169b9be2c7835964a2846018f3dc202b3f688804c00a7d02add569a46b6af0a87452acc', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-07 17:39:17', '2020-10-07 17:39:17', '2021-10-07 14:39:17'),
('7ad0d9c4140d2c4672c60503beda045838429b3bbe50fff278937aa682cfd44628f0dea4ebe2e22c', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-02 17:43:19', '2020-10-02 17:43:19', '2021-10-02 14:43:19'),
('ade8a1647a91ede85b64b335f6c3df0eb7a091e5ec1cb33b4d1c83f2fffe848cbf7b10b5c524aa1b', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-01 23:42:00', '2020-10-01 23:42:00', '2021-10-01 20:42:00'),
('d37477cbc92b917bb273c42377ec32c0f23bfceb562bbd08c4bd47e6afddd136cb5ac893220f2729', 1, 1, 'matheus@email.com', '[]', 0, '2020-10-01 23:21:42', '2020-10-01 23:21:42', '2021-10-01 20:21:42'),
('eb4a64b44c1d6c1b2db3b466a8585948f083469bb0b40b68999024414985645169f7aad4f0c972f9', 1, 1, 'matheus@email.com', '[]', 0, '2020-09-29 22:30:42', '2020-09-29 22:30:42', '2021-09-29 19:30:42');

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
(131, '2020-09-01', '2020-09-07', 5, 9, '7400.00', 0, NULL, NULL, '2020-10-08 01:45:45', '2020-10-08 01:45:45');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `degree_junior_enterprise`
--
ALTER TABLE `degree_junior_enterprise`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `foundations`
--
ALTER TABLE `foundations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `junior_enterprises`
--
ALTER TABLE `junior_enterprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `junior_enterprise_goals`
--
ALTER TABLE `junior_enterprise_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `junior_enterprise_project`
--
ALTER TABLE `junior_enterprise_project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=489;

--
-- AUTO_INCREMENT de tabela `junior_enterprise_service`
--
ALTER TABLE `junior_enterprise_service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

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
