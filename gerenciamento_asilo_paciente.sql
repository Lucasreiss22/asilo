-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gerenciamento_asilo
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `idade` int(11) NOT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `nome_responsavel` varchar(255) DEFAULT NULL,
  `telefone_responsavel` varchar(20) DEFAULT NULL,
  `grau_parentesco` varchar(100) DEFAULT NULL,
  `doencas_cronicas` text DEFAULT NULL,
  `alergias` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `cirurgias` text DEFAULT NULL,
  `historico_internacoes` text DEFAULT NULL,
  `vacinas` text DEFAULT NULL,
  `exames` text DEFAULT NULL,
  `condicoes_cognitivas` text DEFAULT NULL,
  `alteracoes_humor` text DEFAULT NULL,
  `comportamento_social` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Lucas Reis Lucas','1999-08-02',25,'Masculino','Rio Grande do Norte','14195179700','2681311-9','35984165311','teresópolis','Mara','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Mara','1974-07-29',50,'Feminino','casada','07548661738','2681311-8','35984165312','teresópolis','Lucas','35984165311','filho',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Lucas Reis Lucas','1999-08-02',25,'Masculino','solteiro','07363946728','109842203','35984165311','teresópolis','Gloria','2199999999','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'gtethethyt','1999-05-02',25,'Feminino','tgrshth','11111111111','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','filho',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'ffgbwthtr','0199-08-02',25,'Masculino','wdefgrtg','1234567891011','2681311-8','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'gtrerh','1999-08-02',25,'Masculino','Rio Grande do Norte','14567894152','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Lucas Reis Lucas','1999-08-02',25,'Masculino','Rio Grande do Norte','15463258721','2681311-8','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'ghyethey','1999-08-02',25,'Masculino','Rio Grande do Norte','15463287451','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'bwthtwrh','1999-08-02',25,'Masculino','Rio Grande do Norte','45565481597','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'fvsbg','1999-08-02',49,'Masculino','Rio Grande do Norte','45164284531','2681311-8','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'fdbsgbg','1118-12-05',25,'Masculino','Rio Grande do Norte','15434685156','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'fdbsgbg','1118-12-05',25,'Masculino','Rio Grande do Norte','15434685155','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'rgregrew','1999-08-02',25,'Masculino','gtwgwt','14195179704','2681311-9','35984165311','teresópolis','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'rgregrew','1999-08-02',25,'Masculino','gtwgwt','14195179708','2681311-9','35984165311','teresópolis','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'rgregrew','1999-08-02',25,'Masculino','gtwgwt','14195179709','2681311-9','35984165311','teresópolis','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'rgregrew','1999-08-02',25,'Masculino','gtwgwt','14195179703','2681311-9','35984165311','teresópolis','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Lucas Reis Lucas','1999-08-02',67,'Masculino','Rio Grande do Norte','14195179701','2681311-9','35984165311','teresópolis','Lucas Reis Lucas','35984165311','Mãe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 20:44:34
