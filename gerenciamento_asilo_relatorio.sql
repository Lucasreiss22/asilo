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
-- Table structure for table `relatorio`
--

DROP TABLE IF EXISTS `relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `responsavel` varchar(255) DEFAULT NULL,
  `pressao` varchar(50) DEFAULT NULL,
  `frequencia_cardiaca` varchar(50) DEFAULT NULL,
  `temperatura` varchar(50) DEFAULT NULL,
  `consciencia` varchar(255) DEFAULT NULL,
  `dor` varchar(255) DEFAULT NULL,
  `refeicoes` text DEFAULT NULL,
  `hidratacao` text DEFAULT NULL,
  `mobilidade` text DEFAULT NULL,
  `higiene` text DEFAULT NULL,
  `medicamentos` text DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `paciente_cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_cpf` (`paciente_cpf`),
  CONSTRAINT `relatorio_ibfk_1` FOREIGN KEY (`paciente_cpf`) REFERENCES `paciente` (`cpf`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio`
--

LOCK TABLES `relatorio` WRITE;
/*!40000 ALTER TABLE `relatorio` DISABLE KEYS */;
INSERT INTO `relatorio` VALUES (1,'2024-10-13','00:00:00','Mara / enfermeira','130/80 mmHg  ','78 bpm','37.2°C ','Lúcida, orientada  ','Moderada (3/10), aliviada após paracetamol','80% das refeições ingeridas  ','Adequada  ','Necessita auxílio para caminhar ','Fraldas trocadas 3 vezes, sem intercorrências  ','frfwrg','tgt2gt2','14195179700'),(2,'2024-10-14','00:00:00','Mara / enfermeira','130/80 mmHg  ','78 bpm','37.2°C ','Lúcida, orientada  ','Moderada (3/10), aliviada após paracetamol','80% das refeições ingeridas  ','Adequada  ','Necessita auxílio para caminhar ','Fraldas trocadas 3 vezes, sem intercorrências  ','ytrjhyrj','yjhrtjytj','14195179700');
/*!40000 ALTER TABLE `relatorio` ENABLE KEYS */;
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
