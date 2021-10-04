CREATE TABLE `user_entity` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_user_active` tinyint(1) NOT NULL,
  `user_first_name` varchar(25) DEFAULT NULL,
  `user_last_name` varchar(25) DEFAULT NULL,
  `user_password` varchar(250) DEFAULT NULL,
  `user_email` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dept_entity` (
  `Dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(25) DEFAULT NULL,
  `department_name` varchar(25) DEFAULT NULL,
  `parent_department_code` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_By` int DEFAULT NULL,
  `is_dept_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`Dept_id`),
  UNIQUE KEY `department_name_UNIQUE` (`department_name`),
  UNIQUE KEY `dept_code_UNIQUE` (`dept_code`),
  KEY `created_By` (`created_By`),
  CONSTRAINT `dept_entity_ibfk_1` FOREIGN KEY (`created_By`) REFERENCES `user_entity` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_dept` (
  `user_dept_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `Dept_id` int NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_By` int DEFAULT NULL,
  `user_role` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`user_dept_id`),
  KEY `user_id` (`user_id`),
  KEY `Dept_id` (`Dept_id`),
  CONSTRAINT `user_dept_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_entity` (`user_id`),
  CONSTRAINT `user_dept_ibfk_2` FOREIGN KEY (`Dept_id`) REFERENCES `dept_entity` (`Dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `requests_entity` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `created_by` int DEFAULT NULL,
  `assigned_date` datetime(6) DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `request_number` varchar(25) DEFAULT NULL,
  `request_dept` varchar(6) DEFAULT NULL,
  `request_description` varchar(180) DEFAULT NULL,
  `initial_comments` blob,
  `request_title` varchar(20) DEFAULT NULL,
  `severity` int NOT NULL,
  `piority` int NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comments_entity` (
  `comments_id` int NOT NULL AUTO_INCREMENT,
  `comments_desc` varchar(240) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `request_number` int DEFAULT NULL,
  PRIMARY KEY (`comments_id`),
  KEY `FK9wqxwbusadv5oyja6g23vj52p` (`request_number`),
  CONSTRAINT `FK9wqxwbusadv5oyja6g23vj52p` FOREIGN KEY (`request_number`) REFERENCES `requests_entity` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `status_entity` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `created_by` int DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `status_code` char(1) DEFAULT NULL,
  `status_desc` varchar(25) DEFAULT NULL,
  `request_number` int DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `FKmx649kw1itpsuofi3a5b3v3uc` (`request_number`),
  CONSTRAINT `FKmx649kw1itpsuofi3a5b3v3uc` FOREIGN KEY (`request_number`) REFERENCES `requests_entity` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `audit_log` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `Change_type` varchar(45) NOT NULL,
  `Change_type_id` int NOT NULL,
  `Audit_desc` blob NOT NULL,
  `Created_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int NOT NULL,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*=============================================================*/
CREATE DEFINER=`root`@`localhost` TRIGGER `status_entity_BEFORE_INSERT` BEFORE INSERT ON `status_entity` FOR EACH ROW BEGIN
    INSERT INTO requesttrackingsystemdb.audit_log ( Change_type, Change_type_id, Audit_desc, Created_By)
	VALUES ( 'Status Modify', new.request_number,  new.status_desc , new.created_by); 
END


CREATE DEFINER=`root`@`localhost` TRIGGER `requests_entity_BEFORE_UPDATE` BEFORE UPDATE ON `requests_entity` FOR EACH ROW BEGIN
DECLARE temp varchar(255);
set temp = 'Request Update';
	IF old.request_title != new.request_title OR old.request_description != new.request_description THEN SET temp = 'Request Modify';
	ELSEIF old.request_number != new.request_number THEN SET temp = 'Request No Update';
	ELSEIF old.request_dept != new.request_dept THEN SET temp = 'Dept Modify';
    ELSEIF old.assigned_to != new.assigned_to THEN SET temp = 'User Modify';
    END IF;
    INSERT INTO requesttrackingsystemdb.audit_log ( Change_type, Change_type_id, Audit_desc, Created_By)
	VALUES ( temp, old.request_id,  old.request_title, old.created_by );
END

CREATE DEFINER=`root`@`localhost` TRIGGER `comments_entity_BEFORE_INSERT` BEFORE INSERT ON `comments_entity` FOR EACH ROW BEGIN
    INSERT INTO requesttrackingsystemdb.audit_log ( Change_type, Change_type_id, Audit_desc, Created_By)
	VALUES ( 'Comment Modify', new.request_number,  new.comments_desc , new.created_by);    
END























