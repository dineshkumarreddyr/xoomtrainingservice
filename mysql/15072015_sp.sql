-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cosmic
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'cosmic'
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADMINGETASTROLOGER`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csastrologers' and table_schema='cosmic';

if tbCount>0 then

select csastdetailsid as systemid,(concat('CWS',csastdetailsid)) as cosmicid, csastname as astrologername,
		csasttype as astrologertype,csastaddress as address,
        csastprimarynumber as publicnumber,csastshortdescp as shortstory,
        csastsecondarynumber as privatenumber,csastwebsite as website,csastprice as price from cosmic.csastrologers
        group by astrologername;
        
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATEASTROLOGER`(in iorgname varchar(200),
										in ifirstname varchar(100),
                                        in ilastname varchar(100),
                                        in iemail varchar(200),
                                        in ifbpage text,
                                        in iwebsite varchar(200),
                                        in ilatitude varchar(50),
                                        in ilongitude varchar(50),
                                        in iaddress text,
                                        in ilandmark varchar(200),
                                        in icity varchar(100),
                                        in istate varchar(100),
                                        in icountry varchar(100),
                                        in istory mediumtext,
                                        in iprivatenumber varchar(20),
                                        in ipublicnumber varchar(20),
                                        in iustatus varchar(10),
                                        in ipublicrating int,
                                        in ipincode int,
                                        in iphotolink text,
                                        in icreateduser varchar(45),
                                        in imodifieduser varchar(45),
                                        in icreateddate	datetime,
                                        in imodifieddate datetime)
BEGIN

declare tbCount int default 0;
declare tbCosmicid int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csastrolist' and table_schema='cosmic';
select count(*) into tbCosmicid from `cosmic`.`csastrolist`;

if tbCount>0 then

INSERT INTO `cosmic`.`csastrolist` (cosmicid,
									orgname,
                                    fname,
                                    lname,
                                    email,
                                    fbpage,
                                    website,
                                    latitude,
                                    longitude,
                                    address,
                                    landmark,
                                    city,
									state,
                                    country,
                                    shortstory,
                                    privatenumber,
                                    publicnumber,
                                    userstatus,
                                    publicrating,
                                    pincode,
                                    photo,
                                    createduser,
                                    modifieduser,
                                    createddate,
                                    modifieddate) values 
									(concat('CWS',tbCosmicid+1),
                                    iorgname,
                                    ifirstname,
                                    ilastname,
                                    iemail,
                                    ifbpage,
                                    iwebsite,
                                    ilatitude,
                                    ilongitude,
                                    iaddress,
                                    ilandmark,
                                    icity,
									istate,
                                    icountry,
                                    istory,
                                    iprivatenumber,
                                    ipublicnumber,
                                    iustatus,
                                    ipublicrating,
                                    ipincode,
                                    iphotolink,
                                    icreateduser,
                                    imodifieduser,
                                    icreateddate,
                                    imodifieddate);
                                    
select * from `cosmic`.`csastrolist`;


end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CSUSERS`(in fullname varchar(100),in email varchar(100),in userpassword longtext)
BEGIN

DECLARE tbCount INT;

DECLARE exit handler for sqlexception
select 'MySql Server Exception';

SELECT count(*) into tbCount FROM information_schema.TABLES WHERE (TABLE_SCHEMA = 'cosmic') AND (TABLE_NAME = 'csusers');

IF tbCount>0 THEN
INSERT INTO `cosmic`.`csusers`
(`csuserfullname`,`csuseremail`,`csuserpassword`) VALUES 
(fullname,email,userpassword);

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETASTROCITIES`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csastrologers' and table_schema='cosmic';

if tbCount > 0 then

SELECT csastcity as astrologercities FROM cosmic.csastrologers group by csastcity;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETASTRODETAILSBYID`(in astroid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csastrodetails' and table_schema='cosmic';

if tbCount>0 then

select detail.systemid as detailsid,detail.astrotype as astrologytype,detail.priceunits as unitsid,detail.price as price,
detail.currency as currencyid,detail.paymenttype as paymentid,cur.currency,payment.type as paymenttype,units.units as units from cosmic.csastrodetails detail
 inner join cosmic.cscurrencytype cur on detail.currency = cur.systemid 
 inner join cosmic.cspaymenttype payment on detail.paymenttype = payment.systemid 
 inner join cosmic.cspriceunits units  on detail.priceunits=units.systemid where detail.astrosystemid=astroid;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETASTROLOGERLOCATION`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csastrologers' and table_schema='cosmic';

if tbCount > 0 then

SELECT csastlocation as astrologerlocation FROM cosmic.csastrologers group by csastlocation;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETASTROLOGERS`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where 
table_name='csastrologers' and table_schema='cosmic';

if tbCount>0 then

select csastdetailsid as astrologerid,
		csastname as astrologername,
        csasttype as astrologertype,
        csastaddress as address,
        csastlocation as location,
        csastcity as city,
        csaststate as state,
        csastwebsite as webaddress,
        csastshortdescp as shortdescription,
        csastprimarynumber as primarynumber,
        csastsecondarynumber as secondarynumber,
        csastimglocation as profilepic,
        csastrating as ratingcount,
        csastcategory as category,
        csastcurrencytype as currencytype, 
        csastpriceunits as priceunits, 
        csastprice as price from `cosmic`.`csastrologers`;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETASTROLOGYTYPE`()
BEGIN
declare tbCount int default 0;
select count(*) into tbCount from information_schema.tables where table_name='csastrologers' and table_schema='cosmic';
 if tbCount > 0 then
 SELECT csasttype as astrologytype FROM cosmic.csastrologers group by csasttype;
 end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETASTROPROFILE`(IN astrologerid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where 
table_name='csastrologers' and table_schema='cosmic';

if tbCount>0 then

Select astrologer.csastdetailsid as cosmicid,
		astrologer.csasttype as astrologertype,
		astrologer.csastname as astrologername,
		astrologer.csastaddress as address,
        astrologer.csastcity as city,
        astrologer.csaststate as state,
        astrologer.csastwebsite as website,
        astrologer.csastshortdescp as shortdescription,
        astrologer.csastprimarynumber as primarynumber,
        astrologer.csastsecondarynumber as secondarynumber,
        astrologer.csastimglocation as imagelocation,
        astrologer.csastrating as rating,
        concat(astrologer.csastcurrencytype,' ',astrologer.csastprice,' /',astrologer.csastpriceunits) as price,
        spec.csastspecilized as topspecilized,
        spec.csastideal as idealfor,
        spec.csastpaymenttype as paymenttype 
        from `cosmic`.`csastrologers` astrologer left join `cosmic`.`csastspecs` spec 
        on astrologer.csastdetailsid=spec.csastdetailsid where astrologer.csastdetailsid=astrologerid;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETUSER`(in email varchar(100),in userpassword longtext)
BEGIN

DECLARE tbCount INT;

DECLARE exit handler for sqlexception
select 'MySql Server Exception';

SELECT count(*) into tbCount FROM information_schema.TABLES WHERE (TABLE_SCHEMA = 'cosmic') AND (TABLE_NAME = 'csusers');

IF tbCount>0 THEN

Select csuserfullname as fullname,
		csuseremail as email,
        idcsusers as userid from cosmic.csusers where csuseremail=email and csuserpassword=userpassword 
        and csusermode = 1;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETYOGAMASTERCITIES`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csyoga' and table_schema='cosmic';

if tbCount > 0 then

SELECT csymscity as yogamastercity FROM cosmic.csyoga group by csymscity;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETYOGAMASTERLOCATION`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='csyoga' and table_schema='cosmic';

if tbCount > 0 then

SELECT csymslocation as yogamasterlocation FROM cosmic.csyoga group by csymslocation;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETYOGAMASTERPROFILE`(IN yogamasterid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where 
table_name='csyoga' and table_schema='cosmic';

if tbCount>0 then

Select yoga.csymsid as yogamasterid,
		yoga.csymsname as ymsname,
        yoga.csymstype as yogatype,
		yoga.csymsaddress as ymsaddress,
        yoga.csymscity as ymscity,
        yoga.csymsstate as ymsstate,
        yoga.csymswebsite as ymswebsite,
        yoga.csymsshortdesp as ymsshortdescription,
        yoga.csymsprimarynumber as ymsprimarynumber,
        yoga.csymssecondarynumber as ymssecondarynumber,
        yoga.csymspiclocation as ymsimagelocation,
        yoga.csymsrating as ymsrating,
        concat(yoga.csymscurrency,' ',yoga.csymsprice,' /',yoga.csymspriceunits) as ymsprice,
        spec.csymspecialized as ymstopspecilized,
        spec.csymsideal as ymsidealfor,
        spec.csymspaymettype as ymspaymenttype 
        from `cosmic`.`csyoga` yoga left join `cosmic`.`csymasterspecs` spec 
        on yoga.csymsid=spec.csymsid where yoga.csymsid=yogamasterid;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETYOGAMASTERS`()
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where 
table_name='csyoga' and table_schema='cosmic';

if tbCount>0 then

select csymsid as yogamasterid,
		csymsname as ymsname,
        csymstype as ymstype,
        csymsaddress as ymsaddress,
        csymslocation as ymslocation,
        csymscity as ymscity,
        csymsstate as ymsstate,
        csymswebsite as ymswebaddress,
        csymsshortdesp as ymsshortdescption,
        csymsprimarynumber as ymsprimarynumber,
        csymssecondarynumber as ymssecondarynumber,
        csymspiclocation as ymsprofilepic,
        csymsrating as ymsratingcount,
        csymscategory as ymscategory,
        csymscurrency as currencytype, 
        csymspriceunits as ymspriceunits, 
        csymsprice as price from `cosmic`.`csyoga`;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETYOGATYPE`()
BEGIN
declare tbCount int default 0;
select count(*) into tbCount from information_schema.tables where table_name='csyoga' and table_schema='cosmic';
 if tbCount > 0 then
 SELECT csymstype as yogatype FROM cosmic.csyoga group by csymstype;
 end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SAVEASTRODETAILS`(in iastrotype varchar(200),
										in ipriceunits varchar(50),
										in iprice int,
                                        in icurrency varchar(45),
                                        in ipaymenttype varchar(50),
                                        in icreateduser varchar(45),
                                        in imodifieduser varchar(45),
                                        in icreateddate datetime,
                                        in imodifieddate datetime,
                                        in iastrosystemid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_schema='cosmic' and table_name='csastrodetails';

if tbCount>0 then

insert into cosmic.csastrodetails (astrotype,priceunits,price,currency,paymenttype,createduser,modifieduser,createddate,modifieddate,astrosystemid) 
						values (iastrotype,ipriceunits,iprice,icurrency,ipaymenttype,icreateduser,imodifieduser,icreateddate,imodifieddate,iastrosystemid);

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SAVEASTROINTERNALINFO`(in iastroid int,
											in icommunication mediumtext,
                                            in irating int,
                                            in ijudgment mediumtext,
                                            in ivideoaccept varchar(20),
                                            in iestyear varchar(4),
                                            in iambiencerating int,
                                            in icreateduser varchar(50),
                                            in imodifieduser varchar(50),
                                            in icreateddate datetime,
                                            in imodifieddate datetime)
BEGIN

declare tbCount int default 0;
select count(*) into tbCount from information_schema.tables where table_name='csastrologerinternal' and table_schema='cosmic';

if tbCount > 0 then

insert into cosmic.csastrologerinternal (astrosysytemid,communication,rating,judgment,videoaccept,estyear,ambiencerating,
										createduser,modifieduser,createddate,modifieddate) values (iastroid,icommunication,
                                        irating,ijudgment,ivideoaccept,iestyear,iambiencerating,icreateduser,imodifieduser,
                                        icreateddate,imodifieddate);

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SAVEASTROLOGERSESSIONS`(in iastroid int,in iday varchar(50),istarttime varchar(50),
											in iendtime varchar(50),in icreateduser varchar(50),in imodifieduser varchar(50),
											in icreateddate datetime,in imodifieddate datetime)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_schema='cosmic' and table_name='csastrosessions';

if tbCount > 0 then

insert into cosmic.csastrosessions (day,starttime,endtime,createduser,modifieduser,createddate,modifieddate,astrosystemid) 
									values (iday,istarttime,iendtime,icreateduser,imodifieduser,icreateddate,imodifieddate,iastroid);
                                    
select * from cosmic.csastrosessions;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-15  2:45:41
