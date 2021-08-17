-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.25 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para db_sa
DROP DATABASE IF EXISTS `db_sa`;
CREATE DATABASE IF NOT EXISTS `db_sa` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sa`;

-- Copiando estrutura para tabela db_sa.apartamentos
DROP TABLE IF EXISTS `apartamentos`;
CREATE TABLE IF NOT EXISTS `apartamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `torre` varchar(45) NOT NULL,
  `apartamento` varchar(45) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.apartamentos: ~0 rows (aproximadamente)
DELETE FROM `apartamentos`;
/*!40000 ALTER TABLE `apartamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela db_sa.encomendas
DROP TABLE IF EXISTS `encomendas`;
CREATE TABLE IF NOT EXISTS `encomendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `morador_id` int DEFAULT NULL,
  `destinatario` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remetente` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_recebimento` datetime NOT NULL,
  `data_entrega` datetime DEFAULT NULL,
  `observacao` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `porteiro_recebeu` int DEFAULT NULL,
  `porteiro_entregou` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.encomendas: ~0 rows (aproximadamente)
DELETE FROM `encomendas`;
/*!40000 ALTER TABLE `encomendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `encomendas` ENABLE KEYS */;

-- Copiando estrutura para tabela db_sa.moradores
DROP TABLE IF EXISTS `moradores`;
CREATE TABLE IF NOT EXISTS `moradores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `documento` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascimento` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `apartamento_id` int DEFAULT NULL,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.moradores: ~0 rows (aproximadamente)
DELETE FROM `moradores`;
/*!40000 ALTER TABLE `moradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `moradores` ENABLE KEYS */;

-- Copiando estrutura para tabela db_sa.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sobrenome` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` enum('MORADOR','PORTEIRO','SINDICO') NOT NULL DEFAULT 'MORADOR',
  `ativo` enum('ATIVO','INATIVO') DEFAULT 'ATIVO',
  `nascimento` date DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.usuarios: ~1 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nome`, `sobrenome`, `email`, `senha`, `tipo`, `ativo`, `nascimento`, `telefone`) VALUES
	(1, 'Joao', 'Silva', 'admin@admin.com', '$2y$10$BVMmxD.E9GOZrPkpAqFLWOaZ6m3pwhWXuC9s1m1/cNqhyXeI.2XEa', 'SINDICO', 'ATIVO', '2021-07-08', '(47) 99999-9999');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
