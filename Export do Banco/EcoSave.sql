-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ecosave
-- ------------------------------------------------------
-- Server version	8.0.43
CREATE DATABASE EcoSave;
use EcoSave;

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id_animal` varchar(8) NOT NULL,
  `id_resgate` varchar(8) DEFAULT NULL,
  `id_especie` varchar(8) DEFAULT NULL,
  `condicao` text,
  `status` enum('Resgatado','Em tratamento','Solto','Falecido') NOT NULL DEFAULT 'Resgatado',
  `id_tratamento` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_resgate` (`id_resgate`),
  KEY `id_especie` (`id_especie`),
  KEY `id_tratamento` (`id_tratamento`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_resgate`) REFERENCES `resgate` (`id_resgate`),
  CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`id_especie`) REFERENCES `catalogo_especie` (`id_especie`),
  CONSTRAINT `animal_ibfk_3` FOREIGN KEY (`id_tratamento`) REFERENCES `tratamento` (`id_tratamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES ('ANM00001','RES00001','ESP00002','Desorientação por estresse urbano. Sem ferimentos.','Solto',NULL),('ANM00002','RES00003','ESP00016','Politromatismo grave. Ferimento aberto e fratura exposta.','Em tratamento','TRAT0002'),('ANM00003','RES00004','ESP00019','Lacerações superficiais nos membros devido ao arame farpado.','Em tratamento','TRAT0003'),('ANM00004','RES00006','ESP00011','Asa esquerda fraturada (ulna). Não consegue voar.','Em tratamento','TRAT0004'),('ANM00005','RES00007','ESP00004','Atordoamento após colisão com vidro (concussão leve).','Em tratamento','TRAT0015'),('ANM00006','RES00008','ESP00026','Desidratada e exausta. Condição crítica de debilidade.','Em tratamento','TRAT0005'),('ANM00007','RES00002','ESP00007','Filhote 1. Hipotermia e desnutrição severa.','Em tratamento','TRAT0001'),('ANM00008','RES00002','ESP00007','Filhote 2. Desnutrição e sinais de debilidade.','Em tratamento','TRAT0001'),('ANM00009','RES00002','ESP00007','Filhote 3. Muito fraco. Risco de óbito.','Em tratamento','TRAT0001'),('ANM00010','RES00005','ESP00009','Gambá Adulto (mãe). Saudável. Apenas estresse da captura.','Solto',NULL),('ANM00011','RES00010','ESP00018','Ferimento grave na lateral do corpo. Vítima de atropelamento.','Solto','TRAT0006'),('ANM00012','RES00011','ESP00012','Linha de cerol enroscada nas patas. Lesão ligamentar.','Solto','TRAT0007'),('ANM00013','RES00013','ESP00008','Desorientação. Animal saudável, apenas perdido na lavoura.','Solto',NULL),('ANM00014','RES00014','ESP00029','Sinais de contaminação. Intoxicação leve por agrotóxico ou poluente.','Solto','TRAT0008'),('ANM00015','RES00016','ESP00055','Asa esquerda quebrada. Fratura simples.','Solto','TRAT0009'),('ANM00016','RES00017','ESP00033','Saudável. Resgate preventivo por invasão de residência.','Solto',NULL),('ANM00017','RES00018','ESP00005','Sinais de apatia e tosse. Suspeita de doença respiratória.','Solto','TRAT0010'),('ANM00018','RES00019','ESP00032','Serpente saudável. Captura preventiva em área de risco.','Solto',NULL),('ANM00019','RES00021','ESP00023','Inconsciente. Hipoglicemia e intoxicação leve por inseticida.','Solto','TRAT0016'),('ANM00020','RES00022','ESP00048','Exausta. Desorientação devido a mau tempo.','Solto','TRAT0017'),('ANM00021','RES00023','ESP00017','Saudável. Deslocamento acidental para longe de corpo dágua.','Solto',NULL),('ANM00022','RES00024','ESP00034','Pata direita levemente ferida. Preso em rede de proteção.','Solto','TRAT0018'),('ANM00023','RES00025','ESP00038','Pata presa em lixo. Laceração profunda e necrose parcial.','Solto','TRAT0011'),('ANM00024','RES00027','ESP00015','Jaguatirica Filhote 1. Desnutrição grave. Órfão.','Solto','TRAT0012'),('ANM00025','RES00027','ESP00015','Jaguatirica Filhote 2. Desnutrição. Órfão.','Solto','TRAT0012'),('ANM00026','RES00028','ESP00044','Dificuldade de voo e apatia. Trauma craniano leve.','Solto','TRAT0013'),('ANM00027','RES00029','ESP00010','Lesão muscular profunda na coxa. Não consegue apoiar a perna.','Solto','TRAT0014'),('ANM00028','RES00030','ESP00009','Ferimento por mordida de cão em esgoto. Condição de risco.','Em tratamento','TRAT0019'),('ANM00029','RES00002','ESP00007','Filhote 4. Desnutrição severa e hipotermia.','Em tratamento','TRAT0001'),('ANM00030','RES00005','ESP00009','Filhote de Gambá 1. Saudável, junto da mãe.','Solto',NULL),('ANM00031','RES00005','ESP00009','Filhote de Gambá 2. Saudável, junto da mãe.','Solto',NULL),('ANM00032','RES00005','ESP00009','Filhote de Gambá 3. Saudável, junto da mãe.','Solto',NULL),('ANM00033','RES00005','ESP00009','Filhote de Gambá 4. Saudável, junto da mãe.','Solto',NULL),('ANM00034','RES00005','ESP00009','Filhote de Gambá 5. Saudável, junto da mãe.','Solto',NULL),('ANM00035','RES00005','ESP00009','Filhote de Gambá 6. Saudável, junto da mãe.','Solto',NULL),('ANM00036','RES00005','ESP00009','Filhote de Gambá 7. Saudável, junto da mãe.','Solto',NULL);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_clinica`
--

DROP TABLE IF EXISTS `avaliacao_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao_clinica` (
  `id_avaliacao` varchar(8) NOT NULL,
  `diagnostico` text,
  `id_centro_de_triagem` varchar(8) NOT NULL,
  `id_resgate` varchar(8) NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_centro_de_triagem` (`id_centro_de_triagem`),
  KEY `id_resgate` (`id_resgate`),
  CONSTRAINT `avaliacao_clinica_ibfk_1` FOREIGN KEY (`id_centro_de_triagem`) REFERENCES `centro_de_triagem` (`id_centro_de_triagem`),
  CONSTRAINT `avaliacao_clinica_ibfk_2` FOREIGN KEY (`id_resgate`) REFERENCES `resgate` (`id_resgate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_clinica`
--

LOCK TABLES `avaliacao_clinica` WRITE;
/*!40000 ALTER TABLE `avaliacao_clinica` DISABLE KEYS */;
INSERT INTO `avaliacao_clinica` VALUES ('AVA00001','Estresse/Exaustão. Indicado soltura imediata após 48h de observação.','CENTRO01','RES00001'),('AVA00002','Desnutrição severa e hipotermia. Filhotes órfãos. Necessita de cuidados intensivos.','CENTRO01','RES00002'),('AVA00003','Fratura Cominutiva no rádio. Risco de infecção generalizada. Cirurgia urgente.','CENTRO01','RES00003'),('AVA00004','Cortes superficiais. Necessita de sutura e antibióticos profiláticos.','CENTRO01','RES00004'),('AVA00005','Saudáveis. Mãe e filhotes aptos para soltura em área controlada.','CENTRO01','RES00005'),('AVA00006','Fratura oblíqua na ulna. Imobilização cirúrgica e fisioterapia prolongada.','CENTRO01','RES00006'),('AVA00007','Concussão grau I. Exames normais. Repouso absoluto por 7 dias.','CENTRO01','RES00007'),('AVA00008','Desidratação grau III. Falha renal leve. Terapia intensiva com fluidos.','CENTRO01','RES00008'),('AVA00010','Trauma contuso com hemorragia interna abdominal. Prognóstico reservado.','CENTRO01','RES00010'),('AVA00011','Lesão ligamentar por cerol. Repouso e anti-inflamatórios.','CENTRO01','RES00011'),('AVA00013','Saudável. Apenas estresse. Aptos para soltura imediata.','CENTRO01','RES00013'),('AVA00014','Intoxicação por organofosforado (leve). Desintoxicação e observação.','CENTRO01','RES00014'),('AVA00016','Fratura simples de asa. Imobilização em tala.','CENTRO01','RES00016'),('AVA00017','Saudável. Sem traumas. Soltura imediata.','CENTRO01','RES00017'),('AVA00018','Broncopneumonia. Tratamento com antibiótico de largo espectro por 14 dias.','CENTRO01','RES00018'),('AVA00019','Saudável. Captura preventiva. Soltura imediata indicada.','CENTRO01','RES00019'),('AVA00021','Hipoglicemia e intoxicação leve por inseticida. Soro glicosado e vitaminas.','CENTRO01','RES00021'),('AVA00022','Exaustão e estresse. Soltura após 48h de reidratação.','CENTRO01','RES00022'),('AVA00023','Saudável. Deslocamento acidental. Soltura em rio próximo.','CENTRO01','RES00023'),('AVA00024','Pequeno trauma na pata. Sem fraturas. Repouso.','CENTRO01','RES00024'),('AVA00025','Laceração profunda na pata. Necrose parcial. Cirurgia de desbridamento e antibióticos.','CENTRO01','RES00025'),('AVA00027','Desnutrição grave. Filhotes órfãos. Alimentação assistida e termorregulação.','CENTRO01','RES00027'),('AVA00028','Trauma craniano leve. Observação e analgésicos.','CENTRO01','RES00028'),('AVA00029','Lesão muscular profunda na coxa. Cirurgia para reparação muscular e reabilitação.','CENTRO01','RES00029'),('AVA00030','Ferimento por mordida de cão com sinais de infecção. Tratamento com antibióticos.','CENTRO01','RES00030');
/*!40000 ALTER TABLE `avaliacao_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_profissional`
--

DROP TABLE IF EXISTS `avaliacao_profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao_profissional` (
  `id_avaliacao` varchar(8) NOT NULL,
  `id_profissional` varchar(8) NOT NULL,
  PRIMARY KEY (`id_avaliacao`,`id_profissional`),
  KEY `id_profissional` (`id_profissional`),
  CONSTRAINT `avaliacao_profissional_ibfk_1` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao_clinica` (`id_avaliacao`),
  CONSTRAINT `avaliacao_profissional_ibfk_2` FOREIGN KEY (`id_profissional`) REFERENCES `profissional` (`id_profissional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_profissional`
--

LOCK TABLES `avaliacao_profissional` WRITE;
/*!40000 ALTER TABLE `avaliacao_profissional` DISABLE KEYS */;
INSERT INTO `avaliacao_profissional` VALUES ('AVA00001','PROF0001'),('AVA00002','PROF0001'),('AVA00003','PROF0001'),('AVA00004','PROF0001'),('AVA00005','PROF0001'),('AVA00014','PROF0001'),('AVA00016','PROF0001'),('AVA00017','PROF0001'),('AVA00018','PROF0001'),('AVA00022','PROF0001'),('AVA00025','PROF0001'),('AVA00027','PROF0001'),('AVA00030','PROF0001'),('AVA00001','PROF0002'),('AVA00019','PROF0002'),('AVA00028','PROF0002'),('AVA00003','PROF0003'),('AVA00006','PROF0003'),('AVA00007','PROF0003'),('AVA00008','PROF0003'),('AVA00018','PROF0003'),('AVA00019','PROF0003'),('AVA00023','PROF0003'),('AVA00025','PROF0003'),('AVA00028','PROF0003'),('AVA00002','PROF0004'),('AVA00008','PROF0004'),('AVA00023','PROF0004'),('AVA00030','PROF0004'),('AVA00004','PROF0005'),('AVA00005','PROF0005'),('AVA00029','PROF0005'),('AVA00006','PROF0006'),('AVA00010','PROF0006'),('AVA00011','PROF0006'),('AVA00013','PROF0006'),('AVA00021','PROF0006'),('AVA00024','PROF0006'),('AVA00027','PROF0006'),('AVA00029','PROF0006'),('AVA00007','PROF0007'),('AVA00017','PROF0007'),('AVA00022','PROF0007'),('AVA00010','PROF0008'),('AVA00013','PROF0008'),('AVA00014','PROF0008'),('AVA00021','PROF0008'),('AVA00011','PROF0009'),('AVA00016','PROF0009'),('AVA00024','PROF0009');
/*!40000 ALTER TABLE `avaliacao_profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_especie`
--

DROP TABLE IF EXISTS `catalogo_especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_especie` (
  `id_especie` varchar(8) NOT NULL,
  `risco_extincao` decimal(3,2) DEFAULT NULL,
  `especie` varchar(40) DEFAULT NULL,
  `habitat_especie` text,
  `quantidade_animais` int DEFAULT NULL,
  PRIMARY KEY (`id_especie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_especie`
--

LOCK TABLES `catalogo_especie` WRITE;
/*!40000 ALTER TABLE `catalogo_especie` DISABLE KEYS */;
INSERT INTO `catalogo_especie` VALUES ('ESP00001',0.85,'Onça-Pintada','Mata Atlântica, florestas e áreas alagadas',120),('ESP00002',0.65,'Capivara','Beira de rios e lagos, áreas urbanas e rurais',850),('ESP00003',0.92,'Papagaio-de-Peito-Roxo','Floresta com Araucária, áreas de altitude',55),('ESP00004',0.15,'Tucano-do-Bico-Verde','Mata Atlântica, áreas montanhosas',310),('ESP00005',0.78,'Bugio-Ruivo','Floresta Atlântica, capoeiras',180),('ESP00006',0.55,'Gato-do-Mato-Pequeno','Diversos, preferindo florestas densas',90),('ESP00007',0.20,'Quero-Quero','Campos abertos, pastagens, áreas urbanas',1200),('ESP00008',0.95,'Tamanduá-Bandeira','Cerrado e campos abertos no interior',40),('ESP00009',0.35,'Gambá-de-Orelha-Preta','Áreas urbanas, florestas e bordas de mata',620),('ESP00010',0.45,'Veado-Catingueiro','Capoeiras e bordas de florestas',250),('ESP00011',0.88,'Jacutinga','Mata Atlântica (principalmente Floresta com Araucária)',75),('ESP00012',0.10,'Sabiá-Laranjeira','Florestas, pomares e áreas urbanas',980),('ESP00013',0.70,'Muriqui-do-Sul','Floresta Atlântica do Sudeste e Sul',30),('ESP00014',0.05,'Coruja-Buraqueira','Campos abertos e pastagens',510),('ESP00015',0.60,'Jaguatirica','Florestas densas e matas ciliares',150),('ESP00016',0.82,'Lobo-Guará','Cerrado e áreas de campo limpo',65),('ESP00017',0.25,'Cágado-de-Barbicha','Rios, lagos e banhados',400),('ESP00018',0.40,'Paca','Proximidade de rios, áreas de floresta densa',380),('ESP00019',0.50,'Macaco-Prego','Diversos tipos de floresta',210),('ESP00020',0.75,'Tatu-Canastra','Campos e florestas abertas',85),('ESP00021',0.30,'João-de-Barro','Áreas abertas, campos, cidades',750),('ESP00022',0.90,'Harpias (Gavião-Real)','Florestas densas e grandes árvores',20),('ESP00023',0.12,'Beija-Flor','Jardins, florestas e matas ciliares',1100),('ESP00024',0.68,'Queixada','Grandes áreas de floresta primária',110),('ESP00025',0.58,'Anta','Proximidade de água, florestas e savanas',130),('ESP00026',0.80,'Tartaruga-Marinha','Litoral do Paraná (praias e oceano)',45),('ESP00027',0.22,'Codorna','Campos e áreas de vegetação rasteira',450),('ESP00028',0.18,'Iguana','Áreas de mata e restinga no litoral',550),('ESP00029',0.72,'Pato-Mergulhão','Rios de corredeiras limpas',35),('ESP00030',0.42,'Seriema','Campos e Cerrado, áreas secas',290),('ESP00031',0.33,'Cuíca','Florestas e áreas de mata ciliar',340),('ESP00032',0.62,'Jararaca (Serpente)','Campos, florestas e áreas rurais',200),('ESP00033',0.17,'Lagarto-Teiú','Diversos, incluindo áreas urbanas e rurais',410),('ESP00034',0.53,'Tico-Tico','Campos, jardins e beira de estradas',650),('ESP00035',0.83,'Macuco','Floresta com Araucária e densa Mata Atlântica',80),('ESP00036',0.28,'Borboleta-Monarca','Áreas de migração, jardins',1500),('ESP00037',0.77,'Cervo-do-Pantanal','Áreas alagadas e margens de rios (extremo Noroeste)',38),('ESP00038',0.48,'Garça-Branca','Corpos dágua, rios e áreas de banhado',520),('ESP00039',0.98,'Mico-Leão-Preto','Florestas do interior de São Paulo (Divisa PR/SP)',15),('ESP00040',0.08,'Rato Silvestre','Diversos, bordas de mata e lavouras',2000),('ESP00041',0.63,'Capivara (Jovem)','Beira de rios e lagos',450),('ESP00042',0.91,'Pintassilgo do Sul','Campos de altitude e Floresta com Araucária',60),('ESP00043',0.14,'Urutau','Florestas, bordas de mata e áreas de transição',280),('ESP00044',0.87,'Pica-Pau-Rei','Grandes extensões de Mata Atlântica',42),('ESP00045',0.57,'Quati','Florestas e parques urbanos',230),('ESP00046',0.73,'Gavião-Pato','Matas ciliares e áreas próximas a rios',95),('ESP00047',0.27,'Tatu-Galinha','Campos, bordas de mata e áreas de pastagem',360),('ESP00048',0.47,'Ema','Campos abertos do Sul (porções do PR)',170),('ESP00049',0.89,'Papo-Amarelo','Campos de altitude e áreas de Cerrado',33),('ESP00050',0.19,'Saruê','Florestas, áreas rurais e urbanas',580),('ESP00051',0.67,'Cobra Coral (Verdadeira)','Diversos biomas, sob folhagem ou pedras',70),('ESP00052',0.39,'Chinchila Selvagem','Áreas rochosas e de campo (altitude)',190),('ESP00053',0.71,'Gato-Maracajá','Florestas úmidas e densas',105),('ESP00054',0.94,'Pardal-do-Campo','Campos e áreas agrícolas',25),('ESP00055',0.09,'Pomba-de-Bando','Áreas urbanas e rurais',1400),('ESP00056',0.54,'Esquilo-Caxinguelê','Florestas com araucária e matas ciliares',260),('ESP00057',0.81,'Pintado (Peixe)','Rios grandes da Bacia do Paraná',50),('ESP00058',0.24,'Periquito-de-Encontro-Amarelo','Florestas e áreas de mata',390),('ESP00059',0.79,'Curió','Matas ciliares e áreas de restinga',88),('ESP00060',0.44,'Ibis-Preto (Coró-Coró)','Áreas alagadas e margens de rios',320);
/*!40000 ALTER TABLE `catalogo_especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_de_triagem`
--

DROP TABLE IF EXISTS `centro_de_triagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_de_triagem` (
  `id_centro_de_triagem` varchar(8) NOT NULL,
  `responsavel` varchar(45) DEFAULT NULL,
  `local_centro` text,
  `telefone` varchar(15) DEFAULT NULL,
  `capacidade` int DEFAULT NULL,
  PRIMARY KEY (`id_centro_de_triagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_de_triagem`
--

LOCK TABLES `centro_de_triagem` WRITE;
/*!40000 ALTER TABLE `centro_de_triagem` DISABLE KEYS */;
INSERT INTO `centro_de_triagem` VALUES ('CENTRO01','Dr. Helena Silva (Veterinária Chefe)','Rua da Floresta, 120 - Santa Cândida, Curitiba/PR','(41) 3330-1234',150);
/*!40000 ALTER TABLE `centro_de_triagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncia`
--

DROP TABLE IF EXISTS `denuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `denuncia` (
  `id_denuncia` int NOT NULL AUTO_INCREMENT,
  `data_denuncia` date DEFAULT NULL,
  `lugar` varchar(50) DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id_denuncia`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncia`
--

LOCK TABLES `denuncia` WRITE;
/*!40000 ALTER TABLE `denuncia` DISABLE KEYS */;
INSERT INTO `denuncia` VALUES (1,'2025-09-28','Rua XV de Novembro, Centro, Curitiba/PR','Capivara desorientada caminhando em via movimentada. Parecia assustada.'),(2,'2025-09-30','Parque Barigui, Curitiba/PR','Ninho de filhotes de Quero-Quero abandonado próximo ao lago principal.'),(3,'2025-10-01','BR-277, Km 108, Campo Largo/PR','Lobo-Guará atropelado na lateral da rodovia, ainda vivo, mas ferido.'),(4,'2025-10-02','Mata do Pinheirinho, Araucária/PR','Macaco-Prego encontrado preso em cerca de arame farpado.'),(5,'2025-10-04','Residência, Bairro Bacacheri, Curitiba/PR','Gambá com filhotes alojado no forro do telhado. Proprietário solicitou remoção segura.'),(6,'2025-10-05','Estrada da Graciosa, Morretes/PR','Avistada uma Jacutinga com asa quebrada em área de difícil acesso.'),(7,'2025-10-06','Jardim Botânico, Curitiba/PR','Um Tucano-do-Bico-Verde colidiu com o vidro de uma estufa e está atordoado.'),(8,'2025-10-07','Litoral, Praia de Guaratuba/PR','Tartaruga-Marinha juvenil encontrada encalhada e debilitada na areia.'),(9,'2025-09-15','Fazenda em Londrina/PR','Suspeita de caça ilegal; encontrado Gato-do-Mato-Pequeno ferido por armadilha.'),(10,'2025-09-17','Rodovia do Café (BR-376), Ponta Grossa/PR','Paca morta e outra ferida às margens, provavelmente vítimas de atropelamento.'),(11,'2025-09-19','Rua Chile, Bairro Rebouças, Curitiba/PR','Sabiá-Laranjeira com linha de cerol enroscada nas pernas.'),(12,'2025-09-21','Parque São Lourenço, Curitiba/PR','Quati se alimentando em lixeiras e apresentando comportamento agressivo.'),(13,'2025-09-22','Zona Rural, Castro/PR','Tamanduá-Bandeira perdido em área de plantação de soja.'),(14,'2025-09-24','Próximo à Usina Hidrelétrica de Salto Caxias','Pato-Mergulhão em área de risco devido à baixa do rio.'),(15,'2025-09-26','Aeroporto Afonso Pena, São José dos Pinhais/PR','Colisão de pássaro (não identificado) com aeronave. Necessário resgate.'),(16,'2025-08-10','Praça Tiradentes, Curitiba/PR','Pombo urbano com ferimento grave na asa, provavelmente briga.'),(17,'2025-08-12','Bairro Alto, Curitiba/PR','Teiú (Lagarto) de grande porte invadiu quintal, causando pânico.'),(18,'2025-08-14','Reserva do Iguaçu, Foz do Iguaçu/PR','Bugio-Ruivo com sinais de doença em grupo isolado.'),(19,'2025-08-16','Rodovia PR-412, Matinhos/PR','Serpente (suspeita de Jararaca) encontrada próxima à beira da estrada.'),(20,'2025-08-18','Morro do Anhangava, Quatro Barras/PR','Rastros de Onça-Pintada em trilha popular; necessário monitoramento e eventual resgate se for filhote.'),(21,'2025-08-20','Jardim das Américas, Curitiba/PR','Beija-Flor desmaiado em varanda após suposto contato com veneno de insetos.'),(22,'2025-08-23','Interior, Guarapuava/PR','Avistada uma Ema desorientada em área não característica do seu habitat.'),(23,'2025-08-25','Bairro Santa Felicidade, Curitiba/PR','Cágado-de-Barbicha encontrado vagando em rua seca, longe de rios.'),(24,'2025-08-27','Bairro Água Verde, Curitiba/PR','Tico-Tico preso em rede de proteção de apartamento.'),(25,'2025-08-29','Porto de Paranaguá/PR','Garça-Branca com pata presa em lixo industrial na área portuária.'),(26,'2025-07-01','Centro Cívico, Curitiba/PR','Coruja-Buraqueira em área de construção civil sob risco.'),(27,'2025-07-05','Campo Magro/PR','Suspeita de abandono de filhotes de Jaguatirica em área rural.'),(28,'2025-07-10','Parque Tanguá, Curitiba/PR','Pica-Pau-Rei com comportamento incomum, dificuldade para voar.'),(29,'2025-07-15','Área de Mata, Piraquara/PR','Veado-Catingueiro com ferimento na perna, provavelmente por queda.'),(30,'2025-07-20','Rua Visconde de Guarapuava, Curitiba/PR','Gamba ferido por cão doméstico em residência.');
/*!40000 ALTER TABLE `denuncia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_resgate`
--

DROP TABLE IF EXISTS `equipe_resgate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_resgate` (
  `id_equipe` varchar(8) NOT NULL,
  `membros_qtd` int DEFAULT NULL,
  `tempo_experiencia` decimal(4,2) DEFAULT NULL,
  `disponibilidade` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_resgate`
--

LOCK TABLES `equipe_resgate` WRITE;
/*!40000 ALTER TABLE `equipe_resgate` DISABLE KEYS */;
INSERT INTO `equipe_resgate` VALUES ('EQP00001',3,4.50,0),('EQP00002',4,8.25,1),('EQP00003',2,1.50,1),('EQP00004',5,10.00,1),('EQP00005',3,6.75,1),('EQP00006',4,3.10,0),('EQP00007',2,0.90,1),('EQP00008',3,5.00,0),('EQP00009',4,7.30,1),('EQP00010',5,2.00,0),('EQP00011',3,9.50,0),('EQP00012',2,1.20,1),('EQP00013',4,4.80,1),('EQP00014',3,6.00,1),('EQP00015',5,11.50,0),('EQP00016',3,2.75,1),('EQP00017',2,0.50,1);
/*!40000 ALTER TABLE `equipe_resgate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissional`
--

DROP TABLE IF EXISTS `profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissional` (
  `id_profissional` varchar(8) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `funcao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_profissional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissional`
--

LOCK TABLES `profissional` WRITE;
/*!40000 ALTER TABLE `profissional` DISABLE KEYS */;
INSERT INTO `profissional` VALUES ('PROF0001','Dr. Helena Silva','Veterinário Chefe'),('PROF0002','Aux. Lucas Santos','Auxiliar Técnico'),('PROF0003','Dr. Roberto Oliveira','Veterinário Clínico'),('PROF0004','Enf. Paula Mendes','Enfermeiro'),('PROF0005','Aux. Camila Melo','Auxiliar Técnico'),('PROF0006','Dr. André Souza','Veterinário Cirurgião'),('PROF0007','Aux. João Ferreira','Auxiliar Técnico'),('PROF0008','Aux. Maria Clara','Auxiliar Técnico'),('PROF0009','Enf. Ana Liz','Enfermeiro');
/*!40000 ALTER TABLE `profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio`
--

DROP TABLE IF EXISTS `relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio` (
  `id_relatorio` varchar(8) NOT NULL,
  `id_soltura` varchar(8) NOT NULL,
  `conteudo` text,
  `data_emissao` date DEFAULT NULL,
  PRIMARY KEY (`id_relatorio`),
  KEY `id_soltura` (`id_soltura`),
  CONSTRAINT `relatorio_ibfk_1` FOREIGN KEY (`id_soltura`) REFERENCES `soltura` (`id_soltura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio`
--

LOCK TABLES `relatorio` WRITE;
/*!40000 ALTER TABLE `relatorio` DISABLE KEYS */;
INSERT INTO `relatorio` VALUES ('REL00001','SOL00001','Soltura bem-sucedida após 72 horas de observação. O animal estava apto para reintrodução em habitat não urbano.','2025-10-02'),('REL00002','SOL00002','Mãe gambá (ANM00010) solta em área protegida de mata ciliar. Excelente adaptação ao ambiente e comportamento preservado.','2025-10-06'),('REL00003','SOL00003','Filhote de gambá solto em conjunto com a mãe e irmãos. Bom prognóstico de sobrevivência na natureza.','2025-10-06'),('REL00004','SOL00004','Filhote de gambá solto com o grupo familiar. Observado seguindo a mãe imediatamente após a abertura da jaula.','2025-10-06'),('REL00005','SOL00005','Filhote de gambá solto com o grupo. Reage bem à vegetação densa da área de reintrodução.','2025-10-06'),('REL00006','SOL00006','Tamanduá-Bandeira saudável e sem estresse pós-resgate. Soltura preventiva realizada com sucesso em reserva municipal.','2025-09-25'),('REL00007','SOL00007','Lagarto-Teiú solto em ambiente natural logo após triagem. Não houve necessidade de intervenção clínica.','2025-08-14'),('REL00008','SOL00008','Jararaca saudável, solta em área isolada, longe de residências, conforme protocolo de segurança.','2025-08-21'),('REL00009','SOL00009','Beija-Flor com recuperação rápida de hipoglicemia. Demonstra aptidão total para voo e alimentação autônoma.','2025-08-23'),('REL00010','SOL00010','Ema transportada e solta em campo nativo, longe do tráfego, após 48h de hidratação e repouso.','2025-08-27'),('REL00011','SOL00011','Cágado-de-Barbicha retornou ao habitat aquático imediato e sem dificuldades de locomoção.','2025-08-27'),('REL00012','SOL00012','Tico-Tico liberado após breve repouso no centro. Voo e comportamento observados como normais.','2025-09-01'),('REL00013','SOL00013','Paca liberada após 21 dias de recuperação cirúrgica de trauma abdominal. Excelente cicatrização e sem restrições.','2025-10-11'),('REL00014','SOL00014','Sabiá liberado após recuperação total da lesão ligamentar na perna. Voo e pouso sem dificuldades.','2025-10-02'),('REL00015','SOL00015','Pato-Mergulhão liberado após desintoxicação completa. Exames toxicológicos negativos. Solto em ambiente aquático seguro.','2025-10-01'),('REL00016','SOL00016','Pombo liberado após consolidação óssea bem-sucedida de fratura na asa. Voo estável e alto confirmado.','2025-09-07'),('REL00017','SOL00017','Bugio-Ruivo liberado. A broncopneumonia foi resolvida após ciclo de antibióticos. Solto em grupo compatível para reintrodução social.','2025-09-01'),('REL00018','SOL00018','Garça-Branca liberada após cirurgia e recuperação da pata. Nenhuma claudicação observada e suturas removidas.','2025-09-19'),('REL00019','SOL00019','Jaguatirica Filhote 1 solta com o irmão. O filhote está em excelente estado nutricional. Soltura em mata com alto potencial de subsistência.','2025-07-29'),('REL00020','SOL00020','Jaguatirica Filhote 2 solta em conjunto com o irmão. Demonstra comportamento exploratório natural e vigor.','2025-07-29'),('REL00021','SOL00021','Pica-Pau-Rei liberado. Não houve sequelas do trauma craniano. Demonstra vigor no voo e alimentação (percussão).','2025-07-19'),('REL00022','SOL00022','Veado-Catingueiro liberado. Reabilitação completa da perna após cirurgia do quadríceps. Soltura em área monitorada por rastreio.','2025-09-17'),('REL00023','SOL00023','Filhote de gambá solto com o grupo. Comportamento natural de busca por abrigo.','2025-10-06'),('REL00024','SOL00024','Filhote de gambá solto com o grupo. Sem dificuldades de locomoção ou adaptação.','2025-10-06'),('REL00025','SOL00025','Filhote de gambá solto com o grupo. Demonstra vigor e resposta a estímulos.','2025-10-06'),('REL00026','SOL00026','Filhote de gambá solto com o grupo. Imediatamente se escondeu na vegetação com a mãe.','2025-10-06');
/*!40000 ALTER TABLE `relatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resgate`
--

DROP TABLE IF EXISTS `resgate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resgate` (
  `id_resgate` varchar(8) NOT NULL,
  `id_equipe` varchar(8) DEFAULT NULL,
  `id_denuncia` int DEFAULT NULL,
  `data_resgate` date DEFAULT NULL,
  `lugar_resgate` varchar(255) DEFAULT NULL,
  `status` enum('Em andamento','Finalizado','Falhou') NOT NULL DEFAULT 'Em andamento',
  `descricao` text,
  PRIMARY KEY (`id_resgate`),
  KEY `id_equipe` (`id_equipe`),
  KEY `id_denuncia` (`id_denuncia`),
  CONSTRAINT `resgate_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe_resgate` (`id_equipe`),
  CONSTRAINT `resgate_ibfk_2` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncia` (`id_denuncia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resgate`
--

LOCK TABLES `resgate` WRITE;
/*!40000 ALTER TABLE `resgate` DISABLE KEYS */;
INSERT INTO `resgate` VALUES ('RES00001','EQP00002',1,'2025-09-28','Rua XV de Novembro, Centro, Curitiba/PR','Finalizado','Capivara encontrada e sedada. Sem ferimentos graves, apenas estresse. Encaminhada ao centro.'),('RES00002','EQP00003',2,'2025-09-30','Parque Barigui, Curitiba/PR','Finalizado','Quatro filhotes de Quero-Quero resgatados e colocados em incubadora. Ninho destruído.'),('RES00003','EQP00004',3,'2025-10-02','BR-277, Km 108, Campo Largo/PR','Finalizado','Lobo-Guará gravemente ferido. Estabilizado no local e transportado com urgência.'),('RES00004','EQP00005',4,'2025-10-02','Mata do Pinheirinho, Araucária/PR','Finalizado','Macaco-Prego libertado da cerca com cortes superficiais. Resgate com uso de rede.'),('RES00005','EQP00007',5,'2025-10-04','Residência, Bairro Bacacheri, Curitiba/PR','Finalizado','Gambá e 7 filhotes resgatados do forro sem ferimentos. Família encaminhada para área de soltura controlada.'),('RES00006','EQP00009',6,'2025-10-06','Estrada da Graciosa, Morretes/PR','Finalizado','Jacutinga encontrada. Asa fraturada. Resgate em área de mata fechada.'),('RES00007','EQP00012',7,'2025-10-06','Jardim Botânico, Curitiba/PR','Finalizado','Tucano-do-Bico-Verde recolhido. Sofreu concussão leve, sem fraturas aparentes.'),('RES00008','EQP00001',8,'2025-10-08','Litoral, Praia de Guaratuba/PR','Em andamento','Tartaruga em observação pré-transporte. Desidratada e fraca. Equipe (EQP00001) ocupada no local.'),('RES00009','EQP00013',9,'2025-09-15','Fazenda em Londrina/PR','Falhou','O Gato-do-Mato-Pequeno fugiu antes da chegada da equipe. Suspeita de armadilha confirmada e desativada.'),('RES00010','EQP00014',10,'2025-09-17','Rodovia do Café (BR-376), Ponta Grossa/PR','Finalizado','Resgate de uma Paca ferida. A outra já estava falecida. Ferimentos graves por impacto.'),('RES00011','EQP00016',11,'2025-09-19','Rua Chile, Bairro Rebouças, Curitiba/PR','Finalizado','Sabiá resgatado. Linha de cerol removida. Ferimento superficial na perna.'),('RES00012','EQP00017',12,'2025-09-22','Parque São Lourenço, Curitiba/PR','Falhou','Quati não foi localizado pela equipe. Agressividade não confirmada. Provavelmente fugiu.'),('RES00013','EQP00002',13,'2025-09-22','Zona Rural, Castro/PR','Finalizado','Tamanduá-Bandeira sedado e resgatado de plantação. Sem ferimentos.'),('RES00014','EQP00006',14,'2025-09-25','Próximo à Usina Hidrelétrica de Salto Caxias','Em andamento','Monitoramento de Pato-Mergulhão. Aguardando momento seguro para abordagem. Equipe (EQP00006) ocupada.'),('RES00015','EQP00003',15,'2025-09-27','Aeroporto Afonso Pena, São José dos Pinhais/PR','Falhou','Pássaro não encontrado, suspeita que tenha voado após a inspeção da aeronave.'),('RES00016','EQP00004',16,'2025-08-10','Praça Tiradentes, Curitiba/PR','Finalizado','Pombo recolhido. Asa quebrada. Encaminhado ao tratamento.'),('RES00017','EQP00005',17,'2025-08-12','Bairro Alto, Curitiba/PR','Finalizado','Lagarto-Teiú capturado e transportado para avaliação. Animal saudável.'),('RES00018','EQP00008',18,'2025-08-15','Reserva do Iguaçu, Foz do Iguaçu/PR','Em andamento','Bugio-Ruivo monitorado. Equipe aguarda autorização para sedação remota. Equipe (EQP00008) ocupada.'),('RES00019','EQP00009',19,'2025-08-16','Rodovia PR-412, Matinhos/PR','Finalizado','Serpente (Jararaca) capturada com segurança. Levada para identificação e soltura em área controlada.'),('RES00020','EQP00010',20,'2025-08-18','Morro do Anhangava, Quatro Barras/PR','Falhou','Nenhum sinal de Onça-Pintada ou filhote. Alerta de trilha reforçado.'),('RES00021','EQP00011',21,'2025-08-20','Jardim das Américas, Curitiba/PR','Finalizado','Beija-Flor reanimado e estável. Possível intoxicação leve.'),('RES00022','EQP00012',22,'2025-08-23','Interior, Guarapuava/PR','Finalizado','Ema resgatada e transportada. Desorientação devido a tempestade.'),('RES00023','EQP00013',23,'2025-08-25','Bairro Santa Felicidade, Curitiba/PR','Finalizado','Cágado resgatado da rua. Nenhuma fonte de água próxima. Saudável.'),('RES00024','EQP00014',24,'2025-08-27','Bairro Água Verde, Curitiba/PR','Finalizado','Tico-Tico libertado da rede. Pata levemente ferida.'),('RES00025','EQP00010',25,'2025-08-29','Porto de Paranaguá/PR','Em andamento','Garça-Branca requer operação delicada no local para desprendimento da pata. Equipe (EQP00010) ocupada.'),('RES00026','EQP00015',26,'2025-07-01','Centro Cívico, Curitiba/PR','Falhou','Coruja-Buraqueira não estava na área indicada. Supostamente voou para longe.'),('RES00027','EQP00016',27,'2025-07-06','Campo Magro/PR','Finalizado','Dois filhotes de Jaguatirica resgatados. Sem a mãe. Necessário cuidados intensivos.'),('RES00028','EQP00011',28,'2025-07-11','Parque Tanguá, Curitiba/PR','Em andamento','Pica-Pau-Rei em observação em árvore alta. Aguardando veterinário para sedação. Equipe (EQP00011) ocupada.'),('RES00029','EQP00012',29,'2025-07-16','Área de Mata, Piraquara/PR','Finalizado','Veado-Catingueiro resgatado. Ferimento por queda. Estabilizado.'),('RES00030','EQP00015',30,'2025-07-20','Rua Visconde de Guarapuava, Curitiba/PR','Em andamento','Monitoramento de Gambá ferido. Equipe aguardando a saída do animal do esgoto para resgate. Equipe (EQP00015) ocupada.');
/*!40000 ALTER TABLE `resgate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soltura`
--

DROP TABLE IF EXISTS `soltura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soltura` (
  `id_soltura` varchar(8) NOT NULL,
  `data_soltura` datetime DEFAULT NULL,
  `local_soltura` varchar(50) DEFAULT NULL,
  `observacoes` text,
  `id_animal` varchar(8) NOT NULL,
  PRIMARY KEY (`id_soltura`),
  UNIQUE KEY `id_animal` (`id_animal`),
  CONSTRAINT `soltura_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soltura`
--

LOCK TABLES `soltura` WRITE;
/*!40000 ALTER TABLE `soltura` DISABLE KEYS */;
INSERT INTO `soltura` VALUES ('SOL00001','2025-10-01 15:00:00','Parque Estadual Vila Velha, Ponta Grossa/PR','Capivara liberada após 72h de observação. Sem sinais de estresse.','ANM00001'),('SOL00002','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Mãe Gambá (ANM00010) solta em área de mata ciliar segura.','ANM00010'),('SOL00003','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00030'),('SOL00004','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00031'),('SOL00005','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00032'),('SOL00006','2025-09-24 14:00:00','Reserva Municipal Iguaçu, Curitiba/PR','Tamanduá-Bandeira solto em área segura longe da lavoura.','ANM00013'),('SOL00007','2025-08-13 16:00:00','Reserva Ambiental de São Luiz do Purunã/PR','Lagarto-Teiú solto em ambiente natural. Saudável.','ANM00016'),('SOL00008','2025-08-20 19:00:00','Parque Tanguá, Curitiba/PR','Jararaca solta após identificação e confirmação de saúde.','ANM00018'),('SOL00009','2025-08-23 10:00:00','Jardim Botânico, Curitiba/PR','Beija-Flor liberado após recuperação total da hipoglicemia.','ANM00019'),('SOL00010','2025-08-26 11:00:00','Zona Rural de Guarapuava/PR','Ema transportada e solta em campo nativo.','ANM00020'),('SOL00011','2025-08-26 09:30:00','Rio Iguaçu, próximo a Santa Felicidade/PR','Cágado-de-Barbicha solto em seu habitat natural (rio).','ANM00021'),('SOL00012','2025-08-31 13:00:00','Bosque do Alemão, Curitiba/PR','Tico-Tico liberado após repouso.','ANM00022'),('SOL00013','2025-10-10 10:00:00','Reserva Ambiental de Guarapuava/PR','Paca liberada após cirurgia e recuperação intensiva de 21 dias.','ANM00011'),('SOL00014','2025-10-01 09:00:00','Área rural próxima a Campo Largo/PR','Sabiá liberado. Perna totalmente recuperada.','ANM00012'),('SOL00015','2025-09-30 11:00:00','Rio Iguaçu, próximo a usina/PR','Pato-Mergulhão liberado. Desintoxicação completa.','ANM00014'),('SOL00016','2025-09-06 15:00:00','Área urbana controlada, Curitiba/PR','Pombo liberado após consolidação da fratura de asa.','ANM00015'),('SOL00017','2025-08-31 14:00:00','Reserva do Iguaçu, Foz do Iguaçu/PR','Bugio-Ruivo liberado após tratamento de broncopneumonia.','ANM00017'),('SOL00018','2025-09-18 10:00:00','Litoral, Guaratuba/PR','Garça-Branca liberada após cirurgia da pata. Recuperação bem-sucedida.','ANM00023'),('SOL00019','2025-07-28 12:00:00','Mata Atlântica, Campo Magro/PR','Jaguatirica Filhote 1 liberada com o irmão.','ANM00024'),('SOL00020','2025-07-28 12:00:00','Mata Atlântica, Campo Magro/PR','Jaguatirica Filhote 2 liberada com o irmão.','ANM00025'),('SOL00021','2025-07-18 16:00:00','Parque Tanguá, Curitiba/PR','Pica-Pau-Rei liberado após observação do trauma craniano.','ANM00026'),('SOL00022','2025-09-16 13:00:00','Reserva de Piraquara/PR','Veado-Catingueiro liberado após cirurgia e reabilitação da perna.','ANM00027'),('SOL00023','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00033'),('SOL00024','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00034'),('SOL00025','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00035'),('SOL00026','2025-10-05 17:00:00','Mata dos Palmitos, Piraquara/PR','Filhote de Gambá. Solto com a mãe e irmãos.','ANM00036');
/*!40000 ALTER TABLE `soltura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamento`
--

DROP TABLE IF EXISTS `tratamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamento` (
  `id_tratamento` varchar(10) NOT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `descricao` text,
  `medico` varchar(45) DEFAULT NULL,
  `id_avaliacao` varchar(8) NOT NULL,
  PRIMARY KEY (`id_tratamento`),
  KEY `id_avaliacao` (`id_avaliacao`),
  CONSTRAINT `tratamento_ibfk_1` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao_clinica` (`id_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamento`
--

LOCK TABLES `tratamento` WRITE;
/*!40000 ALTER TABLE `tratamento` DISABLE KEYS */;
INSERT INTO `tratamento` VALUES ('TRAT0001','2025-10-01 10:00:00','2025-10-15 10:00:00','Alimentação assistida por sonda/mamadeira e controle rigoroso de temperatura corporal.','Dr. Helena Silva','AVA00002'),('TRAT0002','2025-10-03 15:30:00','2025-11-02 15:30:00','Cirurgia ortopédica para fixação interna da fratura cominutiva e ciclo de antibióticos de 30 dias.','Dr. Roberto Oliveira','AVA00003'),('TRAT0003','2025-10-03 11:00:00','2025-10-10 11:00:00','Limpeza dos ferimentos, sutura e ciclo profilático de 7 dias com Amoxicilina.','Dr. Helena Silva','AVA00004'),('TRAT0004','2025-10-07 16:45:00','2025-11-21 16:45:00','Cirurgia de redução e fixação da fratura da ulna. Imobilização com tala por 30 dias, seguido de fisioterapia.','Dr. André Souza','AVA00006'),('TRAT0005','2025-10-09 10:30:00','2025-10-14 10:30:00','Fluidoterapia intravenosa intensa para reverter desidratação e terapia de suporte renal.','Dr. Roberto Oliveira','AVA00008'),('TRAT0006','2025-09-18 09:00:00','2025-10-09 09:00:00','Cirurgia exploratória abdominal e monitoramento intensivo por 21 dias devido à hemorragia interna.','Dr. André Souza','AVA00010'),('TRAT0007','2025-09-20 14:00:00','2025-09-30 14:00:00','Medicação anti-inflamatória e imobilização temporária da perna para cicatrização ligamentar.','Dr. André Souza','AVA00011'),('TRAT0008','2025-09-26 17:00:00','2025-09-29 17:00:00','Protocolo de desintoxicação e monitoramento cardíaco por intoxicação leve.','Dr. Helena Silva','AVA00014'),('TRAT0009','2025-08-11 12:00:00','2025-09-05 12:00:00','Imobilização completa da asa e analgésicos. Monitoramento de consolidação óssea.','Dr. Helena Silva','AVA00016'),('TRAT0010','2025-08-16 18:00:00','2025-08-30 18:00:00','Antibioticoterapia de largo espectro e nebulização para tratamento da broncopneumonia.','Dr. Roberto Oliveira','AVA00018'),('TRAT0011','2025-08-30 10:00:00','2025-09-17 10:00:00','Cirurgia de desbridamento e remoção de tecido necrosado, seguida de ciclo de antibióticos potentes.','Dr. Helena Silva','AVA00025'),('TRAT0012','2025-07-07 08:00:00','2025-07-27 08:00:00','Alimentação assistida e termorregulação constante para filhotes em desnutrição.','Dr. Helena Silva','AVA00027'),('TRAT0013','2025-07-12 11:30:00','2025-07-17 11:30:00','Observação neurológica, medicação analgésica e suporte nutricional.','Dr. Roberto Oliveira','AVA00028'),('TRAT0014','2025-07-17 14:00:00','2025-09-15 14:00:00','Cirurgia para reparação do músculo do quadríceps e reabilitação intensiva. Repouso absoluto.','Dr. André Souza','AVA00029'),('TRAT0015','2025-10-06 17:30:00','2025-10-13 17:30:00','Repouso em ambiente calmo e escuro. Monitoramento neurológico e suporte vitamínico.','Dr. André Souza','AVA00007'),('TRAT0016','2025-08-20 12:00:00','2025-08-22 12:00:00','Administração de soro glicosado e vitaminas. Monitoramento cardiorrespiratório.','Dr. Roberto Oliveira','AVA00021'),('TRAT0017','2025-08-23 15:00:00','2025-08-25 15:00:00','Hidratação e nutrição assistida para recuperação de exaustão.','Dr. Helena Silva','AVA00022'),('TRAT0018','2025-08-27 18:00:00','2025-08-30 18:00:00','Aplicação de pomada cicatrizante e analgesia leve para o trauma na pata.','Dr. André Souza','AVA00024'),('TRAT0019','2025-07-20 22:00:00','2025-08-03 22:00:00','Limpeza e sutura do ferimento por mordida. Tratamento intensivo com Cefalexina por 14 dias.','Dr. Roberto Oliveira','AVA00030');
/*!40000 ALTER TABLE `tratamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-14 11:26:19
