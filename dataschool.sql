-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-01-2023 a las 18:36:39
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dataschool`
--
CREATE DATABASE IF NOT EXISTS `dataschool` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dataschool`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `name`) VALUES
(1, 'Administrador '),
(2, 'Super Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  `idState` int(11) DEFAULT NULL,
  `typeClass` varchar(100) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `monto` int(10) NOT NULL,
  `fechaPago` date NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `estadoPago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastName`, `email`, `password`, `idRol`, `idState`, `typeClass`, `cantidad`, `monto`, `fechaPago`, `comentario`, `estadoPago`) VALUES
(1, 'Carlos Miguel', 'Hernandez', 'carloshernandez@gmail.com', '1234', 1, 1, 'Presencial', 12, 120, '2023-01-21', 'Se le realizo el pago en efectivo', 'Sin Pagar'),
(2, 'Oscar Miguel', 'Hernandez', 'oscarhernandez@email.com', '1234', 1, 1, 'Presencial', 200, 500, '2023-01-15', 'Se cancelara en efectivo cada 15 de cada mes', 'Sin Pagar'),
(3, 'Pedro Santiago', 'Martinez Alvarenga', 'pedrosantiago@email.com', '1234', 1, 1, 'Online', 450, 800, '2023-01-15', 'Se le cancelara cada 15 de cada mes', 'Sin Pagar'),
(4, 'Carmen Maria', 'Lopez Castillo', 'carmencastillo@email.com', '1234', 1, 1, 'Presencial', 300, 450, '2023-01-17', 'Se le cancelara el 17 y 28 de cada mes', 'Pagado'),
(5, 'Juan Francisco', 'Medrano Orellana', 'juanorellana@email.com', '1234', 1, 1, 'Presencial', 450, 520, '2023-01-29', 'se le cancelara cada 29 de cada mes, el pago se realizara en efectivo', 'Sin Pagar'),
(6, 'Oscar Medina', 'Orellana Castro', 'oscarcastro@mail.com', '1234', 1, 1, 'Presencial', 420, 350, '2023-01-20', 'Se realizo el pago', 'Sin Pagar');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `idState` (`idState`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`idState`) REFERENCES `states` (`id`);
--
-- Base de datos: `indigo`
--
CREATE DATABASE IF NOT EXISTS `indigo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `indigo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bussines_profiles`
--

CREATE TABLE `bussines_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUser` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `idBussinesType` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `reviews` varchar(255) NOT NULL,
  `idTourisPlace` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bussines_profiles`
--

INSERT INTO `bussines_profiles` (`id`, `idUser`, `description`, `location`, `idBussinesType`, `message`, `reviews`, `idTourisPlace`, `score`, `created_at`, `updated_at`) VALUES
(2, 1, 'Tengo mi taller artesanal desde hace 5 años', 'San Salvador AV. Gavidia', 1, 'Ningun mensaje', 'Ningun comentario', 1, 2, '2022-12-22 06:19:15', '2022-12-22 06:19:15'),
(3, 1, 'Tengo mi taller artesanal desde hace 5 años', 'San Salvador AV. Gavidia', 1, 'Ningun mensaje', 'Ningun comentario', 1, 2, '2022-12-22 06:20:44', '2022-12-22 06:20:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bussines_types`
--

CREATE TABLE `bussines_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bussines_types`
--

INSERT INTO `bussines_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Restaurante', '2022-12-22 06:03:25', '2022-12-22 06:03:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hoteles', '2022-12-22 06:03:26', '2022-12-22 06:03:26'),
(2, 'Hoteles', '2022-12-22 06:19:19', '2022-12-22 06:19:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departaments`
--

CREATE TABLE `departaments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departaments`
--

INSERT INTO `departaments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Santa Ana', '2022-12-22 05:42:18', '2022-12-22 05:42:18'),
(2, 'San Salvador', '2022-12-22 05:49:11', '2022-12-22 05:49:11'),
(3, 'Santa Ana', '2022-12-22 06:03:23', '2022-12-22 06:03:23'),
(4, 'San Miguel', '2022-12-22 06:05:54', '2022-12-22 06:05:54'),
(5, 'Zacatecoluca', '2022-12-23 07:42:41', '2022-12-23 07:42:41'),
(6, 'Zacatecoluca', '2022-12-23 07:42:46', '2022-12-23 07:42:46'),
(7, 'Zacatecoluca', '2022-12-23 07:44:37', '2022-12-23 07:44:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idBussinesProfile` bigint(20) UNSIGNED NOT NULL,
  `idTouristProfile` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `input` varchar(255) NOT NULL,
  `output` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_09_21_175436_create_tokensindigos_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_13_004451_create_departaments_table', 1),
(6, '2022_06_13_004735_create_municipalities_table', 1),
(7, '2022_07_13_003209_create_tokens_table', 1),
(8, '2022_07_13_004208_create_select_profiles_table', 1),
(9, '2022_07_14_000000_create_users_table', 1),
(10, '2022_08_11_044703_create_tourist_place_types_table', 1),
(11, '2022_09_12_044927_create_tourist_places_table', 1),
(12, '2022_12_12_205257_create_bussines_types_table', 1),
(13, '2022_12_13_064016_create_tourist_profiles_table', 1),
(14, '2022_12_13_064017_create_bussines_profiles_table', 1),
(15, '2022_12_13_072311_create_categories_table', 1),
(16, '2022_12_13_073927_create_services_table', 1),
(17, '2022_12_13_172836_create_messages_table', 1),
(18, '2022_12_13_173836_create_reviews_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipalities`
--

CREATE TABLE `municipalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `idDepartaments` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipalities`
--

INSERT INTO `municipalities` (`id`, `name`, `idDepartaments`, `created_at`, `updated_at`) VALUES
(1, 'Apaneca', 1, '2022-12-22 06:03:23', '2022-12-22 06:03:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', 1, 'token', 'ac21f4e72afbcfdd7d3188653e397e29c13492a8869597875cfd2a1f57dcb404', '[\"*\"]', NULL, NULL, '2022-12-22 12:10:04', '2022-12-22 12:10:04'),
(5, 'App\\Models\\User', 1, 'token', 'e71001c5c60a5a7ba84885e32130918da8f5940ffa3a989e46ed6df7200ded74', '[\"*\"]', NULL, NULL, '2022-12-22 12:22:57', '2022-12-22 12:22:57'),
(6, 'App\\Models\\User', 1, 'token', '930fd620a6e678b236d5960a8970f5427b7a83467ce46c1e49834a57b75377bf', '[\"*\"]', NULL, NULL, '2022-12-22 14:20:27', '2022-12-22 14:20:27'),
(7, 'App\\Models\\User', 1, 'token', 'a0b23891a11b92bfb6fc20d656ccc10b332029b5bed1c925deedd75e979c1c8d', '[\"*\"]', NULL, NULL, '2022-12-22 15:01:46', '2022-12-22 15:01:46'),
(8, 'App\\Models\\User', 1, 'token', 'e2db1ece752c9e72d99444dcf13e0dbc19ef587bfc61c362bdfb525e63e19b18', '[\"*\"]', NULL, NULL, '2022-12-22 15:03:53', '2022-12-22 15:03:53'),
(9, 'App\\Models\\User', 1, 'token', '51ff8e474d3de5dc8a94c86cc5511f6c2485b332f5ba11165804f979de1b1a92', '[\"*\"]', NULL, NULL, '2022-12-22 15:04:31', '2022-12-22 15:04:31'),
(10, 'App\\Models\\User', 1, 'token', '7f9f4d3434eaefea92cbe655e383af2936cc3a34940e82229a61fde8b135ae57', '[\"*\"]', NULL, NULL, '2022-12-22 15:05:28', '2022-12-22 15:05:28'),
(11, 'App\\Models\\User', 1, 'token', 'd2f0470514f9534412285544bfc75746248a4f848fe79c746da5a5a9572cfa71', '[\"*\"]', NULL, NULL, '2022-12-22 15:21:40', '2022-12-22 15:21:40'),
(12, 'App\\Models\\User', 1, 'token', 'd7be626daf6e8d84dbe68ae0782e7d6c7fb5b4bee6a03410eaafa0fd8a73a703', '[\"*\"]', '2022-12-22 21:27:17', NULL, '2022-12-22 21:27:13', '2022-12-22 21:27:17'),
(13, 'App\\Models\\User', 1, 'token', '77513dc5c6add07be992f204f25a68bc4d301c67fb4b0c4914848e3cf3a15fc0', '[\"*\"]', '2022-12-23 03:42:44', NULL, '2022-12-22 21:27:46', '2022-12-23 03:42:44'),
(14, 'App\\Models\\User', 1, 'token', 'c8e7decbf748eb4a0b3948804b30662ce81f36d7541b1eb74d396ceae903f6ea', '[\"*\"]', '2022-12-23 02:43:21', NULL, '2022-12-23 01:24:07', '2022-12-23 02:43:21'),
(15, 'App\\Models\\User', 1, 'token', 'b65f4c4f9f8e3f93188a838487de7cae87cae1c4efef5bde1635dec22f008fcf', '[\"*\"]', NULL, NULL, '2022-12-23 01:24:21', '2022-12-23 01:24:21'),
(16, 'App\\Models\\User', 1, 'token', 'b068a76ad6a8928fc0583cb7833a7dadc3ba44269bf8f5489ed17ceb8eb08b95', '[\"*\"]', NULL, NULL, '2022-12-23 01:33:42', '2022-12-23 01:33:42'),
(17, 'App\\Models\\User', 1, 'token', '5b31ec905dbba54f181f024c72a7e01b7d9d39099e0fd269e8c0bae75c81dbc4', '[\"*\"]', NULL, NULL, '2022-12-23 02:05:47', '2022-12-23 02:05:47'),
(18, 'App\\Models\\User', 1, 'token', '13dd33c869fbc4edc8a2d539b7acde35205319430d669f116842a0e681909af0', '[\"*\"]', NULL, NULL, '2022-12-23 02:08:08', '2022-12-23 02:08:08'),
(19, 'App\\Models\\User', 1, 'token', '4b94a8a2891a58a0d87f1555565849a8240fc51941187aaa22346a320b64442b', '[\"*\"]', NULL, NULL, '2022-12-23 02:13:38', '2022-12-23 02:13:38'),
(20, 'App\\Models\\User', 1, 'token', '286575ba16ee32094adddc8aeebda646ed5bee0d56a149d4665fb900e3977861', '[\"*\"]', NULL, NULL, '2022-12-23 02:18:00', '2022-12-23 02:18:00'),
(21, 'App\\Models\\User', 1, 'token', '6e914cdb67f69592a3adb47aec7ff41db9d4e8da1e92991e1c4bcf7f67e1e8f0', '[\"*\"]', NULL, NULL, '2022-12-23 02:19:06', '2022-12-23 02:19:06'),
(22, 'App\\Models\\User', 1, 'token', '8bf3d3613b22843b669bfe50cd0b7b17d7def37f80c77c4ea7732132a7e9c968', '[\"*\"]', NULL, NULL, '2022-12-23 02:21:43', '2022-12-23 02:21:43'),
(23, 'App\\Models\\User', 1, 'token', '9bec512b7ddd50549bc9d2cbf60cae3e6b1f95807d7f2a135172596f4140f42f', '[\"*\"]', NULL, NULL, '2022-12-23 02:22:55', '2022-12-23 02:22:55'),
(24, 'App\\Models\\User', 1, 'token', 'aac6ff0ed17ebcc130bd198f547f70d23db71ad79ca0f5d79a237cf8c999f2d3', '[\"*\"]', NULL, NULL, '2022-12-23 02:23:08', '2022-12-23 02:23:08'),
(25, 'App\\Models\\User', 1, 'token', '96b98ee93c4436eb1ae2d1decd292d6a96791889dd0c4b39fa7d665d5bc34549', '[\"*\"]', NULL, NULL, '2022-12-23 02:23:24', '2022-12-23 02:23:24'),
(26, 'App\\Models\\User', 1, 'token', '5f33312623b3d91219f1cfdf3cf1874dd5a31fbcb0fa796e104a5b673f0349ea', '[\"*\"]', NULL, NULL, '2022-12-23 02:23:37', '2022-12-23 02:23:37'),
(27, 'App\\Models\\User', 1, 'token', '12aee764a6a8029ff5e80380fba70bf251b77967c414f7ecaacaecf382aa5833', '[\"*\"]', NULL, NULL, '2022-12-23 02:25:44', '2022-12-23 02:25:44'),
(28, 'App\\Models\\User', 1, 'token', 'c913393206fd567035373c76a6d11271253785d622ecda2342740191264ce1fd', '[\"*\"]', NULL, NULL, '2022-12-23 02:26:19', '2022-12-23 02:26:19'),
(29, 'App\\Models\\User', 1, 'token', '5e58d51a95c6489a78c8d6b0bf27c0cc14cf39fdc78e0c7aaaa10d2399469523', '[\"*\"]', NULL, NULL, '2022-12-23 02:26:51', '2022-12-23 02:26:51'),
(30, 'App\\Models\\User', 1, 'token', '07cf9b8af9f0135d8f2ddf382610dc9ea98661bb94a8c204f087ac73ba2baf42', '[\"*\"]', NULL, NULL, '2022-12-23 02:26:56', '2022-12-23 02:26:56'),
(31, 'App\\Models\\User', 1, 'token', '6c1982edbccb829740152931f72095462ba0c66fd73695e58df019eeb02c11d4', '[\"*\"]', NULL, NULL, '2022-12-23 02:27:00', '2022-12-23 02:27:00'),
(32, 'App\\Models\\User', 1, 'token', '1efbacf3d865922402fee52b61c5536319592bd5196150bce575bfc1b027cad3', '[\"*\"]', NULL, NULL, '2022-12-23 02:27:02', '2022-12-23 02:27:02'),
(33, 'App\\Models\\User', 1, 'token', 'aa3948f15f7514daeb959628b7f89a164d543a9d7d5ecfc711de2ba3f51fe975', '[\"*\"]', NULL, NULL, '2022-12-23 02:27:57', '2022-12-23 02:27:57'),
(34, 'App\\Models\\User', 1, 'token', 'c6def8a2ba143c42ce1dfc8812a1124acc98706bc0fcdd13d2c520500b54e32b', '[\"*\"]', NULL, NULL, '2022-12-23 02:28:50', '2022-12-23 02:28:50'),
(35, 'App\\Models\\User', 1, 'token', '31545c2b58d8a44dfae4ab5de7e504e94275ff8f967850aea4f34dd329ed84d2', '[\"*\"]', NULL, NULL, '2022-12-23 02:30:19', '2022-12-23 02:30:19'),
(36, 'App\\Models\\User', 1, 'token', '2169c7a29021e33d73a99d172ecebeef5ad4658a53adefa9b86680f734825f6d', '[\"*\"]', NULL, NULL, '2022-12-23 02:43:35', '2022-12-23 02:43:35'),
(37, 'App\\Models\\User', 1, 'token', 'c7a8cc70f06e04aa075899fdef66ebdfea5949075d1db1eb4d5935c412fa0965', '[\"*\"]', NULL, NULL, '2022-12-23 02:45:32', '2022-12-23 02:45:32'),
(38, 'App\\Models\\User', 1, 'token', '120a612893be0eed65604fe79433c0706d8067ecfe94a269581ac1530132b34c', '[\"*\"]', NULL, NULL, '2022-12-23 02:47:34', '2022-12-23 02:47:34'),
(39, 'App\\Models\\User', 1, 'token', '66aa644f08601f115ca5450348bad44f380cfa7d2854ffb427df16b6c327a719', '[\"*\"]', NULL, NULL, '2022-12-23 02:51:19', '2022-12-23 02:51:19'),
(40, 'App\\Models\\User', 1, 'token', '864b82cbf2f0114c34555b7fe5bcebc15c57c74ba195f3ab7bbfa633e1b5e8f3', '[\"*\"]', NULL, NULL, '2022-12-23 02:52:26', '2022-12-23 02:52:26'),
(41, 'App\\Models\\User', 1, 'token', '3e08d2c3f48d6ec046d87547103eff7a70f07dc00f59a3bd7f398278417a5873', '[\"*\"]', NULL, NULL, '2022-12-23 03:21:30', '2022-12-23 03:21:30'),
(42, 'App\\Models\\User', 1, 'token', 'df17b396db41d9a28fcaa52f3ff13cd465b78f20c5969aa570ae77ef4eee27b2', '[\"*\"]', NULL, NULL, '2022-12-23 03:21:33', '2022-12-23 03:21:33'),
(43, 'App\\Models\\User', 1, 'token', 'b56c1296784776819ae5edf4d65a375dd192078f7a041e31403af0ccce80a13e', '[\"*\"]', NULL, NULL, '2022-12-23 03:21:37', '2022-12-23 03:21:37'),
(44, 'App\\Models\\User', 1, 'token', 'd8c931ff1a8035d3d23e1a373395a310db1f878deff269853b06783ed4d8146c', '[\"*\"]', NULL, NULL, '2022-12-23 03:21:38', '2022-12-23 03:21:38'),
(45, 'App\\Models\\User', 1, 'token', '5277c8b9a5e2ed74b4e76ff654eac8b6f347893fc5b24886c4c8240a5881b7b4', '[\"*\"]', NULL, NULL, '2022-12-23 03:22:45', '2022-12-23 03:22:45'),
(46, 'App\\Models\\User', 1, 'token', '9f338b00f706cba5d9d963d0c00f18eb08fbe041ccfe31d3339ccd624fa75233', '[\"*\"]', NULL, NULL, '2022-12-23 03:22:48', '2022-12-23 03:22:48'),
(47, 'App\\Models\\User', 1, 'token', '5fb9e7da53d138949a0bd742284c21deb05b23635319510286c91f534fd71bec', '[\"*\"]', NULL, NULL, '2022-12-23 03:23:32', '2022-12-23 03:23:32'),
(48, 'App\\Models\\User', 2, 'token', '850ee45fc9c1f0cbfd60ec7d0da59065d5948352393c860e216be00131759caf', '[\"*\"]', '2022-12-23 03:57:43', NULL, '2022-12-23 03:51:24', '2022-12-23 03:57:43'),
(49, 'App\\Models\\User', 2, 'token', '5fff233de674cca17be4ffa31563c222a76a2ceb2a6a149cc8a7485c521dd1cd', '[\"*\"]', NULL, NULL, '2022-12-23 03:51:31', '2022-12-23 03:51:31'),
(50, 'App\\Models\\User', 2, 'token', '3b53b5fe5bc69d7cdf343eec512c493c2f12fceec37fbddc9b7599016dc50115', '[\"*\"]', NULL, NULL, '2022-12-23 03:51:32', '2022-12-23 03:51:32'),
(51, 'App\\Models\\User', 2, 'token', 'abd7eb026125b27bed6a17dc8149276255eaee4a77da2e5bd797b6953e6c6624', '[\"*\"]', NULL, NULL, '2022-12-23 03:51:39', '2022-12-23 03:51:39'),
(52, 'App\\Models\\User', 2, 'token', '6a1b4334a221604ee33aa9515ff93d7717f527567abc79b87ddc434be7bccbbc', '[\"*\"]', NULL, NULL, '2022-12-23 03:51:52', '2022-12-23 03:51:52'),
(53, 'App\\Models\\User', 1, 'token', 'b58577bc9155d25229d8edb8145d8e9d9e4a83e5fbef09f830a094a8409e72b0', '[\"*\"]', NULL, NULL, '2022-12-23 03:52:31', '2022-12-23 03:52:31'),
(54, 'App\\Models\\User', 1, 'token', '7fd40c79ace3b992d23eebc03275a412360aa0208401fb591fdecfcded3e6cc9', '[\"*\"]', NULL, NULL, '2022-12-23 03:52:34', '2022-12-23 03:52:34'),
(55, 'App\\Models\\User', 1, 'token', '080f6fb82e5b9231bc962d1b194d3df56d71cb8132b9aaf50ab2ec2ceef46a76', '[\"*\"]', NULL, NULL, '2022-12-23 03:53:03', '2022-12-23 03:53:03'),
(56, 'App\\Models\\User', 1, 'token', 'addecadca01f6d517e82ebe590d9b012fad5925c1ea8316a4112c43e27e48409', '[\"*\"]', NULL, NULL, '2022-12-23 03:53:18', '2022-12-23 03:53:18'),
(57, 'App\\Models\\User', 1, 'token', 'f5090e827053f30b7e6ce52fa9962a49b355f701694ba1e6372a956f046a0043', '[\"*\"]', NULL, NULL, '2022-12-23 03:53:30', '2022-12-23 03:53:30'),
(58, 'App\\Models\\User', 1, 'token', '5c75b9386e8540234d0cb64ded752e60f145573847f52423c84e0678770e4422', '[\"*\"]', NULL, NULL, '2022-12-23 03:54:15', '2022-12-23 03:54:15'),
(59, 'App\\Models\\User', 1, 'token', '88c3a613ea6641b8cac60277e482987b029b04e72df7fbdfe6ae69850e90c3e3', '[\"*\"]', NULL, NULL, '2022-12-23 03:54:22', '2022-12-23 03:54:22'),
(60, 'App\\Models\\User', 1, 'token', 'ac88a2c2d00b73bb4fae1cef36bd36207b3383fd95206bb21f0475dea46f1e5d', '[\"*\"]', NULL, NULL, '2022-12-23 03:55:11', '2022-12-23 03:55:11'),
(61, 'App\\Models\\User', 1, 'token', '2ae217a88d0d9127c5b29c8d39e429a79038d2e7d8218e525802751a1e293629', '[\"*\"]', NULL, NULL, '2022-12-23 03:55:14', '2022-12-23 03:55:14'),
(62, 'App\\Models\\User', 1, 'token', '8ba4bc960049d683e100c4ca1a30ea7b729b57832fd47e27d011b5cf95cde56a', '[\"*\"]', NULL, NULL, '2022-12-23 03:57:49', '2022-12-23 03:57:49'),
(63, 'App\\Models\\User', 1, 'token', 'ec36d7c7b6bcff68dc28ac67e03b3f3a6e62a398d615e8b5a759312e5b9e7f52', '[\"*\"]', NULL, NULL, '2022-12-23 03:57:51', '2022-12-23 03:57:51'),
(64, 'App\\Models\\User', 1, 'token', '687dce6e8d0a6a86c8c778b7f9efaba1835fae16c274cf213c88e2eadb393fb9', '[\"*\"]', NULL, NULL, '2022-12-23 03:58:19', '2022-12-23 03:58:19'),
(65, 'App\\Models\\User', 2, 'token', 'e040209056e0f0411f6281a4b5c4b79b45a9c948d5209cf87ff79eac39b63b20', '[\"*\"]', NULL, NULL, '2022-12-23 03:58:46', '2022-12-23 03:58:46'),
(66, 'App\\Models\\User', 2, 'token', '6599405b9545cbabc854d89a0f6bf2df9efa556db683ea37002da035f5541d5e', '[\"*\"]', NULL, NULL, '2022-12-23 03:59:14', '2022-12-23 03:59:14'),
(67, 'App\\Models\\User', 2, 'token', '64c2041e17624fddde77f70a7542f19f22a90ed24e6d3062298b351a295d1cef', '[\"*\"]', NULL, NULL, '2022-12-23 04:00:04', '2022-12-23 04:00:04'),
(68, 'App\\Models\\User', 2, 'token', '17f856fa405b8d4e5957173a108fb8b8e8334c0c24fb76bcc700940b39f144e9', '[\"*\"]', NULL, NULL, '2022-12-23 04:00:10', '2022-12-23 04:00:10'),
(69, 'App\\Models\\User', 2, 'token', 'c5d1396223ef10dca9af48bc260d438d08fb532074fad64597e539a94febbc22', '[\"*\"]', NULL, NULL, '2022-12-23 04:00:11', '2022-12-23 04:00:11'),
(70, 'App\\Models\\User', 2, 'token', '8f91547821d4d17de115ff824cc92775644843471b6d6eef0832ce6814654978', '[\"*\"]', NULL, NULL, '2022-12-23 04:00:11', '2022-12-23 04:00:11'),
(71, 'App\\Models\\User', 2, 'token', '04651e2ff23b339842f087d547d9dcb3e7ec0c2eb63656e33b0e2312840925f2', '[\"*\"]', NULL, NULL, '2022-12-23 04:00:12', '2022-12-23 04:00:12'),
(72, 'App\\Models\\User', 2, 'token', 'af79d376474a392a093737832233cfb81346367376b4fc9dc9809036131f8ab3', '[\"*\"]', NULL, NULL, '2022-12-23 04:01:01', '2022-12-23 04:01:01'),
(73, 'App\\Models\\User', 2, 'token', '3538a439a01ce21b2c47a68b7e6b53f329fc48cdcc0336f581d5856470727a7a', '[\"*\"]', NULL, NULL, '2022-12-23 04:01:08', '2022-12-23 04:01:08'),
(74, 'App\\Models\\User', 2, 'token', '3c53ede412f560e022130679fe09d9349637567df0a6f9c2abd3343126facc63', '[\"*\"]', NULL, NULL, '2022-12-23 04:01:22', '2022-12-23 04:01:22'),
(75, 'App\\Models\\User', 2, 'token', 'cf809ada95e6c3b9a6ce2b56837f52998fa9d29b1c9b26c3cf8a1f8782333598', '[\"*\"]', NULL, NULL, '2022-12-23 04:01:23', '2022-12-23 04:01:23'),
(76, 'App\\Models\\User', 2, 'token', '9371dbac5ca589f99a76d226aee8a0018dd07668b7758fc892a3ee172c2eab64', '[\"*\"]', NULL, NULL, '2022-12-23 04:01:24', '2022-12-23 04:01:24'),
(77, 'App\\Models\\User', 2, 'token', 'd61d8ab7c567e6208e7054ee46147a4eb235395526e148dd8580e258bc5127c0', '[\"*\"]', '2022-12-23 04:18:59', NULL, '2022-12-23 04:01:30', '2022-12-23 04:18:59'),
(78, 'App\\Models\\User', 1, 'token', 'c6e13f047e404a135043cbb42c6693ac6490a9fd686eddfda4de2934d33bdc22', '[\"*\"]', '2022-12-23 04:19:29', NULL, '2022-12-23 04:19:28', '2022-12-23 04:19:29'),
(79, 'App\\Models\\User', 1, 'token', '25020b58f0f4fb5fa3e49415a2a844082d62b7df0c55da376c6322e722f72a38', '[\"*\"]', '2022-12-23 04:20:24', NULL, '2022-12-23 04:20:24', '2022-12-23 04:20:24'),
(80, 'App\\Models\\User', 1, 'token', '383a261048f52224aa5b04e2d884d902f9631fc0aab56687ded399c802f7b5f8', '[\"*\"]', '2022-12-23 04:20:38', NULL, '2022-12-23 04:20:38', '2022-12-23 04:20:38'),
(81, 'App\\Models\\User', 2, 'token', 'a50de482f236e5e5b6d1ae5ae184b761b0969c55cf125c118f33b1ea6a5e9a0c', '[\"*\"]', '2022-12-23 04:20:57', NULL, '2022-12-23 04:20:57', '2022-12-23 04:20:57'),
(82, 'App\\Models\\User', 2, 'token', '044ac66f27d221c99df73d0b6622e7a62d25be42660601c8799f92ccca70b634', '[\"*\"]', NULL, NULL, '2022-12-23 04:22:36', '2022-12-23 04:22:36'),
(83, 'App\\Models\\User', 2, 'token', 'ddcd567584533b37e67b7d2e61c9a76d3355b5ca3c0bf493fb20887197547963', '[\"*\"]', '2022-12-23 04:27:01', NULL, '2022-12-23 04:25:49', '2022-12-23 04:27:01'),
(84, 'App\\Models\\User', 2, 'token', 'd8678738a64026b946c29d0165faa484404c1da8696f38b3c7775c7c5d22ba95', '[\"*\"]', '2022-12-23 04:44:55', NULL, '2022-12-23 04:29:34', '2022-12-23 04:44:55'),
(85, 'App\\Models\\User', 2, 'token', '90b37d83efd2a4938f824b6d146e5b21039e99a0eb9171e7bfe5cdc7d53f2c25', '[\"*\"]', '2022-12-23 04:37:44', NULL, '2022-12-23 04:37:44', '2022-12-23 04:37:44'),
(86, 'App\\Models\\User', 2, 'token', '4ad638aadf819355e8e645db9d108b7b87eb385f859ddd0a17ea0693d263a8ac', '[\"*\"]', '2022-12-23 04:49:58', NULL, '2022-12-23 04:38:31', '2022-12-23 04:49:58'),
(87, 'App\\Models\\User', 2, 'token', '0279e45d096a672d7da56f314939d266bacfdffa0e15f8800c21c6a160fab5b3', '[\"*\"]', '2022-12-23 05:11:19', NULL, '2022-12-23 04:47:26', '2022-12-23 05:11:19'),
(88, 'App\\Models\\User', 1, 'token', 'f81b808c2bff3e1a68de68c8f0c5776eae5ffeb8bcff6e0a0173c51887989d6c', '[\"*\"]', '2022-12-23 05:32:45', NULL, '2022-12-23 05:03:23', '2022-12-23 05:32:45'),
(89, 'App\\Models\\User', 2, 'token', 'ba509507856d4a88ddf8da2072b6667e1cba39d2a807a56d0583871e339bf54a', '[\"*\"]', '2022-12-23 07:41:19', NULL, '2022-12-23 07:33:29', '2022-12-23 07:41:19'),
(90, 'App\\Models\\User', 2, 'token', '42de591c3b7be4ffab9dd737522714a09b0422b623a7b2e03d2908e097d87cd9', '[\"*\"]', '2022-12-23 07:33:59', NULL, '2022-12-23 07:33:58', '2022-12-23 07:33:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idBussinesProfile` bigint(20) UNSIGNED NOT NULL,
  `idTouristProfile` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `score` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `select_profiles`
--

CREATE TABLE `select_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `select_profiles`
--

INSERT INTO `select_profiles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'TuristProfile', '2022-12-22 06:03:24', '2022-12-22 06:03:24'),
(2, 'Bussines profile', '2022-12-22 06:26:51', '2022-12-22 06:26:51'),
(3, 'Administrador', '2022-12-23 07:45:29', '2022-12-23 07:45:29'),
(4, 'Administrador', '2022-12-23 07:45:31', '2022-12-23 07:45:31'),
(5, 'Employed', '2022-12-23 07:46:44', '2022-12-23 07:46:44'),
(6, 'Employed', '2022-12-23 07:47:10', '2022-12-23 07:47:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idCategory` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `img` varchar(255) NOT NULL,
  `idBussinesProfile` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokensindigos`
--

CREATE TABLE `tokensindigos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tokensindigos`
--

INSERT INTO `tokensindigos` (`id`, `name`, `key`, `created_at`, `updated_at`) VALUES
(1, 'developer', 'string', '2022-12-22 06:03:24', '2022-12-22 06:03:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tourist_places`
--

CREATE TABLE `tourist_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namePlace` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `idMunicipalities` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `gallery` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idTouristPlaceType` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tourist_places`
--

INSERT INTO `tourist_places` (`id`, `namePlace`, `location`, `idMunicipalities`, `description`, `gallery`, `score`, `created_at`, `updated_at`, `idTouristPlaceType`) VALUES
(1, 'Volcan Izalco', 'String', 1, 'Senderismo', 'String', 1, '2022-12-22 06:03:24', '2022-12-22 06:03:24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tourist_place_types`
--

CREATE TABLE `tourist_place_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tourist_place_types`
--

INSERT INTO `tourist_place_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Senderismo', 'string', '2022-12-22 06:03:24', '2022-12-22 06:03:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tourist_profiles`
--

CREATE TABLE `tourist_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUser` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `reviews` varchar(255) NOT NULL,
  `idTouristPlaces` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tourist_profiles`
--

INSERT INTO `tourist_profiles` (`id`, `idUser`, `description`, `location`, `message`, `reviews`, `idTouristPlaces`, `created_at`, `updated_at`) VALUES
(2, 1, 'Soy una persona que me gusta el senderismo', 'String', 'No recibido', 'No realizo', 1, '2022-12-22 06:19:09', '2022-12-22 06:19:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `DUI` varchar(255) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `imgProfile` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dateOfBirth` varchar(255) NOT NULL,
  `idSelectProfile` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastName`, `DUI`, `phoneNumber`, `email`, `password`, `imgProfile`, `gender`, `dateOfBirth`, `idSelectProfile`, `created_at`, `updated_at`) VALUES
(1, 'Rebeca Pineda', 'Martinez', '0223658-1', 26648789, 'rebecapineda@outlook.com', '$2y$10$AIWJGGg3h1jcLsLTKqnv2u70MBprspovx0ZifAJ9035v818s16lK.', 'img.png', 'String', '17-12-1992', 1, '2022-12-22 06:19:00', '2022-12-22 06:19:00'),
(2, 'Juan Pineda', 'Martinez', '0223658-1', 26648789, 'juan@outlook.com', '$2y$10$uMTFqR1FSzW.ctvjJWLOzupqzbSp3tEyrL/HWpSP0B3WypTJXQKli', 'img.png', 'String', '17-12-1992', 1, '2022-12-22 06:51:49', '2022-12-22 06:51:49'),
(3, 'Abisai', 'Melendez', '234234', 23423423, 'abisaimelendez@icloud.com', '$2y$10$eqRwcXwH.PgLiHzphJvr0uKJUpiHjgbp5m2h0HhYX48Ek9Uw9jPJK', 'route/image.png', 'Masculino', '2022-12-22', 1, '2022-12-22 06:55:40', '2022-12-22 06:55:40'),
(4, 'Abisai', 'Melendez', '234234', 23423423, 'melendez@icloud.com', '$2y$10$RpByJwxrjz8V8FPCMigFCOl6PSj07SpOmOG0JaTDIyP/29P9KKabu', 'route/image.png', 'Masculino', '2022-12-22', 2, '2022-12-22 06:56:46', '2022-12-22 06:56:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bussines_profiles`
--
ALTER TABLE `bussines_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bussines_profiles_iduser_foreign` (`idUser`),
  ADD KEY `bussines_profiles_idbussinestype_foreign` (`idBussinesType`);

--
-- Indices de la tabla `bussines_types`
--
ALTER TABLE `bussines_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departaments`
--
ALTER TABLE `departaments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_idbussinesprofile_foreign` (`idBussinesProfile`),
  ADD KEY `messages_idtouristprofile_foreign` (`idTouristProfile`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipalities_iddepartaments_foreign` (`idDepartaments`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_idbussinesprofile_foreign` (`idBussinesProfile`),
  ADD KEY `reviews_idtouristprofile_foreign` (`idTouristProfile`);

--
-- Indices de la tabla `select_profiles`
--
ALTER TABLE `select_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_idcategory_foreign` (`idCategory`),
  ADD KEY `services_idbussinesprofile_foreign` (`idBussinesProfile`);

--
-- Indices de la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tokensindigos`
--
ALTER TABLE `tokensindigos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tourist_places`
--
ALTER TABLE `tourist_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tourist_places_idmunicipalities_foreign` (`idMunicipalities`),
  ADD KEY `tourist_places_idtouristplacetype_foreign` (`idTouristPlaceType`);

--
-- Indices de la tabla `tourist_place_types`
--
ALTER TABLE `tourist_place_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tourist_profiles`
--
ALTER TABLE `tourist_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tourist_profiles_iduser_foreign` (`idUser`),
  ADD KEY `tourist_profiles_idtouristplaces_foreign` (`idTouristPlaces`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_idselectprofile_foreign` (`idSelectProfile`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bussines_profiles`
--
ALTER TABLE `bussines_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bussines_types`
--
ALTER TABLE `bussines_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `departaments`
--
ALTER TABLE `departaments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `select_profiles`
--
ALTER TABLE `select_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tokensindigos`
--
ALTER TABLE `tokensindigos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tourist_places`
--
ALTER TABLE `tourist_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tourist_place_types`
--
ALTER TABLE `tourist_place_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tourist_profiles`
--
ALTER TABLE `tourist_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bussines_profiles`
--
ALTER TABLE `bussines_profiles`
  ADD CONSTRAINT `bussines_profiles_idbussinestype_foreign` FOREIGN KEY (`idBussinesType`) REFERENCES `bussines_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bussines_profiles_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_idbussinesprofile_foreign` FOREIGN KEY (`idBussinesProfile`) REFERENCES `bussines_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_idtouristprofile_foreign` FOREIGN KEY (`idTouristProfile`) REFERENCES `tourist_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipalities`
--
ALTER TABLE `municipalities`
  ADD CONSTRAINT `municipalities_iddepartaments_foreign` FOREIGN KEY (`idDepartaments`) REFERENCES `departaments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_idbussinesprofile_foreign` FOREIGN KEY (`idBussinesProfile`) REFERENCES `bussines_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_idtouristprofile_foreign` FOREIGN KEY (`idTouristProfile`) REFERENCES `tourist_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_idbussinesprofile_foreign` FOREIGN KEY (`idBussinesProfile`) REFERENCES `bussines_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_idcategory_foreign` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tourist_places`
--
ALTER TABLE `tourist_places`
  ADD CONSTRAINT `tourist_places_idmunicipalities_foreign` FOREIGN KEY (`idMunicipalities`) REFERENCES `municipalities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tourist_places_idtouristplacetype_foreign` FOREIGN KEY (`idTouristPlaceType`) REFERENCES `tourist_place_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tourist_profiles`
--
ALTER TABLE `tourist_profiles`
  ADD CONSTRAINT `tourist_profiles_idtouristplaces_foreign` FOREIGN KEY (`idTouristPlaces`) REFERENCES `tourist_places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tourist_profiles_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_idselectprofile_foreign` FOREIGN KEY (`idSelectProfile`) REFERENCES `select_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"dataschool\",\"table\":\"users\"},{\"db\":\"dataschool\",\"table\":\"rol\"},{\"db\":\"dataschool\",\"table\":\"states\"},{\"db\":\"indigo\",\"table\":\"users\"},{\"db\":\"indigo\",\"table\":\"roll_ids\"},{\"db\":\"indigo\",\"table\":\"bussines_types\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'dataschool', 'users', '{\"sorted_col\":\"`users`.`fechaPago` ASC\"}', '2023-01-06 16:25:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-01-06 15:12:45', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"NavigationWidth\":244}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
