/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : 48

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 24/04/2019 17:32:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` int NOT NULL,
  `cname` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tid` int NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_course_teacher`(`tid`) USING BTREE,
  CONSTRAINT `fk_course_teacher` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '语文', 1);
INSERT INTO `course` VALUES (2, '数学', 1);
INSERT INTO `course` VALUES (3, '英语', 3);
INSERT INTO `course` VALUES (4, '物理', 4);
INSERT INTO `course` VALUES (5, '化学', 5);
INSERT INTO `course` VALUES (6, 'mysql', NULL);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sid` int NOT NULL,
  `cid` int NOT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`sid`, `cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (1, 1, 90);
INSERT INTO `sc` VALUES (1, 2, 83);
INSERT INTO `sc` VALUES (1, 3, 58);
INSERT INTO `sc` VALUES (1, 4, 52);
INSERT INTO `sc` VALUES (2, 1, 59);
INSERT INTO `sc` VALUES (2, 2, 100);
INSERT INTO `sc` VALUES (2, 3, 76);
INSERT INTO `sc` VALUES (2, 4, 90);
INSERT INTO `sc` VALUES (3, 2, 78);
INSERT INTO `sc` VALUES (3, 4, 79);
INSERT INTO `sc` VALUES (4, 2, 76);
INSERT INTO `sc` VALUES (4, 3, 70);
INSERT INTO `sc` VALUES (4, 4, 98);
INSERT INTO `sc` VALUES (5, 2, 80);
INSERT INTO `sc` VALUES (5, 3, 78);
INSERT INTO `sc` VALUES (5, 4, 54);
INSERT INTO `sc` VALUES (6, 1, 68);
INSERT INTO `sc` VALUES (6, 2, 89);
INSERT INTO `sc` VALUES (6, 4, 73);
INSERT INTO `sc` VALUES (7, 1, 80);
INSERT INTO `sc` VALUES (8, 1, 90);
INSERT INTO `sc` VALUES (8, 2, 90);
INSERT INTO `sc` VALUES (8, 6, 90);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sage` datetime NULL DEFAULT NULL,
  `ssex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_student_sc`(`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '刘一', '1981-05-07 08:47:35', '男');
INSERT INTO `student` VALUES (2, '钱二', '2010-04-01 08:48:04', '女');
INSERT INTO `student` VALUES (3, '张三', '2011-11-07 08:48:14', '男');
INSERT INTO `student` VALUES (4, '李四', '2018-05-07 08:48:24', '女');
INSERT INTO `student` VALUES (5, '王五', '1990-05-07 08:48:28', '男');
INSERT INTO `student` VALUES (6, '赵小六', '2001-04-01 08:48:40', '女');
INSERT INTO `student` VALUES (7, '孙7', '2018-05-02 08:48:55', '男');
INSERT INTO `student` VALUES (8, '在8', NULL, NULL);
INSERT INTO `student` VALUES (9, '周九', NULL, NULL);
INSERT INTO `student` VALUES (10, '周九', NULL, NULL);
INSERT INTO `student` VALUES (11, '在8', NULL, NULL);
INSERT INTO `student` VALUES (12, 'f4dbae195c7e1e7a05474f2d7ae9801d', NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tid` int NOT NULL,
  `tname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '叶平');
INSERT INTO `teacher` VALUES (2, '贺高');
INSERT INTO `teacher` VALUES (3, '杨艳');
INSERT INTO `teacher` VALUES (4, '周磊');
INSERT INTO `teacher` VALUES (5, '李丽');
INSERT INTO `teacher` VALUES (6, '李四');

-- ----------------------------
-- Table structure for testlog
-- ----------------------------
DROP TABLE IF EXISTS `testlog`;
CREATE TABLE `testlog`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `psw` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testlog
-- ----------------------------
INSERT INTO `testlog` VALUES (1, 'lisi', '123', '2018-03-03 09:37:11');
INSERT INTO `testlog` VALUES (2, 'zhangsan', '123', '2018-03-01 09:37:14');
INSERT INTO `testlog` VALUES (3, '赵五', '123', '2018-03-02 09:37:19');
INSERT INTO `testlog` VALUES (4, '王二', '123', NULL);

-- ----------------------------
-- Procedure structure for 1
-- ----------------------------
DROP PROCEDURE IF EXISTS `1`;
delimiter ;;
CREATE PROCEDURE `1`(IN `in_param` int)
BEGIN
	#Routine body goes here...
	SELECT in_param;
	SET in_param=1;
	SELECT in_param;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 123
-- ----------------------------
DROP PROCEDURE IF EXISTS `123`;
delimiter ;;
CREATE PROCEDURE `123`()
BEGIN
	#Routine body goes here...
DECLARE no_more INT DEFAULT 0;
	DECLARE id1 INT DEFAULT 0;
	DECLARE name1 VARCHAR(100) DEFAULT NULL;
	DECLARE cur_pro CURSOR FOR SELECT sid,sname FROM student;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more=1;
CREATE TABLE test(`nid` INT NOT NULL ,`nname` VARCHAR(10) NOT NULL,PRIMARY KEY (`nid`))ENGINE=INNODB;
OPEN cur_pro;
cor_loop:LOOP
FETCH cur_pro INTO id1,name1;

IF no_more THEN
SELECT * FROM test;
END IF;
INSERT INTO test VALUES(id1,name1);
END LOOP cor_loop;
CLOSE cur_pro;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 2concat
-- ----------------------------
DROP PROCEDURE IF EXISTS `2concat`;
delimiter ;;
CREATE PROCEDURE `2concat`()
BEGIN
	#Routine body goes here...
	SELECT CONCAT(@str,'存储过程');
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 3_p1
-- ----------------------------
DROP PROCEDURE IF EXISTS `3_p1`;
delimiter ;;
CREATE PROCEDURE `3_p1`()
BEGIN
	#Routine body goes here...
set @first_pro='存储过程';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 4_p2
-- ----------------------------
DROP PROCEDURE IF EXISTS `4_p2`;
delimiter ;;
CREATE PROCEDURE `4_p2`()
BEGIN
	#Routine body goes here...
SELECT CONCAT('this is ',@first_pro);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 5_if_then
-- ----------------------------
DROP PROCEDURE IF EXISTS `5_if_then`;
delimiter ;;
CREATE PROCEDURE `5_if_then`(in param int)
BEGIN
	#Routine body goes here...
DECLARE vint INT ;
SET vint= param+1;
IF vint=0 THEN
INSERT INTO student VALUES('smith',19,'man');
end IF;
IF param = 0 THEN
UPDATE student SET sage=sage+1 WHERE sid=7;
ELSE
UPDATE student SET sage= sage+2 WHERE sid=7;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 6_while_do
-- ----------------------------
DROP PROCEDURE IF EXISTS `6_while_do`;
delimiter ;;
CREATE PROCEDURE `6_while_do`()
BEGIN
	#Routine body goes here...
DECLARE var INT;
SET var = 0;   -- 变量要赋初始值，不赋值的话变量为null，null与任何运算都为null。
WHILE var <3 DO
UPDATE student SET sage=var WHERE sid=7;
SET var=var+1;
END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 7_repeat
-- ----------------------------
DROP PROCEDURE IF EXISTS `7_repeat`;
delimiter ;;
CREATE PROCEDURE `7_repeat`()
BEGIN
	#Routine body goes here...
	DECLARE var INT;
	SET var = 0;
	REPEAT
		UPDATE student SET sage = var WHERE sid= 7;
		SET var=var-1;
	UNTIL var<=0
	END REPEAT;	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 8_loop
-- ----------------------------
DROP PROCEDURE IF EXISTS `8_loop`;
delimiter ;;
CREATE PROCEDURE `8_loop`()
BEGIN
	#Routine body goes here...
DECLARE var INT;
	SET var = 0;
	loop_demo:LOOP
	UPDATE student SET sage = var WHERE sid = 7;
	SET var = var+1;
	IF var >=2 THEN
	LEAVE loop_demo;
	END IF;
	END LOOP;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 9_cursor
-- ----------------------------
DROP PROCEDURE IF EXISTS `9_cursor`;
delimiter ;;
CREATE PROCEDURE `9_cursor`()
BEGIN
	#Routine body goes here...
DECLARE no_more INT DEFAULT 0;
	DECLARE p_name VARCHAR(100) DEFAULT NULL;
	DECLARE cur_name CURSOR FOR SELECT sname FROM student;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more=1;
	OPEN cur_name;
	REPEAT
	FETCH cur_name INTO p_name;
	IF NOT no_more THEN
	SELECT p_name;
	END IF;
	UNTIL no_more END REPEAT;
	CLOSE cur_name;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for abc
-- ----------------------------
DROP PROCEDURE IF EXISTS `abc`;
delimiter ;;
CREATE PROCEDURE `abc`(OUT `out_str` varchar(10))
BEGIN
	#Routine body goes here...
	set out_str=(select student.sname FROM student where sid=1);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for count_score
-- ----------------------------
DROP PROCEDURE IF EXISTS `count_score`;
delimiter ;;
CREATE PROCEDURE `count_score`(IN `id` int,OUT  `out_score` int)
BEGIN
	#Routine body goes here..
	SELECT SUM(score) into out_score FROM
	sc WHERE sid=id GROUP BY sid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for findall
-- ----------------------------
DROP PROCEDURE IF EXISTS `findall`;
delimiter ;;
CREATE PROCEDURE `findall`()
BEGIN
	#Routine body goes here...
	select * from student;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for in_param
-- ----------------------------
DROP PROCEDURE IF EXISTS `in_param`;
delimiter ;;
CREATE PROCEDURE `in_param`(IN `v_in` varchar(20))
BEGIN
	#Routine body goes here...
	SELECT v_in;
	SET v_in = '2';
	SELECT v_in;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for in_str
-- ----------------------------
DROP PROCEDURE IF EXISTS `in_str`;
delimiter ;;
CREATE PROCEDURE `in_str`(IN `v_str` int)
BEGIN
	#Routine body goes here...
	SELECT v_str;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for in_str_param
-- ----------------------------
DROP PROCEDURE IF EXISTS `in_str_param`;
delimiter ;;
CREATE PROCEDURE `in_str_param`(IN `in_str` varchar(20))
BEGIN
	#Routine body goes here...
	SELECT in_str;
	SET in_str='我是存储过程';
	SELECT in_str;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for out_param
-- ----------------------------
DROP PROCEDURE IF EXISTS `out_param`;
delimiter ;;
CREATE PROCEDURE `out_param`(out `v_int` int)
BEGIN
	#Routine body goes here...
	SELECT v_int;
	SET v_int=3;
	SELECT v_int;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procedure_varchar
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_varchar`;
delimiter ;;
CREATE PROCEDURE `procedure_varchar`()
BEGIN
	#Routine body goes here...
	DECLARE v_string VARCHAR(10);
	SET v_string = '存储过程';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for stu_count
-- ----------------------------
DROP PROCEDURE IF EXISTS `stu_count`;
delimiter ;;
CREATE PROCEDURE `stu_count`(out `param` int)
BEGIN
	#Routine body goes here...
	SELECT COUNT(1) INTO param FROM student;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for test111
-- ----------------------------
DROP PROCEDURE IF EXISTS `test111`;
delimiter ;;
CREATE PROCEDURE `test111`()
BEGIN
	#Routine body goes here...
	DECLARE var INT;
	SET var = 0;
	loop_test:LOOP
	UPDATE student SET sage = var WHERE sid = 7;
	SET var=var+1;
	IF var>=3 THEN
	LEAVE loop_test;
	END if;
	END LOOP;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for testlogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `testlogin`;
delimiter ;;
CREATE PROCEDURE `testlogin`(IN `uerName` varchar(50),IN `passWord` varchar(50),OUT `status` int,OUT `msg` varchar(100))
BEGIN
	#Routine body goes here...
	DECLARE v_sta int;
	DECLARE v_stat int;
	SELECT count(1) INTO v_sta FROM testlog WHERE username=uerName;
	IF 
		v_sta=0
	THEN
	SET `status`=0;
	SET `msg`='用户不存在';
	ELSE
		SELECT COUNT(1) INTO v_stat FROM testlog WHERE username=uerName AND psw=`passWord`;
		IF v_stat=0 THEN
			SET	`status`=21;
			SET `msg`='密码不正确';
		ELSE
			set `status`=1;
			SET `msg`=CONCAT(uerName,',欢迎登录');
		END IF;
END IF;
	SELECT * FROM student;
	SELECT COUNT(1) AS num FROM student;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for testlogin2
-- ----------------------------
DROP PROCEDURE IF EXISTS `testlogin2`;
delimiter ;;
CREATE PROCEDURE `testlogin2`(IN `userN` varchar(100),IN `passwd` varchar(100),OUT `status` int,OUT `msg` varchar(100))
BEGIN
	#Routine body goes here...
DECLARE pswd VARCHAR(50);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION,SQLWARNING,NOT FOUND SET `status` =1;
SET `status` = 0;
START TRANSACTION;
Label:-- 执行过程中出现错误则跳出此Label
BEGIN
	IF	TRIM(userN)='' OR userN is NULL  THEN
		SET `status`=11;
		SET `msg`='用户名不能为空';
		LEAVE Label;
	end IF;

	IF	TRIM(passwd)='' OR passwd is NULL  THEN
		SET `status`=11;
		SET `msg`='密码不能为空';
		LEAVE Label;
	end IF;

	SELECT psw INTO pswd FROM testlog WHERE username=userN;
	IF ISNULL(pswd) THEN
		SET `status`=11;
		SET `msg`='用户不存在';
		LEAVE Label;
	ELSEIF `pswd`!=passwd THEN
		SET `status`=11;
		SET `msg`='密码不正确';
		LEAVE Label;
	ELSE
		SET `msg`='欢迎登录';
		LEAVE Label;
	END IF;
END Label;

IF `status`=0 THEN
	if ISNULL(`msg`) THEN
		SET `msg`='ok';
	end if;
	COMMIT;	
ELSEIF `status`=1 THEN
	ROLLBACK;
	set `msg`='错误';
ELSE 
  ROLLBACK;
END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
