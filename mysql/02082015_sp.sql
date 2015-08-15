-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: xoomtrainings
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'xoomtrainings'
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CHANGEPASSWORD`(in userid int,in oldpassword mediumtext,in newpassword mediumtext)
BEGIN

declare tbCount int default 0;
declare tbRecordCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='xtusers' and 
table_schema='xoomtrainings';

if tbCount>0 then

select count(*) into tbRecordCount from xoomtrainings.xtusers where xtuserid=userid 
and xtuserpassword=oldpassword and xtactivestate=1;

if tbRecordCount>0 then

update xoomtrainings.xtusers set xtuserpassword=newpassword 
where xtuserid=userid and xtuserpassword=oldpassword and xtactivestate=1;

select tbRecordCount;

else

select tbRecordCount;

end if;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CHECKEMAIL`(IN emailaddress varchar(100))
BEGIN
Select Count(xtuseremail) as users from `xoomtrainings`.`xtusers` where xtuseremail=emailaddress;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CHECKUSER`(IN emailaddress LONGTEXT)
BEGIN
select count(xtuseremail) as email from `xoomtrainings`.`xtusers` where xtuseremail=emailaddress and xtactivestate=1;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCARTCOUNT`(in userid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from 
information_schema.tables where table_name='savedcart' 
and table_schema='xoomtrainings';

if tbCount>0 then
select count(*) as cartItemscount, transactionid from `xoomtrainings`.`savedcart` 
where xtuserid=userid;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCARTDETAILS`(IN userid int)
BEGIN

declare tbCount int default 0;

Select count(*) into tbCount from information_schema.tables 
where table_name='savedcart' and table_schema='xoomtrainings';

if tbCount>0 then

select cart.idsavedcart as savedcartid,
		cart.transactionid as cartid,
        cart.xtcourseid as courseid,
        cart.xtuserid as userid,
        course.xtcoursename as coursename,
        course.xtcoursestartdate as coursestartdate,
        course.xtcoursedurationtype as durationtype,
        course.xtcourseduration as courseduration,
        course.xtcoursedays as coursedays,
        course.xtcoursestarttime as starttime,
        course.xtcourseendtime as endtime,
        maincourse.xtcoursename as maincoursename,
        maincourse.xtinrprice as indianprice,
        maincourse.xtusprice as usprice,
        maincourse.xtcourseimg as courseimg
         from `xoomtrainings`.`savedcart` cart 
         inner join `xoomtrainings`.`coursedetails` course 
         inner join `xoomtrainings`.`xtcourses` maincourse
         on cart.xtcourseid = course.xtcourseid and cart.xtcourseid=maincourse.xtcourseid 
         where cart.xtuserid=userid and cart.enrollstatus='saved';

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOUNTRY`()
BEGIN
Select * from xoomtrainings.countrylist;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOURSE`(IN courseid int)
BEGIN

Declare tbCount INT;

SELECT count(*) into tbCount 
FROM information_schema.tables
WHERE table_schema = 'xoomtrainings' AND table_name = 'xtcourses' LIMIT 1;

BEGIN
if tbCount>0 then
Select course.xtcourseid as courseid,
		course.xtcoursename as coursename,
        course.xtcourseshortdescp as shortdescription,
        course.xtcourseduration as courseduration,
        course.xtinrprice as indianprice,
        course.xtusprice as usprice,
        course.xtcourseimg as courseimglocation,
        course.xtcourserating as courserating,
        course.xtcoursetype as coursetype,
        faq.idxtcoursefaq as faqid,
        faq.xtcoursequestion as question,
        faq.xtcourseasnwer as answer,
        spec.idxtcoursespec as specid,
        spec.xtaboutcourse as aboutcourse,
        spec.xtcurriculum as curriculum,
        review.xtlearners as learners,
        review.xtrating as rating 
        from xoomtrainings.xtcourses course inner join 
		xoomtrainings.xtcoursefaq faq inner join 
        xoomtrainings.xtcoursespec spec inner join 
        xoomtrainings.xtcoursereviews review 
        on (course.xtcourseid=faq.xtcourseid and course.xtcourseid=spec.xtcourseid and course.xtcourseid=review.xtcourseid)
		where course.xtcourseid=courseid;
end if;
end;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOURSEDETAIL`(IN courseid int)
BEGIN

select course.xtcoursedetailid as coursedetailid,
		course.xtcoursename as coursename,
        course.xtcoursedescription as coursedesciption,
        course.xtcoursestartdate as coursestartdate,
        course.xtcoursedurationtype as coursedurationtype,
        course.xtcourseduration as courseduration,
        course.xtcoursedays as coursedays,
        course.xtcoursestarttime as coursestarttime,
        course.xtcourseendtime as courseendtime,
        enroll.enrollstatus,
        enroll.transactionid 
        from `xoomtrainings`.`coursedetails` course 
        left outer join `xoomtrainings`.`savedcart` enroll on 
        course.xtcourseid=enroll.xtcourseid where course.xtcourseid=courseid;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOURSES`()
BEGIN
SELECT a.*,b.xtlearners as courselearners,b.xtrating as userratings FROM xoomtrainings.xtcourses as a inner join xoomtrainings.xtcoursereviews as b on a.xtcourseid=b.xtcourseid;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETUSERCOURSES`(IN userid int)
BEGIN

declare tbCount int default 0;

Select count(*) into tbCount from information_schema.tables 
where table_name='savedcart' and table_schema='xoomtrainings';

if tbCount>0 then

select cart.idsavedcart as savedcartid,
		cart.transactionid as cartid,
        cart.xtcourseid as courseid,
        cart.xtuserid as userid,
        course.xtcoursename as coursename,
        course.xtcoursestartdate as coursestartdate,
        course.xtcoursedurationtype as durationtype,
        course.xtcourseduration as courseduration,
        course.xtcoursedays as coursedays,
        course.xtcoursestarttime as starttime,
        course.xtcourseendtime as endtime,
        maincourse.xtcoursename as maincoursename,
        maincourse.xtinrprice as indianprice,
        maincourse.xtusprice as usprice,
        maincourse.xtcourseimg as courseimg
         from `xoomtrainings`.`savedcart` cart 
         inner join `xoomtrainings`.`coursedetails` course 
         inner join `xoomtrainings`.`xtcourses` maincourse
         on cart.xtcourseid = course.xtcourseid and cart.xtcourseid=maincourse.xtcourseid 
         where cart.xtuserid=userid;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETUSERDETAILS`(IN userid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from 
information_schema.tables where table_name='savedcart' 
and table_schema='xoomtrainings';

if tbCount>0 then

select xtuserid as userid,
		xtuserfirstname as firstname,
        xtuserlastname as lastname,
        xtusernumber as mobilenumber,
        xtusercountry as country,
        xtuseremail as email,
        xtusername as username from `xoomtrainings`.`xtusers` where xtuserid=userid and xtactivestate=1;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN`(IN username varchar(100),IN userpassword longtext)
BEGIN
select CONCAT(xtuserfirstname," ",xtuserlastname) as xtfullname,
		xtuserindian,
        xtusername,
        xtusercountry,
        xtuseremail,
        xtuserid from xoomtrainings.xtusers where (xtusername=username or xtuseremail=username) and 
        xtuserpassword=userpassword and xtactivestate=1;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REMOVECART`(IN cartid int,IN userid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where
 table_name='savedcart' and table_schema='xoomtrainings';
 
 if tbCount>0 then
 delete from `xoomtrainings`.`savedcart` where xtuserid=userid and idsavedcart=cartid;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SAVECART`(IN transactionid text,IN courseid int,in userid int,
IN username varchar(50),IN enrollstatus nvarchar(10))
BEGIN

declare tbCount int default 0;
declare cartCount int default 0;

Select count(*) into tbCount from information_schema.TABLES WHERE TABLE_NAME='savedcart' 
AND TABLE_SCHEMA='xoomtrainings';

if tbCount>0 then


INSERT INTO `xoomtrainings`.`savedcart` 
(`transactionid`,`xtcourseid`,`xtuserid`,`createduser`,`modifieduser`,`enrollstatus`) 
VALUES 
(transactionid,courseid,userid,username,username,enrollstatus);


select count(*) as cartItemsCount from `xoomtrainings`.`savedcart` where xtuserid=userid;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEPROFILE`(In userid int,in firstname varchar(200),in lastname varchar(200),
in email varchar(200),in userindian int,in country varchar(200),in mobile varchar(20))
BEGIN
declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where table_name='xtusers' and 
table_schema='xoomtrainings';

if tbCount>0 then

UPDATE `xoomtrainings`.`xtusers`
SET
`xtuserfirstname` = firstname,
`xtuserlastname` = lastname,
`xtusernumber` = mobile,
`xtuserindian` = userindian,
`xtusercountry` = country,
`xtusername` = email,
`xtuseremail` = email
WHERE `xtuserid` = userid and xtactivestate=1;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_XTCOURSES`(IN courseid int,IN coursename varchar(100),IN shortdesc longtext,
IN duration varchar(100),IN enrolled int,IN courselogo longtext,IN courserating int,IN flag char(1))
BEGIN
if flag='i' then
Insert into xoomtrainings.xtcourses (xtcoursename,xtcourseshortdescp,xtcourseduration,xtenrolled,
xtcourseimg,xtcourserating,createddate,modifieddate) values (coursename,shortdesc,duration,enrolled,
courselogo,courserating,Now(),Now());
elseif flag='u' then
update xoomtrainings.xtcourses set xtcoursename=coursename,
									xtcourseshortdescp=shortdesc,
									xtcourseduration=duration,
                                    xtenrolled=enrolled,
                                    xtcourseimg=courselogo,
                                    courserating=xtcourserating where xtcourseid=courseid;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_XTUSERS`(IN firstname varchar(100),
IN lastname varchar(100),IN phonenumber varchar(20),IN userindian char(1),IN country varchar(100),
IN username varchar(100),IN email varchar(100), IN userpassword longtext,IN flag char(1))
BEGIN
IF flag='i' then
Insert into xoomtrainings.xtusers (xtuserfirstname,xtuserlastname,xtusernumber,xtuserindian,
xtusercountry,xtusername,xtuseremail,xtuserpassword,createddate,modifieddate) values(firstname,
lastname,phonenumber,userindian,country,username,email,userpassword,Now(),Now());
END IF;
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

-- Dump completed on 2015-08-02 17:00:54
