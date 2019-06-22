CREATE DATABASE  IF NOT EXISTS `web_order_tracker` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `web_order_tracker`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `package_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  senderName varchar(30),
    senderAddress varchar(100),
    senderPostalCode varchar(20),
    senderPhoneNumber varchar(20),

    recipientName varchar(30),
    recipientAddress varchar(100),
    recipientPostalCode varchar(20),
    recipientPhoneNumber varchar(20),
    
    typeOfPackage varchar(20),
    sendingTime varchar(20),
    packageThings varchar(30),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `package_order` WRITE;
/*!40000 ALTER TABLE `package_order` DISABLE KEYS */;
INSERT INTO `package_order` (senderName, senderAddress, senderPostalCode, senderPhoneNumber, recipientName, recipientAddress, recipientPostalCode, recipientPhoneNumber, typeOfPackage, sendingTime, packageThings) 
VALUES ('Tom', 'No. 8, Aly. 123, Ln. 15, Beiping E. Rd., Zhongzheng Dist., Taipei City 100, Taiwan (R.O.C.)', '112-12', '0912395678',
					'Jason', 'No. 1, Aly. 1, Ln. 1, Dalong St., Datong Dist., Taipei City 103, Taiwan (R.O.C.)', '112-15', '0912353444', 'normal', 'noon', 'mackup'),
                    ('Henry', 'No. 1, Aly. 1, Ln. 1, Beiping E. Rd., Zhongzheng Dist., Taipei City 100, Taiwan (R.O.C.)', '112-12', '0912345678',
					'Ray', 'No. 1, Aly. 1, Ln. 1, Dalong St., Datong Dist., Taipei City 103, Taiwan (R.O.C.)', '112-15', '0912333444', 'normal', 'day', 'books');

         
/*!40000 ALTER TABLE `package_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-13 21:50:59

select * from web_order_tracker.package_order
