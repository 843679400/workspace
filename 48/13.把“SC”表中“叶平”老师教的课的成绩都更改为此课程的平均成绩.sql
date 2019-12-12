-- 13.把“SC”表中“叶平”老师教的课的成绩都更改为此课程的平均成绩

 UPDATE SC SET score=(
											SELECT score 
											FROM (SELECT AVG(score) score,sc.cid cid   -- 叶平所教课程的平均分和课程ID 
														FROM sc
														WHERE cid IN (
																					SELECT cid FROM course WHERE tid=1 -- 叶平老师所教的课程
																					) 
														GROUP BY cid   -- 根据课程分组，查出每门课程的平均分
														) avgtable
											WHERE avgtable.cid=sc.cid)   -- 所教课程的ID = 要修改的课程ID  
					WHERE sc.`cid` IN (SELECT cid FROM course WHERE tid=1);  -- 要修改的课程ID 为叶平老师所教的课程
-- 方法2
SET autocommit=0;           
            UPDATE sc
            SET sc.`score`=
                   (
                    SELECT b.avgscore
                    FROM(
                         SELECT AVG(sc2.`score`) avgscore,sc2.`cid`
                         FROM sc sc2,course,teacher
                         WHERE sc2.cid=course.cid AND teacher.`tid`=course.`tid` AND teacher.`tname`='叶平'
                         GROUP BY sc2.`cid`
                        ) b
                     WHERE b.cid=sc.`cid`
                   ) 
                   WHERE sc.cid IN(
                       SELECT course.`cid`
                       FROM teacher,course
                       WHERE teacher.`tid`=course.`tid` AND teacher.`tname`='叶平'
                   ) 
  
 ROLLBACK;