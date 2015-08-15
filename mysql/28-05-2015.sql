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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Frequently asked questions for particular course';


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DELIMITER $$
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
END$$
DELIMITER ;

