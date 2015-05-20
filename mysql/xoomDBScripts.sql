CREATE TABLE `countrylist` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(200) NOT NULL,
  PRIMARY KEY (`countryid`),
  UNIQUE KEY `countryid_UNIQUE` (`countryid`),
  UNIQUE KEY `countryname_UNIQUE` (`countryname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='List of all countries across the globe';


# Course List table
CREATE TABLE `xtcourses` (
  `xtcourseid` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursename` varchar(100) NOT NULL,
  `xtcourseshortdescp` longtext,
  `xtcourseduration` varchar(100) DEFAULT NULL,
  `xtenrolled` int(11) DEFAULT NULL,
  `xtcourseimg` longtext,
  `xtcourserating` int(11) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `xtcoursetype` varchar(100) NOT NULL,
  PRIMARY KEY (`xtcourseid`),
  UNIQUE KEY `xtcourseid_UNIQUE` (`xtcourseid`),
  UNIQUE KEY `xtcoursename_UNIQUE` (`xtcoursename`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#Signed up used table
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
  PRIMARY KEY (`xtuserid`),
  UNIQUE KEY `xtusername_UNIQUE` (`xtusername`),
  UNIQUE KEY `xtuseremail_UNIQUE` (`xtuseremail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store sign up users';

#Stored Procedures
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CHECKEMAIL`(IN emailaddress varchar(100))
BEGIN
Select Count(xtuseremail) as users from `xoomtrainings`.`xtusers` where xtuseremail=emailaddress;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOUNTRY`()
BEGIN
Select * from xoomtrainings.countrylist;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOURSES`()
BEGIN
Select * from xoomtrainings.xtcourses;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN`(IN username varchar(100),IN userpassword longtext)
BEGIN
select CONCAT(xtuserfirstname," ",xtuserlastname) as xtfullname,
		xtuserindian,
        xtusername,
        xtusercountry,
        xtuseremail from xoomtrainings.xtusers where (xtusername=username or xtuseremail=username) and 
        xtuserpassword=userpassword;
END$$
DELIMITER ;
DELIMITER $$
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
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_XTUSERS`(IN firstname varchar(100),
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


CREATE TABLE `coursedetails` (
  `xtcousedetailid` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`xtcousedetailid`),
  UNIQUE KEY `xtcoursename_UNIQUE` (`xtcoursename`),
  UNIQUE KEY `xtcourseid_UNIQUE` (`xtcourseid`),
  CONSTRAINT `xtcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETCOURSEDETAIL`(IN courseid int)
BEGIN
select * from `xoomtrainings`.`coursedetails` where xtcourseid=courseid;
END$$
DELIMITER ;



