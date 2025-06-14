-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_platform
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (20,3,2,3,'2025-06-13 23:11:54');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` longblob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop Gamer','Laptop de alto rendimiento para gaming.',1200.00,NULL,'2025-06-13 18:59:33','2025-06-13 18:59:33'),(2,'Mouse InalÃ¡mbrico','Mouse ergonÃ³mico inalÃ¡mbrico.',25.99,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿþ\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿ\Â\0\êö\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0õH\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I(Q‹s¯›\Ì_\è\Ü\'!8\í±™€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬\Ø\ëÎ©Á\×\ï†\é}zÞ‹\ï>s„Ž½üPSbû\ÂyœRiõ?S\Õ\ÙÉ§\è?·òMŽ7¯\Þv\ìÝ?÷{2ó€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\nw±úS¯+ó½¯\Ó\ê¡g[\ÐlŒ4\Ä\ïqÕ³syŒOV·[,b/œ\Å5–bœs–¥©¿eeñ}7jt4¶9Â»\ä>\Ö\Ýò½\Ì\ãùü@\0\0\0\0\0\0\0\0\0\0\0\0.¿4kv\ïü\Ì#\Éú>aœb\Ú\â¸no­öüÿ\0\Ù\ÛøŽ?³óßº|\ß5µ¡n÷\×\éý®>›ó\ßPÛ†1og1MdŠk–15\Îc‰¦\Ù\×Í±ó½Á\Ð\Ö6¸\ÞÄ±\å~\î\ßñ¿t2òÀ\0\0\0\0\0\0\0\0\0\ÄòbÁ\Ô\ãx8g‰õ<\ã{,\á‡\Æý®2jt½~\ëù\íÿ\0%ðö»7\âú^>\îû×·¹œ5F\ç\Ü\Ý\ËO}œ„\Æ \Âj\ÎYn\Ñ<˜®]\ã,\ìjvuyGœ\Ýò¾¡|§\Õ\íy0š\0\0\0\0\0\0\0\0‰êž¹K‡õif\Ö\ì\Ér3…re„Nc\"5\Ó\ä1l9ôf\ç«Y`\éñW,Ó¾+Ž+‰Ù‚,\Ã’a5”¡+\Ófúû2\á·b†\Ü\ÚÜ¯ut4¶¸¾\Ât\Ïr\ïxL‹k\0\0\0\0\0\0\0ª{[\Ïx:½OY\àý_nug\ÆÆ¼\×$ó\ÖòDI„\Æs‚2\Æ$S\Æ0Œñ\\žm‹‹\å+qwÁ\Î\â¾\ì{Y\ÆfbD³«²z¥“\é\èd\ÃfU±“\r®\Ö\é\è\ç\åûg=\Þ}?œ…õ€\0\0\0\0\0\0y\Ç\Ñ\ÞxÁ\×\êVŸŸú¶ü\ê\Î=¹×š\Þy‚-µ6!™I\Äó&ŽL\à˜Œ\ä\â6r5rj\Ø\ÅB¹ñ‰F/”H–`š\ìÎ¥ñ\íÆ¬dÇ²±O\Ñ>o·µ\Ãöû\ãþÃ­ó`š\0\0\0\0\0\0:«µj§\Ã·\ÇðþŸgeMºŽ\Ît\ì®Y\Ê‹I„¤À\ËK1\É,\Æq\âF3”°–LkÌ±3\Ï„gc‚¹\Äq1–14\Ìq‹\ã\ÄQ¾¬õÏ†û×«\â;\èox\à\0\0\0\0\0\0:\Ë>ÿ\0òŒß­vÐ—\è<–\ê;¹ž²Ü«Î¹·g\\¢óG12\Ìs1,\ã$¥‰¡$\æ#“´i\Î\äÆ˜\ïKDl`­\Z\â\Ú#¶:ñ(\Ä\Æ2Œ\Õ\ÅTsU\ÆØ—ø\ì\ìsý¥ô^lôŸs\å¡}0\0\0\0\0\0\Îýñ\Îzû\Ë7§\Î^Ÿ¡\ê9-\Üvþ\'\Ð/N®\ÜÓ²/²P”§,MÙ–®6KfJFs\Ùzk\ÆùÚ•V³*p»	šZ\îj¥\éê¹£\ëCvº\ßT6BŒ£\ÂQ˜Æ¹F\Ø\ãr\êò~\Ëñ? ºþ#¼\Æ\ï\0\0\0*[\0\0\0{\ØCÂ´=_\å{SŒ…ý÷å»±\Âú7!¾†ý.õÍ•ö\Æ[5o´mÝ®\ÆLrÝù°\Ãtö\äÃ®Ve—u\ÄÒ–¾CT[­\É×®^:½ú˜v)éµ§zðÛ®–\Õ\nú\çg:\æ\ØWš$\Ä/‹g\Û|7%¿\Â÷V~w\èº\ß5\0\ä¸/\ZLrþò†\Ù~’\Ë\Ë^˜¬\Ý\0\0\0\ë\Î\r\Ñ\ë¯\'Z¼~‹š\æú·\×q½\ß#cŒ·\Ëöž>\Û-û-\ç\Ãg~›[\Z\Ûw\ã~]f\ì\íË‹\\·\æÔ­¦ö”Ñ«\È\ÔÇ›Ž§~ž\rºU\í\Ö\×Ú¯\Æò|f8Ùš\éž4nÕœR«W“¾¾¸\é\Û,Ý£ko—\ê.\Ô\èþ\ì|\Ø\'X@ŸHü§š\Íúc²YŽ~ªcŽö÷ŸyzO§œ73 \0\0\Æ}˜ð•jyc‡Õ»1o¬\ä.ð¶øþó›½\Â_¶nj\ß{kW“³B\îÆº÷\åÁ91lzáº½m^¥š”Ø§N\å=}º•\ìU\×\Ú\Ñ\Ç\Þ\ã±M\\7 ¦\ÝZ¾zØ³ôZv\"¶\Í;¦VkX\Ù\çö\ï§<Ÿ\ë\Ç\Ï\Ü÷˜ý9\æY8g”\ã\å¦;{:9ÙœÞŠZ­.C\ã+?S\è/(ý<Ç¬\Ø€\0\0\á9±\â?œ÷w\Ññ\ÐJ\Í–­N\í\ÎG„³\Äú/\Ñò?5\É\ß7\Ñ_ùþCoS›\Ý\Æ\ØÍ©{5¥jm\ÕQh\Ò\Ù[ÆŠ›ª\àÚ¯_um}|g!W³Àò;§\Ïs™„\Z%]3–c|S\ß_~\ß3°ýq\ä\ÏYõþ~\ç>_\êñŸ^þ€yjôù~\Íù\ÎG\îUŸOE{{G\Î\ÎJ‘·4q\Õ\æNÿ\0´w H\0\0½\ä^¶ý\0òù\Ôx†\ËEy\ìÓƒ«bÿ\0³‡ô¤\ä~c‘mýßš»±ƒ\è6p»ò\â\ä!OL-T\×_}•3_Â¾t\à\ÌÑT¾)[‚•afTó	Œ0Ë­;5­\îr;kÓ½Þ_\0¨N\á\Æõ?uWšù’ûîµ¤òš\ìV–¾¬\Ñ\é;Wˆ\ïR,	\0\0\0\0;ô\'\èH#\Î\Zò¼h\Î\Íº\íqû8ŸD\ælð–uú\Ü\î\îm\í\Ì\ãŒÍ—´\××Žö4\ê…/³Tu\Ò\ÙÖ„1˜#j!˜\äÁœ\ÆYô¶ò~·¡Áô¿\ÝjÛ½\áAP\0{Ø¤y‹«½y¦Õ£\Ø\Ål	\0\0\0\0\0\0\ê,{ÿ\0®f<‰®\å[Ö³n¬{{vT\Ý\Ç÷\×wq\Ût»Ü„\èN›6óS5\Éb:p±„a(b(EQ/…œg.«f7ms¬z#¦½\Òñ÷^\0\0\0\0\0\0\0\0\0\0\0\0\ätð\Èð®¯ºø›\ÅhY\Õ\\¹•yó=¥™\ÖÎ¢µšòÅ·c\ZsL\ÛcÅ§\âc1\Âø\Ã&ºXÛŸC7µz¡ÀûN\Ä6¼€*\0\0\0\0\0\0\0\0\0\0\0\0\0¼»\ê¼Ÿ\Ñô7Ÿ\íZšo\Âf”\ç[O\Ño–™sý>\Ùj\Î-Ý˜Š¹²\Æ@¾,É³6ž,\îôf\ï‹\ï\ÃgË„\â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|/\Ýü·½º®\Õò\å~\Âø\ËG«ž§MªR„5{;ó^xz;³«c$\ç¯\ìóiü·\Ø÷wnf\ä|gÛ—\æ€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>o\éIü/©“,ù\ßz¥ù÷\È{Ðv¡?öd \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\00 !@\"1P#23%5ABÿ\Ú\0\0ÿ\0\Å%]®§Œ[\åOõ\r¼L†Þ£o4NUŸ¶¬¿PÐ•y\ÛP©Ë®’\Ü\ç˜ó\Ôó8ó=D©sH/UT\å6kYG›SJS\\i«Sõ\Îz1·<Ê–¸d•\×_³fÍœ›6l\Ù\È\äs#©|ko\ÌkiK~_GX1í‘¿ª¼eÖ²\ç~ªº9\\*›7\ÚÙ³f\Îz(/uV÷[s–HSU\ÃX\Ï\ÓTT\ÇIA˜K[Ž®«,dU‘NlU\Ñ\ç5Äµ*Á—(ùk\í\ílØŽ)nR>Õœ)I]t£¹\Ý ´\Ó\Þo\Õ‰·\ÑSd\Ö\Ø$*%šÚ­\ÝAõ1ª9E‘Pó•‰Mrl«\ÛÙ±Q\Ü&£’Ñ›µ\ä3²¢?\Ð]\îð\Ù\én—Y\îµ>‹…W\Ñ\Ò\ÒÖ·\êg¸}Bù\îiM_\ÈGùˆ9‰\"RVðc$l‰\ÜE\Z\â\Ûx¨¶\ÉhÊ©\î>\åq†\×Kv»Mw«ß¦H\Û#*ñ¶<©¡žbûÜ”Í‘)j¿\Íkb÷|>S£…\Ñ/ujŒyf\Ê\æ¡(\ëa¯‡\å\Ë#a%¾ºñY\ØsQ\É=š%Z;\ÂR¶óm…’Y¨™q…\é	\"—„5Q\É\ßE\Z£\\[\îsÛ¦³_à»³\åg\Ý\'oD”¨\è\è\í³[®S\Ì&§dÉ©\éˆj7yjˆ\â9ñì©µŸ&\áX\Ú\n*Ê—UT|)©™)\çIL5\èöö\ÐENG#\Ëxü+|š\rôÙ¿…%\"µ\ÐÖ¢»·³f\ÎG#\Ë>?\ÄI·rôo\áM*ü\Ô$S2vv¶l\Ù\È\äaùWø¾!û^7\è\ßMü)hôø*¼\Çv6lÙ³f\ÄvŒ/&ú\èþ\'ˆñq¸l\ßÈž“µŽ’\ì\ï\ÓOPúyq«\ëo”?\ÄJUY9#“f\Ä_¯\Þd³W\ÓT2®…Sj\é\ïTX\ë\ÄS}wðu\Ù\å®\Ò.Œý\Å\ß<±ýU4°¾\Ì{db(Š\"›\é¾\îºhÐ¦º¯z–¡\ÐMbº¶ñmøNj=¹]‰l\×	i\â%TQr6o¹£F\Z4*tÑ¡S¦»hº0\Ï\ÒWü;\åž+\ÝÂ†Z\n©\é\Û ’ºb8E6oÖ4hÑ£Gš4hVšöVŠ‚ú—\×M2\Ç%–\à—Kg\Ã\Êñf_ ©§’šg4ò\Ý\0\É\â8E7\êC]\r\ÓGœth\àp\Úh\âhT¶\Å<:¹{üL«Žý\rLSL¨I\ÆÉ¥ØŠ\"ˆ¢ ‚\"\Ñ\Z#N>\ÜvkÛ‰\Ä\âq£p¢§¡E¨‰½¯ô9y*)Wÿ\0Oº~{5PÒ§o/\Ä\Û~‚F:)49›Ox\Äp\×¢(Š ‚›6#DAkN\'‰\Ç\ÙPTÁZ9è¢Ž•\Îw\Ó5N\rAðFóOŒk\Ñ\é\Ñ\nwiqú¿­³úò–“¤\Èrj¼Ž·ñ:Æ¢£“µ—a\Ñß™4RRÎ¢¡ÇˆŽ\Ã\\\"Qˆ \ÔCÛ£‰£ˆ\æû¹ ¨(¨/J‡+ÜF7¥MCiš×¤“ø×¬_Ÿª|\Û_«-\Í)±¨®·j›\ÍZ&„1]LRU\Å]M\ÚÊ±(2H*\ég¶ÕŠ†„\Z\á®\Z\áƒTj\Z7ðƒM}©\ÑZ9=•=\ÜH8_aE ÷¬\Ñ$\Ñ\Óñ¤R/d\é\á\Äú«ô\æž ²Ò•52VL‡\àO¸·@\é\å\Ãø¦;\ÛÉ±Šl–’\ån©²\ÖþM\n\Z\á®\Z\áŽ\Z£¨\Ñ?\r?\é=ú(\á\Ú\Û\Ç8rûSûS(½\äjsú«‚‰þ~Œ0)x^ú¹\È\Æ\æ\Þ#skœ²)ø5²Ác[õR[›FZ®õ*›eÖž\ïMÛ¿\ãÔ¹\æ\ÍWŽVôT\èŠ5\ã1\ã\ì\Å\Z£=\Ä\ØE\Ùù?\éTp\á\Ë\î\áÂŠS†\é•!‘\ÒCQP\Úvÿ\05\ÅñB\È\Z3\ÞNŒ0\×q¾õñG ­Š±csŽ\"®›«Uô‘½œx¶iY(kŸA=‡!‚ûn\ïh¥¾QdX\åV-V‹¾Št1\ã¡÷ûñŽ÷jˆ\ãfö¼…Q]\ì\áÃ‡(\á\Âÿ\0\ê¥U4Îš;{žýqBGðlm\àÎ1/ùÎ¾&Eþù%?”ö<¾%‚\É\r\ÎX^q\äŽN$Ö·\Ü\îtVImWù”ócyLwt\í\×PS\Ü\ér¼J£™}x\É<dƒ$§1%Â¸W\n£‡(\å¢Š=\íó.‹\Ñ\ïF#Z®rôA†\ÞWÞ·lr†÷%\ë©±Jú-A‡AI ø¸»ZIf†\"F9¯V£\ÍhV}²@a¹·˜{sÁT9†.:\ävú(©®x\ÉFK\ì\É\È6AsÂ¸W\nñW\Ý\Ê*Š£”QO\'‰ü§lh\Åô0À!ó/žŠš8jÛ“â‹\Åh\Ç~š‘\'’\ÚU¾JH\ëí•’\ÇO<4*ÁQM#cº^_Q\'†¸ü¶[oq\ÍG·2ÀkV»’\Z5£ò5ú \ÉD—Cd_o0\æ,ˆ+‡<WŠ¢¨«\ÛB3\Ãz_»\Òø™![C\r\Âµônz>È‰ooÿ\0_\ÚI,q6\ãxšñ6²†>þg€\éZ\î]M»F\È6A²\r”I0Wû+\Î^üÍŠoª¯Eõ!}ð\Ê/£°úç•\\\í %¦’\Ðø¼™)ªªK\rUuNM>„\Çh\à\æx\Z\\\Ý(\äMp×ˆñ$š9œ\ÎG!TÙ¾›\ì \Ô,v÷\\®±\"gaQ—[’‘ASKS:TeWL[†\Ã\Ã\Ìpˆï­–9)¦T\Ý\Â<\är9œŽFÍ›7\Ñ{F\ÓÃ»?ûwKT\Î/=Oñr\Ì:Ž\Z\ÊI\íµBŠ‚;]6\"œ›6lÙ³~új;T—júJX\è\é¿G‘\ã™%5\â\ËW\Ö\n)¾&Í›6lÙ³}w\Ó~¤B&r\\;þ‹Eú[­¦šóG“b•X\ÌÂ ¨h‹¾›7\Ófúo°ƒZ`¸¦¿Q=<uP\å\Ø,–Q4\áZ*`Žôo¦\Íú\Ñ´\Ãð\Õ\å^yŠ­V?Gñ\ìû˜\"ï¶ˆC¥v%ƒ¥þ³\"\Ä(²&\Þñ{…\Ú\Úp\ètsVˆ¨\ïZ ,x\Õuõøþ)I`o\ëœ\Ôr^|<·\Ü\çˆ]m\'²ŽŒtC¡÷û\ÚsQ‡6œ\Ð\äZ1[­\ä²xqEB1¿²¸\ã\Ö\ë©[\á…,…_†÷hJŒNñNKl«„X…=–¶¬£ðöõTPxPˆ[1M«ÿ\00¿ÿ\Ä\08\0\0\0\0\0\0\0\0!10 \"2@ABQa‘#3CRp±q¡Á\Ñ\áñÿ\Ú\0?üŽ\rq\Ø.Ÿ„¢\Ò7.Ÿ¨Ÿ[X|T8,\ï\ê™C}Ö®\0\\\0;O’“\r‚MÚ¦Á÷f\Êz\nˆ7o†¦¤–¬\Ú0©0\è)up\í{”Ö$÷2!w›!ŠP“n\"ak\Æf›…dB²!]TaÏ¸\ÕT\áSC«5\n\Ö\ßÁa\Øk\ë]™\Ú5CN\ÈZÁ¢Ê±:\È\èû,²ªež¥\Ù\å7[*,Bj\'Ý‡OeGYly\ãè²²²²s.ª°\èª7\Zª¬>Zmw¡ut¹}#uM‰¡Œ\Z²¨¢†¨ZV\ÝTÿ\0½ªg_\àTð¾\'d•¶(ƒ{,™’	§\ìü=ú,¬¬¬‹Qj’;ª\Ì(?µ…=ŽŒ\åp×š&ÁaÔ‚’\ß4I Žvä•·\n.’üHÙª-B²–÷Pp:++++\"jse*[®\êzwÓ¿#ù˜\\|J¶š‡\"\Éñ‡\î³>´\Ô{ÿ\0”p¸VVVD\"\ÔZª\è\ÙRÌ®Uï¦“#ùxS\Ã*\Ùt\Ä9f\"Ãš/——úLv`¬¬¬ˆD\"ÕˆP¶ª;y§±Ñ¸µ\Ûò-7\ÄYW½\àC•~­•‘	Ác4Wúö~¼¸\å|FuXv2ÊŽÄš95÷W\ë\Ý]]]_¬Bž0öØª¸>)g/e‡\ãO‚Ì›P ©d\Í\ÌÂWéºººÌ³¬\È9\Õ)\ë\Z‚\í\â.e•%d´Ž»\n \Ä\ã«n› \ë«ô‹‘rÎ³¬\è95\ÈŒ\å\ÝÀ¾·\à³\ßCºr­`|e¨‹sX÷D\ì\Ì:¬7\Ú9t)¯]\ä\\‹–dšSJ?µf{¡¦Š\\å‡‡\ÞLw>ÖŽýŠÍ™·U*–\å™Ã­nN‹˜\íÿ\05¡\ãDS‘G &¦ ¾ð~¿\Ù6l\Ó:6þª¢¬DxlŸì©¡t-&C\Úv¥7oŸ\î§\ÙW‹Lzû\ï\É\Ãñ7Rœ\î¨\'lÍ¸)Á9¨µY\0šB	\Í$iº’6U7+¿â†š:q\ØO¡»¢E‚˜ªÿ\0¶\é\Ù\äž\ì‚\ç¦üš\Z÷\Ò:Þ•MT\ÉÛ˜EÓ£Yb\r@!\Ð\æ5Û£÷?5`\Ñ`žT\åU»4Ç¨E\Ð>G›GXúGi²¤­d\í¸(VU‘«u\nqR9UI•¤§\Æýmy´õ/¦vfª:ö\ÌÛ„\É.ƒ•ún‰D§¹Hõˆ\Ï~Àð±Jø]™ŠŠŽk¡\"Y–d\\œ\å$Š®¨F\Ô\çœ\Ç\ÃZn.%\é‘GQtÙ—q¥O™UV¶?æ¤‘Ò»3¼=º\"¨’\éQbƒÖ›ˆ\Æ}K\éñ~%&\'\ÛU-|’m§Œ²²·\åGÿ\Ä\0)\0\0\0\0\0\0\0\0! 01A@\"2QapBÿ\Ú\0?ÿ\0µó%–1%\Ä?C\Êß³Y¬ú‚\Ì\Ñ#öG$eñ§5$ò\Êe‰9x?—ô;[>‹ˆ\æhŽh\Ë\á\åÌ±\í\ì”\ÛÝ–`\ÆòyðcÑTD\Ó3pñÊŒ˜\Þ\'O•—\Ê\Ä\ÈehŒÔ¾\\ŸMY)6\íò²9eÄ‡Ÿ\æFIý\ÑdZh\âøˆ5¢—\Î\Ë,LŒˆeýž{Ù²k—Tf\â\î$¸Œ²T\Ùe\ÙU\Ñbbb‘”FJJ\×s3¨1ö”¨¥/)‰šˆdqdd¤­vó+ƒjùk½¤5]	–Y‹&–\'{öøŒþ¾\"g“þ{t¦´³?\n\á¼J\ë\\¨¢º\Ñ	S!-JûwfnOx“ƒƒ§\ÓE\n%\ZM&‘®¨œ<½w,ÉŠ9\ænXŠæ‘¤\Òi4Ž$\×*ý›#ß»cJ[3?§\î‰B\"DEP\Æ3\Æü£W¸Ö—ýˆ]Z»9øe-\â5¤‹\".†1ž‡·Qz·~’Rð{1‘ñ\Ét7B\ì\æÀ²n¼“ƒƒ#\"2/“cbn\Ñ)¹ùöÅ¹ŒŽi\Ø×±oÎ»9p¬ˆž7)\nf¡\Èllo•\Ñg‘Ð¼t¸û\î\äÄ²-Ì˜œt)š\ÍC})F(õ\íÝœ\Õ3.Ç¦¹$$B$#K\â\Ê*J™—&’Š(¡\"11\Ã\ãù2`ö‡Œq4šM$`CÈ¾R‚ø\Ñô°±`~\Å¾]–Y\åÿ\Ä\0D\0\n\0\0\0\0\0!1\"@AQa #02RqÁ$3BPb‘\ÑCr‚¡±4Scs\áð²¢\âÿ\Ú\0\0?ÿ\0…+\ã9ö\Ç\æâ›\âSÄ¦.™G\Î3]B»•\ïnqñ^\Êo1Iv+½f=nL|‘žò\Õ\ÞcM\Æ3Z|c>Ë£\â\ÈSGh¼G2òW\ã\îú¨€³,zC›º°B(Gaš©Q\Ð•–F\ÅÀ‚þ,\"\ÒHP\Ú=\ÖP“–°]ñÎ¹DjBp\Ð\êË¥;µ@L\ÛvOmm—\âw{Nº°„I…±%V?{\í¨R]\ïŽ}•7¾3\î<\Ókº3Rù¢Ë©[\'\âE¡œžÐ¼tÁM8[V\Ð`\"q6¿¨˜¶ÃÁ»Ü…×•Üf*³e±\Õl`8\ïŠÙ°v¦\0K\ÙOX\ÆRqvS©‘\çIM5\ÙûGûH\æŽM\Ï\ÐÅ‡9µô\ám8P­¢\'SO\ê¦\ÛXZ±\îë¦§\ÙF\Ó×•ÜC’§@©ƒ0ýVu\Ù{¢•ðŠ”nŠ+\ç%Œ\äk\Ú#4×§´Ë„mN£·y‡¶ž§\Þ4V\ØSÎŸÂ@rŠT-$\ê1V`öN\Î ði¾B\ÂT0\ßQ¢\ÆØ¨\Ç\\\0nÑ³¿²~‘eI¥?ß–‚{ŸcõavÓ¦)k6R›ÉƒK˜E\ÈOŸCB*\"\Ó\\Ú±\ÝŽ\àöVÂ®.´ˆ\ËI\ä¦üS.F«}ir\Ê\ë\íNØ»9µ\ÅJr”Õ´Ež¢Ç²­8\Ê\é´j1gÕ¾1lùiae_\Ü>]*’œ\Ê\ì†\æ\åf‹.\"ð@¾^Í¢Y\ã\Æ.\ç\Û\Ù\íFi¿a\ÐBÒ¢•„\ËÍ—õ/R´—f‚X[‹5RN‡^ª»C\çE´v\ÓI¨\ÐS+:«°C\Ç\ÏHe÷Š©ðÑ­Ë«&®Ï²c&\è\É;°\ë\î\ÐS)8®k8}„v[ó\Ñì¸›B/«\ì\ì )\Ð\Ð#6¼\Üp\êÝ£7ý¡¤\å975eQ“XÉº=“\å 	)•s\éŠ>\Ð\ÑX_m»¼4ª+ÀŒDYw9:œ}:\\BŠV“PD\ÜE\Î\'\ÏD¶*\ä²\íøk€¤õN\êCÉ½8-;D!æ¦\Ö*†\ã+\ê­6L<\Ú\Ç7k<v~!^6\é\çGÿ\0uYª½®ýš\'\Û[MTØ£ƒjvÁ°-±­\Z\Ó\ÝH6“·\Ý)Z\r“Pa©\ÖÁca\Ð\È\" ê‚€=\Ì\æŽ\íž”d\ÙV±©Qf–\ìtý™g›~\ïÍ«DT»—+/²¨r]ôXu³B\"ÿ\0¬E½?\Ìúû¡*„`a‰iC;¿D\Ê7DN¶3\ÚøL-§P[uŠI\Õ\ÅVúºÑª.Õˆ8\r	\é5s\Ó\ç¢\å\Z£s¨«\ín0¶]Am\Ô\Z)*\Õ\ÅPh¡E\Üv\ê=.\Z¬G\Î3T\Üy\Ý\Å.ö «ûº$—CAFÈ¶ªT\ì\é2\ÌQ\è§R\Çd\Â\Ûq%·h¤+xö§õ»¦Xte-j\Åg]]?\Ò: xE\èL\\r‰\ìœ~qQÉ•wb‡¼tY…U\Ã\ê\ÙOYq•™Vh\ê6žª;¡3ù9l‹\"¸\ç^ñQx\èþ\Ð\Å\á‹•©\Í\Êú\Â\Ø}²\Ó\È4Rˆ\ã»A;:\ÒM	¼‚\0H aJ\×dÁŒ ü\Ãh\äº\×ò\×ûòòi£ó\Ê­W«½P¹‰‡K®¯\Úò8\Ë*\åe›h%¢\ÛwÝ¶}‡­8*•\r}¡F\'P9·¼Ž\èrVi²\Ë\è\Å\'÷´¸«_Ð­\ÎÙ»¸r\nN%v–­Z‡Gd\ÓÃ‘0\×i\å.Oƒ\ÔœÁnâ–¿\Ì-\Ç¥©FªRJ\"¡¶“~ø“	¦þ’Ãœ\Ü\Â=S\ãÿ\0ˆT¤\â,:/uV6ŽFþƒ»“õ>,9m~È©4•#Ä¾\á\Èhv’G\é\È$š¬\Â\äø-\Ë-à¹”\ëÜŸ¬_\ÇS„%y2’Ýµû]\ÐMœšz¶0‹lóŒ«\Ö3¨÷@z]v†´\ëI\ØzC/2›\Å\èu=f\Î\Ñf›ú·“\Õpºº!\ã¯\"\èÃ 	\ì\æ\Â]Ms?\Ú\ÂT¤\ÙTU^;-”Q#‰\Ã\áÈ”ü\\Áˆ\æ¥\n”S÷›Žè´ªÓŽÒ¡.\Ì,û-\ëT\0d\ÐE·TF\Õ Nðl\ÊNh\ê/\á0lss	õŒœGø\é+6\ÞQµ|\Òvñ“{•Y\æ¦@\Çq\ØzNþ–¾ËŸö\â\Ê6\ç…iH´ù®\ê\ÅÃŠºõ¦¾D—÷\"Sb‚s	4+Ši\Ý\Å}\ê:¡¹¾aN¤g%€püPV\Úl¥F\àx·ÁD\Úý7¶\ÒOZ\ÑT3\ÑÚ„\ÌK¬²ú0XŒƒôft{:—¼tŽKL´ebŠJ¢\ÚJŸ\à\åÇµ£\áW×¦óŠ@\è\nU‹.›µ9õ\ä_\á—Ž¤\ì\ä\Ê~*ò\\\ÓeK@¢H4‰T\Í\Ñ\×Ô¤\Ð\Ö\èÊ kP#\Æ-?™2µQ§”s?\ãX²Roˆef\Zb½\\¢¬Ú‚¡€\rôŒ.\â\nÂ¨V\Ã²ýô±\0¬k\ï\ß\Ò-§ibŠB…\ÄB¦¥ž\àÓˆ\ÅL÷\îß¤\æ(£v\"1Að1zÀü\"+¯iÇ”\Ù\ì%G“GZC—-&´¬2\Óo²\Õ5³L\è-\Ï\Ë]y7´¿hm€\Ä\ë…r¸36qo\á^\íð»»J„\êT&r{Ò­\ê\'tXyjqr\ÖJvF8\ÅÑ\n”’¡>\ÓÚ‘¸\æ$,Z\ëwž”¥B©7asü‚¹L\\—·½;¢£\ÜS\0G(ZHU\rEF2o&ºÁ¤\í’˜\Æ\×rWK—»¾,©þ\Ø/[\ÛFè´’Û™\ÉR:«‹¢”ñ‚µ\Ü!Ròg&\Ç\Þ<?a\r\ÌN5Mha_º¾šœ!ÁMüNÊ§^ôý9t\èŒ×¬\ï8|º6\âBÐ¬A‚or_R\Î)\ïú\ÂÜ–l¿(«Ý“­?26L\Ë\ËK«ª­‡b†£Ö ±’f\Ò%+LÞ³‡`†\æ&[N\\u\Z\Ä7õ:\çø5!x¸Î§ú‚••ŠN ò7\é,K§\ÛUv¸J(”Š\Ð\Ð\Þ ».*\ßcZ{·B¦¥’†\Ýû\æU\êŸN\Ø)e‰5/šf¹Ë„¸\àK“t¥\Ø7¹?]\ÍJQžÁ\Ý\Ç\ëe\ä)§Ph¤+È¿Hs„1\Ìo\ÌôŠ\\½\â±IÀ\ï~ZmC=\ï!°h\ÙDQ‰ôÇ¶\îV\èrZi²\Ë\è\Å\'‘~ŒÔ³x¬Þ®\È\Öa¶\Z[lYÜ–O«}=dˆû<\Ú)^£ƒª±»‘»E\Ê:ŸK{­ðž\æT´\ÛA\Æ\ÕóhŠª¯I(\æ?ä­‡‘v44pŒ\Ú7²\Ùÿ\0·º\Ó\È4±E!B\ã\n›‘\nzC#5õ^:‹Œ_q\Ð;\Â(\ÞÜº¿u}=\Ö\ä\ç$!x®S«ð\ì\î…!iSn$\ÑHP¡w\Å÷ˆºþ‘)JJ”£@\ä\Â\'8A ¿Š\Æ\Æó¿Ý¶œ¡Õ˜o°~\Ð\ÖR_T\Ã}_œŠ‹Œg_\Ðú3Tg[\î\\õ‹Iç¦Ž/¯\rž\ï Šƒªä¯ ¼{0þ_¤¹|»C\ïX\Î,y÷F5\ï‹\Óò(\Æ5\Æ8™r†Þ¹š˜NŸ¶½\ÙÁ\Ã\\¤¤`¼ý&Qµ«·J+\ç\ÊÍº\Ç\Â\à¶#š,LÊ²X\Î\à\×\Îô_´g\É\Ì#½¥GªXü¦9™)‡?F¢¦\\my`@3“¿‘„ù˜™D©Á÷Ž\ç+õÿ\0Œ/ÿ\Ä\0+\0\0\0\0\0\0\0\0!1AQa q‘±¡Áð0@P\áñÑÿ\Ú\0\0?!ÿ\0ŠHYh[ž·*^:O\æ1‡²\Ï.\àzN+2Q%™\Ñ\í‰X]? v\ß=FË³$KRZ›…ñCn©\"Sõ‡|ÀL65WoÇ»^3!\"Å	\Ôz\Ìü\Ç\\\Î~øþ&\ØU›,®gqsGe\î	M›6SüZ$\nÌ§0}“e/\n’I$’I$\âX&\Ì)£g9nhÒ’\Êê„½X{~µ\'l{M\"ª\Ã\ÂNj–XlÊ¡[p\ä%e¸KQB…v#·$ò²ó“¹“l\Ù:\ãH°’IÄ‡1M¦ˆZ†¶oU˜…¹ª®kð‘–\ÉWtEw•gôc-ŠZZ1Œ:4F\Ù)ó%¨p@”„m\ë\êtZ:°š\ê½TG\Èi[<\'a$ðN \æˆe6†WøXÍ•ø\ê4UÉ‹›Ê³¢$˜$|PQ’\ë¼-\Ñ3\Ñ\åQ¨²?5\Å\Ó,\ß%¶!„M—\"¨Ÿî„£€N2I8Hž\ÖdY®\åyÈ§—\ÒN\Ûûü§/3\èŠlž‰`œn!	‡ùˆƒ,\ÓU\ÜwIº\ÈOQŸdš\Ðl\Å.¢‰©;<ÿ\0dôdIDý@žƒ½{Rmqap<gð¡Vò)W\Û~\ÂH7K­šû\Ä\åJFH—ô	\ÂpœXÄ“2e\'-\ÑüÐ¼A¶\è`\å:¶9~Gû­&^p–i\ê8Š½–r ´\×ñN	ð\æ\ïl—Fˆ\Â¬õÔ¾\ï­Ez	ž<±krk~¾ƒ=ÿ\0r:‚“ó\Ñe„\ZV­™u6#5Ÿ\è…\Ø^“Dý4\'Á#¥<·\r3&k›£û›\Ê(jò]É¦K·bxI8\É3Œ}²£jhYluW4.(û4I|\Zcb(ª\É\Óü¡·û•*\ßnÆ¨}3öc“žI\ÆI$ž;`\Ç\Ì\â\ÛÃ–ÿ\0O\æf[	\áO\ÄÅ‚ŠÂ«\ë\ê»^\ÂiNW\Û;-—»I$\àœg\èN2¸G†FÜ‰MHgó‘Ûš\'Œ‰\ÐL‘b ¿6«\Ý\ÛO¶­k\äe\ä’N	Á$“„’I$“ô\ïž„³7³·løg\ÉÁHø12vy\ÚËšûW\ÇÒ£v¯•…H‘2q\\N2O ¾„5U¢f\ÌZv”ôL-Œ’I$\à’F\ÆÅªC*¦7–)®Ÿ\ÚF¿jôOú”\ÈAa$O\ÂI\'	\Å„aa\ZÁ\ã8\È\Ù#0J^a\ç¢%¶û4\Ë/r\Çq‚•\Þrh›&U&x¦\'‚~Š¾1Œ‚1ˆ\ÄÊ‰\ÂHx\É$Œd“‰ú\æg–n¯´R\é[/x$E\ÎS\Üÿ\0$¡K\'¿ˆ&,„ð#\ÓˆÁ8Î§$V\Ø \Ç\Âðc$x9j„2hd*j&Mþ\Í–†Ù¡Ãª;\Ýð\Ð{A÷}d43.÷:jŠ¸ „“Á|\Ê\ÙG\ì\ê‚b6v¹\Ô{ø-G\àðc\Æaa4ó—\Â>\Óg[\×)Œì‰­Ð…%µP\á›3¢R«r{‹5Ó³Y\â( ˜°B‚BTÈª.µ;`htñ™o2\ZPÈ¡\' Y­÷\Z\ÇÀc\Ù#ñ6š2ˆ¡Mÿ\0hM\r²xty‡EÕ…2C©snå µÖž$\n)‰\à°\î^£\Å^§@Ÿ!0T`›\ß  ù­Œ\è\á\\\Ä\Ò\Ä\rx<^²j!#\ÝS\Ù\Û\ís\Ý\Ê\Ëó®Fh¥\Ó\Z‚9¸Hb#}—\à…\rGQ\'Ø´H \è2>h\è1þ¡\ÎN\ÐU™†¹tö°B$i\ØT\Ý2ÁŒhM\Ù,\Æ\Ð\ÔùDž F:‰•z\\\ê?A8J·\ÑO5½,“ŸÔ†u\ÓOˆ‡ø¥Y	]40§&¨õ—9\n–\Zr\ÖzðP´w\ÈH(\"˜l\Î\Âg$·;¤“¦\ãM\ÃZO «Ù˜óª[ ª\î:£ˆ|Ÿ,h¤J‰M7Gk\î\ÉR\êj],BBˆlƒbq\ßÚ§ý>W†2\â$—©\Û¡­56\Ñn3dK\'MÚ±¬XÚž‡:¢·\ÔYbeSYý6z2m¾K\'\";ú‚`Ê¸nµ3—óCO\é¹WsR\Äý\È\"\ÔEt£‘c}\ÈN„(ÓbµW\Ìh\å\Ìf5lù7)GcÉ£1\Ôi\åaü\å\Ù\nˆµ\ÉH:¸R˜²ô\î\ç4JjUg1‰N\Îj®Iú|o€š<¶c…Z\ÉhdÁµ\æ\Î\äŽNz®‹6ð\"qm\éôå¥Œ\ß\Ï\áø\ã¸Y36ÉŽ¸N.U\Ýô\Åw\èKn\ÄY”$¢¡[\×\Ü_K9&¨d,.•\"h™v$UB*™\\× ·U3£±mrý;6\ÂJ\ê\\¢\â­{e\Ð^ýñ3¹£Ô©Y˜`t\Ôõ!ŠƒC%‡E¯4ÿ\0|JÁ<¾ÜŽqg\ÐD±[M‘z„r\Ø#å’™5œ\éõ,\Æ8uô\ßR<¿\ë5\ã2C þ„¿‹\àNo”,&)\Ïq\æ8\×A»\Ç:‰)_¨¥5BU¡\n«k„i\Ât›³PO¿©u z¡R« g˜¿lF1¬‹·\ãKu\Ùgƒ¹‘‹,:ið\Ý8il¢D§\îv½Ÿ\àŸM)°‘)jf\Ð28¶ö§B\ÃL#H“r¥®Žº”\Ùu4†_R*^¢\Û2½jMNahõ\È&˜\ÑDw÷#Â¨°ró\Ð\ï…Êª	6\å{\Î\ã(Jz\ZEQ\êga¹I\'/3\ä\Ìlµ\ê\\²Œ\'\ê7B}Q~\Å/]\Ûôp2tw¥r&*§\ä—5vnÈ\ë:?\Öu\Ön\ìclm/Eû$W.9\æ>\ä6¼«9©¢,6\Î!8¡C½‰Rm„†¦¿\ätD-D\"½…\Ð—ˆˆdú\ë-W…¤\Ó\ç]E®®«]\ßQ%ì²Œ\ÉÖ¸ªG\Ê\ï‘	^\Ø(`¦)¢¤¤HÓ˜%Mª%]±CžE\Éf5cJŽ®\n\'z\Ô[YI\Ê\Ô\×#\Ò?sµ£q\æý?\Ùx(\Ï94œ‡­xo¨‘(‚‰,†\É\èMš$C»››\Õ\ç‚x^8\r\ÍJ7\Ù¥½r\ßÁ>g–‚¦\çhµm”3¡Vz¹\Õ9“\Ò6*,\á\Ñ\rl\Ò(f‚¨\\ý\r•}hMjµ\Zª\Z–6\ÜHZúüo/©+ÿ\0Ç¹E\Ç2ã·³›™‘¢:\Í3x·.¥¨%}JWZ‹Ï¹qdU­§s\Ù\èr]Œ±¥[b¡\Ût5:$|1\Å\á4\Z$\í\Ø\Æ0Ø¸\ÞôEw\É4“\åß€¸\åÿ\0I>S<4\ì\êŠ>Jù”{Û¸ôP%Lšhd\rnX–­\ï\Üs]€È‘õh;{fš)!†j.A\\™ˆb¨\å™\îAš*‹—\Ü4Z\ÂoÇ«´2£ùõ\×&²hkbžÁ\Õ\ég¨¥¦I•\ØO4D\ÑZý\É.bIù‹n´&÷zN¥\Î\ä\êõ\ÜØ¹K:d*\×\Û]:\áH1šjSF|°Æ“\Û\ã±_X\ì•{º[©#Á\Z+\è±\ï\Ã \ÐC‰³«Ð”´»Ž[¬\éÎ»¬Æ–nS§¨¢\ËC\Í2‘!²Žy-@\æÀR/L¬Tn\"G~›\Ú?\Òh\ÒuZd”@õ¿\ÕV %4T\Ðkúº›r\åe¥’žx:Ö‰Ü†`\âu\ìD\Øþ&S#¼t\ÊôW§‘ºûœ“*pT\ÞeÁ¹Cw\Æ\É*WÊ‰ú\Õø\\VŸÕ¨,\Ö\ã\ÌF¬2c?šE[;Ø³\Ü%Ay\Ï\Ò\ÕnUÁ9!Äª-\Ä@%\Ìu4fz«>G\Ø6±9OÔ½u\í‚À¸‚g$\Èð¤(.Cc¨\'\ÇA\È\î\Üe†Àla†a<H{\ë„¾‚1„Y2ú¿`ü·\Zò\Ãø:\Ê]¢/µð\ÛR\Õ\â»G²y9\ï\å\Ë/²´\Êo­<‰j]­„.šÈ‘(H\å:¢z:y\n­}O\â@-Ö£¼õd3+^G¸eº{Œ66H\Æ\ç#S¦\Í.n\ÒC@4	}”&Q§˜\Ç\Ò*Ò¾\ã`\á\Ã\à8\ÌjP§J½%\è½á€”¾›\í5\íeyt\î!2m†\î\\H;\æM\Ú\ê&A€¸`\Íc\Ãc\r’1¼R™”ƒwú|¨¡uŽÁ\Ð\Êl@ž½¶&DB*/­\à0©Ç§i\æžLuB“\äXw,\nÅ®H\Ø\Ø\ÇÀL$X\ì—\á\Ù^–§¾Á\ârO©\Í\åd]/ðMó ¤ Š\ÃG›“¼\r’F	`5	&\ÛÐ¶\ä\'>Ÿûý~\Z\Æ\Æ\Ë$Ìš-™V\Óø\Ðu\Å\Z~°F¡\"N$\àlo…	Rq´¶C\êö\ïøŠ\Ýq$h\Ð\ß\ä\0û·Y\ê@H\ÓNÄ˜mŸØ’Ó$’D\'xRÂœš\ËlìK~%©BšX3zÝœŠ\×\'£C,\"ò[\ê\èJ\Ë$\ØL’I$ž° ,G‘¢Yˆª\èò<?>«B\ì™9Œ\Ê\Õû\ÝdP\Ô\ÂLrk\"@%¡·\Ð3]9ˆhí†®D{‰\nv&OÇ¡²\Ð\Ú\Ìhnº&vù;­ÿ\0i¬v24º‡u¨FAtB+F\Ìò1nºû†™V¶\êú«%+\á~Â›¬\'	._“—oy=á™ öX\Íóg\ØHõ5ó1ƒ\é›Ø¾sD\î7ø=\â	Sc¡:)c‰}a|9\r©gOù…ÿ\Ú\0\0\0\0\0\0ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Îòÿ\0\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï#÷\Ï\î÷\Ø>\Ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\ïõRý\î\Ûý ›Ÿ|ó\Ï<ó\Ï<ó\Ï<ó\Ï<ÛŸ|./\Òzªd•óšó\Ï<ó\Ï<ó\Ï<ó\Ï/\ç™	t\rÒŸ mµ)ð\ï<ó\Ï<ó\Ï<óÎ“¶\Û>um\Þz\ÎkSO£ó<ó\Ï<ó\Ï<ó\Ë	»Û–\Ö	ý|¿-\îm<5Ÿó\Ï<ó\Ï<ó\Ë.‰ý›K\Ù\ÊZ\Î\È\ßóžªNúó\Ï<ó\Ï<ó\ÊË½\Ï\ã[šQ¿»\Ò[{\"n\Ã\Ï<ó\Ï<ó\Ï\æ-ð~ùŸ{+u\æ\î}±y\Ï<ó\Ï<ó\Ï<¾evšw÷\âG\Þó‡þÿ\0Ï›n¯<ó\Ï4ó\Ï<±ú¾—_ú#u+ñ¬¦_?M\å<ó\ÍZ{\Ï<ó\Ämÿ\0´›Wÿ\02\È~ÿ\0_ \ïÿ\0|\âh\ìÿ\0\Ï<ó\Ët³ö– »NCý_\Äg\×|\âŸ\åh¼ó\Ï<ý\Ãó\ÍúÙ’§\ÚÊ†\Ü\å|ôóðúüó\Ï<³m/F\Òl\Ís@—ýüó\Êv®÷üó\Ï<ó\Ïöùôñt\Ãÿ\0g–²\×<ó\Ï/¡ÿ\0<ó\Ï<ó\Ï§´e²¯Wm\rï“¯<ó\Ï<ó\Ï<ó\Ï<ó\Ï<þ\Ëö3—\×û\n>…\ß<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ò¡\êsK^\ïAq»\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ë=Wlû\è\Êó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\ß\r:\ß<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ÿ\Ä\0*\0\0\0\0\0\0\0!1AQaq0‘±\Ñ @¡Áð\ápñÿ\Ú\0?ÿ\0‡j£\ä\Ïü†ja÷eªý\r} \×\è~>fžDiÐš€„cööµ\×\\Ÿ2Õ¸\ægýûm:]\îR¶÷!\í±^R›\Ç5y[‹ó¯Z¨<I¸\Ù+Àb\ØZ¥\ÓO1†Zþ\Ë\Ò)P§\ì´\Ð\êó\è~Ý¥\\†\Ó(	€^\Z£›´@µø;DuL\à-Vû\Ö\0l\în?\Ú;Ê¸\Þ2\Ë *us\ZÅšuO\Ùö\0td]9weu0\0Š¾¦Ž‰\Ù3/\é;“£\çQzùI\íþ@PFA&‹wNšöÞ¸Œ<&(#$º>†\Ï\ÄCHx¤Š\×\îe•\æ\ÃÀ\n•*S‡Xþ¨0!\Ñm®\×u\0¢É­Vr~c;\\L£\Â]/”CGsä†¹;=¼A\Ò~‡\Ì‚\n\ãQ.0y	ÙšA\Ñm\Ùû<\Âk‘·6;>\Î\ã\Ò2.\Î\É\ÌðÝ´6z‘p¾\ÓR¢l®\çnn¦\Í\à\ÝTšŽ§÷¤a‡‰AŒ4\'\á\Þt0øF“$*ÀŸ¸n‘Kú^#Á|iX\ÃÀ^J”dõü¼:ð0¾\Ó\0šðx\\x²2—.k\'	b.ß©\Û\Ã\ËÄ°]]\Èz\à\Ëø.\\a7g_Id¶¸\Æ‚\ÉDö>#\Z?nlÁ–¡¨\ë\"¿G-\Ü;%„%Êº·Z=•ò+k¸\Ó9t\ÉùÏ´ª¹Ó£ýu—[ŒD[}\à$9Po-OWfc2‹~2dñ\ÂJ\îÆ¾¸<\îP\0Á)h)‹\Ò\ãŽ¨gø\åÉ§xRE;ôtOX-Nô{ý*SS\ë¨X\ÙV6ù|\ÂÊ‚\áK†£–¬\\æ¸£¹t=\Ð\èbu\íœT+x\Ð{®\Ä9Š`\Ð\èMW¯¹2S¸¸-A¹{\ÃKx†)ú\êU@‹~\Ïò¼2\Üðö\'\\\É(bM \Ùñ\æYù–Y4¯\í5H\Èu\\¯v2\Ûð\êþû[\0i˜˜\íö8%\Är‚\å«%Å™cÁ›ZœºM¡ƒ£€\Ê_\r\È T ¦MôNÉ’n=G\Ì)š&	HÀI\Û\èX]K\\+Àc-ª÷Ÿ²½ÁhÃ+<\rÈª÷úR\àZ V<$¹U/®79Á\É@`/\0{J&üµw³K•5>ð\áu¸ƒLË <\á‰¢\'x\årý«ˆm\é#”´ó\Ûü†D`;ÀDÀ @R\ï’8Lý»Àþ\×-¦€#\ë4¡\ç2}f¦WIvbü\ÅVßº® 	Uÿ\0\'ÿ\Ä\0(\0\0\0\0\0\0\0\0!1 AQa0@pq¡±Ñ‘Á\áÿ\Ú\0?þ(y¾\èwöúý\ÖO\ÂòSo½¸G½\à™=—€XmwXtJšÃ¯Ô‰«‚á¶\Û\á÷»¨zLŒGT\ÖTž©\ÐX^\ì‡v_·7‚—¾\Þ?\Ï\è\Î|H¼Œ\ÌoV]pÏ³ýFKQ²¼>O\Ç\r·˜X^\ÄiùW;fV\\–\Þ4´\Æ2.»z±\åÔ®\Ö\Ûlp0\âWõù@o§-¶\Ã\Î\Û\Âx_Fü¦Dq\ãa\Î@›ò\ÏYyó\Î\Û\Ã`\î{ÿ\0\ï p1?\Õ\0\â\é\éñ#O)2OFú2\Ë,\à\äa\ã\Ð\×\ãX¥¼„£\Ì\Ë\éD\ít’\Ë8ew\ãtwmt60’9!tò³9!—v‡\ä\Z°Fs¾Ï™Å[ð˜cDm\îùðbuÉ“\Ï,û\Î;;\'e\éÙ²g¨€a\Ôû\í\'\Ô¼h\Û\êlr=Aýó*ö\Ë<õ_kû–tK°sœx•ú\ÆÝ„O¿‰\Ö7³+¿ˆ\á\âoŒù\ç\Éÿ\0p€;¿\ÚA¾|¥\0ôOô‹\Îðð5³…VÇ¬·³Å»\ê\Û`\á‚Kh ö°ôJ\Ìý\çqð\Ý(gµOk\Å\àÿ\02V±\îðò…ƒ\æ\Í;‚\èo¬bû–K>›\î\Éck\Ì?ü«V7e\àôDôŽ\à\ÃYWðYO)ð–¦il¬»o–‰\ê´w*ºþ!\Èw‡\n\ÈI\Ãc\Ã86\à\î¿Lr\07rrq<D8.\Øvþ¨\ä; 1´–,^$.þ,{`\Ã\×3h\ÞX\â#\í/\Ú7}/³ý½[¿–\Ý\çøOÿ\Ä\0+\0\0\0\0\0!1AQaq‘¡±Áð0@P\Ñ\áñ ÿ\Ú\0\0?ÿ\0ñIhK•D#\Õ\ß\Ìf®y—ð>Ð°°ý¦ÿ\0ÿ\0\Â!:ý‰€Dy?\Ê(\n´Cy¾>Ñ¯™…£Çº¸¸e£*û¾ñ±n\ì}¥\ï\É3\É\Öü\Ì÷k”sú\Ì\Ó~\Z‡š}#\ì¸qke\áPu^Ø»óù„_9¬–~\ß\ã\ËzY@\íX‹¶¬ù\åñõŠIüwM7òe’ªò¹Ž9„žb»eº‚\îtý5Ü­b\ì-\ÂVV&~´}\Ì)©¶\Ì\Zûc||„3obú	þ,nµQ»èž·\ê>mOR\Î_,\á«{ˆ\å\Ül¿ˆ\Û\Ç\éa\\\Ç\è[\Ì;\â6–ðþ £9n;b\ÇR\è\ÚþL1÷Þ–E\çiðüG„¸o\È\Ùóþ™^\0<¾%³`\å\Åú\ÔO½¼‡\æ¹ò30úPý%\ÝÅ¦\ç*µ\ïÆ½úˆ£\ç¾„Š(üö¨úE\è	~+\Ç\è\Ûq\ç‰\á»Ÿ™o™v\æ^\î#±bk	*_=\Î7º |\èøS\Z½3ôƒ\ìÿ\0Y\Îrôð¾ˆ\áoiž\ß\ÈÆ¼¹\î;dB*\Å}\"\æ[w\\}jð\Å\Ö\ÉU8Uý¡•\nž…OC\Í\ëd(¿ÀdÕˆ›&§Ù™@®±ƒxxñ/­qú‡,n\rfSþ~»\ê-Í¥³Lí¤\Õ\Ë|&“\Ã-aö/óôC¼6Z|ÿ\0–1°;xŽ\ÐX\ç/Gç˜¯1YüFó\n<\Ë\âY\Û4\é\îø:	V)©§¹\ì¤\\‰þŽ 4?—2\íea·¹Ÿ\'~Gú”‡§\Î!\ç\Ä&QW\Ò{&öÿ\0ð¿÷-\Ìi‹–\Ç¢‰S›U\âQG®_{†³\Ë<ú|?ýøž\â—lb[!\á~\ã\Ë-fZ7\Äøý\0Q,g%¬\Îx>ó©…•õ	tÀ\ã\Ö^¿\Å(¯—\Þâ„¨¼U\ìt\ÃjzŽ“¸ã¬¯ø	\ßPG\ÛÐ¼Z\ì†\ìÙ“$©V¨®\"Ñ™M¿£\î4ñ^ ;&g8¸\Ó\ÂZ¼A1(w*Ü°rL$fŠ\Ð0=¶\Ï/„›°ú²üðÿ\0x£Š½\0ec£û…\\‡oü—R^§´½VY\êc™¼¢\ÄŠY\å\ÅL3WóÙ¨l.Ëž\Î\ß7=Àú1õ0\ÎN\Ç ‰e\ÅZZt6\"RJ¿s\Æ\í-\ì\Ù\n Ž·\0;=L\ß\èµ\ê=K\Ë_2È»ƒsZ?A¼N-\\\ÎV#™u)&¬ýB>\çBZ2iÿ\0Cžÿ\0»\Îa½ž6ù£ˆ¥.±u‚.=n[Xý.\\]™,óØƒ|C\Ä)¨\íps¿‡\Z \æ”Xˆ‰†\àFñ¬\roRø&\Z†=\\!yO„‡÷O4µ\ÒGLË³2ù\à\â/P£`\Ìw™›#b­?¢©æ¸ A½·57™pˆì—º\éù<ø_?¹®ÚŠô|ˆ\"wX[´¶WÌ¿?¥\å\Ä\Ï\èøLxý¦—r¼TùŸ™ž7Ž7=009m±\ì\ß\Ì2±kþy )]Œð\Ô\ìJAý§D\Z²±\Ô‰2û\Ô\Év\Ê*S9xš{—÷‰•\Ò8Iy\rL\çˆÜ=sŒ‚H(±4Ÿ\Û\Øl²+\â‡\â*¬[óz†µT\Ëz˜`–º–L9ž\Ò\Ý\Çy}\ÃÜ³SÇ¹w¿Ñ³U³ò\ë\ç“\É;\n£\ç\Ð#€²ÀˆYe°\ê 8ó9ó6bY¦`\Þ \Ç(p”q¹r“Q\\1i¡ù\êñ\ëFÁ#ý°Á¯Ÿô	\Çñ7£®3…j(õ\r._2ü\âv–_`\Ë\Ü–K\î*_Q]\ËV3?‚\\{\Ü,/´iõ-\ZÁòqòfi)§¤\áŽ>cQÀ6g£;¸\'¶a\Í\ÜÂ€\Ü\â,£¡X\Þ\'z™ŠrF0i\Þ</\Üu§_ÚœŽ•K\Éw¯\Ò%\Ã)“™b™\ë/·0YNpøL\É\Úuyƒô‹zžL\Ýu8\êR]üB¹·\ì¼O“\æ;? z½Mñúgr‹ó5ž¥\îy*(‰\Ëy\ê9®K/ˆ7ddÛ½G\É\äoûF–T\àRt\Ò\Ö\Ü\ïMÜ¯‰bBÿ\0D\ÝKOc©zƒ_§IwŽIpF\æ\Ô\ê^q¦h\Ëf™Tp\Ç\ëP\äR}–ÀË‹M}„ô˜|Jø–”9™\nu/žaõGœ,³\'u0®b1\æ+\é\Äq\Ü\Ëßƒôh¤\'\áöŠaª¸6qý£\Ü8<6!“¾9ò=#†W]L _™gÿ\0gS9ó=snX{`:›L±\Ü\ÛS\ï\çôV2_™\Ã5¨‡«•Q¥<q\Z\Ô\ÃexWV\Ôká‚Rë˜¼w)ª–]Ký6Dq¸\Ó\çqcy—Wkz“\ä\äxa\Ý$yG=<W\Ù\×¿\Þn³\ÑxC“E]Ü­u\Ål#ú!¡˜ñ8‡3_3¯pFYúeõ\rÃ¾%ó2\Ë0¬sR¯ms‰E%w+…üG‚²\ï3’“’cÄ«Ù‰\Æ-®e[\æRØ¨%38¯6X×Œ†¥‘\Ê\Ë\Zú\Æ\Õ01\âó2EÎ¦FŸúÁg›\ïûAZ·\æ\ë~OQ}\ë’K\Ïaÿ\0ˆ9ÿ\0\ß \Øö3®i\Î ·OÌ§\Ô\ÓS#P@þ€Vózñ\\A£rÝŽ\ÌJ5¨\Øi\êt\Ã$»@®&†óÔ¦p†­‚\ë•\æ& Q©Ì /]D­2ô-½j\n\Åø\Ô\Ôu\\\Ò_™”Q¡\â[G\é\ËC=J¬O’AN\Ïöo˜Æˆ…\"rDž\ØJ¶W´×‘\\\Ì\î\Ç;Á\Äù3»\Ûô\í\ë\È|\Ê(\Üó`„ós\á¹÷&£¨YýP_¤/”Æ›&\ì|\Ëyƒ \Ô+JK…¬+2Á^øÌ«ª\Îø\\\åj·;¹u	‡%ÿ\0¹O-¦\nü\ÊJŠ[\æ\\at2ã¾£ð³8¼ñÔ£‹\Üz	[–\Ån~\"—^\æ\r_¬ú\â\Ô\ß\Ì\×q\ã¨ø”-\ê]c X=¾mùiZºÕŒañšNE\"˜.øò®J“‘\î?\Û~\ÄJ\ê1ž\èqzcºŽ\0AZ¬3\Í\æjx–~Šq\Ì·3+\Ë&M\Ó\Ì7Y¢g@ù\â3x\Þu<AUd±sMKk=w\n¡\\k™lFS™¾²Þ¿ö, m‡\æ.\0m~]\ï?™q\æ¸­ø‰\nÁ\ÇqZÝ„\Î\r<\Íe¶a\ßp¢ŽW>¦Zs\Ô\Ó1²yj_ˆ³t~Ó’\áŸdf)E(lG\Ü`¨\â©~“ûD%ný\Ù\Û<‰½(£\éÒ\Ã\Þ2&\"‘\ÆÈŽElk±|þ\Ï\'1µ¥…I\ä\ë¤\Ã4S˜o¾æ«¸h•/\â&> e–N	”\æ.ß·p4^\ê`SyO¬Àr\Ìn]w§¹v/O—š\ê\à6˜\ásGaI¶²\á}D†ñ[ˆ \ÒÕ›÷øˆÈ£’ð|\Ëo³~?„ºÐ«1eüx—-¦^?6˜\É\Ý\î-[€O\Ú`¾e\ä®9õ¯¼£\ÂÏ¢\çIópûeøŠ\Ý1\Þ.]7Á+^b\î\å€>-òþ\Õ\å\ÆEÏ˜\ëe\ÙdM4\Z‹Ç›Ø˜JLBD\ÒlÀŠ¿\Úv8`\æc?^^<<Gt\á1c^3.üNS7©•žf­¨cñp\íO^ú™²\Z†2šY\n®‹uU\Íý¦–Òž_¦s„J¡8\Ï7\ã\êþ\ë\ã\îA4P¨\Ð7\ÐAK\ç•rEO9[z·l¤…\0ÖšÀ\Ç<‚¢~\ä\ÃY£om\Ú6d6\ã¿`\ÚEºA\ëþ\ÊIt\Zóìˆ®“WŸ\Ãþ\ÄZ²¹\ç13}\Ò	“¹V\è\Î\ênc\â	°°1G\ÞsUø¿\ãó²²)¡¢­ò\í{•`¢m_\ï¦ ¢\Ä\äþˆ¬\íÃ©´\è3ýGE@¬\ÛÇ—m\áeŽ(›+€ô\Ä4®8Ò¤\ÈN’:º»c\á\á\á\Ï]@¡õFC?\×pv\Ë¥òz¸\n»ú›ˆž4C¡f\\waVúúDS\n/\ÃÖ¦‰¾\×°mbòY\Ì@±Èªi­T\0xy§»8\î·Y†œ®ŽTxce@\Þr‚`dm/lÏ¹ocý™…U\Ý\ã¸\Ë\ã+E@TŠ?ö\Z¥«\èË‘py\Û\îZ”&>#)§8ó^¶\Êr¶4rñ,;º\àjUú ¥K2Ž‰7À¤ú\Ì\ç>½\ë\ê…\Öö6\"ùGd\Â\Èþ¤v{ˆ‹ªIW*y/;A5:%\àprðyhnXÍ‡Žr¹rú D5dF\0c\Ùu\0¼\Ä\ì‘\äþž3\æ”lQô¢ôo\á5D\Ú\ÏbdL%\"“>\Û\Zõ,UG~—~3Ll\åy—m\Ì\ìjhW»\Ï\ÚX_\Þ\n­4À\Æ”„y\ã0\n¥)\Æz‰e\Åixs¿\çQ“>K\ÏB†Ñ­j&‡-,\í«ø\Î!D¦øº\È\Þÿ\0„4 ³¯›Á\ÜU»¯9¬B†\Ê[Z\â\ßõ8­\í¼yÿ\0¬Z\ÏF;‰wg’õùŒ5\ï•ˆ¹[\Ç7ûq2\à\ïFÿ\0SF\rc\ëQ¹üñˆ°\ï*=Ÿq\âRð˜ÀJs-¾a°p\Ý\ÝZ®µß–\Îb”P<C§\Éä³©D”¢\r&Ä‹0¬•\ëÛ¸·2‹«õÿ\0\îã—Œ“{Í¸Q‘|‚\î´€\Ç\æ\0£…ú\"X\Ú\Zmn¹Mð\\¿K.Ó¤\ëªr8þ™@;ƒt™w\ågÐŒÙ‡ *XaðˆP\ã\é<7Q¯ÿ\0†¥Ž02øw)®¦ª~fƒNú˜hl;Ka~75›¾~:\Ôu\ì\Î@Rºý¢\Ý\Ø\Í\ì|˜•\Æ8b·\Ú “¬óÔ¹®©iz\ë\ÍL%°Û¿ù\n@\ì,õù\êd©±uŸ0i(L¢ÀüGB/ ye\çþ\Æd\"®8™ó2¨FË¥\æóPŠ\à\\%D\éúÊª1g×¥ó09>ðaWP—WÐ†O\Ö2žS$^û•¦÷<\àòŒ´rV<—_/Ã§\Ü\ÏÖŸ\Ú²\×\Ä\Ç\ÃÄª%g2\Ç(öýY³1§§\Òr·µ¹2ªË™@J.\0–žC™A¦¤¬\Ù–RXDWÁ/_\Ôv\×ò9Ðµ§e •\à\ÙFõóžV\0\Í\'´˜‹š\àº\îWµ¡™,ªi…’ñ]ø„\Éveø~\ì¼,\'ú—\ÚV\Øñ\ê¡\ÝVA£¨Â€sJh\ï1V\Û]1\Ú§\\U÷\åûF¦£\Ï\ÛòÜ©`­®°õ­\â& JWOˆ(…¦\Û3—œ¾â•\áO\ÏûƒaEÝ¦\×Íœ\Â6o¦\ïW\Ä]¡Xñ¯¤x£¬7›\Ï\í©D\à\Ï\Íq* \Óð·\æT6_”/\æ0««\É\\¬\ËN7˜—œ\Ãôöº63Úª\ë?´WQ\Ñ\\{³ø%ýÍ¡d™1$ûÿ\0ðyp0\0µWG˜°5\Þ+Ž\Ç/C+\í¤6\ï\Ë\Û\ZõˆY,:9`k[4\à\ç0\Ï\ÆÂªki4P\Æ%3´\ÕW…\Ún\îâ——O¥¹\Òi\çMš8–Và³°£ÂŸ\ÔJ®L\n´}’°0’·\í˜·AV6»A\Ã: ´£Ü±“ž?\Ú.-Œ\é[`Ñ¢ª¡\r\Ú<gR\ä\à1k\êD«ö\Ê\Ñ¿U–Ž®8\Ù\Åbj-Y5Mo\ÔSIZ³\çñ3\ì\ìpj“N Z›‘K(\ï\ß‰Ee`ð\ïš\æ“n_\ì\ÌO…\Ù\íP\ç@[M‰ø¶s<ðßš‡	cÂ·^g=¢·‡\Ó|¹EŽ(\Çý‹–[‘\Æ=JºØ¼-øSóyf\äÝƒ\×>=L_ßªü\rƒºa\\eÁ¿Á\×kˆ[~\Ó\áþ‰Š\îs—µýµÿ\08\Ïf¹û\Ö6Æ˜;EŒW]]ñJ¾ÿ\0ü8m7\à8.[(„]h_£ˆ\î:\Ø\ÌI—Ý›Œ\ã\â \ê\éU\ìö6Áœ3ã§†8„\â!`«(\ä7\í‚.‡YÅ¼ó¢Þ‰J\Â&\ä\0\\\ÌU­e:\'„S&†ƒË³\"zlQ]Ä¤s… 8\ÖÜ€,\ØÆ’\Â(\ÜF¶½/’%y\Û5\á0²¦±ˆvJ³x×œ@=…º\Þy|¸–¥lbÿ\0‰\î0TE\ÖüY\æ\áY«\Ó!Å»>/P²\ËL˜Mó\âC Š1‚¸1DU+IA kÿ\0.^°³Ÿ:÷Uþ¥\ÉLšMg\é–VvÛ<\Ì\Õ^>Ö±¿}\Ê.šµ¯j\ã¶\Âe‚«›\îCß™daø\"‹\è*ö;`¯Qsdª!\Ò\Ò_7?\Å\ë^ƒ\íYt`õñ\æR¶[|\Ï\Ú&É»j«\ê±\Æ\ç\Å0J‹G½Oÿ\0\Z\'\áO\Ú_µdª±”­\Ñ\Ö#¢€+\åN3\Î2CBˆðÀr\Êc˜â…‚ä‡ÿ\0@`R.þsŸˆ¥!%˜Ç¯s#VS@·\ë¾\à+L±\Êk|ó©Cž({\Ó	g\Öc@¥¢\Í(p\ØòM¬Ð†U\Ï¼›,\Ïõ3–±\Â&A\È\ZDc’ûs@¡\â€\çX$\Ü2.X#\ê–ÿ\0Ê•\ä²97…\Ô«Œu/²¦¾\Ý\Ä[/VŽE«·X\ÓiPjÿ\0\ØÜ ¬ñª\êJ¢…ñ~\à¥;o#JöDUƒ¦ý°°v\à˜À\ã\Óq\nko\07\äxñjŽ;¦\0®Œky\ë\Þ ä¼Ž¼\ä­Š\ècxŒ4¸\â·\Ö\î³l\ã\Ó\Èñln±\Ò-y\\;)\Ät\é1~\á|L­\æRtVýr?\ÆE\Â\ë¶ù}ð`\î&üAù™7\ÄÈ„Q\×ûCöÿ\0\áÇˆÖ¦¶·Ý˜‚’¡`‡E®\ÂÕ¯@\ÕP,ôýNó\nÁ¢ˆšPhØŽðó\r°¯â—\ç¤g.\Ý\ã-¦Z;e„ß¹\ÈyöoŒ@žº\äl\á\äHµ1\è6®ùÇ¸ù\Û|„d,‰–ZÄ\Öo\ïû˜UfUi\Î\ëO\êÉ°B”a[³©R¸M\ÞÑ¶œU	¸8¬Kw¯ö€–\ÙûÄ¸\æYC&*D©\n­&\ã¶ü\î*.—iy<Q¨|¾“$B\Ç+1Œ_>\áZúx¬‘p*3q¾k\ß\Þ^[2»W\Ãñ\Ô\ÅE_+§V;ù•l¸S}\Î0\ÅR\çx†X\'a\É\Ôp\ãj«Tj¬\ã‰BŽx&\Ê\ãqˆ	‘È&˜õe|\Z¾*©\ÚÏ¥¦+\Ôê¿ˆS&¥	Ò¸ðQWöŽ\êõ1^aû\ÂÒ¶ED·¾?þo\ÛEÈ†,\Ýnhžg	¢[\ZQw½\ÍGýUFjì¾‰k´Y›\\ô<œ\ã\É.TQlÍŒ&\à(-’þ­Ë¢¹\Ý\æ6¢µ=\à~a¢þ\0+@\Öñ_<Á™*XP\ê¸\Ýa\ÌFu4)F¨óùŸu™»>z<¹,B,Q@b\Ê7„þª™\ÐDŠDv#T\Ìf\èS\ì[\äwÜ¼ ôšÁ‘eK(FV©\ÉC‘¿r\Úm‰¨4\ç,?Ë•\0™]o\ßV^\í“ÿ\0\"\Ñ\Ë\n]×“\é0\Ú3‡ñ_\êZPÈ§vñ.C¶iQöŒUyp\å€\ã\"°ùyŠ\rŠ:\à\æWv ñ|q3r\à	[þ|F\Éu.³Fþ#%3›©‘ŽŒ9\n¼je\é—9”\"öš¿†ú^\Ý\Ü#„\É¶x,l…úKmž•u>•^®\í\ÏF5\ÉU\æmkd*V1IŸA«\ZGy \à\Ú9i\ÆS\ë»¿[/x¾\Ì\Ô<ò\ìv\çI³?\î ³”mCN\×XË£\Zõ\ÒGç˜±\Ë8?¯}\ÖÀcka\ÞXD£\âœ#Èœ7²#<°7²2<\æ\'­Š÷U¢\ì;—DAþj`aŠ\æ¦C[0e©|\ÉF\×=\æ*\ê©Ö£\Øö\ßðˆŽ\Ö:›b\Ô_©Ž—ZóÌ´\Ù}°i\Â[–þ³M\Ü\èi‹M\ëŸR\çˆ\æ™g¶*‹o,Xv\Êü\Ï)@Tz¾fª}\×\çúýw\Ø~\Ï6drJJ²,Ç˜\à\åª9i\ê6û®D1Î‡¶\Ü\nJwVY(ú\Õ!‡\Ãl\Üi®M\Ý\0goQ”:ò­/\ÃL³ý–eÖŸ˜ñù°s§1[þJH´8GQ7p›h8”•µTZ\àôŽ\Äq2\ï³Ÿ–R-´ÁWJùs\å«5ÿ\0³:\àe_ˆ”\n½\Ý*.*\Ô%2\Ö\áË¸ú\ÜÍ‡&½ wÔ»3«\ë;,[\\K\r\Î{&\î±u÷•©…z’ÿ\0h‰ \0ôE{¡\Ø‰\É\\#¾H\ßf\Ç`*]¶\í\Ñ2j\ÂX•\Ìh&·\èŠ2¨.sÍªóvI¾\Ì\éƒ\Úeµ\çŽ1NªV\ÓV*”	\èÿ\0Àû‰„È¤\Ó\ÃÁ†\â«oR\êSü7¬\Ç\årú\ÊBs‡7¸<¶#2*\ë\Ä\Ï™`\Ðkþ\Í8ñ3U[\Ã7ýÏ§\Ô?I\Ã0¿‰Û¹‘\â\ïQs9\Þ\çDe;\îQX”Xkpq{@>?¨4œ\â!)F\Æ\Þ]<w\Ë\Ø8\Ú\åV«ûVõq¨\Ë:vòb\Çd]68l!„ù”µ\ÌÀ¼÷V‘\ÔV\áÿ\0p¯¸÷\ælªß²pw\ÄYbò\Ó2\æ£\åó<‘·\ÄÈ•ˆX»øžJñÿ\0JZ\Ìå®¢D¸\È2Ñ®\Ú9€€R\à+=¼¯.\Â\"AR\\\ã;¼<SHR²‰\Þ\çV\ç–)Zº\Ü\Å/ó0¸±Œkoü@6lxbsö˜0Æjœ@ÿ\0¬\Ë&\Í\Ëw\Þc\Ë\Z)\Ì\ä\Ü\å‹Yƒw\ça/Ô¿Q\ï \0µo\0r²öµ‡\Òo\Ë?\Ãd\Ô\ÖÁy~2zlR[\r~\ípÏô\Ó`†ÊŸ+Ô¾\íø¸¥\çü‰\Óüóýt\Þ\é8a]Dø¨c\ÝÀ\çÄ£Dÿ\0©Kƒ\Ä;3¿´\\\îW 6¼~–¡õ‰K>b¨V³\å\à\Ýxÿ\0§ø‡\r\0\r\íHµåƒ•\ç\èD0“Z¸‰\Ä^\n™†£|“˜h\'s\é\çó\ryC\Ù8£¾&û\Ì{\Æ\Æ77\\MÏ™ó,–\â¥ÁK”kñ\È~\è/} ‚ñ \Â\á1{|\Ø#O»S\â\ØZ¹•µ–\'˜¨SHó	\ÉCP \ï§\Ïq%!\Å\ä\ç\ã>\á\Þ\é‹q7ñ\n)\Æ\æ3s,\Üô	–^\ÝBö§\é\èE§€%IES§N:B\Î\ë¯ñ•È±¡\Z\Öñ\äp’†\ZsŠUž0\é`‘C‘20ª¶÷\0<£\Ï$Oº@ù4ü\ÊaÂ²\n|›>.Pob²]qyø—˜5¨[\ë\ÏpJP|%\Ë\ìi~\0ù¨•? \ï[\Æe\åÇ®\0\n ”‰\É.\0ˆM_FÜ¯FZkœ´wGÕ§™nÜ´ˆdy†=³+\Z\Ó†’\ï)ú\î+\Ü/©þ¥z\äô\Åo\'j­g‰p\ÏMg)S²¤­»f\Ê£cxñ÷4_³¦\ÙÀ0òy\ìŽs\ß\ï±aK‹«\Ä{Xµ\Äþº\n1°Ÿ‡ñ!‹š\Ð?2­=\à~Ðµ·“úŸ’\"ûeÀòÿ\0n,2&gû©o_we‚ô Q_þ`ÿ\0ÿ\Ù','2025-06-13 18:59:33','2025-06-13 18:59:33'),(30,'Laptop HP ProBook','Laptop de alto rendimiento ideal para trabajo y estudio.',799.99,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(31,'AudÃ­fonos Bluetooth','AudÃ­fonos inalÃ¡mbricos con cancelaciÃ³n de ruido.',59.99,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(32,'Smartphone Galaxy S22','TelÃ©fono inteligente con cÃ¡mara de alta calidad.',999.99,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(33,'Mouse InalÃ¡mbrico Logitech','Mouse ergonÃ³mico con conectividad inalÃ¡mbrica.',25.50,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(34,'Teclado MecÃ¡nico RGB','Teclado gamer con retroiluminaciÃ³n RGB.',75.00,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(35,'Monitor Dell 27\"','Monitor Full HD con pantalla IPS.',179.90,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(36,'Cargador USB-C','Cargador rÃ¡pido compatible con mÃºltiples dispositivos.',19.95,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(37,'Disco Duro Externo 1TB','Almacenamiento portÃ¡til y seguro.',89.00,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(38,'Impresora Multifuncional','Impresora, escÃ¡ner y copiadora en un solo dispositivo.',145.99,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18'),(39,'Tablet Lenovo 10\"','Tablet Android ideal para entretenimiento.',199.00,NULL,'2025-06-13 17:10:18','2025-06-13 17:10:18');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admins','admin22@example.com','$2b$10$dRiJYQwjDoLIq1jeZjpteuYtrZZIa6hoxVsu6Wyj0dVHwXQnP7g9K','user','2025-06-13 18:59:33'),(3,'JuliÃ¡n','admin@example.com','$2b$10$7qNg.ElmDAN4QOL7pI76ou0LlwUTdpQU9xD6BZ9vvOolxHFflcvI6','admin','2025-06-13 19:58:36'),(12,'julian','julianpiedra15@gmail.com','$2b$10$C74djlSMuq8sowrKlb.RpeTsGdQ.sz3Y6hY7qCX6xblV0bfulE1V.','user','2025-06-13 23:19:29');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-13 17:45:00
