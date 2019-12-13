-- 06.查询学过课程001并且也学过编号002课程的学生学号、姓名
-- 方法1
SELECT  s.sid,s.sname
FROM sc s1 INNER JOIN sc s2 
ON s1.sid = s2.sid
AND s1.cid = 001
AND s2.cid = 002 
LEFT JOIN student s 
ON s.sid = s1.sid
-- 方法2
SELECT s.sid,s.sname
FROM sc JOIN student s ON sc.sid = s.sid
GROUP BY sc.sid
HAVING COUNT(IF(sc.cid in (1,2),1,NULL))=2
-- 方法3
select Student.SID,Student.Sname 
from Student,SC 
where Student.SID=SC.SID 
and SC.CID='001'
and exists( 
		Select 1 
		from SC as S2 
		where S2.SID=SC.SID 
		and S2.CID='002'
); 

-- 方法2
SELECT student.sid ,student.sname
FROM student,sc
WHERE student.sid = sc.sid 
and sc.cid = '001' 
and sc.sid in (  -- 如果学过两科，那么学过001课程的同学ID必然存在于学过002课程的学生ID中。
	SELECT sc.sid
	FROM sc
	WHERE sc.cid = '002'
);
-- 方法3
SELECT a.sid,a.sname
 FROM  
   (
    SELECT sc.sid,student.`sname`
    FROM sc,student
    WHERE sc.`cid`='001' AND student.sid=sc.`sid`                                                                                      
   )  a,  
   (
     SELECT sc.`sid`
     FROM sc
     WHERE sc.`cid`='002'
   ) b
 WHERE a.sid=b.sid;