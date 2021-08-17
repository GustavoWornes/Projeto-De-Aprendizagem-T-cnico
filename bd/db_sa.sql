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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.apartamentos: ~10 rows (aproximadamente)
DELETE FROM `apartamentos`;
/*!40000 ALTER TABLE `apartamentos` DISABLE KEYS */;
INSERT INTO `apartamentos` (`id`, `torre`, `apartamento`, `usuario_id`) VALUES
	(1, '1', '101', 3),
	(2, '1', '102', 4),
	(3, '1', '103', 5),
	(4, '1', '104', 0),
	(5, '2', '101', 0),
	(6, '2', '102', 0),
	(7, '2', '103', 0),
	(8, '2', '104', 0),
	(9, '3', '101', 0),
	(10, '3', '105', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.encomendas: ~0 rows (aproximadamente)
DELETE FROM `encomendas`;
/*!40000 ALTER TABLE `encomendas` DISABLE KEYS */;
INSERT INTO `encomendas` (`id`, `morador_id`, `destinatario`, `remetente`, `data_recebimento`, `data_entrega`, `observacao`, `porteiro_recebeu`, `porteiro_entregou`) VALUES
	(1, 3, 'Maria dos Santos', 'Mercado Livre', '2021-06-28 16:57:00', '2021-06-29 17:03:00', '    ', 1, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.moradores: ~1 rows (aproximadamente)
DELETE FROM `moradores`;
/*!40000 ALTER TABLE `moradores` DISABLE KEYS */;
INSERT INTO `moradores` (`id`, `nome`, `sobrenome`, `documento`, `nascimento`, `email`, `telefone`, `usuario_id`, `apartamento_id`, `data_entrada`, `data_saida`) VALUES
	(3, 'Maria', 'dos Santos', '123.456.789-01', '1988-04-03', 'maria@maria.com', '(47) 98989-8989', 3, 1, '2021-06-09', NULL),
	(4, 'Mariana', 'dos Santos', '215.454.578-75', '2021-06-01', 'mariana@gmail.com', '(47) 56545-4567', 3, 1, NULL, NULL),
	(5, 'Mariano', 'dos Santos', '546.546.876-87', '2021-06-03', 'mariano@gmail.com', '(44) 54545-787', 3, 1, '2021-06-29', NULL),
	(6, 'Pedro', 'Carvalho', '324.545.454-56', '2021-06-16', 'pedro@gmail.com', '(44) 24245-4545', 5, 3, '2021-06-16', NULL),
	(7, 'Marcos', 'Carvalho', '645.545.645-46', '2021-06-08', 'marcos@gmail.com', '(47) 98989-8989', 5, 3, '2021-06-17', NULL),
	(8, 'Josefa', 'Pereira', '154.646.546-54', '2021-06-02', 'josefa@gmail.com', '(45) 45455-4545', 4, 2, '2021-06-22', NULL),
	(9, 'Jose', 'Pereira', '312.123.134-54', '2021-06-08', 'jose@gmail.com', '(47) 54545-4545', 4, 2, '2021-06-18', NULL);
/*!40000 ALTER TABLE `moradores` ENABLE KEYS */;

-- Copiando estrutura para tabela db_sa.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sobrenome` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` enum('MORADOR','PORTEIRO','SINDICO') NOT NULL DEFAULT 'MORADOR',
  `ativo` enum('ATIVO','INATIVO') DEFAULT 'ATIVO',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela db_sa.usuarios: ~5 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nome`, `sobrenome`, `email`, `senha`, `tipo`, `ativo`) VALUES
	(1, 'Joao', 'Silva', 'admin@admin.com', '$2y$10$Xlk5t1ZwJOTboOVs1QoFx.uF39Hk0DzV7E3rjyWqjRhMLrxjyWdva', 'SINDICO', 'ATIVO'),
	(2, 'Severino', 'dos Santos', 'severino@gmail.com', '$2y$10$jgVIV.jqnUGjur17jGcXTOn7NB6yw7AenBfNXtX0rfwaFq7jT0Zd6', 'PORTEIRO', 'ATIVO'),
	(3, 'Maria', 'Nascimento', 'maria@gmail.com', '$2y$10$NwjKfG6oSLqvgxFqaQ2SoO4K5093DKjzsRJJttYUMUVUAxgD7j9eu', 'MORADOR', 'ATIVO'),
	(4, 'Jose', 'Pereira', 'jose@gmail.com', '$2y$10$y9ZmFC/hisaHSWBOiEgNY.6gVdN2TWEKV1WM1RlJFE5IYUNQzZiWa', 'MORADOR', 'ATIVO'),
	(5, 'Pedro', 'Carvalho', 'pedro@gmail.com', '$2y$10$Vwgs/sTwNp15tFYGDKccXOudQYbIu4FvvC62ms47HYEoi1cC1BH8.', 'MORADOR', 'ATIVO');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
