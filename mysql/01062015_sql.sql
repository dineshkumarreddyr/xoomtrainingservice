CREATE TABLE `countrylist` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(200) NOT NULL,
  PRIMARY KEY (`countryid`),
  UNIQUE KEY `countryid_UNIQUE` (`countryid`),
  UNIQUE KEY `countryname_UNIQUE` (`countryname`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='List of all countries across the globe';

CREATE TABLE `xtcourses` (
  `xtcourseid` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursename` varchar(100) NOT NULL,
  `xtcourseshortdescp` longtext,
  `xtcourseduration` varchar(100) DEFAULT NULL,
  `xtinrprice` int(11) NOT NULL,
  `xtcourseimg` longtext,
  `xtcourserating` int(11) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `xtcoursetype` varchar(100) NOT NULL,
  `xtusprice` int(11) NOT NULL,
  PRIMARY KEY (`xtcourseid`),
  UNIQUE KEY `xtcourseid_UNIQUE` (`xtcourseid`),
  UNIQUE KEY `xtcoursename_UNIQUE` (`xtcoursename`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `coursedetails` (
  `xtcoursedetailid` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursename` varchar(200) NOT NULL,
  `xtcoursedescription` longtext,
  `xtcoursestartdate` date NOT NULL,
  `xtcoursedurationtype` varchar(100) NOT NULL,
  `xtcourseduration` int(11) NOT NULL,
  `xtcoursedays` longtext NOT NULL,
  `xtcoursestarttime` time NOT NULL,
  `xtcourseendtime` time NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createduser` varchar(50) DEFAULT NULL,
  `modifieduser` varchar(50) DEFAULT NULL,
  `xtcourseid` int(11) NOT NULL,
  PRIMARY KEY (`xtcoursedetailid`),
  UNIQUE KEY `xtcoursename_UNIQUE` (`xtcoursename`),
  UNIQUE KEY `xtcourseid_UNIQUE` (`xtcourseid`),
  CONSTRAINT `xtcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `savedcart` (
  `idsavedcart` int(11) NOT NULL AUTO_INCREMENT,
  `transactionid` text NOT NULL,
  `xtcourseid` int(11) NOT NULL,
  `xtuserid` int(11) NOT NULL,
  `createddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createduser` varchar(50) NOT NULL DEFAULT 'Admin',
  `modifieduser` varchar(50) NOT NULL DEFAULT 'Admin',
  `enrollstatus` varchar(10) NOT NULL DEFAULT 'saved',
  PRIMARY KEY (`idsavedcart`),
  UNIQUE KEY `idsavedcart_UNIQUE` (`idsavedcart`),
  KEY `savedcartcourseid_idx` (`xtcourseid`),
  KEY `savedcartuserid_idx` (`xtuserid`),
  CONSTRAINT `savedcartcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savedcartuserid` FOREIGN KEY (`xtuserid`) REFERENCES `xtusers` (`xtuserid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `xtcoursefaq` (
  `idxtcoursefaq` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursequestion` text NOT NULL,
  `xtcourseasnwer` longtext NOT NULL,
  `xtcourseid` int(11) NOT NULL,
  `createduser` varchar(50) DEFAULT 'Admin',
  `modifieduser` varchar(50) DEFAULT 'Admin',
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idxtcoursefaq`),
  UNIQUE KEY `idxtcoursefaq_UNIQUE` (`idxtcoursefaq`),
  KEY `xtcourseidfaq` (`xtcourseid`),
  CONSTRAINT `xtcourseidfaq` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Frequently asked questions for particular course';

CREATE TABLE `xtcoursereviews` (
  `xtcoursereviewid` int(11) NOT NULL AUTO_INCREMENT,
  `xtlearners` int(11) NOT NULL DEFAULT '0',
  `xtrating` int(11) NOT NULL DEFAULT '2',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createduser` varchar(50) DEFAULT NULL,
  `modifieduser` varchar(50) DEFAULT NULL,
  `xtcourseid` int(11) NOT NULL,
  PRIMARY KEY (`xtcoursereviewid`),
  KEY `xtratingcourseid` (`xtcourseid`),
  CONSTRAINT `xtratingcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `xtcoursespec` (
  `idxtcoursespec` int(11) NOT NULL AUTO_INCREMENT,
  `xtaboutcourse` longtext NOT NULL,
  `xtcurriculum` longtext NOT NULL,
  `xtcourseid` int(11) NOT NULL,
  `createduser` varchar(50) DEFAULT 'Admin',
  `modifieduser` varchar(50) DEFAULT 'Admin',
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idxtcoursespec`),
  KEY `xtcourseidspec` (`xtcourseid`),
  CONSTRAINT `xtcourseidspec` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `xtusers` (
  `xtuserid` int(11) NOT NULL AUTO_INCREMENT,
  `xtuserfirstname` varchar(60) NOT NULL,
  `xtuserlastname` varchar(60) NOT NULL,
  `xtusernumber` varchar(20) NOT NULL,
  `xtuserindian` char(1) NOT NULL,
  `xtusercountry` varchar(50) NOT NULL,
  `xtusername` varchar(100) DEFAULT NULL,
  `xtuseremail` varchar(100) DEFAULT NULL,
  `xtuserpassword` longtext NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `xtactivestate` int(11) NOT NULL,
  PRIMARY KEY (`xtuserid`),
  UNIQUE KEY `xtusername_UNIQUE` (`xtusername`),
  UNIQUE KEY `xtuseremail_UNIQUE` (`xtuseremail`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Store sign up users';

DELIMITER $$
CREATE  PROCEDURE `SP_CHECKEMAIL`(IN emailaddress varchar(100))
BEGIN
Select Count(xtuseremail) as users from `xoomtrainings`.`xtusers` where xtuseremail=emailaddress;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_CHECKUSER`(IN emailaddress LONGTEXT)
BEGIN
select count(xtuseremail) as email from `xoomtrainings`.`xtusers` where xtuseremail=emailaddress and xtactivestate=1;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_GETCARTCOUNT`(in userid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from 
information_schema.tables where table_name='savedcart' 
and table_schema='xoomtrainings';

if tbCount>0 then
select count(*) as cartItemscount, transactionid from `xoomtrainings`.`savedcart` 
where xtuserid=userid;
end if;

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_GETCOUNTRY`()
BEGIN
Select * from xoomtrainings.countrylist;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_GETCOURSE`(IN courseid int)
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
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_GETCOURSEDETAIL`(IN courseid int)
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
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_GETCOURSES`()
BEGIN
SELECT a.*,b.xtlearners as courselearners,b.xtrating as userratings FROM xoomtrainings.xtcourses as a inner join xoomtrainings.xtcoursereviews as b on a.xtcourseid=b.xtcourseid;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_LOGIN`(IN username varchar(100),IN userpassword longtext)
BEGIN
select CONCAT(xtuserfirstname," ",xtuserlastname) as xtfullname,
		xtuserindian,
        xtusername,
        xtusercountry,
        xtuseremail,
        xtuserid from xoomtrainings.xtusers where (xtusername=username or xtuseremail=username) and 
        xtuserpassword=userpassword and xtactivestate=1;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_SAVECART`(IN transactionid text,IN courseid int,in userid int,
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

END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_XTCOURSES`(IN courseid int,IN coursename varchar(100),IN shortdesc longtext,
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
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `SP_XTUSERS`(IN firstname varchar(100),
IN lastname varchar(100),IN phonenumber varchar(20),IN userindian char(1),IN country varchar(100),
IN username varchar(100),IN email varchar(100), IN userpassword longtext,IN flag char(1))
BEGIN
IF flag='i' then
Insert into xoomtrainings.xtusers (xtuserfirstname,xtuserlastname,xtusernumber,xtuserindian,
xtusercountry,xtusername,xtuseremail,xtuserpassword,createddate,modifieddate) values(firstname,
lastname,phonenumber,userindian,country,username,email,userpassword,Now(),Now());
END IF;
END$$
DELIMITER ;

DELIMITER $$
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
         where cart.xtuserid=userid;

end if;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REMOVECART`(IN cartid int,IN userid int)
BEGIN

declare tbCount int default 0;

select count(*) into tbCount from information_schema.tables where
 table_name='savedcart' and table_schema='xoomtrainings';
 
 if tbCount>0 then
 delete from `xoomtrainings`.`savedcart` where xtuserid=userid and idsavedcart=cartid;
 end if;

END$$
DELIMITER ;



















