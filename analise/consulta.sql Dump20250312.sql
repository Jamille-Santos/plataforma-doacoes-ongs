-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projeto_final_m3
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_ong` int DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `comentario` text,
  `data_avaliacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_ong` (`id_ong`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_ong`) REFERENCES `ong` (`id_ong`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,1,1,5,'Ótima iniciativa! Atendimento excelente.','2024-03-08 12:00:00'),(2,2,2,4,'Muito bom, mas poderia ter mais transparência.','2024-03-09 15:30:00'),(3,3,3,3,'A ideia é boa, mas precisa de mais apoio.','2024-03-10 09:20:00');
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campanha`
--

DROP TABLE IF EXISTS `campanha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campanha` (
  `id_campanha` int NOT NULL AUTO_INCREMENT,
  `id_ong` int DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` text,
  `meta_arrecadacao` decimal(10,0) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  PRIMARY KEY (`id_campanha`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campanha`
--

LOCK TABLES `campanha` WRITE;
/*!40000 ALTER TABLE `campanha` DISABLE KEYS */;
INSERT INTO `campanha` VALUES (1,1,'Atendimento para as crianças carentes','Campanha para compra de remédios e compra de equipamentos médicos',25000,'2022-12-01'),(2,2,'Conhecimento para todos','Doação de livros para crianças',20000,'2022-11-05');
/*!40000 ALTER TABLE `campanha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doacao`
--

DROP TABLE IF EXISTS `doacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doacao` (
  `id_doacao` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_campanha` int DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `metodo_pagamento` enum('cartão','dinheiro','pix','boleto') DEFAULT NULL,
  `data_doacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_doacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doacao`
--

LOCK TABLES `doacao` WRITE;
/*!40000 ALTER TABLE `doacao` DISABLE KEYS */;
INSERT INTO `doacao` VALUES (1,1,1,100,'pix','2024-03-05 14:30:00'),(2,2,2,50,'cartão','2024-03-06 10:15:00'),(3,3,3,200,'dinheiro','2024-03-07 18:45:00');
/*!40000 ALTER TABLE `doacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ong`
--

DROP TABLE IF EXISTS `ong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ong` (
  `id_ong` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `categoria` enum('saúde','educação','meio ambiente','direitos humanos') DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `descricao` text,
  `contato` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_ong`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ong`
--

LOCK TABLES `ong` WRITE;
/*!40000 ALTER TABLE `ong` DISABLE KEYS */;
INSERT INTO `ong` VALUES (1,'Médicos Sem Fronteiras','saúde','12.345.678/0001-90','ONG de ajuda médica humanitária.','11987654321'),(2,'Educa Brasil','educação','98.765.432/0001-12','Promoção da educação em comunidades carentes.','21965432187'),(3,'Verde para o Futuro','meio ambiente','11.223.344/0001-55','Preservação ambiental e reflorestamento.','11955556666'),(4,'Direitos Humanos Já','direitos humanos','33.444.555/0001-77','Defesa dos direitos humanos no Brasil.','11944447777');
/*!40000 ALTER TABLE `ong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatoriotransparencia`
--

DROP TABLE IF EXISTS `relatoriotransparencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatoriotransparencia` (
  `id_relatorio` int NOT NULL AUTO_INCREMENT,
  `id_ong` int DEFAULT NULL,
  `descricao` text,
  `data_publicacao` date DEFAULT NULL,
  `total_gasto` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_relatorio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatoriotransparencia`
--

LOCK TABLES `relatoriotransparencia` WRITE;
/*!40000 ALTER TABLE `relatoriotransparencia` DISABLE KEYS */;
INSERT INTO `relatoriotransparencia` VALUES (1,1,'Compra de remédios para 500 pessoas.','2023-02-05',30000),(2,2,'Compra de 500 livros para crianças carentes.','2024-06-20',10000);
/*!40000 ALTER TABLE `relatoriotransparencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `senha` varchar(80) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Julianne','juliannev@gmail.com','123456','2025-03-10'),(2,'Deivid','deivid123@gmail.com','senha12','2025-03-10'),(3,'Melissa','melissaP@gmail.com','segredo123456','2025-03-10'),(4,'Jamille','jamille321@gmail.com','senhasenha','2025-03-10'),(5,'Davi','daviN@gmail.com','654321','2025-03-10'),(6,'Jonas','jonas321@gmail.com','321321','2025-03-10'),(7,'Maria Alice','marialice@gmail.com','senhaaa','2025-03-10');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-12 18:13:39
