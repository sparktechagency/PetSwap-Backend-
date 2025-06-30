-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2025 at 01:29 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petswap`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('0XC6kZuyYYXMmPZ4', 'a:1:{s:11:\"valid_until\";i:1743860092;}', 1746449992),
('16nonVEVX7SwFVEr', 'a:1:{s:11:\"valid_until\";i:1749035053;}', 1751626993),
('3fllMJSqC1WBOE7n', 'a:1:{s:11:\"valid_until\";i:1749034652;}', 1750391912),
('8ey71emsdY56EmFi', 'a:1:{s:11:\"valid_until\";i:1749558116;}', 1752140816),
('cFBKFnDjjY7jhCqd', 'a:1:{s:11:\"valid_until\";i:1744279875;}', 1746871935),
('FgmqrfIBqKlj3e4u', 'a:1:{s:11:\"valid_until\";i:1746538294;}', 1749130294),
('Gox7rHhRblWTSQBd', 'a:1:{s:11:\"valid_until\";i:1747324314;}', 1749916374),
('HgAxrTkWZQI6XZKd', 'a:1:{s:11:\"valid_until\";i:1745235224;}', 1747826024),
('IQo1aRKR2rQ0kizG', 'a:1:{s:11:\"valid_until\";i:1747322683;}', 1749913543),
('JmMvWJUuiRhYvP53', 'a:1:{s:11:\"valid_until\";i:1746600246;}', 1749136686),
('kU8olpzv4EYwQuen', 'a:1:{s:11:\"valid_until\";i:1743848165;}', 1746435605),
('mEYZw8jFrCmJdeGt', 'a:1:{s:11:\"valid_until\";i:1744287235;}', 1744814815),
('MTaqqJ1wDLfMPm2M', 'a:1:{s:11:\"valid_until\";i:1750336142;}', 1752927842),
('QX9s8i3URYyOjns7', 'a:1:{s:11:\"valid_until\";i:1749035069;}', 1751627129),
('rH1Aa6dhSpMHlZ5t', 'a:1:{s:11:\"valid_until\";i:1749450838;}', 1751953138),
('Rr544MZ18ycQWUBf', 'a:1:{s:11:\"valid_until\";i:1749361027;}', 1751953027),
('SLdHEFq5ZZ4zx2wj', 'a:1:{s:11:\"valid_until\";i:1742640986;}', 1745139926),
('Sst6dDa5Wd8din6s', 'a:1:{s:11:\"valid_until\";i:1749719398;}', 1752243418),
('uwDHztMbP4fXWsvH', 'a:1:{s:11:\"valid_until\";i:1749038307;}', 1751629227),
('W23yHvRj3rR3LVI5', 'a:1:{s:11:\"valid_until\";i:1749360547;}', 1751951827),
('XNccxiZyn5wWklWS', 'a:1:{s:11:\"valid_until\";i:1747551920;}', 1750102220),
('Xxhc35DaNVavzJ6u', 'a:1:{s:11:\"valid_until\";i:1749732489;}', 1752324249),
('yTtf53xkqeLvC6Bp', 'a:1:{s:11:\"valid_until\";i:1749730273;}', 1752319693),
('z2BmSW8rOkI0AdlC', 'a:1:{s:11:\"valid_until\";i:1747323740;}', 1749914780);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'category/default_icon.png' COMMENT 'icon should be png format',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `icon`, `name`, `created_at`, `updated_at`) VALUES
(1, 'category/dog.png', 'Dog', '2025-01-27 00:23:47', '2025-05-20 22:14:44'),
(2, 'category/cat.png', 'Cat', '2025-01-27 00:23:47', '2025-05-20 22:14:39'),
(3, 'category/smal_pets.png', 'Small Pets', '2025-01-27 00:23:47', '2025-01-27 00:23:47'),
(4, 'category/fish.png', 'Fish', '2025-01-27 00:23:47', '2025-01-27 00:23:47'),
(5, 'category/bird.png', 'Bird', '2025-01-27 00:23:47', '2025-01-27 00:23:47'),
(6, 'category/reptile.png', 'Reptiles', '2025-01-27 00:23:47', '2025-01-27 00:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '5a3ea0e8-22f7-4e80-97ca-72230ff9f1ca', 'database', 'default', '{\"uuid\":\"5a3ea0e8-22f7-4e80-97ca-72230ff9f1ca\",\"displayName\":\"App\\\\Mail\\\\helpCenterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\helpCenterMail\\\":3:{s:11:\\\"help_center\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\HelpCenter\\\";s:2:\\\"id\\\";i:91;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 41be03b00d2f7-b2fd6387ea4sm1473092a12.76 - gsmtp\". in C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550-5.4.5 Daily...\', Array)\n#1 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(220): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.ask_help_...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\PetSwap-Backend-\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-06-12 09:18:05'),
(2, 'bbc83a16-d73b-4e24-ae2b-590cd24a4d1a', 'database', 'default', '{\"uuid\":\"bbc83a16-d73b-4e24-ae2b-590cd24a4d1a\",\"displayName\":\"App\\\\Mail\\\\helpCenterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\helpCenterMail\\\":3:{s:11:\\\"help_center\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\HelpCenter\\\";s:2:\\\"id\\\";i:92;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 41be03b00d2f7-b2fd6387ea4sm1473092a12.76 - gsmtp\". in C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550-5.4.5 Daily...\', Array)\n#1 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(220): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.ask_help_...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\PetSwap-Backend-\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-06-12 09:18:58'),
(3, 'a9305216-1c01-49e0-b2b8-fefebb6b0790', 'database', 'default', '{\"uuid\":\"a9305216-1c01-49e0-b2b8-fefebb6b0790\",\"displayName\":\"App\\\\Mail\\\\helpCenterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\helpCenterMail\\\":3:{s:11:\\\"help_center\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\HelpCenter\\\";s:2:\\\"id\\\";i:93;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 41be03b00d2f7-b2fd6387ea4sm1473092a12.76 - gsmtp\". in C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550-5.4.5 Daily...\', Array)\n#1 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(220): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.ask_help_...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\PetSwap-Backend-\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-06-12 09:25:34'),
(4, 'b84c1d86-6bb2-482c-9551-63cac0d75efa', 'database', 'default', '{\"uuid\":\"b84c1d86-6bb2-482c-9551-63cac0d75efa\",\"displayName\":\"App\\\\Mail\\\\helpCenterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\helpCenterMail\\\":3:{s:11:\\\"help_center\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\HelpCenter\\\";s:2:\\\"id\\\";i:94;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 41be03b00d2f7-b2fd6387ea4sm1473092a12.76 - gsmtp\". in C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550-5.4.5 Daily...\', Array)\n#1 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(220): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.ask_help_...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\PetSwap-Backend-\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-06-12 09:27:18');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(5, '39537c25-ab32-40de-b527-ff80df08c3c5', 'database', 'default', '{\"uuid\":\"39537c25-ab32-40de-b527-ff80df08c3c5\",\"displayName\":\"App\\\\Mail\\\\helpCenterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\helpCenterMail\\\":3:{s:11:\\\"help_center\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\HelpCenter\\\";s:2:\\\"id\\\";i:95;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 41be03b00d2f7-b2fd6387ea4sm1473092a12.76 - gsmtp\". in C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550-5.4.5 Daily...\', Array)\n#1 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(220): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.ask_help_...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\PetSwap-Backend-\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-06-12 09:28:10'),
(6, '60247366-93c3-4d00-a9da-9e799d209570', 'database', 'default', '{\"uuid\":\"60247366-93c3-4d00-a9da-9e799d209570\",\"displayName\":\"App\\\\Mail\\\\helpCenterMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\helpCenterMail\\\":3:{s:11:\\\"help_center\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:21:\\\"App\\\\Models\\\\HelpCenter\\\";s:2:\\\"id\\\";i:96;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"admin@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550-5.4.5 Daily user sending limit exceeded. For more information on Gmail\r\n550-5.4.5 sending limits go to\r\n550 5.4.5  https://support.google.com/a/answer/166852 41be03b00d2f7-b2fd6387ea4sm1473092a12.76 - gsmtp\". in C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550-5.4.5 Daily...\', Array)\n#1 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(220): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.ask_help_...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(694): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\PetSwap-Backend-\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1205): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\PetSwap-Backend-\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2025-06-12 09:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'How do I create an account?', 'To create an account, click on the \"Sign Up\" button on the homepage, fill in the required details, and follow the verification steps sent to your email.', '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(2, 'Is the app free to use?', 'Yes, the app is free to download and use.', '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(3, 'How can I reset my password?', 'Go to the login screen and click on \"Forgot Password.\" Enter your registered email address, and we\'ll send you a link to reset your password.', '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(4, 'How can I contact support?', 'You can contact our support team by navigating to the \"Help\" section in the app and submitting a support ticket or emailing us at support@example.com.', '2025-01-27 00:23:49', '2025-01-27 00:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint UNSIGNED NOT NULL,
  `platform_fee` float NOT NULL DEFAULT '2',
  `delivery_fee` float NOT NULL DEFAULT '4',
  `buyer_protection_fee` float NOT NULL DEFAULT '5',
  `per_day_promotion_amount` float NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `platform_fee`, `delivery_fee`, `buyer_protection_fee`, `per_day_promotion_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 5.74, 2, 5, '2025-01-27 00:23:49', '2025-01-27 00:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `help_centers`
--

CREATE TABLE `help_centers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_centers`
--

INSERT INTO `help_centers` (`id`, `user_id`, `subject`, `description`, `answer`, `created_at`, `updated_at`) VALUES
(1, 4, 'Hshshs', 'Hdhsjs', NULL, '2025-01-29 03:13:11', '2025-01-29 03:13:11'),
(2, 4, 'Gsgshs', 'Sshsjsj', NULL, '2025-01-29 03:13:31', '2025-01-29 03:13:31'),
(3, 4, 'Hdhsh', 'Bxbsb', NULL, '2025-01-29 03:14:15', '2025-01-29 03:14:15'),
(4, 2, 'Gsgsv', 'Hdhdhd', NULL, '2025-01-29 03:18:49', '2025-01-29 03:18:49'),
(5, 3, 'Hhh', 'Fghhh', NULL, '2025-01-29 04:00:12', '2025-01-29 04:00:12'),
(6, 3, 'Rr', 'Gg', NULL, '2025-01-29 05:01:59', '2025-01-29 05:01:59'),
(7, 70, 'Test title', 'Test description', NULL, '2025-01-29 06:01:10', '2025-01-29 06:01:10'),
(8, 3, 'Test', 'Hi', NULL, '2025-01-29 22:07:32', '2025-01-29 22:07:32'),
(9, 2, 'Test', 'Good morning', NULL, '2025-01-31 01:21:03', '2025-01-31 01:21:03'),
(10, 82, 'G', 'G', NULL, '2025-02-01 04:56:45', '2025-02-01 04:56:45'),
(11, 82, 'G', 'G', NULL, '2025-02-01 04:56:50', '2025-02-01 04:56:50'),
(12, 82, 'G', 'G', NULL, '2025-02-01 04:56:52', '2025-02-01 04:56:52'),
(13, 82, 'G', 'G', NULL, '2025-02-01 04:56:54', '2025-02-01 04:56:54'),
(14, 82, 'G', 'G', NULL, '2025-02-01 04:56:55', '2025-02-01 04:56:55'),
(15, 82, 'G', 'G', NULL, '2025-02-01 04:56:56', '2025-02-01 04:56:56'),
(16, 82, 'G', 'G', NULL, '2025-02-01 04:56:58', '2025-02-01 04:56:58'),
(17, 82, 'G', 'G', NULL, '2025-02-01 04:56:59', '2025-02-01 04:56:59'),
(18, 82, 'G', 'G', NULL, '2025-02-01 04:57:00', '2025-02-01 04:57:00'),
(19, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:04', '2025-02-01 04:57:04'),
(20, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:06', '2025-02-01 04:57:06'),
(21, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:08', '2025-02-01 04:57:08'),
(22, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:09', '2025-02-01 04:57:09'),
(23, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:10', '2025-02-01 04:57:10'),
(24, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:11', '2025-02-01 04:57:11'),
(25, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:12', '2025-02-01 04:57:12'),
(26, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:12', '2025-02-01 04:57:12'),
(27, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:12', '2025-02-01 04:57:12'),
(28, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:13', '2025-02-01 04:57:13'),
(29, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:13', '2025-02-01 04:57:13'),
(30, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:14', '2025-02-01 04:57:14'),
(31, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:14', '2025-02-01 04:57:14'),
(32, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:15', '2025-02-01 04:57:15'),
(33, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:15', '2025-02-01 04:57:15'),
(34, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:16', '2025-02-01 04:57:16'),
(35, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:16', '2025-02-01 04:57:16'),
(36, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:17', '2025-02-01 04:57:17'),
(37, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:18', '2025-02-01 04:57:18'),
(38, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:19', '2025-02-01 04:57:19'),
(39, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:19', '2025-02-01 04:57:19'),
(40, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:20', '2025-02-01 04:57:20'),
(41, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:20', '2025-02-01 04:57:20'),
(42, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:21', '2025-02-01 04:57:21'),
(43, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:21', '2025-02-01 04:57:21'),
(44, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:21', '2025-02-01 04:57:21'),
(45, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:23', '2025-02-01 04:57:23'),
(46, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:24', '2025-02-01 04:57:24'),
(47, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:25', '2025-02-01 04:57:25'),
(48, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:27', '2025-02-01 04:57:27'),
(49, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:28', '2025-02-01 04:57:28'),
(50, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:29', '2025-02-01 04:57:29'),
(51, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:31', '2025-02-01 04:57:31'),
(52, 82, 'Ggsgss', 'Gbds', NULL, '2025-02-01 04:57:32', '2025-02-01 04:57:32'),
(53, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:10', '2025-02-01 04:58:10'),
(54, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:24', '2025-02-01 04:58:24'),
(55, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:26', '2025-02-01 04:58:26'),
(56, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:26', '2025-02-01 04:58:26'),
(57, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:27', '2025-02-01 04:58:27'),
(58, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:27', '2025-02-01 04:58:27'),
(59, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:27', '2025-02-01 04:58:27'),
(60, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:28', '2025-02-01 04:58:28'),
(61, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:28', '2025-02-01 04:58:28'),
(62, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:28', '2025-02-01 04:58:28'),
(63, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:29', '2025-02-01 04:58:29'),
(64, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:30', '2025-02-01 04:58:30'),
(65, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:31', '2025-02-01 04:58:31'),
(66, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:31', '2025-02-01 04:58:31'),
(67, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:32', '2025-02-01 04:58:32'),
(68, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:33', '2025-02-01 04:58:33'),
(69, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:33', '2025-02-01 04:58:33'),
(70, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:34', '2025-02-01 04:58:34'),
(71, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:34', '2025-02-01 04:58:34'),
(72, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:37', '2025-02-01 04:58:37'),
(73, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:37', '2025-02-01 04:58:37'),
(74, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:38', '2025-02-01 04:58:38'),
(75, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:39', '2025-02-01 04:58:39'),
(76, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:39', '2025-02-01 04:58:39'),
(77, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:40', '2025-02-01 04:58:40'),
(78, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:41', '2025-02-01 04:58:41'),
(79, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:41', '2025-02-01 04:58:41'),
(80, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:41', '2025-02-01 04:58:41'),
(81, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:42', '2025-02-01 04:58:42'),
(82, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:43', '2025-02-01 04:58:43'),
(83, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:43', '2025-02-01 04:58:43'),
(84, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:44', '2025-02-01 04:58:44'),
(85, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:44', '2025-02-01 04:58:44'),
(86, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', 'Yo', '2025-02-01 04:58:46', '2025-02-01 05:18:08'),
(87, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', 'Yo', '2025-02-01 04:58:46', '2025-02-01 05:19:48'),
(88, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:47', '2025-02-01 04:58:47'),
(89, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', NULL, '2025-02-01 04:58:49', '2025-02-01 04:58:49'),
(90, 82, 'Gggdbdbsgss', 'Gbdsbsbbd', 'Checking', '2025-02-01 04:58:50', '2025-02-01 05:14:24'),
(91, 90, 'Ggg', 'Gghh', NULL, '2025-06-12 09:18:00', '2025-06-12 09:18:00'),
(92, 90, 'Ggg', 'Gghh', NULL, '2025-06-12 09:18:55', '2025-06-12 09:18:55'),
(93, 90, 'Tyy', 'Fgg', NULL, '2025-06-12 09:25:31', '2025-06-12 09:25:31'),
(94, 90, 'Cvnn', 'Vbnjj', NULL, '2025-06-12 09:27:14', '2025-06-12 09:27:14'),
(95, 90, 'Ghhhhj', 'Cvbbb', NULL, '2025-06-12 09:28:09', '2025-06-12 09:28:09'),
(96, 90, 'Dfvbbnn', 'Fvbbbb', NULL, '2025-06-12 09:35:55', '2025-06-12 09:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_26_053025_create_personal_access_tokens_table', 1),
(5, '2024_12_04_062333_create_categories_table', 1),
(6, '2024_12_04_082834_create_sub_categories_table', 1),
(7, '2024_12_04_110644_create_products_table', 1),
(8, '2024_12_05_095935_create_sliders_table', 1),
(9, '2024_12_05_104833_create_faqs_table', 1),
(10, '2024_12_06_043337_create_wishlists_table', 1),
(11, '2024_12_06_094910_create_ratings_table', 1),
(12, '2024_12_07_052108_create_offer_prices_table', 1),
(13, '2024_12_07_053721_create_notifications_table', 1),
(14, '2024_12_07_095627_create_payments_table', 1),
(15, '2024_12_18_040027_create_settings_table', 1),
(16, '2024_12_18_043335_create_help_centers_table', 1),
(17, '2025_01_04_100842_create_product_promotions_table', 1),
(18, '2025_01_06_055515_create_user_plans_table', 1),
(19, '2025_01_06_082240_create_subcriptions_table', 1),
(20, '2025_01_10_113117_create_fees_table', 1),
(21, '2025_05_06_064823_add_table_to_fees_table', 2),
(25, '2025_05_17_062256_create_shippings_table', 3),
(26, '2025_05_20_124535_add_column_to_shippings_table', 3),
(28, '2025_05_28_102242_add_column_to_payments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('001b39f1-ebb6-4e73-b7c9-464b6c9ca8ae', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 05:12:04', '2025-05-28 05:12:04'),
('0087c593-0715-4cdb-9930-c50fec4a2325', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:27', '2025-02-01 04:58:27'),
('02761b7d-d834-4302-b731-f5bec2e6de84', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:18', '2025-02-01 04:57:18'),
('05ecaa55-1c1c-48fe-be1e-d0b471db13aa', 'App\\Notifications\\OfferAskingNotification', 'App\\Models\\User', 2, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/avatar.png\",\"title\":\"Jillur5 sent you an offer request\",\"product_id\":20,\"offer_id\":40,\"type\":\"pending\"}', '2025-01-31 01:19:47', '2025-01-31 01:08:31', '2025-01-31 01:19:47'),
('09816ce9-af12-4fba-ad7a-584092e0b772', 'App\\Notifications\\OfferAcceptNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"Demo User 1 accept your an offer request\",\"product_id\":159,\"offer_id\":38,\"type\":\"accept\"}', '2025-01-29 23:13:56', '2025-01-29 23:13:16', '2025-01-29 23:13:56'),
('09b86171-0d22-45e9-98b6-9d95c7448f67', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:16', '2025-02-01 04:57:16'),
('09cac708-27af-4ef7-bddc-729b7d70597c', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:20', '2025-02-01 04:57:20'),
('0c37a3a9-0457-48d6-8b7e-fe67f685796b', 'App\\Notifications\\OfferAcceptNotification', 'App\\Models\\User', 83, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"Demo User 1 accept your an offer request\",\"product_id\":129,\"offer_id\":41,\"type\":\"accept\"}', '2025-05-07 00:33:44', '2025-05-06 03:23:37', '2025-05-07 00:33:44'),
('0c93a508-c70d-42f6-9157-5ecb6d2339e9', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:10', '2025-02-01 04:57:10'),
('0fd50347-35bb-481d-9484-a72782167559', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 2, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/avatar.png\",\"title\":\"You have a new order.\",\"product_id\":20,\"type\":\"buy\"}', '2025-01-31 01:19:23', '2025-01-31 01:09:41', '2025-01-31 01:19:23'),
('14272b05-9f4f-491c-8074-ee9dda433782', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:23', '2025-02-01 04:57:23'),
('16129342-4bb3-4b83-a6d6-b6eba0a943d4', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:32', '2025-02-01 04:57:32'),
('1bf89ced-8580-4aaa-aee2-23db7a984ce8', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:12', '2025-02-01 04:57:12'),
('1e3ed062-3d10-4ed5-90d5-7744d2b155f2', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:17:59', '2025-05-28 04:17:59'),
('227afcc9-1573-446e-9c89-ade1798fd5e7', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:12', '2025-02-01 04:57:12'),
('23eac852-e724-436f-8d2e-e585da36a0f8', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-19 06:40:06', '2025-05-19 06:40:06'),
('27579418-9e99-4fd2-842c-6c43f0a50bc1', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 05:14:37', '2025-05-28 05:14:37'),
('2d146419-8292-4e67-b958-86034efbdae8', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:49', '2025-02-01 04:58:49'),
('2dd286c4-d138-44e3-9593-8faa2c1b0a8d', 'App\\Notifications\\OfferAcceptNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"Demo User 1 accept your an offer request\",\"product_id\":159,\"offer_id\":39,\"type\":\"accept\"}', '2025-01-29 23:22:56', '2025-01-29 23:22:48', '2025-01-29 23:22:56'),
('2f9fb8b2-4158-43fd-88e1-2c84ca304666', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1749360577.jpeg\",\"title\":\"Jillur Rahman is asking a question\"}', NULL, '2025-06-12 09:28:09', '2025-06-12 09:28:09'),
('339a60cb-6b9d-4b0f-8bb3-2e9c4baaede8', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:14', '2025-02-01 04:57:14'),
('369a8b30-3b2a-4a19-ac49-b7709aa20cc6', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:50', '2025-02-01 04:56:50'),
('37add3f1-a6c6-4384-9cd2-366269564b6c', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:04', '2025-02-01 04:57:04'),
('3a9f2f5f-3609-4ddc-838f-4017d98c927f', 'App\\Notifications\\HelpCenterAnswerNotification', 'App\\Models\\User', 82, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738400041.png\",\"title\":\"An Admin from PetSwap Responded to Your Support Message.\"}', NULL, '2025-02-01 05:14:24', '2025-02-01 05:14:24'),
('3ade890d-aeac-4d0b-a7e7-0541863d4acc', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1749360577.jpeg\",\"title\":\"Jillur Rahman is asking a question\"}', NULL, '2025-06-12 09:27:14', '2025-06-12 09:27:14'),
('3af87994-bea0-44e4-843d-9592e9a02ee8', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:50:03', '2025-05-28 04:50:03'),
('3e0da094-57e2-4e06-98d7-0ffb57df1de7', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:35:46', '2025-05-28 04:35:46'),
('3e1864ec-b581-4322-a3ae-e71f36ad1b42', 'App\\Notifications\\OfferAcceptNotification', 'App\\Models\\User', 81, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"Demo User 1 accept your an offer request\",\"product_id\":20,\"offer_id\":40,\"type\":\"accept\"}', NULL, '2025-01-31 01:19:52', '2025-01-31 01:19:52'),
('3e54fdf0-a37a-473c-8d34-e9fb6e73d352', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:13', '2025-02-01 04:57:13'),
('3edce8bd-e69e-4d25-b1f0-fcbd98e8c610', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:19', '2025-02-01 04:57:19'),
('413eb07a-19fd-40bf-a2d9-2e506e1eb21b', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:31', '2025-02-01 04:58:31'),
('42ac82c1-9920-4f6c-91ee-c4bc545eb324', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:37:17', '2025-05-28 04:37:17'),
('45e5f85e-f4b7-4071-a83e-55c238292e45', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-20 06:22:35', '2025-05-20 06:22:35'),
('47e6f038-5850-4aa0-b938-233d9a2cef60', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:46:47', '2025-05-28 04:46:47'),
('4a503e35-5090-4f6f-8b69-975e89acfd99', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:29', '2025-02-01 04:58:29'),
('4b81ef78-4642-4da1-af95-0d4aa82089f5', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:38', '2025-02-01 04:58:38'),
('4c1f16d1-1b36-4aa2-b2ff-61c614cb22a6', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:24', '2025-02-01 04:57:24'),
('4dec167c-0ec9-46c9-bed5-5de6d70a4f18', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:26', '2025-02-01 04:58:26'),
('4e346b0e-3354-4111-9d4d-f5e054c1f895', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1749360577.jpeg\",\"title\":\"Jillur Rahman is asking a question\"}', NULL, '2025-06-12 09:18:55', '2025-06-12 09:18:55'),
('4e78f5d9-a247-4eea-a465-2e74c10c670b', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:28', '2025-02-01 04:58:28'),
('500c031d-4ecf-4287-81b8-748138759961', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:50', '2025-02-01 04:58:50'),
('52d97b00-7b3d-47fc-9017-2c9063fea19f', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:37', '2025-02-01 04:58:37'),
('540e4367-9fae-4085-b09f-12f0870ff301', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:43', '2025-02-01 04:58:43'),
('57592c21-7444-4e7e-a7f7-82b6516807c4', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":12,\"type\":\"buy\"}', NULL, '2025-05-28 06:32:26', '2025-05-28 06:32:26'),
('5921cd89-20dd-4811-9cca-c2a5dba324dd', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:15', '2025-02-01 04:57:15'),
('59675e71-ae0b-4f50-a35c-fd744a96c0e9', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:32', '2025-02-01 04:58:32'),
('5b0369d6-73dc-48d3-90d9-e5ae02aff197', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-07 23:50:34', '2025-05-07 23:50:34'),
('5b0aa9d6-5566-4a10-bdc7-7c88a68808fa', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:55', '2025-02-01 04:56:55'),
('60088217-0e7d-41d8-a239-db24f52a773c', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738123896.jpeg\",\"title\":\"You have a new order.\",\"product_id\":36,\"type\":\"buy\"}', NULL, '2025-04-05 03:00:38', '2025-04-05 03:00:38'),
('60aec5d3-e25e-4bca-a517-c62f56e9930e', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:59', '2025-02-01 04:56:59'),
('60da30f6-fd20-4be3-b950-c691dd80dc3b', 'App\\Notifications\\OfferAskingNotification', 'App\\Models\\User', 2, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738494777.jpeg\",\"title\":\"Elena Blasio sent you an offer request\",\"product_id\":129,\"offer_id\":41,\"type\":\"pending\"}', '2025-05-06 03:23:16', '2025-03-27 08:37:43', '2025-05-06 03:23:16'),
('622453e8-5bc2-45d0-8572-5d12f41bc6bb', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:24', '2025-02-01 04:58:24'),
('6233ee13-9033-410b-9d4f-26b26cc7f8ea', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:14', '2025-02-01 04:57:14'),
('644929a0-a087-4488-b095-df8138881b38', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:36:11', '2025-05-28 04:36:11'),
('65499241-44f8-41d1-9d6f-1f112fb5a96d', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":12,\"type\":\"buy\"}', NULL, '2025-06-02 03:28:15', '2025-06-02 03:28:15'),
('65b428f2-2998-44f2-bb87-d77136d01283', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:43', '2025-02-01 04:58:43'),
('68265914-b5ec-4820-9505-51e0ad9b4e61', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:44', '2025-02-01 04:58:44'),
('6b8cb3bf-7f3e-41c8-9fe7-862e1703744b', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:33', '2025-02-01 04:58:33'),
('6c3a4341-13c2-4ff7-ad46-9913fdb60d7a', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 2, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/avatar.png\",\"title\":\"You have a new order.\",\"product_id\":159,\"type\":\"buy\"}', '2025-01-29 23:08:47', '2025-01-29 23:08:39', '2025-01-29 23:08:47'),
('6e6e7df7-babf-4496-9bad-0f83557a94b6', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:33', '2025-02-01 04:58:33'),
('6f2cb958-2fb8-487d-84c4-f46e2c9244c5', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:26', '2025-02-01 04:58:26'),
('746e4228-3d75-42e8-a248-c161b53640ca', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:00', '2025-02-01 04:57:00'),
('75fb4bb7-17c2-4ed8-bfab-56483d191e79', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:46', '2025-02-01 04:58:46'),
('76146743-2342-4400-be04-fd3d9de2103f', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:46', '2025-02-01 04:56:46'),
('767e406e-69f2-4cc8-812e-f68facb53479', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-07 23:53:43', '2025-05-07 23:53:43'),
('7a747f3b-2e3a-41a8-a24e-656e40006c23', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:34', '2025-02-01 04:58:34'),
('8027b2df-50da-4d02-b2c3-65afef00d7a3', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:09', '2025-02-01 04:57:09'),
('8089e017-05b8-4ef2-bff5-ae2db438ed94', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:27', '2025-02-01 04:57:27'),
('82c03058-54de-4f13-b743-297fdec9cca3', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:10', '2025-02-01 04:58:10'),
('85041625-1e52-4a02-98a6-8e94178f27a1', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:15', '2025-02-01 04:57:15'),
('8c7be362-59fa-49ed-9c1a-80076f60c312', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:17', '2025-02-01 04:57:17'),
('90440b10-d81e-43a7-a25f-544f00716cc4', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 05:02:06', '2025-05-28 05:02:06'),
('91fe053b-6fd3-4d70-8199-d5b0c6544c9f', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:46', '2025-02-01 04:58:46'),
('9243c05b-af29-434c-8449-28145caed9df', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:47', '2025-02-01 04:58:47'),
('93e90331-da68-4281-b657-47a351209664', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-19 23:55:56', '2025-05-19 23:55:56'),
('95e83ab3-8d59-4cb6-a9d8-e0fc32cb1db8', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:34', '2025-02-01 04:58:34'),
('970cada7-8580-4696-abdf-17744aba9773', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1749360577.jpeg\",\"title\":\"Jillur Rahman is asking a question\"}', NULL, '2025-06-12 09:35:55', '2025-06-12 09:35:55'),
('9bea9ce6-2251-4037-a0d1-296165768cf3', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:08', '2025-02-01 04:57:08'),
('9dbffe3d-206e-45c6-8d74-e9b5e8957cef', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:20', '2025-02-01 04:57:20'),
('9e7a74e3-df76-4193-b0fa-6f32be127336', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:31:56', '2025-05-28 04:31:56'),
('a8374d90-9f8e-41a7-a9ad-79061576d8e4', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:58', '2025-02-01 04:56:58'),
('a8ad2a69-dae2-4e82-8637-f7e8b974bdb1', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:11', '2025-02-01 04:57:11'),
('aa15f312-d68c-4570-8920-c9399f56e683', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:21', '2025-02-01 04:57:21'),
('ab2413f8-8b4b-46ea-807e-5de2a5f04072', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:30', '2025-02-01 04:58:30'),
('abacf04e-f79d-420e-85e8-22f0e72a024b', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:37', '2025-02-01 04:58:37'),
('ae534ac6-98d4-4b22-b69c-bc9600d65961', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1749360577.jpeg\",\"title\":\"Jillur Rahman is asking a question\"}', NULL, '2025-06-12 09:25:31', '2025-06-12 09:25:31'),
('ae539e3e-5090-48b3-ad9b-007f48d00585', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:27', '2025-02-01 04:58:27'),
('b3275974-49e9-4720-aaa1-3b0ebb7777f4', 'App\\Notifications\\HelpCenterAnswerNotification', 'App\\Models\\User', 82, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738400041.png\",\"title\":\"An Admin from PetSwap Responded to Your Support Message.\"}', NULL, '2025-02-01 05:18:08', '2025-02-01 05:18:08'),
('b381d73f-936b-4f8d-8ee3-b746d0f63b31', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"Demo User 1 is asking a question\"}', NULL, '2025-01-31 01:21:03', '2025-01-31 01:21:03'),
('b39bd51a-aa4b-4032-94f7-4ea9ca8d47d4', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:41', '2025-02-01 04:58:41'),
('b4074c65-97c2-4a43-9f18-b08a274227a9', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:40', '2025-02-01 04:58:40'),
('b4606efe-f99f-471b-b0fc-d850c558d265', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":12,\"type\":\"buy\"}', NULL, '2025-06-20 08:37:33', '2025-06-20 08:37:33'),
('b4723128-5969-49a1-adb4-672b03e391b6', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:39', '2025-02-01 04:58:39'),
('b7136826-7939-4f9a-9113-a62d529fb791', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:16', '2025-02-01 04:57:16'),
('b7207b91-55c1-4b66-8145-f8aecb608694', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:28', '2025-02-01 04:57:28'),
('baac31be-cf33-43b4-b617-24851916315e', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:32:50', '2025-05-28 04:32:50'),
('badaaa3c-ea21-4acc-aa85-cad64e0e4855', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:56', '2025-02-01 04:56:56'),
('bb00b03b-8e02-43af-acc2-e3a169ff713a', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:52', '2025-02-01 04:56:52'),
('bb4bae89-a73c-4bd8-883d-2a4934ee810e', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:28', '2025-02-01 04:58:28'),
('bd842e27-1d1e-46b1-a8a3-1a983172b7f0', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:12', '2025-02-01 04:57:12'),
('be402475-5b19-46c6-8c82-c990c788d51d', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:56:54', '2025-02-01 04:56:54'),
('c1bad992-53d5-4e68-bcb2-8710f2ae7da6', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:21', '2025-02-01 04:57:21'),
('c5a82c25-4c0a-4307-a829-3446710fe425', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:42', '2025-02-01 04:58:42'),
('c6ef2e40-2c51-46b4-97e9-5ba021fede4d', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:27', '2025-02-01 04:58:27'),
('c86e4232-7cf5-48e0-90cd-670ee75a4851', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:31', '2025-02-01 04:57:31'),
('cf864032-b0e2-4b51-8ee4-6790fc3f9863', 'App\\Notifications\\OfferAskingNotification', 'App\\Models\\User', 2, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/avatar.png\",\"title\":\"Demo User 4 sent you an offer request\",\"product_id\":159,\"offer_id\":38,\"type\":\"pending\"}', '2025-01-29 23:11:31', '2025-01-29 23:11:24', '2025-01-29 23:11:31'),
('cfddc8d4-8ee5-4d32-b2fd-022e478790bf', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:44', '2025-02-01 04:58:44'),
('d343f376-9ce6-4322-b902-8d33d19195e1', 'App\\Notifications\\HelpCenterAnswerNotification', 'App\\Models\\User', 82, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738400041.png\",\"title\":\"An Admin from PetSwap Responded to Your Support Message.\"}', NULL, '2025-02-01 05:19:48', '2025-02-01 05:19:48'),
('d3b43acd-e49a-4d70-b12b-18a9cd4a6052', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:31', '2025-02-01 04:58:31'),
('d62780bb-7781-4e92-9e52-48c10f9e4bf1', 'App\\Notifications\\OfferAskingNotification', 'App\\Models\\User', 2, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/avatar.png\",\"title\":\"Demo User 4 sent you an offer request\",\"product_id\":159,\"offer_id\":39,\"type\":\"pending\"}', '2025-01-29 23:22:40', '2025-01-29 23:22:37', '2025-01-29 23:22:40'),
('d95a117d-ae67-4bd9-b78d-5cf387129b57', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:41', '2025-02-01 04:58:41'),
('d97e56eb-767a-4fec-bf13-7c2242128daa', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:19', '2025-02-01 04:57:19'),
('dda79e4c-8b6a-49bb-835a-5f2e992b0b4e', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:29', '2025-02-01 04:57:29'),
('de36f7e7-4a19-4b1a-bd3a-0ed52c11e62d', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 04:15:34', '2025-05-28 04:15:34'),
('e1861151-e98f-401f-a97e-4a46cff4e40d', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:41', '2025-02-01 04:58:41'),
('e224d72f-6113-4369-b9df-b03dcef69776', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 15, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738125961.jpg\",\"title\":\"You have a new order.\",\"product_id\":71,\"type\":\"buy\"}', NULL, '2025-05-28 05:00:49', '2025-05-28 05:00:49'),
('e59580a2-a1b5-4f75-b90e-f0592334ace5', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:28', '2025-02-01 04:58:28'),
('ead4bd5a-d635-44dd-8809-4a9533e8fb53', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738123896.jpeg\",\"title\":\"You have a new order.\",\"product_id\":158,\"type\":\"buy\"}', NULL, '2025-04-10 02:39:17', '2025-04-10 02:39:17'),
('eb7a4b9e-009c-4474-b54c-e7e970152809', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:21', '2025-02-01 04:57:21'),
('eb8548e3-7c33-404c-920f-754e6d8511f0', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:25', '2025-02-01 04:57:25'),
('f29964cf-f630-49ad-aefd-ce7691d095bc', 'App\\Notifications\\BuyProductNotification', 'App\\Models\\User', 5, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738123896.jpeg\",\"title\":\"You have a new order.\",\"product_id\":36,\"type\":\"buy\"}', '2025-01-30 08:38:00', '2025-01-30 02:45:42', '2025-01-30 08:38:00'),
('f2a1cf16-c5e7-485e-a6d3-c5fa7b832160', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:58:39', '2025-02-01 04:58:39'),
('f3991868-3beb-4b2b-9409-17bd5ba82efb', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1749360577.jpeg\",\"title\":\"Jillur Rahman is asking a question\"}', NULL, '2025-06-12 09:18:00', '2025-06-12 09:18:00'),
('f4e7570c-8e1d-42d3-9fb0-c65305c1419f', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:13', '2025-02-01 04:57:13'),
('fc6c6455-1832-4be1-a68c-ec6405058a9c', 'App\\Notifications\\HelpCenterNotification', 'App\\Models\\User', 1, '{\"image\":\"http:\\/\\/182.252.68.227:8001\\/uploads\\/user\\/1738316229.jpeg\",\"title\":\"Asikul Islam Sazzat is asking a question\"}', NULL, '2025-02-01 04:57:06', '2025-02-01 04:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `offer_prices`
--

CREATE TABLE `offer_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `buyer_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `asking_price` double NOT NULL,
  `status` enum('accept','reject','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_buy` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_prices`
--

INSERT INTO `offer_prices` (`id`, `seller_id`, `buyer_id`, `product_id`, `asking_price`, `status`, `is_buy`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 48, 20, 'accept', 1, '2025-01-27 00:24:58', '2025-01-29 06:33:31'),
(3, 5, 2, 36, 200, 'pending', 0, '2025-01-27 07:23:40', '2025-01-27 07:23:40'),
(4, 5, 3, 36, 10, 'pending', 0, '2025-01-29 00:00:22', '2025-01-29 04:03:01'),
(5, 2, 3, 20, 100, 'pending', 0, '2025-01-29 01:05:03', '2025-01-29 01:05:50'),
(6, 2, 3, 20, 80, 'pending', 0, '2025-01-29 02:24:37', '2025-01-29 02:24:48'),
(7, 2, 3, 20, 5, 'pending', 0, '2025-01-29 02:34:01', '2025-01-29 02:34:07'),
(8, 2, 3, 20, 6, 'pending', 0, '2025-01-29 02:34:40', '2025-01-29 02:34:51'),
(9, 2, 3, 20, 99, 'pending', 0, '2025-01-29 02:36:58', '2025-01-29 02:37:09'),
(10, 2, 3, 20, 19, 'pending', 0, '2025-01-29 02:48:59', '2025-01-29 02:48:59'),
(21, 3, 2, 48, 5, 'pending', 0, '2025-01-29 03:28:07', '2025-01-29 03:28:07'),
(36, 2, 4, 20, 50, 'accept', 0, '2025-01-29 06:18:31', '2025-01-29 06:20:11'),
(37, 2, 4, 20, 50, 'reject', 0, '2025-01-29 06:18:53', '2025-01-29 06:20:00'),
(38, 2, 5, 159, 100, 'accept', 0, '2025-01-29 23:11:24', '2025-01-29 23:13:16'),
(39, 2, 5, 159, 50, 'accept', 0, '2025-01-29 23:22:37', '2025-01-29 23:22:48'),
(40, 2, 81, 20, 5, 'accept', 0, '2025-01-31 01:08:31', '2025-01-31 01:19:52'),
(41, 2, 83, 129, 20, 'accept', 0, '2025-03-27 08:37:43', '2025-05-06 03:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `buyer_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `platform_fee` float DEFAULT NULL,
  `buyer_protection_fee` float DEFAULT NULL,
  `delivery_fee` double DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `stripe_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `buyer_id`, `seller_id`, `product_id`, `amount`, `currency`, `platform_fee`, `buyer_protection_fee`, `delivery_fee`, `status`, `stripe_payment_id`, `country`, `state`, `city`, `zip`, `created_at`, `updated_at`) VALUES
(135, 2, 2, 71, 181.3, 'USD', 1, 3.63, 14.07, 'Pending', 'pi_3RMNXAKOpUtqOuW11OhWk3b5', 'GB', 'Dhaka', 'dhaka', 'BN3 5PB', '2025-05-28 05:14:34', '2025-05-28 05:14:34'),
(136, 2, 2, 12, 178.84, 'USD', 1, 3.58, 14.22, 'Pending', 'pi_3RMNXAKOpUtqOuW11OhWk3b5', 'GB', 'Dhaka', 'dhaka', 'BN3 5PB', '2025-05-28 06:30:36', '2025-05-28 06:30:36'),
(137, 2, 2, 12, 178.84, 'USD', 1, 3.58, 14.22, 'Pending', 'pi_3RMNXAKOpUtqOuW11OhWk3b5', 'GB', 'Dhaka', 'dhaka', 'BN3 5PB', '2025-05-28 06:31:30', '2025-05-28 06:31:30'),
(138, 2, 2, 12, 178.84, 'USD', 1, 3.58, 14.22, 'Completed', 'pi_3RMNXAKOpUtqOuW11OhWk3b5', 'GB', 'Dhaka', 'dhaka', 'BN3 5PB', '2025-05-28 06:32:23', '2025-06-19 03:28:45'),
(139, 2, 5, 12, 197.64, 'USD', 1, 3.58, 14.22, 'Completed', 'pi_3Rc5rFKOpUtqOuW10qblgy4N', 'GB', 'Dhaka', 'dhaka', 'BN3 5PB', '2025-06-02 03:28:13', '2025-06-20 08:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `sub_category_id` json NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `images` json DEFAULT NULL,
  `price` double NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_food` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.5',
  `view_count` bigint UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('Approved','Pending','Canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Approved',
  `is_promoted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `sub_category_id`, `title`, `description`, `images`, `price`, `brand`, `condition`, `is_food`, `weight`, `view_count`, `status`, `is_promoted`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '[\"13\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/15.png\", \"product/56.png\", \"product/27.png\", \"product/1.png\"]', 413.91, 'Earthborn Holistic', 'New', 0, '53.29', 14, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(2, 4, 2, '[\"5\", \"8\"]', 'Vitamin-Rich Canary Food', 'Enriched with vitamins and minerals to support the vibrant health of canaries.', '[\"product/59.png\", \"product/1.png\", \"product/29.png\", \"product/72.png\"]', 332.58, 'Merrick', 'New', 1, '24.54', 16, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(3, 3, 5, '[\"18\", \"19\"]', 'Vitamin-Enriched Snake Food', 'Prey-based food fortified with essential vitamins for snakes.', '[\"product/42.png\", \"product/64.png\", \"product/46.png\"]', 220.68, 'Whiskas', 'Used', 0, '30.79', 61, 'Canceled', 0, '2025-01-27 00:23:49', '2025-05-28 22:07:36'),
(4, 3, 6, '[\"22\"]', 'Grain-Free Kitten Food', 'Made without grains or fillers, this food supports your kitten’s energy and growth.', '[\"product/43.png\", \"product/52.png\", \"product/28.png\", \"product/23.png\", \"product/56.png\"]', 178.45, 'Nutro', 'New', 1, '10.36', 47, 'Pending', 0, '2025-01-27 00:23:49', '2025-06-02 03:23:16'),
(5, 5, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/54.png\", \"product/1.png\", \"product/16.png\", \"product/47.png\"]', 117.56, 'Pedigree', 'New', 0, '27.4', 77, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(8, 4, 3, '[\"9\", \"11\", \"12\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/65.png\", \"product/15.png\"]', 419.48, 'Taste of the Wild', 'Used', 0, '35.95', 21, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(10, 4, 2, '[\"7\", \"8\"]', 'Mealworm Mix for Lizards', 'A protein-rich mealworm mix to keep lizards active and healthy.', '[\"product/71.png\", \"product/4.png\", \"product/46.png\", \"product/20.png\"]', 310.47, 'Nature\'s Variety Instinct', 'Used', 1, '27.53', 38, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-28 03:28:29'),
(11, 3, 6, '[\"21\", \"22\", \"24\"]', 'Soft Chew Cat Treats', 'Soft, chewy treats that are easy to digest and perfect for picky eaters.', '[\"product/81.png\", \"product/78.png\", \"product/10.png\", \"product/75.png\"]', 260.69, 'Nature\'s Variety Instinct', 'New', 0, '28.81', 36, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(12, 5, 6, '[\"24\"]', 'Nutty Hamster Treats', 'A mix of nuts and seeds to provide a fun and healthy snack for hamsters.', '[\"product/7.png\", \"product/33.png\", \"product/23.png\", \"product/12.png\", \"product/31.png\"]', 178.84, 'Natural Balance', 'Used', 1, '35', 91, 'Approved', 0, '2025-01-27 00:23:49', '2025-06-20 09:01:10'),
(14, 2, 3, '[\"9\", \"11\", \"12\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/69.png\", \"product/56.png\", \"product/68.png\", \"product/49.png\", \"product/28.png\"]', 172.84, 'Acana', 'Used', 1, '7.87', 2, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(15, 5, 5, '[\"19\"]', 'Carrot-Flavored Chew Sticks', 'Delicious and durable chew sticks that support dental health for small pets.', '[\"product/75.png\", \"product/3.png\"]', 48.42, 'Meow Mix', 'Used', 0, '63.98', 80, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(18, 4, 3, '[\"10\", \"9\"]', 'Timothy Hay for Rabbits', 'High-quality Timothy hay that promotes digestion and dental health in rabbits.', '[\"product/1738152821679a1b75d1800.jpg\", \"product/1738152821679a1b75d1bff.jpg\"]', 334.68, 'Royal Canin', 'new', 1, '19.29', 64, 'Approved', 0, '2025-01-27 00:23:49', '2025-05-28 22:07:27'),
(19, 3, 2, '[\"5\", \"6\", \"7\", \"8\"]', 'Vitamin C Treats for Guinea Pigs', 'Specially formulated treats with extra vitamin C to boost guinea pig health.', '[\"product/20.png\", \"product/78.png\", \"product/40.png\"]', 359, 'American Journey', 'Used', 0, '41.48', 97, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(20, 2, 4, '[\"3\", \"4\", \"15\", \"14\"]', 'Demo', 'Veritatis temporibus sed ad temporibus. Update', '[\"product/173808399067990e962cd7f.jpg\"]', 100, 'Awesome upfatw', 'used', 0, '10.56', 159, 'Approved', 0, '2025-01-27 00:23:49', '2025-06-20 04:45:13'),
(21, 5, 6, '[\"23\", \"24\"]', 'Calcium-Enriched Turtle Sticks', 'Floating sticks packed with calcium to strengthen turtle shells.', '[\"product/9.png\", \"product/55.png\"]', 432.42, 'Halo', 'New', 0, '65.36', 93, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(22, 4, 6, '[\"23\", \"24\"]', 'Gourmet Turkey Cat Stew', 'A savory turkey stew enriched with vitamins for adult cats.', '[\"product/36.png\", \"product/12.png\"]', 74.11, 'Blue Buffalo', 'Used', 1, '18.11', 78, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(23, 3, 3, '[\"3\", \"4\"]', 'Principal Interactions Manager udape', 'Tempora quod sint voluptatem.', '[\"product/17381283706799bbf2663a3.jpg\", \"product/17381283706799bbf2666ae.jpg\"]', 483.25, 'Singapore', 'good', 1, '31.46', 15, 'Approved', 0, '2025-01-27 00:23:49', '2025-01-28 23:26:10'),
(24, 4, 6, '[\"21\", \"22\", \"24\"]', 'Tropical Fish Color Enhancer Flakes', 'Boost the vibrant colors of your tropical fish with this nutrient-packed formula.', '[\"product/28.png\", \"product/5.png\", \"product/41.png\", \"product/43.png\", \"product/57.png\"]', 47.74, 'Meow Mix', 'New', 0, '32.99', 36, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(25, 5, 6, '[\"21\", \"22\", \"23\", \"24\"]', 'Timothy Hay for Rabbits', 'High-quality Timothy hay that promotes digestion and dental health in rabbits.', '[\"product/44.png\", \"product/62.png\", \"product/15.png\", \"product/61.png\"]', 110.96, 'Acana', 'New', 0, '69.57', 32, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(26, 4, 3, '[\"3\", \"4\"]', 'Regional Creative Officer', 'Ullam rerum aperiam illo voluptatem iste rerum voluptatum sunt.', '[]', 58.11, 'Product', 'good', 1, '40.9', 90, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-28 04:34:27'),
(27, 5, 4, '[\"13\", \"14\", \"15\", \"16\"]', 'Mealworm Mix for Lizards', 'A protein-rich mealworm mix to keep lizards active and healthy.', '[\"product/68.png\"]', 457.57, 'Purina Pro Plan', 'New', 0, '63.75', 71, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(28, 4, 2, '[\"5\", \"6\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/50.png\", \"product/60.png\", \"product/19.png\", \"product/16.png\", \"product/64.png\"]', 375.75, 'Halo', 'Used', 1, '57.08', 26, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(29, 4, 1, '[\"1\", \"2\", \"3\"]', 'Sunflower & Millet Bird Seed', 'A premium blend of seeds to keep your parrot or cockatiel energized and happy.', '[\"product/7.png\"]', 366.71, 'Canidae', 'New', 1, '24.15', 35, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(30, 2, 4, '[\"14\", \"15\"]', 'Beef & Veggie Dog Chews', 'Long-lasting chews made with real beef and veggies to keep your dog busy and satisfied.', '[\"product/37.png\", \"product/58.png\"]', 375.96, 'NutriSource', 'New', 1, '17.52', 7, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(32, 3, 2, '[\"5\", \"7\", \"8\"]', 'High-Protein Betta Food', 'Specially crafted pellets to enhance the health and beauty of your betta fish.', '[\"product/49.png\"]', 304.03, 'Halo', 'New', 0, '14.12', 44, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(34, 4, 5, '[\"17\", \"18\", \"19\", \"20\"]', 'High-Protein Betta Food', 'Specially crafted pellets to enhance the health and beauty of your betta fish.', '[\"product/63.png\", \"product/2.png\", \"product/19.png\", \"product/32.png\", \"product/51.png\"]', 40.56, 'Halo', 'New', 1, '17.04', 88, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(35, 3, 2, '[\"7\", \"8\"]', 'Egg & Honey Bird Treats', 'Protein-packed treats with a hint of honey for added flavor.', '[\"product/73.png\", \"product/14.png\", \"product/72.png\"]', 76.82, 'Iams', 'New', 0, '41.86', 47, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(36, 5, 4, '[\"13\", \"14\", \"16\"]', 'Soft Chew Cat Treats', 'Soft, chewy treats that are easy to digest and perfect for picky eaters.', '[\"product/8.png\", \"product/5.png\", \"product/4.png\"]', 431.11, 'Purina ONE', 'New', 1, '19.15', 234, 'Approved', 0, '2025-01-27 00:23:49', '2025-06-20 09:28:17'),
(37, 3, 5, '[\"17\", \"18\", \"19\", \"20\"]', 'Algae Wafers for Bottom Feeders', 'Ideal for plecos and other bottom-dwelling fish, these wafers provide essential nutrients.', '[\"product/19.png\", \"product/61.png\"]', 106.75, 'Orijen', 'Used', 0, '38.2', 67, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(38, 2, 5, '[\"18\"]', 'Salmon & Tuna Cat Kibble', 'A delicious mix of salmon and tuna flavors packed with omega-3 for a shiny coat.', '[\"product/9.png\"]', 303.52, 'Solid Gold', 'New', 0, '63.56', 67, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(39, 3, 5, '[\"18\", \"19\", \"20\"]', 'High-Protein Puppy Food', 'Specially designed for growing puppies, this food is rich in protein and DHA for brain development.', '[\"product/49.png\", \"product/9.png\"]', 385.82, 'Nature\'s Variety Instinct', 'New', 0, '64.19', 83, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(40, 5, 3, '[\"3\", \"4\"]', 'Corporate Data Executive', 'Dolores nostrum accusantium.', '[]', 499.22, 'incentivize', 'good', 1, '60.26', 95, 'Approved', 0, '2025-01-27 00:23:49', '2025-06-02 03:22:12'),
(41, 3, 2, '[\"7\"]', 'Sunflower & Millet Bird Seed', 'A premium blend of seeds to keep your parrot or cockatiel energized and happy.', '[\"product/77.png\", \"product/64.png\", \"product/48.png\", \"product/52.png\", \"product/43.png\"]', 462.81, 'Blue Basics', 'New', 1, '38.72', 15, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(42, 5, 4, '[\"15\"]', 'Gourmet Turkey Cat Stew', 'A savory turkey stew enriched with vitamins for adult cats.', '[\"product/34.png\", \"product/23.png\"]', 145.12, 'Halo', 'Used', 0, '11.84', 5, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(43, 5, 5, '[\"19\", \"20\"]', 'Vitamin C Treats for Guinea Pigs', 'Specially formulated treats with extra vitamin C to boost guinea pig health.', '[\"product/54.png\", \"product/39.png\", \"product/78.png\", \"product/65.png\", \"product/40.png\"]', 372.98, 'The Honest Kitchen', 'Used', 1, '11.04', 22, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(44, 4, 6, '[\"24\"]', 'Goldfish Veggie Pellets', 'Plant-based pellets designed to support digestion and overall health in goldfish.', '[\"product/2.png\", \"product/37.png\"]', 233.89, 'Orijen', 'Used', 0, '18.68', 76, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(45, 4, 1, '[\"1\", \"2\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/43.png\", \"product/15.png\", \"product/23.png\"]', 87.25, 'Purina ONE', 'New', 1, '59.26', 98, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(46, 4, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Herbal Tortoise Food', 'Plant-based food made from natural herbs and greens, ideal for tortoises.', '[\"product/38.png\", \"product/2.png\"]', 236.21, 'Royal Canin', 'New', 0, '32.28', 64, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(47, 3, 4, '[\"13\", \"15\"]', 'Wild Bird Attracting Mix', 'A special blend of seeds and nuts to attract wild birds to your backyard.', '[\"product/43.png\", \"product/44.png\", \"product/64.png\"]', 497.79, 'American Journey', 'Used', 0, '51.59', 13, 'Canceled', 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(48, 3, 3, '[\"10\"]', 'Product Creative Developer', 'Accusamus molestiae quia aut et accusamus debitis.', '[]', 167.28, 'SAS', 'good', 1, '22.15', 88, 'Approved', 0, '2025-01-27 00:23:49', '2025-01-29 23:05:30'),
(50, 5, 3, '[\"3\", \"4\"]', 'Investor Usability Supervisor', 'Omnis eveniet tempore laudantium.', '[]', 320.38, 'Executive', 'good', 1, '23.96', 90, 'Pending', 0, '2025-01-27 00:23:49', '2025-01-28 04:37:50'),
(52, 3, 4, '[\"13\", \"14\", \"15\"]', 'New title', 'New des', '[\"product/17381286156799bce7711f4.jpg\", \"product/17381286156799bce77156b.jpg\"]', 10, 'Hskaydl', 'new', 1, '52.33', 0, 'Approved', 0, '2025-01-28 23:30:15', '2025-01-28 23:30:15'),
(64, 14, 5, '[\"19\"]', 'Timothy Hay for Rabbits', 'High-quality Timothy hay that promotes digestion and dental health in rabbits.', '[\"product/71.png\", \"product/8.png\", \"product/76.png\", \"product/49.png\", \"product/56.png\"]', 327.88, 'Whiskas', 'New', 0, '50.8', 59, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(65, 2, 1, '[\"2\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/17.png\", \"product/4.png\", \"product/81.png\"]', 315.25, 'Halo', 'Used', 0, '26.99', 39, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(66, 12, 2, '[\"6\", \"7\", \"8\"]', 'Mealworm Mix for Lizards', 'A protein-rich mealworm mix to keep lizards active and healthy.', '[\"product/68.png\", \"product/31.png\", \"product/82.png\", \"product/1.png\", \"product/24.png\"]', 67.68, 'Nutro', 'New', 0, '50.54', 24, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(67, 14, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Egg & Honey Bird Treats', 'Protein-packed treats with a hint of honey for added flavor.', '[\"product/71.png\", \"product/22.png\"]', 17.02, 'Nature\'s Variety Instinct', 'New', 0, '32.73', 84, 'Approved', 0, '2025-01-29 05:05:07', '2025-06-02 03:20:15'),
(68, 17, 6, '[\"21\", \"23\", \"24\"]', 'Sunflower & Millet Bird Seed', 'A premium blend of seeds to keep your parrot or cockatiel energized and happy.', '[\"product/33.png\", \"product/66.png\", \"product/44.png\", \"product/68.png\"]', 73.01, 'The Honest Kitchen', 'Used', 0, '11.05', 47, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(69, 15, 3, '[\"10\", \"11\", \"12\"]', 'Hairball Control Cat Food', 'Formulated to reduce hairballs and improve digestion in long-haired cats.', '[\"product/3.png\"]', 275.92, 'Purina ONE', 'New', 1, '25.07', 65, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(70, 15, 3, '[\"9\", \"10\", \"11\"]', 'Algae Wafers for Bottom Feeders', 'Ideal for plecos and other bottom-dwelling fish, these wafers provide essential nutrients.', '[\"product/67.png\", \"product/70.png\", \"product/66.png\", \"product/44.png\", \"product/31.png\"]', 468.51, 'The Honest Kitchen', 'New', 0, '22.18', 28, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(71, 15, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Salmon & Tuna Cat Kibble', 'A delicious mix of salmon and tuna flavors packed with omega-3 for a shiny coat.', '[\"product/29.png\", \"product/52.png\", \"product/17.png\", \"product/58.png\", \"product/38.png\"]', 181.3, 'Friskies', 'Used', 1, '34.7', 128, 'Approved', 0, '2025-01-29 05:05:07', '2025-06-20 09:18:27'),
(72, 3, 5, '[\"18\", \"19\", \"20\"]', 'Insect Pellets for Geckos', 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.', '[\"product/24.png\", \"product/51.png\", \"product/56.png\", \"product/61.png\", \"product/69.png\"]', 499.46, 'Purina Pro Plan', 'Used', 0, '36.95', 40, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(73, 8, 4, '[\"13\", \"14\", \"15\", \"16\"]', 'Marine Fish Brine Shrimp', 'Freeze-dried brine shrimp to support the dietary needs of marine fish.', '[\"product/47.png\", \"product/12.png\"]', 445.69, 'The Honest Kitchen', 'Used', 1, '10.65', 27, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(74, 2, 3, '[\"10\", \"11\"]', 'Beef & Veggie Dog Chews', 'Long-lasting chews made with real beef and veggies to keep your dog busy and satisfied.', '[\"product/76.png\", \"product/35.png\"]', 288.48, 'Pedigree', 'Used', 0, '10.39', 27, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(75, 2, 3, '[\"9\", \"11\"]', 'Timothy Hay for Rabbits', 'High-quality Timothy hay that promotes digestion and dental health in rabbits.', '[\"product/50.png\", \"product/21.png\", \"product/36.png\", \"product/78.png\", \"product/30.png\"]', 163.16, 'Canidae', 'New', 0, '19.01', 80, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(76, 12, 2, '[\"5\", \"6\", \"8\"]', 'Sunflower & Millet Bird Seed', 'A premium blend of seeds to keep your parrot or cockatiel energized and happy.', '[\"product/41.png\", \"product/14.png\", \"product/32.png\", \"product/22.png\"]', 288.95, 'Nature\'s Variety Instinct', 'Used', 0, '62.88', 7, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(77, 10, 5, '[\"18\"]', 'Fruit-Infused Parakeet Mix', 'A delicious seed mix infused with dried fruits to provide essential vitamins.', '[\"product/23.png\", \"product/36.png\"]', 177.24, 'Wellness CORE', 'New', 1, '49.38', 75, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(78, 12, 5, '[\"17\", \"18\", \"19\", \"20\"]', 'High-Protein Betta Food', 'Specially crafted pellets to enhance the health and beauty of your betta fish.', '[\"product/35.png\", \"product/57.png\", \"product/8.png\", \"product/12.png\"]', 35.1, 'Eukanuba', 'Used', 0, '57.24', 14, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(79, 6, 3, '[\"10\", \"12\"]', 'Pellet Mix for Guinea Pigs', 'Nutrient-rich pellets that support the dietary needs of guinea pigs.', '[\"product/75.png\", \"product/29.png\"]', 372.56, 'Blue Basics', 'New', 0, '68.07', 70, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(80, 7, 2, '[\"7\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/39.png\", \"product/17.png\"]', 121.74, 'Taste of the Wild', 'New', 0, '29.61', 47, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(81, 11, 1, '[\"3\"]', 'Algae Wafers for Bottom Feeders', 'Ideal for plecos and other bottom-dwelling fish, these wafers provide essential nutrients.', '[\"product/43.png\"]', 47.38, 'The Honest Kitchen', 'Used', 0, '11.86', 12, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(82, 14, 6, '[\"21\", \"22\", \"23\"]', 'Dental Care Dog Treats', 'These treats clean teeth and freshen breath while being irresistibly tasty.', '[\"product/69.png\", \"product/41.png\", \"product/65.png\", \"product/20.png\"]', 399.67, 'Merrick', 'New', 0, '38.45', 31, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 06:05:41'),
(83, 6, 5, '[\"17\", \"19\"]', 'Natural Chicken & Rice Dog Food', 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.', '[\"product/39.png\", \"product/54.png\", \"product/76.png\"]', 374.83, 'Taste of the Wild', 'Used', 0, '17.7', 63, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(84, 12, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'High-Protein Puppy Food', 'Specially designed for growing puppies, this food is rich in protein and DHA for brain development.', '[\"product/81.png\"]', 172.29, 'Earthborn Holistic', 'New', 0, '41.12', 38, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(85, 12, 2, '[\"5\"]', 'High-Protein Puppy Food', 'Specially designed for growing puppies, this food is rich in protein and DHA for brain development.', '[\"product/77.png\"]', 149.65, 'Whiskas', 'New', 1, '13.51', 64, 'Approved', 0, '2025-01-29 05:05:07', '2025-05-19 13:37:14'),
(86, 2, 4, '[\"14\", \"15\", \"16\"]', 'Goldfish Veggie Pellets', 'Plant-based pellets designed to support digestion and overall health in goldfish.', '[\"product/37.png\", \"product/66.png\", \"product/82.png\"]', 427.25, 'Wellness CORE', 'New', 0, '12.21', 83, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(87, 3, 4, '[\"13\", \"15\", \"16\"]', 'Sunflower & Millet Bird Seed', 'A premium blend of seeds to keep your parrot or cockatiel energized and happy.', '[\"product/6.png\", \"product/51.png\"]', 381.4, 'Canidae', 'Used', 1, '19.5', 69, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(88, 5, 5, '[\"17\", \"18\", \"19\", \"20\"]', 'High-Protein Betta Food', 'Specially crafted pellets to enhance the health and beauty of your betta fish.', '[\"product/14.png\", \"product/79.png\", \"product/40.png\"]', 167.22, 'Nature\'s Variety Instinct', 'Used', 1, '59.87', 34, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(89, 15, 6, '[\"21\", \"23\", \"24\"]', 'Calcium-Enriched Turtle Sticks', 'Floating sticks packed with calcium to strengthen turtle shells.', '[\"product/43.png\", \"product/24.png\", \"product/46.png\", \"product/78.png\", \"product/64.png\"]', 348.18, 'Orijen', 'New', 0, '32.84', 37, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(90, 2, 1, '[\"4\"]', 'Dental Care Dog Treats', 'These treats clean teeth and freshen breath while being irresistibly tasty.', '[\"product/20.png\", \"product/10.png\", \"product/53.png\", \"product/77.png\"]', 408.95, 'Meow Mix', 'Used', 0, '52.59', 91, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-31 01:10:38'),
(91, 5, 4, '[\"13\", \"14\", \"15\", \"16\"]', 'Pellet Mix for Guinea Pigs', 'Nutrient-rich pellets that support the dietary needs of guinea pigs.', '[\"product/2.png\", \"product/18.png\", \"product/14.png\", \"product/20.png\"]', 416.82, 'Friskies', 'Used', 1, '25.45', 105, 'Approved', 0, '2025-01-29 05:05:07', '2025-04-05 06:18:35'),
(92, 5, 3, '[\"12\"]', 'Vitamin-Enriched Snake Food', 'Prey-based food fortified with essential vitamins for snakes.', '[\"product/80.png\", \"product/13.png\"]', 413.51, 'Nature\'s Variety Instinct', 'New', 1, '37.48', 59, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(93, 8, 5, '[\"19\", \"20\"]', 'Vitamin C Treats for Guinea Pigs', 'Specially formulated treats with extra vitamin C to boost guinea pig health.', '[\"product/61.png\", \"product/70.png\", \"product/58.png\"]', 428.94, 'Canidae', 'Used', 1, '41.06', 90, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(94, 12, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'Soft Chew Cat Treats', 'Soft, chewy treats that are easy to digest and perfect for picky eaters.', '[\"product/32.png\", \"product/25.png\", \"product/69.png\"]', 62.05, 'Rachael Ray Nutrish', 'Used', 0, '22.85', 76, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(95, 10, 4, '[\"13\", \"14\", \"15\", \"16\"]', 'Calcium-Enriched Turtle Sticks', 'Floating sticks packed with calcium to strengthen turtle shells.', '[\"product/14.png\"]', 129.5, 'American Journey', 'Used', 0, '59.08', 30, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 06:10:09'),
(96, 5, 3, '[\"9\"]', 'Algae Wafers for Bottom Feeders', 'Ideal for plecos and other bottom-dwelling fish, these wafers provide essential nutrients.', '[\"product/9.png\", \"product/21.png\"]', 443.06, 'Taste of the Wild', 'Used', 0, '18.86', 23, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(97, 14, 6, '[\"21\", \"22\", \"23\", \"24\"]', 'Vitamin-Enriched Snake Food', 'Prey-based food fortified with essential vitamins for snakes.', '[\"product/48.png\", \"product/79.png\", \"product/65.png\", \"product/10.png\", \"product/77.png\"]', 141.05, 'Purina ONE', 'New', 1, '54.03', 100, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(98, 3, 6, '[\"21\"]', 'Soft Chew Cat Treats', 'Soft, chewy treats that are easy to digest and perfect for picky eaters.', '[\"product/68.png\", \"product/80.png\", \"product/33.png\"]', 55.42, 'American Journey', 'Used', 0, '5.59', 53, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(99, 8, 6, '[\"22\", \"24\"]', 'Natural Chicken & Rice Dog Food', 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.', '[\"product/75.png\", \"product/44.png\"]', 120.78, 'Sheba', 'Used', 1, '2.85', 72, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 06:12:07'),
(100, 16, 6, '[\"21\", \"22\", \"24\"]', 'Grain-Free Kitten Food', 'Made without grains or fillers, this food supports your kitten’s energy and growth.', '[\"product/70.png\", \"product/25.png\", \"product/34.png\", \"product/31.png\"]', 88.61, 'Iams', 'Used', 1, '65.46', 51, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(101, 9, 4, '[\"13\", \"14\", \"15\"]', 'Natural Chicken & Rice Dog Food', 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.', '[\"product/53.png\", \"product/46.png\", \"product/62.png\"]', 301.79, 'Purina ONE', 'Used', 1, '41.78', 46, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(102, 4, 5, '[\"18\"]', 'High-Protein Puppy Food', 'Specially designed for growing puppies, this food is rich in protein and DHA for brain development.', '[\"product/19.png\"]', 204.08, 'Blue Buffalo', 'New', 0, '11.52', 92, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(103, 8, 3, '[\"9\", \"10\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/82.png\", \"product/12.png\", \"product/70.png\", \"product/67.png\"]', 50.23, 'Meow Mix', 'New', 1, '69.26', 44, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(104, 15, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Nutty Hamster Treats', 'A mix of nuts and seeds to provide a fun and healthy snack for hamsters.', '[\"product/30.png\", \"product/69.png\"]', 439.11, 'Eukanuba', 'New', 0, '34.74', 25, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(105, 8, 1, '[\"1\", \"3\"]', 'Fruit-Infused Parakeet Mix', 'A delicious seed mix infused with dried fruits to provide essential vitamins.', '[\"product/13.png\", \"product/53.png\", \"product/76.png\", \"product/20.png\", \"product/8.png\"]', 261.04, 'Sheba', 'New', 0, '33.9', 75, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(106, 7, 5, '[\"18\"]', 'Calcium-Enriched Turtle Sticks', 'Floating sticks packed with calcium to strengthen turtle shells.', '[\"product/72.png\", \"product/81.png\", \"product/14.png\", \"product/19.png\"]', 423.79, 'Natural Balance', 'Used', 0, '64.28', 71, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(107, 6, 6, '[\"21\", \"22\", \"23\", \"24\"]', 'Nutty Hamster Treats', 'A mix of nuts and seeds to provide a fun and healthy snack for hamsters.', '[\"product/82.png\", \"product/29.png\"]', 111.37, 'American Journey', 'New', 1, '11.73', 96, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(108, 2, 3, '[\"10\"]', 'Timothy Hay for Rabbits', 'High-quality Timothy hay that promotes digestion and dental health in rabbits.', '[\"product/44.png\", \"product/11.png\", \"product/12.png\", \"product/40.png\", \"product/34.png\"]', 378.87, 'Sheba', 'New', 1, '2.78', 79, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(109, 2, 3, '[\"10\", \"11\", \"12\"]', 'Fruit-Infused Parakeet Mix', 'A delicious seed mix infused with dried fruits to provide essential vitamins.', '[\"product/26.png\", \"product/71.png\", \"product/63.png\"]', 69.17, 'Acana', 'New', 1, '46.7', 75, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(110, 15, 4, '[\"14\", \"15\", \"16\"]', 'Tropical Fish Color Enhancer Flakes', 'Boost the vibrant colors of your tropical fish with this nutrient-packed formula.', '[\"product/16.png\", \"product/32.png\", \"product/31.png\", \"product/54.png\"]', 421.69, 'Pedigree', 'New', 1, '17.17', 32, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(111, 15, 6, '[\"21\", \"22\", \"24\"]', 'Dental Care Dog Treats', 'These treats clean teeth and freshen breath while being irresistibly tasty.', '[\"product/53.png\", \"product/40.png\", \"product/66.png\"]', 317.28, 'The Honest Kitchen', 'Used', 0, '13.77', 49, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(112, 8, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'Wild Bird Attracting Mix', 'A special blend of seeds and nuts to attract wild birds to your backyard.', '[\"product/5.png\", \"product/33.png\"]', 214.86, 'Eukanuba', 'New', 1, '16.34', 120, 'Approved', 0, '2025-01-29 05:05:07', '2025-06-02 03:24:48'),
(113, 10, 3, '[\"10\", \"11\", \"12\"]', 'Insect Pellets for Geckos', 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.', '[\"product/25.png\", \"product/53.png\", \"product/31.png\", \"product/23.png\", \"product/49.png\"]', 79.64, 'Blue Buffalo', 'New', 0, '39.38', 40, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(114, 4, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'Marine Fish Brine Shrimp', 'Freeze-dried brine shrimp to support the dietary needs of marine fish.', '[\"product/49.png\", \"product/22.png\", \"product/13.png\"]', 89.18, 'Taste of the Wild', 'New', 0, '8.86', 46, 'Canceled', 0, '2025-01-29 05:05:07', '2025-05-15 09:42:09'),
(116, 15, 2, '[\"5\", \"6\"]', 'Goldfish Veggie Pellets', 'Plant-based pellets designed to support digestion and overall health in goldfish.', '[\"product/35.png\", \"product/30.png\", \"product/23.png\", \"product/51.png\"]', 85.97, 'Wellness CORE', 'Used', 0, '63.17', 35, 'Approved', 0, '2025-01-29 05:05:07', '2025-04-10 02:37:44'),
(117, 6, 5, '[\"17\", \"18\"]', 'Pellet Mix for Guinea Pigs', 'Nutrient-rich pellets that support the dietary needs of guinea pigs.', '[\"product/55.png\", \"product/24.png\", \"product/61.png\"]', 440.63, 'Solid Gold', 'Used', 1, '12.29', 28, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(118, 2, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'Salmon & Tuna Cat Kibble', 'A delicious mix of salmon and tuna flavors packed with omega-3 for a shiny coat.', '[\"product/76.png\", \"product/36.png\", \"product/62.png\", \"product/10.png\", \"product/25.png\"]', 463.34, 'Merrick', 'New', 0, '8.95', 17, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(119, 12, 4, '[\"13\", \"14\", \"16\"]', 'Hairball Control Cat Food', 'Formulated to reduce hairballs and improve digestion in long-haired cats.', '[\"product/42.png\", \"product/33.png\", \"product/12.png\", \"product/57.png\"]', 162.67, 'Blue Buffalo', 'Used', 1, '6.84', 96, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(120, 2, 6, '[\"21\", \"23\", \"24\"]', 'Insect Pellets for Geckos', 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.', '[\"product/26.png\"]', 86.8, 'Canidae', 'Used', 0, '6.39', 45, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(121, 8, 5, '[\"17\", \"18\", \"19\"]', 'Nutty Hamster Treats', 'A mix of nuts and seeds to provide a fun and healthy snack for hamsters.', '[\"product/17.png\", \"product/51.png\"]', 296.28, 'Nature\'s Variety Instinct', 'Used', 0, '10.41', 68, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(122, 2, 6, '[\"21\", \"24\"]', 'Gourmet Turkey Cat Stew', 'A savory turkey stew enriched with vitamins for adult cats.', '[\"product/75.png\", \"product/33.png\", \"product/63.png\"]', 358.94, 'Blue Basics', 'Used', 1, '31.87', 9, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(123, 15, 4, '[\"13\", \"14\"]', 'Pellet Mix for Guinea Pigs', 'Nutrient-rich pellets that support the dietary needs of guinea pigs.', '[\"product/45.png\", \"product/36.png\", \"product/17.png\", \"product/4.png\"]', 367.27, 'The Honest Kitchen', 'Used', 1, '58.14', 11, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(124, 11, 4, '[\"15\"]', 'Vitamin C Treats for Guinea Pigs', 'Specially formulated treats with extra vitamin C to boost guinea pig health.', '[\"product/8.png\", \"product/37.png\"]', 99.69, 'Acana', 'Used', 0, '56.09', 87, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(125, 10, 2, '[\"5\", \"7\", \"8\"]', 'Beef & Veggie Dog Chews', 'Long-lasting chews made with real beef and veggies to keep your dog busy and satisfied.', '[\"product/5.png\", \"product/13.png\", \"product/66.png\", \"product/62.png\", \"product/10.png\"]', 369.85, 'Rachael Ray Nutrish', 'Used', 1, '36', 86, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(126, 7, 6, '[\"21\", \"23\", \"24\"]', 'Carrot-Flavored Chew Sticks', 'Delicious and durable chew sticks that support dental health for small pets.', '[\"product/54.png\", \"product/43.png\"]', 109.63, 'Friskies', 'Used', 0, '10.77', 46, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(127, 14, 6, '[\"21\", \"24\"]', 'Grain-Free Kitten Food', 'Made without grains or fillers, this food supports your kitten’s energy and growth.', '[\"product/8.png\", \"product/6.png\"]', 190.76, 'Earthborn Holistic', 'New', 1, '13.82', 69, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(128, 5, 5, '[\"17\", \"19\", \"20\"]', 'Algae Wafers for Bottom Feeders', 'Ideal for plecos and other bottom-dwelling fish, these wafers provide essential nutrients.', '[\"product/36.png\", \"product/75.png\", \"product/15.png\"]', 85.42, 'Merrick', 'New', 1, '35.79', 25, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(129, 2, 5, '[\"18\", \"19\", \"20\"]', 'Insect Pellets for Geckos', 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.', '[\"product/57.png\", \"product/66.png\", \"product/40.png\", \"product/9.png\"]', 63.94, 'Eukanuba', 'Used', 1, '67.49', 68, 'Approved', 0, '2025-01-29 05:05:07', '2025-03-27 08:37:33'),
(130, 14, 2, '[\"5\", \"6\", \"8\"]', 'Marine Fish Brine Shrimp', 'Freeze-dried brine shrimp to support the dietary needs of marine fish.', '[\"product/61.png\", \"product/29.png\", \"product/2.png\", \"product/26.png\"]', 367.75, 'American Journey', 'New', 1, '22.09', 29, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(131, 9, 4, '[\"14\"]', 'Goldfish Veggie Pellets', 'Plant-based pellets designed to support digestion and overall health in goldfish.', '[\"product/53.png\", \"product/66.png\"]', 172.58, 'Nature\'s Variety Instinct', 'Used', 1, '44.97', 55, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(132, 14, 3, '[\"9\", \"12\"]', 'Gourmet Turkey Cat Stew', 'A savory turkey stew enriched with vitamins for adult cats.', '[\"product/66.png\"]', 382.74, 'Nutro', 'New', 1, '19.59', 43, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(133, 17, 1, '[\"1\", \"3\"]', 'Wild Bird Attracting Mix', 'A special blend of seeds and nuts to attract wild birds to your backyard.', '[\"product/22.png\"]', 322.73, 'Purina ONE', 'Used', 1, '31.03', 38, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(134, 11, 5, '[\"17\", \"18\", \"19\", \"20\"]', 'Calcium-Enriched Turtle Sticks', 'Floating sticks packed with calcium to strengthen turtle shells.', '[\"product/68.png\", \"product/75.png\", \"product/46.png\", \"product/74.png\"]', 184.42, 'Solid Gold', 'New', 1, '26.4', 19, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(135, 8, 2, '[\"7\", \"8\"]', 'Salmon & Tuna Cat Kibble', 'A delicious mix of salmon and tuna flavors packed with omega-3 for a shiny coat.', '[\"product/23.png\"]', 332.74, 'Solid Gold', 'Used', 1, '37.92', 34, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(136, 6, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Insect Pellets for Geckos', 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.', '[\"product/77.png\", \"product/37.png\", \"product/79.png\"]', 421.41, 'Rachael Ray Nutrish', 'New', 1, '40.38', 88, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(137, 13, 5, '[\"17\", \"19\", \"20\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/13.png\", \"product/81.png\", \"product/49.png\", \"product/22.png\"]', 201.74, 'Fancy Feast', 'New', 0, '18.14', 100, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(138, 13, 3, '[\"11\", \"12\"]', 'Mealworm Mix for Lizards', 'A protein-rich mealworm mix to keep lizards active and healthy.', '[\"product/41.png\", \"product/13.png\", \"product/68.png\"]', 438.66, 'Blue Basics', 'Used', 1, '37.56', 16, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(139, 17, 5, '[\"17\", \"19\", \"20\"]', 'Mealworm Mix for Lizards', 'A protein-rich mealworm mix to keep lizards active and healthy.', '[\"product/73.png\"]', 248.67, 'Solid Gold', 'New', 1, '63.39', 87, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(140, 14, 2, '[\"6\", \"7\"]', 'Vitamin-Rich Canary Food', 'Enriched with vitamins and minerals to support the vibrant health of canaries.', '[\"product/24.png\", \"product/54.png\", \"product/41.png\", \"product/4.png\"]', 221.24, 'Natural Balance', 'Used', 0, '65.25', 98, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(141, 7, 6, '[\"22\"]', 'Fruit-Infused Parakeet Mix', 'A delicious seed mix infused with dried fruits to provide essential vitamins.', '[\"product/63.png\", \"product/44.png\", \"product/75.png\", \"product/69.png\"]', 25.86, 'Friskies', 'Used', 1, '66.11', 79, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 06:08:19'),
(142, 16, 5, '[\"18\", \"20\"]', 'Organic Dog Biscuits', 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.', '[\"product/76.png\", \"product/58.png\", \"product/62.png\", \"product/66.png\", \"product/75.png\"]', 492.85, 'Purina ONE', 'Used', 1, '64.79', 54, 'Approved', 0, '2025-01-29 05:05:07', '2025-05-06 03:58:59'),
(143, 15, 4, '[\"15\", \"16\"]', 'Egg & Honey Bird Treats', 'Protein-packed treats with a hint of honey for added flavor.', '[\"product/74.png\", \"product/14.png\", \"product/54.png\", \"product/44.png\", \"product/4.png\"]', 226.33, 'The Honest Kitchen', 'New', 0, '55.62', 29, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(144, 8, 4, '[\"13\", \"14\", \"15\"]', 'Hairball Control Cat Food', 'Formulated to reduce hairballs and improve digestion in long-haired cats.', '[\"product/7.png\", \"product/24.png\"]', 16.94, 'Friskies', 'Used', 0, '13.73', 36, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(145, 4, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Vitamin-Rich Canary Food', 'Enriched with vitamins and minerals to support the vibrant health of canaries.', '[\"product/79.png\"]', 116.2, 'Nutro', 'New', 0, '38.79', 86, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(146, 3, 4, '[\"13\", \"14\", \"15\"]', 'Insect Pellets for Geckos', 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.', '[\"product/12.png\"]', 261.8, 'Sheba', 'New', 0, '13.74', 8, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(147, 11, 3, '[\"9\", \"12\"]', 'Grain-Free Kitten Food', 'Made without grains or fillers, this food supports your kitten’s energy and growth.', '[\"product/81.png\", \"product/30.png\", \"product/9.png\", \"product/49.png\"]', 326.06, 'Natural Balance', 'New', 1, '20.35', 18, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(148, 2, 2, '[\"5\", \"6\", \"7\", \"8\"]', 'Natural Chicken & Rice Dog Food', 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.', '[\"product/50.png\"]', 153.11, 'Friskies', 'New', 0, '59.53', 45, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-31 09:04:34'),
(149, 14, 1, '[\"1\", \"2\", \"3\", \"4\"]', 'Wild Bird Attracting Mix', 'A special blend of seeds and nuts to attract wild birds to your backyard.', '[\"product/55.png\", \"product/38.png\", \"product/19.png\", \"product/16.png\", \"product/41.png\"]', 339.28, 'Whiskas', 'Used', 0, '28.62', 39, 'Pending', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(150, 14, 4, '[\"13\", \"14\", \"15\"]', 'Vitamin C Treats for Guinea Pigs', 'Specially formulated treats with extra vitamin C to boost guinea pig health.', '[\"product/45.png\", \"product/13.png\", \"product/26.png\"]', 191.38, 'Eukanuba', 'New', 0, '32.48', 41, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(151, 9, 5, '[\"20\"]', 'Mealworm Mix for Lizards', 'A protein-rich mealworm mix to keep lizards active and healthy.', '[\"product/21.png\", \"product/58.png\", \"product/31.png\", \"product/22.png\"]', 298.35, 'American Journey', 'New', 1, '6.53', 34, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(152, 8, 2, '[\"5\", \"6\", \"7\", \"8\"]', 'Vitamin-Enriched Snake Food', 'Prey-based food fortified with essential vitamins for snakes.', '[\"product/77.png\", \"product/20.png\", \"product/39.png\", \"product/64.png\"]', 389.69, 'The Honest Kitchen', 'New', 1, '3.22', 10, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(153, 2, 3, '[\"9\", \"11\"]', 'Natural Chicken & Rice Dog Food', 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.', '[\"product/68.png\", \"product/57.png\", \"product/2.png\", \"product/40.png\", \"product/28.png\"]', 214.19, 'Earthborn Holistic', 'New', 1, '64.52', 9, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-30 02:55:03'),
(154, 12, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'Calcium-Enriched Turtle Sticks', 'Floating sticks packed with calcium to strengthen turtle shells.', '[\"product/31.png\"]', 347.09, 'Fancy Feast', 'Used', 1, '35.94', 43, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(155, 3, 5, '[\"17\", \"18\", \"19\", \"20\"]', 'Goldfish Veggie Pellets', 'Plant-based pellets designed to support digestion and overall health in goldfish.', '[\"product/43.png\"]', 33.19, 'Canidae', 'New', 0, '54.14', 75, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-31 00:47:30'),
(156, 4, 3, '[\"9\", \"10\", \"11\", \"12\"]', 'Pellet Mix for Guinea Pigs', 'Nutrient-rich pellets that support the dietary needs of guinea pigs.', '[\"product/48.png\"]', 334.19, 'Blue Buffalo', 'Used', 1, '23.87', 68, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-30 02:49:27'),
(157, 2, 5, '[\"20\"]', 'Wild Bird Attracting Mix', 'A special blend of seeds and nuts to attract wild birds to your backyard.', '[\"product/42.png\", \"product/30.png\", \"product/67.png\", \"product/9.png\"]', 316.93, 'Eukanuba', 'Used', 0, '24.94', 62, 'Canceled', 0, '2025-01-29 05:05:07', '2025-01-29 05:05:07'),
(158, 5, 2, '[\"5\", \"6\", \"8\"]', 'Gourmet Turkey Cat Stew', 'A savory turkey stew enriched with vitamins for adult cats.', '[\"product/49.png\"]', 16.1, 'Orijen', 'New', 0, '52.07', 19, 'Approved', 0, '2025-01-29 05:05:07', '2025-04-10 02:38:32'),
(159, 2, 6, '[\"22\"]', 'Natural Chicken & Rice Dog Food', 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.', '[\"product/63.png\"]', 425.16, 'American Journey', 'Used', 1, '46.54', 116, 'Approved', 0, '2025-01-29 05:05:07', '2025-01-29 23:36:20'),
(162, 2, 5, '[\"18\", \"19\", \"20\"]', 'Fruit-Infused Parakeet Mix', 'A delicious seed mix infused with dried fruits to provide essential vitamins.', '[\"product/36.png\", \"product/53.png\", \"product/76.png\", \"product/42.png\", \"product/38.png\"]', 147.51, 'Rachael Ray Nutrish', 'Used', 1, '6.48', 72, 'Approved', 0, '2025-01-29 05:05:07', '2025-04-22 03:34:16'),
(168, 83, 1, '[\"4\"]', 'Dog collar', 'Dog collar', '[\"product/17473352616826385d84664.jpg\"]', 10, 'Collina', 'used', 0, '29.8', 0, 'Approved', 0, '2025-05-15 12:54:21', '2025-05-15 12:54:21'),
(170, 83, 3, '[\"9\", \"10\"]', 'Collar', 'Dog collar', '[\"product/1747650724682b08a4c8ed3.jpg\"]', 10, 'Viva', 'used', 0, '59.53', 0, 'Approved', 0, '2025-05-19 04:32:04', '2025-05-19 04:32:04'),
(171, 83, 3, '[\"9\", \"10\"]', 'Collar', 'Dog collar', '[\"product/1747650751682b08bfcce66.jpg\"]', 10, 'Viva', 'used', 0, '69.28', 0, 'Approved', 0, '2025-05-19 04:32:31', '2025-05-19 04:32:31'),
(172, 83, 3, '[\"9\", \"10\"]', 'Collar', 'Dog collar', '[\"product/1747650753682b08c11b908.jpg\"]', 10, 'Viva', 'used', 0, '28.81', 0, 'Approved', 0, '2025-05-19 04:32:33', '2025-05-19 04:32:33'),
(173, 83, 3, '[\"9\", \"10\"]', 'Collar', 'Dog collar', '[\"product/1747650757682b08c59a8b7.jpg\"]', 10, 'Viva', 'used', 0, '4.19', 0, 'Approved', 0, '2025-05-19 04:32:37', '2025-05-19 04:32:37'),
(174, 2, 1, '[\"1\", \"2\"]', 'Internal Interactions Director', 'Voluptas aut provident in qui veritatis voluptas corporis.', '[\"product/17484246396836d7bf70790.png\", \"product/17484246396836d7bf70b20.jpg\"]', 1000, 'Industrial', 'good', 1, '1.52', 0, 'Approved', 0, '2025-05-28 03:26:54', '2025-05-28 03:30:39'),
(185, 2, 4, '[\"14\"]', 'Title', 'Vhhh', '[\"product/17493748696845579575a14.jpg\"]', 55, 'Gyy', 'used', 0, '34', 0, 'Approved', 0, '2025-06-08 03:27:49', '2025-06-08 03:27:49'),
(189, 2, 1, '[\"2\", \"4\"]', 'Cvg', 'Fgg', '[\"product/174937675568455ef3e9f05.jpg\"]', 5885, 'Fggg', 'new', 1, '2255', 0, 'Approved', 0, '2025-06-08 03:59:15', '2025-06-08 03:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_promotions`
--

CREATE TABLE `product_promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `promoted_amount` float NOT NULL,
  `promotion_start` date DEFAULT NULL,
  `promotion_end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_promotions`
--

INSERT INTO `product_promotions` (`id`, `product_id`, `promoted_amount`, `promotion_start`, `promotion_end`, `created_at`, `updated_at`) VALUES
(1, 71, 10, '2025-01-29', '2025-02-03', '2025-01-29 06:14:47', '2025-01-29 06:14:47'),
(2, 71, 4, '2025-01-30', '2025-02-01', '2025-01-29 21:42:59', '2025-01-29 21:42:59'),
(3, 71, 15, '2025-01-30', '2025-02-02', '2025-01-29 21:49:23', '2025-01-29 21:49:23'),
(4, 71, 10, '2025-01-31', '2025-02-02', '2025-01-31 01:18:54', '2025-01-31 01:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `buyer_id` bigint UNSIGNED NOT NULL,
  `products_id` bigint UNSIGNED NOT NULL,
  `rating` bigint UNSIGNED DEFAULT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `seller_id`, `buyer_id`, `products_id`, `rating`, `review`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 20, 4, 'Gshs', '2025-01-29 01:03:46', '2025-01-29 01:03:46'),
(3, 2, 3, 20, 5, 'Good', '2025-01-29 22:09:32', '2025-01-29 22:09:32'),
(4, 2, 5, 159, 5, 'Hdbxbxbx', '2025-01-29 22:34:20', '2025-01-29 22:34:20'),
(5, 2, 5, 159, 4, 'Jdndnd', '2025-01-29 22:34:54', '2025-01-29 22:34:54'),
(6, 2, 2, 12, 0, 'Hshd', '2025-05-28 06:57:33', '2025-05-28 06:57:33'),
(7, 2, 2, 12, 4, 'Hshd', '2025-05-28 06:57:47', '2025-05-28 06:57:47'),
(8, 2, 2, 71, 4, 'Gg', '2025-05-28 06:58:43', '2025-05-28 06:58:43'),
(9, 2, 2, 12, 4, 'Gjv', '2025-06-02 03:26:42', '2025-06-02 03:26:42'),
(10, 5, 2, 12, 0, NULL, '2025-06-16 06:05:10', '2025-06-16 06:05:10'),
(11, 5, 2, 12, 0, NULL, '2025-06-16 06:06:18', '2025-06-16 06:06:18'),
(12, 2, 2, 12, 0, NULL, '2025-06-16 06:06:20', '2025-06-16 06:06:20'),
(13, 2, 2, 71, 0, NULL, '2025-06-16 06:06:25', '2025-06-16 06:06:25'),
(14, 5, 2, 12, 0, NULL, '2025-06-16 06:39:06', '2025-06-16 06:39:06'),
(15, 5, 2, 12, 0, NULL, '2025-06-16 06:42:28', '2025-06-16 06:42:28'),
(16, 5, 2, 12, 0, NULL, '2025-06-16 06:44:51', '2025-06-16 06:44:51'),
(17, 5, 2, 12, 0, NULL, '2025-06-16 06:45:05', '2025-06-16 06:45:05'),
(18, 5, 2, 12, 0, NULL, '2025-06-16 06:45:06', '2025-06-16 06:45:06'),
(19, 5, 2, 12, 0, 'Review text is empty', '2025-06-16 07:02:08', '2025-06-16 07:02:08'),
(20, 5, 2, 12, 0, 'Review text is empty', '2025-06-16 07:02:12', '2025-06-16 07:02:12'),
(21, 5, 2, 12, 0, 'Review text is empty', '2025-06-16 07:02:41', '2025-06-16 07:02:41'),
(22, 5, 2, 12, 0, 'Review text is empty', '2025-06-16 07:03:13', '2025-06-16 07:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0TaPdFFbUruLyBRTXQULuN5OyCsoBzAL2sOm5vdV', NULL, '194.187.177.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS01nR056NWNIeXhaWFJsbzR3RnNHeGRPNm1udHZraU1BeElaVjhBTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751089452),
('2rxqtXKrMGD7zHs9A2dJ0ws6L10gC7lI8N926L4F', NULL, '3.130.96.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWlVb0lpWXdlRWJmMkhibHRiYzdqa1pPY0RINXJsWXh2aU80emtXTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751008214),
('5YA7a217ugA98v1wZQ1e6wPmiF9zPAnSKROZal9H', NULL, '3.130.96.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienJOMnV0RDdhMGNZT3V0MGJ0TlpVM1lsUTlhZmFtSlo0RGpuOEhSeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751194408),
('7HUf8hjeWRTeLkuPTpcqmfPMg4v990ByrK8XBGtU', NULL, '167.94.138.178', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclhpWFh3TlM4dnptMGV5VGJwRk1TbGVqTzY2dUoyRHRZSzJnN1hCNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751129643),
('91PftbwVVZIMN3cOX8R3H4Lk3fRMAbqZNwWTLopK', NULL, '64.62.197.62', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3puWXhCbWtQbjNvNGt0alMzc3RLOHFKa0VsdUMxR0NoOG5rUUtLNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751024929),
('9o70l9ExVcSNTF4nPTrVku9p9cz1o0iSbx0En1PQ', NULL, '52.53.247.75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGVaUWtBYTJqOWhmWmoydzhnYTVoT2piZGtxUEY2ZUgzQVBPZ1VJYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751047525),
('DJ9ZL9QUNuPLRNFDyZ3ypf5JZ9UArgGU0LMkjo5l', NULL, '185.247.137.223', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1pycjhXNkRMNUVPMW1WUWNHa2o4TmVwTHpacllJa0ZBZXdrQ09OTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751196803),
('dxGoOHd9GLIKombTtAA0cf3nrkXLhPZ0LjDlDNWa', NULL, '128.14.237.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU9XMkFneTFtR1lCWmRWUEJjZEdyaTNGVGtrQjl2NHZSOWpTajNZMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751198274),
('G6xTBYn7oEIwWP43XqsZEACIT0nHNWsp3TayUusx', NULL, '3.131.215.38', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjZibVduOW9iZEE1RUZrRWl5Q3dma01IaHZLUFVYUTQ1MTlrTjBHZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751123027),
('G8tN3lWQ9CHOXFnFJLNeyiBlPkVzwZ2TM4QbholW', NULL, '64.62.156.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZSVnVUdHFhU0VkRDhQWDJMOFNrRHdwWVNxSGdYWjh1b3dUTld0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751089601),
('L8V2sxIZbNiNW243D95SHXJbQWwEz6ngWGk3v09K', NULL, '64.62.197.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEt6aE13V2xPZXlrSUxCbFFLNzhHVHp0a2VJSmc3MDJhVFNXdjdWeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9hcGkuaXBpZnkub3JnLz9mb3JtYXQ9anNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751024945),
('NFfbtoHth9IgiAPqlrBY067sk5l4kGSVnA9puatu', NULL, '178.62.53.176', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUxwVlNHcWNjTlBiVDE2MXRvUHhTWVNGQm15aUh0elF3YjNvV1lnUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751161328),
('tOZUrCnS5r4MVDfUsf6seMrKXIdbHFgR2GWP2Yur', NULL, '3.131.215.38', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUxnOG54OUw1OGlpeTlhU1BjUGFoQnR4ZXhreDkzRTNocVFvcXZoMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751123116),
('TSo59LX60ZseCyMUfCxKwMbxoF3PqUnPehiZmz8i', NULL, '64.62.156.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW9zSDZyYXhPeWVFSjlEdkFVTUxOZFNiNWgwRXVrdXBwRXdMQ1hLeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9hcGkuaXBpZnkub3JnLz9mb3JtYXQ9anNvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751089619),
('tXURV6acgC2fGZ5s4LjPewzHW0TJwt9QkXdALZTg', NULL, '3.130.96.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3UxZjVNdFJJTFllTFphOHQxNWtweVBpV1IyYXgxdkk0bjBybG1uaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751008082),
('Yea74dDQB3TqJabdbWsr0atgQn3yvU2NSJEQTuO8', NULL, '167.94.138.192', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTdEY1dsOXBLdVp2S3liWUJUOVVqd051bGpkZU15QmYxSllhaDFQUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751039842),
('Z7yeUXw1BeskAJGFvVieXY3uNPd5DZLXJQR2JStc', NULL, '20.169.81.90', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTFmSlU2TjAwRTNBUGJLaVlmRVZnQU41YzhIYkpxMnJxTEs2Z0ZkUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751047357),
('ZebLuiV6g6km3PJoX0OWBJpKzHWuFUuKjSDQ0oAN', NULL, '195.184.76.201', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3pzSnpETVNVbnk5S0lVVGdrVWpweVVidnpNTk9sYjh3enIyWHJGaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751030990),
('ZFV4ddnMOSYjz4bhek9H85V9MIdho2AI0IaeJ8GO', NULL, '3.130.96.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXJDR2J3ZXpsNVB0cmxHaGJ2aTFtNHV3SkIwYkZWZHVlZjBmMWNwZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xODIuMjUyLjY4LjIyNzo4MDAxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1751194211);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `data`, `created_at`, `updated_at`) VALUES
(1, 'Terms and Conditions', '<h4 data-start=\"188\" data-end=\"212\" class=\"\">1. <strong data-start=\"196\" data-end=\"212\">Introduction</strong></h4>\n<p data-start=\"213\" data-end=\"377\" class=\"\">Welcome to <strong data-start=\"224\" data-end=\"235\">Petmart</strong>! By accessing and<strong><u> using our website, </u></strong>you agree to comply with and be bound by the following terms and conditions. Please read them carefully.</p>\n<h4 data-start=\"379\" data-end=\"410\" class=\"\">2. <strong data-start=\"387\" data-end=\"410\">Acceptance of Terms</strong></h4>\n<p data-start=\"411\" data-end=\"583\" class=\"\">By using Petmart, you agree to the terms and conditions laid out in this agreement. If you do not agree with any part of these terms, please refrain from using our website.</p>\n<h4 data-start=\"585\" data-end=\"616\" class=\"\">3. <strong data-start=\"593\" data-end=\"616\">Product Information</strong></h4>\n<p data-start=\"617\" data-end=\"884\" class=\"\">We strive to provide accurate product descriptions and images. However, we do not guarantee that all information, including prices, is completely accurate or up to date at all times. Petmart reserves the right to change or update product details without prior notice.</p>\n<h4 data-start=\"886\" data-end=\"915\" class=\"\">4. <strong data-start=\"894\" data-end=\"915\">User Registration</strong></h4>\n<p data-start=\"916\" data-end=\"1146\" class=\"\">To access certain features of the website, you may need to create an account. By registering, you agree to provide accurate and complete information. You are responsible for maintaining the confidentiality of your account details.</p>\n<h4 data-start=\"1148\" data-end=\"1169\" class=\"\">5. <strong data-start=\"1156\" data-end=\"1169\">Purchases</strong></h4>\n<p data-start=\"1170\" data-end=\"1392\" class=\"\">All transactions made on Petmart are subject to our return and refund policy. Prices listed on the website are in the applicable currency and may be subject to change. Sales tax and shipping costs may be added at checkout.</p>\n<h4 data-start=\"1394\" data-end=\"1413\" class=\"\">6. <strong data-start=\"1402\" data-end=\"1413\">Payment</strong></h4>\n<p data-start=\"1414\" data-end=\"1613\" class=\"\">Petmart accepts various payment methods, including credit/debit cards, online payment systems, and other available methods. You agree to provide valid payment information during the purchase process.</p>\n<h4 data-start=\"1615\" data-end=\"1648\" class=\"\">7. <strong data-start=\"1623\" data-end=\"1648\">Shipping and Delivery</strong></h4>\n<p data-start=\"1649\" data-end=\"1886\" class=\"\">We offer shipping to various locations. Shipping costs, delivery times, and other related details will be provided during checkout. Please note that Petmart is not responsible for delays or issues caused by third-party shipping carriers.</p>\n<h4 data-start=\"1888\" data-end=\"1919\" class=\"\">8. <strong data-start=\"1896\" data-end=\"1919\">Returns and Refunds</strong></h4>\n<p data-start=\"1920\" data-end=\"2156\" class=\"\">We accept returns on certain products as per our return policy. Products must be returned in their original condition within a specified period for a refund or exchange. Please refer to our <strong data-start=\"2110\" data-end=\"2138\">Return and Refund Policy</strong> for more details.</p>\n<h4 data-start=\"2158\" data-end=\"2182\" class=\"\">9. <strong data-start=\"2166\" data-end=\"2182\">User Conduct</strong></h4>\n<p data-start=\"2183\" data-end=\"2286\" class=\"\">You agree not to misuse the website or engage in any unlawful activities, including but not limited to:</p>\n<ul data-start=\"2287\" data-end=\"2419\">\n<li data-start=\"2287\" data-end=\"2328\" class=\"\">\n<p data-start=\"2289\" data-end=\"2328\" class=\"\">Uploading malicious software or content</p>\n</li>\n<li data-start=\"2329\" data-end=\"2374\" class=\"\">\n<p data-start=\"2331\" data-end=\"2374\" class=\"\">Using the website for fraudulent activities</p>\n</li>\n<li data-start=\"2375\" data-end=\"2419\" class=\"\">\n<p data-start=\"2377\" data-end=\"2419\" class=\"\">Violating any intellectual property rights</p>\n</li>\n</ul>\n<h4 data-start=\"2421\" data-end=\"2448\" class=\"\">10. <strong data-start=\"2430\" data-end=\"2448\">Privacy Policy</strong></h4>\n<p data-start=\"2449\" data-end=\"2634\" class=\"\">Petmart respects your privacy and is committed to protecting your personal information. Please refer to our <strong data-start=\"2557\" data-end=\"2575\">Privacy Policy</strong> for details on how we collect, use, and protect your data.</p>\n<h4 data-start=\"2636\" data-end=\"2670\" class=\"\">11. <strong data-start=\"2645\" data-end=\"2670\">Intellectual Property</strong></h4>\n<p data-start=\"2671\" data-end=\"2851\" class=\"\">All content on the website, including text, images, logos, and trademarks, is owned by Petmart or its licensors. You may not use, copy, or reproduce any content without permission.</p>\n<h4 data-start=\"2853\" data-end=\"2889\" class=\"\">12. <strong data-start=\"2862\" data-end=\"2889\">Limitation of Liability</strong></h4>\n<p data-start=\"2890\" data-end=\"3070\" class=\"\">Petmart is not liable for any damages arising from the use or inability to use the website, including but not limited to any direct, indirect, incidental, or consequential damages.</p>\n<h4 data-start=\"3072\" data-end=\"3107\" class=\"\">13. <strong data-start=\"3081\" data-end=\"3107\">Modifications to Terms</strong></h4>\n<p data-start=\"3108\" data-end=\"3323\" class=\"\">Petmart reserves the right to update or modify these terms at any time. Any changes will be posted on this page with the updated date. By continuing to use the website after such changes, you agree to the new terms.</p>', '2025-01-27 00:23:49', '2025-04-23 03:54:18'),
(2, 'Legal Notes', '<h3 data-start=\"110\" data-end=\"130\" class=\"\"><strong data-start=\"114\" data-end=\"130\">Legal Notice</strong></h3>\n<h4 data-start=\"132\" data-end=\"156\" class=\"\">1. <strong data-start=\"140\" data-end=\"156\">Introduction</strong></h4>\n<p data-start=\"157\" data-end=\"443\" class=\"\">This website (\"Petmart\") is owned and operated by [Your Business Name]. By accessing and using this website, you agree to comply with the following terms and conditions, as well as any applicable laws and regulations. If you do not agree with these terms, you must not use this website.</p>\n<h4 data-start=\"445\" data-end=\"477\" class=\"\">2. <strong data-start=\"453\" data-end=\"477\">Ownership of Content</strong></h4>\n<p data-start=\"478\" data-end=\"841\" class=\"\">The content, including but not limited to text, graphics, images, logos, icons, and software, contained within this website is owned by or licensed to [Your Business Name] and is protected by intellectual property laws. You are not permitted to copy, reproduce, distribute, or otherwise use any content from this site without prior written consent from the owner.</p>', '2025-01-27 00:23:49', '2025-04-23 03:55:16'),
(3, 'Our Platform', '<p>Welcome to the <strong data-start=\"187\" data-end=\"207\">Petmart Platform</strong> (\"Platform\"), owned and operated by [Your Business Name]. By accessing, browsing, or using this Platform, you agree to be bound by the following terms and conditions (\"Terms\"). If you do not agree with these Terms, you must not use the Platform.</p>', '2025-01-27 00:23:49', '2025-04-23 03:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` bigint UNSIGNED NOT NULL,
  `parcel_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_number` longtext COLLATE utf8mb4_unicode_ci,
  `tracking_url` longtext COLLATE utf8mb4_unicode_ci,
  `label_url` longtext COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `payment_id`, `parcel_id`, `tracking_number`, `tracking_url`, `label_url`, `shipping_status`, `created_at`, `updated_at`) VALUES
(24, 135, '506121504', '1ZF3E1436801373470', 'https://tracking.eu-central-1-0.sendcloud.sc/forward?carrier=ups&code=1ZF3E1436801373470&destination=GB&lang=en-gb&source=GB&type=parcel&verification=BN3+5PB&servicepoint_verification=&shipping_product_code=ups%3Astandard&recipient_name=Demo+User+1&created_at=2025-05-28&tracking_identifier=1ZF3E1436801373470', 'https://panel.sendcloud.sc/api/v2/labels/label_printer/506121504', 'Label Downloaded', '2025-05-28 05:14:37', '2025-06-02 03:30:31'),
(25, 138, '506172276', '1ZF3E1436822398388', 'https://tracking.eu-central-1-0.sendcloud.sc/forward?carrier=ups&code=1ZF3E1436822398388&destination=GB&lang=en-gb&source=GB&type=parcel&verification=BN3+5PB&servicepoint_verification=&shipping_product_code=ups%3Astandard&recipient_name=Demo+User+1&created_at=2025-05-28&tracking_identifier=1ZF3E1436822398388', 'https://panel.sendcloud.sc/api/v2/labels/label_printer/506172276', 'Label Downloaded', '2025-05-28 06:32:26', '2025-06-02 03:41:07'),
(26, 139, '507653499', '1ZF3E1436806356024', 'https://tracking.eu-central-1-0.sendcloud.sc/forward?carrier=ups&code=1ZF3E1436806356024&destination=GB&lang=en-gb&source=GB&type=parcel&verification=BN3+5PB&servicepoint_verification=&shipping_product_code=ups%3Astandard&recipient_name=Demo+User+1&created_at=2025-06-02&tracking_identifier=1ZF3E1436806356024', NULL, 'Pending', '2025-06-02 03:28:15', '2025-06-02 03:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'sliders/1.jpg', '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(2, 'sliders/2.jpg', '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(3, 'sliders/3.jpg', '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(4, 'sliders/4.jpg', '2025-01-27 00:23:49', '2025-01-27 00:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `subcriptions`
--

CREATE TABLE `subcriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `subscription_amount` float NOT NULL,
  `subscription_start` date DEFAULT NULL,
  `subscription_end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dry Dog Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(2, 1, 'Wet Dog Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(3, 1, 'Dog Treats', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(4, 1, 'Dog Toys', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(5, 2, 'Dry Cat Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(6, 2, 'Wet Cat Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(7, 2, 'Cat Treats', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(8, 2, 'Cat Toys', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(9, 3, 'Small Pet Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(10, 3, 'Small Pet Cages', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(11, 3, 'Bedding', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(12, 3, 'Small Pet Toys', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(13, 4, 'Fish Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(14, 4, 'Aquariums', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(15, 4, 'Filters & Pumps', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(16, 4, 'Aquarium Decorations', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(17, 5, 'Bird Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(18, 5, 'Bird Cages', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(19, 5, 'Perches & Stands', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(20, 5, 'Bird Toys', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(21, 6, 'Reptile Food', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(22, 6, 'Terrariums', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(23, 6, 'Heating & Lighting', '2025-01-27 00:23:48', '2025-01-27 00:23:48'),
(24, 6, 'Reptile Accessories', '2025-01-27 00:23:48', '2025-06-04 05:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user/avatar.png',
  `role` enum('ADMIN','USER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `subscription_plan` enum('Free','Monthly','Yearly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `product_upload` bigint UNSIGNED NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `avatar`, `role`, `email_verified_at`, `password`, `otp`, `otp_expires_at`, `google_id`, `facebook_id`, `stripe_account_id`, `status`, `subscription_plan`, `product_upload`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mahedi', 'admin@gmail.com', 'Dhaka', 'user/1738400041.png', 'ADMIN', '2025-01-27 00:23:47', '$2y$12$TQkPivShwv7n0T4G.OzgQ.BRQUwrLu59OYsi6t4yMzRbHF/rpcnAO', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-27 00:23:47', '2025-05-15 09:05:01', NULL),
(2, 'Demo User 1', 'user1@gmail.com', 'your addrtess', 'user/1738125961.jpg', 'USER', '2025-01-27 00:23:47', '$2y$12$o.HKhAJX12.ssDBcI2vFTeVnuaoqCf/CH9tJSh5QyhkV1UUNFZhLC', NULL, NULL, NULL, NULL, 'acct_1RTfkv4DGa7N9U4c', 'active', 'Free', 18, NULL, '2025-01-27 00:23:47', '2025-06-08 03:59:15', NULL),
(3, 'Sazzat hossen update', 'user2@gmail.com', '123 Main Street', 'user/1738208554.jpg', 'USER', '2025-01-27 00:23:47', '$2y$12$xnYaHjoMte2JsaEQf7.42.kBiwnMMXlCdLbb1t2HSYtTiWoKWZ.r2', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 13, NULL, '2025-01-27 00:23:47', '2025-01-29 22:08:47', NULL),
(4, 'Demo User 3', 'user3@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-27 00:23:47', '$2y$12$HGJT0Hz1pR1xf9kzg..ME.2MyHug9LKI.6QkJs690DUPAh4Xc7IVi', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-27 00:23:47', '2025-01-27 00:23:47', NULL),
(5, 'Demo User 4', 'user4@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-27 00:23:47', '$2y$12$o.HKhAJX12.ssDBcI2vFTeVnuaoqCf/CH9tJSh5QyhkV1UUNFZhLC', NULL, NULL, NULL, NULL, 'acct_1QnH1J4CaZiYWBPi', 'active', 'Free', 0, NULL, '2025-01-27 00:23:47', '2025-01-31 04:05:56', NULL),
(6, 'Jillur Rahman', 'jrtushar@gmail.com', 'Dhaka', 'user/1737970757.jpeg', 'USER', '2025-01-27 03:39:17', '$2y$12$xI6Dr4VfNA/slt4obbT9YOx05kZbqgTyth8ETL2Nc1aowRqkAO/Ua', '267753', '2025-04-05 11:58:01', '105566105961392937817', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-27 03:39:17', '2025-04-05 05:48:01', NULL),
(7, 'Asikul Islam Sazzat', 'asikuldislamsazzat553@gmail.com', 'Dhaka', 'user/1738122872.jpeg', 'USER', '2025-01-28 21:54:32', '$2y$12$Rko.tDKJ9lvEhZvG4sdu3etZnUhp7VTwDTOvnh6Bd9odVOdfVR31.', NULL, NULL, '100985592439379612589', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 21:54:32', '2025-01-28 21:54:32', NULL),
(8, 'Asikul Islam Sazzat', 'asisdskuslislamsazzat@gmail.com', 'Dhaka', 'user/1738123084.jpeg', 'USER', '2025-01-28 21:58:04', '$2y$12$sdxko1eXjCPJHFdhDPRkk.JF6/e0QtNdg5.7WRA0odASWfY/DWErS', NULL, NULL, '101919710599764646413', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 21:58:04', '2025-01-28 21:58:04', NULL),
(9, 'sta chatgpt', 'stagpt2024@gmail.com', 'Dhaka', 'user/1738123896.jpeg', 'USER', '2025-01-28 22:11:36', '$2y$12$abhIQrOW7Eem5v33QS9iEOaGppNEoKCk9Qdz3hiOeu2/BDarMHFo.', '773251', '2025-03-22 11:06:56', '116539687954542088923', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 22:11:36', '2025-04-05 03:35:11', NULL),
(10, 'bdcallingsdt sparktech', 'bdcallingsdt@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-28 22:25:49', '$2y$12$X7skqFoNDxXoayLJpuSuVun4xxQgJsP1kVdG7R2NItUtFwrFATnYC', NULL, NULL, '104056614290981283869', NULL, 'acct_1QnGc04JI3Vz9S5d', 'active', 'Free', 0, NULL, '2025-01-28 22:25:49', '2025-01-31 03:39:02', NULL),
(11, 'Sazzat Hossen', 'asikuldislamsazzat93@gmail.com', 'Dhaka', 'user/1738124924.jpg', 'USER', '2025-01-28 22:28:12', '$2y$12$.ypyD6GoTRtx0V4ZGn0SyuBb2hqwyNefFbNFT5wYDx6yX94idoi7S', NULL, NULL, '114531072197382040232', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 22:28:12', '2025-01-28 22:28:44', NULL),
(12, 'Sazzat Akon', 'terehoh@kuandika.com', 'Dhaka', 'user/avatar.png', 'USER', NULL, '$2y$12$BKqg2xx9o6W0neC0tN6jwemYM7VHSqUFbwSCCI7Td7c5wIn/DfXx.', '911274', '2025-01-29 04:43:55', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-28 22:33:55', '2025-01-28 22:33:55', NULL),
(13, 'Sazzat Akon', 'terehoh364@kuandika.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-28 22:35:27', '$2y$12$1PwOQIM26JQkFLCb4hLBsOk/4VpY704NhEIOiWnHOaaVKvxto4a06', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 22:34:53', '2025-01-28 22:35:27', NULL),
(14, 'Sazzat Hossen', 'sekaco8816@rykone.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-28 22:39:28', '$2y$12$kDVuxXBugSRyLiQULz1miOPL.Yi8Q/Biuk.ev.JX2G.fkcSFI7xGS', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 22:38:51', '2025-01-28 22:39:28', NULL),
(15, 'Tushar', 'jrtushar1@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', NULL, '$2y$12$o4U5.iNhaVSyvd4Rq0TNROJov/tK6j4/fXllggGtvWzOAVgXllJ9W', '695040', '2025-01-29 05:22:14', NULL, NULL, 'acct_1QnBk9QQdILZJbUN', 'inactive', 'Free', 0, NULL, '2025-01-28 23:12:14', '2025-01-28 23:12:14', NULL),
(16, 'Miss Glenda Romaguera', 'cagax82824@pofmagic.com', 'Dhaka', 'user/avatar.png', 'USER', NULL, '$2y$12$PDZRv85fttd6rMCVCvAAsOopQY7efkOL/uqTlif..h7LYgPnahGaa', '441840', '2025-01-29 05:24:29', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-28 23:14:29', '2025-01-28 23:14:29', NULL),
(17, 'Tushar', 'jrtushar2@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-28 23:19:48', '$2y$12$tXXP3VZoIqErPJMKEajXY.bTf0m7PPJ3oyKhjlL99N6GG/EkYIq6q', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-28 23:18:53', '2025-01-28 23:19:48', NULL),
(18, 'Tate Tillman PhD', 'cassin.angelina@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'lLK3oxsNPp', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(19, 'Mr. Sidney Funk', 'matt.jacobi@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'Uw74ws2WVc', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(20, 'Cleo Parker', 'qreynolds@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'E7YdcjJNwD', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(21, 'Prof. Giovani Cassin', 'abdullah.mills@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'QKrznBHyun', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(22, 'Grace Hyatt MD', 'rolfson.andreanne@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'iH24HosMi7', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(23, 'Dr. Katharina Huel Sr.', 'everardo.ruecker@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'VM2oF9U8Hj', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(24, 'Toni Kerluke', 'kshlerin.logan@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'KXnYhHkx5U', '2025-05-21 05:33:20', '2025-01-29 05:33:20', NULL),
(25, 'Hardy Bahringer', 'roberta.oconnell@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 's6gg6JNClC', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(26, 'Mr. Norbert Padberg', 'mona.emard@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'vd6ciJg7f8', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(27, 'Samson Brakus PhD', 'htillman@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'xUpZZYeG2s', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(28, 'Lavonne Walter', 'cwalter@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'DOrU7JDdI1', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(29, 'Sherwood Schoen', 'joelle81@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'yf8gAl56q7', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(30, 'Mrs. Ova Mayer', 'anais79@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '89S5gF36jn', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(31, 'Dr. Martine Sauer III', 'domenic43@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'JTrKADAH6X', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(32, 'Randall Kub', 'hintz.stephan@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 't5YRwHIPkH', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(33, 'Jamar Konopelski', 'rex88@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'qbVzLOcGmO', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(34, 'Jeramy Crist Sr.', 'magali.prohaska@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'JXjGVDaZQ5', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(35, 'Marjorie McLaughlin PhD', 'omari.murphy@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'bsdcDQ6bxc', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(36, 'Prof. August Bechtelar', 'kristofer66@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '7fHI4IwflF', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(37, 'Prof. Princess Fisher', 'price.royce@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'fT2ePfiHRF', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(38, 'Miss Rosanna Hansen', 'melyna83@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'VIFFrr0Fws', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(39, 'Devon Veum', 'sean88@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'UTFGLOWDrT', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(40, 'Perry Kulas', 'kiehn.godfrey@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'Q8ibVAGij0', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(41, 'Jennyfer Miller', 'zjacobi@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'dWkPe6AyeM', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(42, 'Janice Hoppe', 'sister.heathcote@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'azCcAh0lTw', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(43, 'Blanca Kulas', 'frankie.gulgowski@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'MsRMe0n9gS', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(44, 'Maverick Hermann V', 'maya39@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'pux8bMEiIm', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(45, 'Era Kuhlman', 'jorge31@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '08h9QEHXqK', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(46, 'Mr. Darius Ullrich III', 'nlittel@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'o0oiHpPLid', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(47, 'Angus Collins', 'mhills@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '0qJKpWUvW9', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(48, 'Yesenia Walker', 'fay94@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'nELIiusx9S', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(49, 'Pietro Marquardt', 'barton33@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'PYp6unWZt3', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(50, 'Berry Welch', 'dbergstrom@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'agdJDb2tef', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(51, 'Mrs. Roxane Wolf V', 'tyson.grady@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '8vWfiEqIhl', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(52, 'Bettie Bradtke', 'jayde.kulas@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'kJg3E5MoFZ', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(53, 'Dr. Dulce Wilderman', 'rozella.bauch@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '6q1fT2U25X', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(54, 'Mrs. Luella Leuschke', 'ransom88@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'pwRLyfH0GV', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(55, 'Shania Wolff', 'nmills@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'dy6O3oSHbE', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(56, 'Mercedes Schaden', 'cora32@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'DroA1xy0GR', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(57, 'Trent Boyer', 'dfeil@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'uKykyxwXSp', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(58, 'Colton Swift', 'mrobel@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'keRBUJPH7p', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(59, 'Toney Padberg PhD', 'mckenzie.bernhard@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'NVCDgxAfqs', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(60, 'Mrs. Barbara Howell', 'rashad.balistreri@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'z6SMVr3ZQo', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(61, 'Grant Stoltenberg', 'hagenes.ethel@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'BPxWlvCgpm', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(62, 'Dr. Jamil Schmeler MD', 'dallin.kshlerin@example.org', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'bfzUdvTbMv', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(63, 'Stella Yost', 'mckenzie.darien@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'EBgLjBMQ9g', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(64, 'Ebony Prohaska III', 'trantow.don@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'DoPUz3jLsz', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(65, 'Desiree Williamson', 'ookuneva@example.net', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'AxyxBcp4gs', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(66, 'Marisa Flatley', 'jakubowski.viviane@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, 'MGWEHlYENX', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(67, 'Dr. Jocelyn McDermott IV', 'rblanda@example.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:33:20', '$2y$12$P6z96N/qDKYd9jIpAxjAFukE59FPPeaAi1kOajdbhTBmQ0WV2.JDG', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, '2oVMO0pNOy', '2025-01-29 05:33:20', '2025-01-29 05:33:20', NULL),
(69, 'Tester', 'asikulislamsazzat93@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-29 05:59:38', '$2y$12$ed3SM7xflXHjbDdYOcConOYFDxmAzc0nVVDriiQ4FcBzeRUCkQHp2', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-29 05:58:18', '2025-01-29 22:12:25', NULL),
(70, 'Asikul Islam Sazzat', 'asikulislamsazzat553@gmail.com', 'Dhaka', 'user/1738152028.jpeg', 'USER', '2025-01-29 06:00:28', '$2y$12$.dO9hYX/ndIja8G0iR7V1.HCTwRh6GhCS72qYKWjN5JSSIptUu0BK', NULL, NULL, '100985592439379612589', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-29 06:00:28', '2025-01-29 06:00:28', NULL),
(73, 'Md. Sazzat Hossen Akon', 'thisissazzat@gmail.com', NULL, 'user/1738210482.jpeg', 'USER', '2025-01-29 22:14:42', '$2y$12$oHbzp6G38qu64O6ZTp.DnuTvTt5RvvGPyR798UZCyzWPrcqgYGmVe', '385321', '2025-05-15 15:45:31', '117285065071843985733', NULL, 'acct_1RH0514Jwjt1s1Z2', 'active', 'Free', 1, NULL, '2025-01-29 22:14:42', '2025-05-19 04:28:41', NULL),
(74, 'Rojifa apa', 'rojr02054@gmail.com', 'Banasree,  Dhaka', 'user/avatar.png', 'USER', '2025-01-29 22:16:41', '$2y$12$te0H/55ohYW8SLZ9ECG9kuPlMPo2BVOiOb/pK.TlFxE47jiRXIsky', '571914', '2025-01-30 06:46:09', NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-29 22:16:15', '2025-01-30 00:36:09', NULL),
(75, 'Kerry Jerde', 'quroiwuerioquwioeru@pofmagic.com', '230 Laisha Tunnel', 'user/avatar.png', 'USER', NULL, '$2y$12$h25oYJMvbq5FPX/rEpxGxu36ckM9ENydf1UDmJnEc42BAjwqmJkD.', '505637', '2025-01-30 04:32:03', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-29 22:22:03', '2025-01-29 22:22:03', NULL),
(76, 'Brittany Schroeder', 'quroiwuerdioquwioeru@pofmagic.com', '1457 Senger Rapids', 'user/avatar.png', 'USER', NULL, '$2y$12$7brkLK6pHXuwyB5o2cUMNeXuy9Gp6sYbONNgJkiLO/vb2oemXGUAW', '745352', '2025-01-30 04:32:10', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-29 22:22:10', '2025-01-29 22:22:10', NULL),
(77, 'Dexter Powlowski', 'quroiwuaserdioquwioeru@pofmagic.coms', '948 Schumm Gardens', 'user/avatar.png', 'USER', NULL, '$2y$12$TE7n3QHYKiYuSgy/LHa7k.60rt10DK9.1mA9x/H3Dkvxc4pejYx7e', '731952', '2025-01-30 04:32:19', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-29 22:22:20', '2025-01-29 22:22:20', NULL),
(78, 'Johanna Dickinson', 'cagax828245@pofmagic.com', '3218 Schiller Village', 'user/avatar.png', 'USER', NULL, '$2y$12$QhDJ.XqsSbW8.2uUpXO4QeaDTJrq/CTba6EcfLPG6KPROEMU5F34u', '759250', '2025-01-30 05:01:44', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-29 22:51:45', '2025-01-29 22:51:45', NULL),
(79, 'Omor', 'omor@gmail.com', 'Dd', 'user/avatar.png', 'USER', NULL, '$2y$12$xnYaHjoMte2JsaEQf7.42.kBiwnMMXlCdLbb1t2HSYtTiWoKWZ.r2', '211118', '2025-01-30 06:01:45', NULL, NULL, 'acct_1RLiupQLPYmH125b', 'inactive', 'Free', 0, NULL, '2025-01-29 23:51:46', '2025-05-06 04:40:10', NULL),
(80, 'omor', 'omor1@gmail.com', 'Dd', 'user/avatar.png', 'USER', NULL, '$2y$12$w2b0SHMJDArWpAfds8b2PuMHaLw2.jDyyaoEt0QGEyx3xl67aDkC2', '701920', '2025-01-30 06:08:14', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-01-29 23:58:15', '2025-01-30 04:58:16', NULL),
(81, 'Jillur5', 'jillur5@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', '2025-01-31 01:04:44', '$2y$12$rY7xgA9cPPmy55iDy7yST.vqHsg9BKowezzYsXo824L95vJ5mub7G', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-31 01:04:12', '2025-01-31 01:04:44', NULL),
(82, 'Asikul Islam Sazzat', 'asikulislamsazzat345@gmail.com', NULL, 'user/1738316229.jpeg', 'USER', '2025-01-31 03:37:09', '$2y$12$/E7beW6AzjCdzZAIkRwci.rTT.NingSp6Tc/bGfT4oeDbJcfkjO/C', NULL, NULL, '101312667489962990741', NULL, NULL, 'active', 'Free', 0, NULL, '2025-01-31 03:37:09', '2025-01-31 04:34:41', NULL),
(83, 'Elena', 'blasioelena18@gmail.com', 'Vico dei Cangi 15', 'user/1745238338.jpg', 'USER', '2025-02-02 05:12:57', '$2y$12$poSBsLyh60Pzna.sqUKyiOTp6/6VXG1AeM7SkYh7vynYoDXr7rrru', NULL, NULL, '105669829444780284031', NULL, 'acct_1RGNqfQTJTjwcsHt', 'active', 'Free', 7, NULL, '2025-02-02 05:12:57', '2025-05-19 04:32:37', NULL),
(84, 'Rickey Lewis', 'rickeylewis.39175@gmail.com', NULL, 'user/1744276666.jpeg', 'USER', '2025-04-10 03:17:46', '$2y$12$aCAKmZSki7vyDhgO42aGz./qvDRE.uERwslnteKj.PT/WzBZhBXma', NULL, NULL, '105467748688578702107', NULL, NULL, 'active', 'Free', 0, NULL, '2025-04-10 03:17:46', '2025-04-10 03:17:46', NULL),
(85, 'Tatum Antonio', 'tatumantonio.01801@gmail.com', NULL, 'user/1744278432.jpeg', 'USER', '2025-04-10 03:47:12', '$2y$12$ypQOv7nPA07xDt6h3zH5huETwt7UbzE7SNDXRqlxP4bvSpCnmuteG', NULL, NULL, '103058444283998841843', NULL, NULL, 'active', 'Free', 0, NULL, '2025-04-10 03:47:12', '2025-04-10 03:47:12', NULL),
(86, 'Moses Freeman', 'mosesfreeman.70764@gmail.com', NULL, 'user/1745233771.jpeg', 'USER', '2025-04-21 05:09:31', '$2y$12$ErCWyocom5h3IcsYYRAuE.WYn8gkgfDlZdc88TDlI7FQbycStFx4S', NULL, NULL, '108456005137869521520', NULL, NULL, 'active', 'Free', 0, NULL, '2025-04-21 05:09:31', '2025-04-21 05:09:31', NULL),
(87, 'Tush', 'tush@gmail.com', 'Dhaka', 'user/avatar.png', 'USER', NULL, '$2y$12$8RRHD2uykUA5cVvAmP1Av.Z087rkdDM18VObWVus4MXKZ37o6OX6S', '986053', '2025-05-06 13:44:35', NULL, NULL, NULL, 'inactive', 'Free', 0, NULL, '2025-05-06 07:34:35', '2025-05-06 07:34:35', NULL),
(88, 'Md Jusef', 'xoconej596@daupload.com', 'Dhaka, Bangladesh', 'user/avatar.png', 'USER', '2025-05-17 04:38:53', '$2y$12$grAp6OKFkvannOvMxmm04uEuuLxP0Dd3V6T.6PsW9qe/IJPXPY74C', NULL, NULL, NULL, NULL, NULL, 'active', 'Free', 0, NULL, '2025-05-17 04:38:24', '2025-05-17 04:38:53', NULL),
(89, 'demo name', 'dsf@gmail.comd', NULL, 'user/avatar.png', 'USER', '2025-06-07 22:56:32', '$2y$12$glKhH9WaAA.JphZMpc8k0ubFu0iKOQdhyW19.Kk.lR4UM9z6uwIFC', NULL, NULL, '105566105961392937817', NULL, NULL, 'active', 'Free', 0, NULL, '2025-06-07 22:56:32', '2025-06-07 22:56:32', NULL),
(90, 'Jillur Rahman', 'jrmrcglobal@gmail.com', NULL, 'user/1749360577.jpeg', 'USER', '2025-06-07 23:29:37', '$2y$12$LR9RvkbMaccDNL53OMyMIepiSau5ZOQuAYHCk8Cb28WGe1zV.2O9W', NULL, NULL, '100656279998275599505', NULL, NULL, 'active', 'Free', 0, NULL, '2025-06-07 23:29:37', '2025-06-07 23:29:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

CREATE TABLE `user_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_can_upload` bigint UNSIGNED DEFAULT NULL,
  `plan_price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_plans`
--

INSERT INTO `user_plans` (`id`, `plan_type`, `max_can_upload`, `plan_price`, `created_at`, `updated_at`) VALUES
(1, 'Free', 1000, 0, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(2, 'Monthly', 2000, 1, '2025-01-27 00:23:49', '2025-01-27 00:23:49'),
(3, 'Yearly', 3000, 2, '2025-01-27 00:23:49', '2025-01-27 00:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 3, 20, '2025-01-29 00:07:56', '2025-01-29 00:07:56'),
(7, 2, 12, '2025-01-29 04:55:18', '2025-01-29 04:55:18'),
(11, 70, 129, '2025-01-29 06:05:04', '2025-01-29 06:05:04'),
(13, 70, 91, '2025-01-29 06:05:23', '2025-01-29 06:05:23'),
(14, 70, 159, '2025-01-29 06:05:29', '2025-01-29 06:05:29'),
(15, 70, 82, '2025-01-29 06:05:40', '2025-01-29 06:05:40'),
(16, 70, 141, '2025-01-29 06:08:18', '2025-01-29 06:08:18'),
(17, 70, 71, '2025-01-29 06:08:32', '2025-01-29 06:08:32'),
(21, 70, 95, '2025-01-29 06:09:45', '2025-01-29 06:09:45'),
(24, 70, 36, '2025-01-29 06:10:51', '2025-01-29 06:10:51'),
(27, 70, 99, '2025-01-29 06:12:06', '2025-01-29 06:12:06'),
(32, 4, 36, '2025-01-29 10:23:23', '2025-01-29 10:23:23'),
(33, 4, 159, '2025-01-29 10:23:32', '2025-01-29 10:23:32'),
(42, 5, 159, '2025-01-29 22:41:31', '2025-01-29 22:41:31'),
(49, 2, 91, '2025-01-29 23:07:37', '2025-01-29 23:07:37'),
(50, 2, 36, '2025-01-29 23:07:46', '2025-01-29 23:07:46'),
(51, 9, 36, '2025-01-30 02:46:32', '2025-01-30 02:46:32'),
(52, 81, 36, '2025-01-31 01:06:11', '2025-01-31 01:06:11'),
(53, 81, 20, '2025-01-31 01:08:19', '2025-01-31 01:08:19'),
(54, 81, 90, '2025-01-31 01:10:37', '2025-01-31 01:10:37'),
(57, 2, 71, '2025-05-28 03:37:43', '2025-05-28 03:37:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_centers`
--
ALTER TABLE `help_centers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `help_centers_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `offer_prices`
--
ALTER TABLE `offer_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_prices_seller_id_foreign` (`seller_id`),
  ADD KEY `offer_prices_buyer_id_foreign` (`buyer_id`),
  ADD KEY `offer_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_buyer_id_foreign` (`buyer_id`),
  ADD KEY `payments_seller_id_foreign` (`seller_id`),
  ADD KEY `payments_product_id_foreign` (`product_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_promotions`
--
ALTER TABLE `product_promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_promotions_product_id_foreign` (`product_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_seller_id_foreign` (`seller_id`),
  ADD KEY `ratings_buyer_id_foreign` (`buyer_id`),
  ADD KEY `ratings_products_id_foreign` (`products_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcriptions`
--
ALTER TABLE `subcriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcriptions_user_id_foreign` (`user_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_otp_unique` (`otp`);

--
-- Indexes for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `help_centers`
--
ALTER TABLE `help_centers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `offer_prices`
--
ALTER TABLE `offer_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `product_promotions`
--
ALTER TABLE `product_promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcriptions`
--
ALTER TABLE `subcriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `help_centers`
--
ALTER TABLE `help_centers`
  ADD CONSTRAINT `help_centers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offer_prices`
--
ALTER TABLE `offer_prices`
  ADD CONSTRAINT `offer_prices_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offer_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offer_prices_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_promotions`
--
ALTER TABLE `product_promotions`
  ADD CONSTRAINT `product_promotions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcriptions`
--
ALTER TABLE `subcriptions`
  ADD CONSTRAINT `subcriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
