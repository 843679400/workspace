-- 27.查询只选修了一门课程的全部学生的学号和姓名
SELECT sc.`sid`,student.`sname`
FROM sc,student
WHERE sc.`sid`=student.`sid`
GROUP BY sc.`sid`
HAVING COUNT(1)=1 ;
-- -----------------
SELECT student.sid,student.sname
FROM student
WHERE  sid in(
	SELECT sc.sid
	FROM sc
	GROUP BY sc.sid  -- 按学生分组，分组后统计只有一行的。
	HAVING COUNT(1)=1
);
-- 方法2
select SC.SID,Student.Sname,count(CID) AS 选课数 
from SC ,Student 
where SC.SID=Student.SID 
group by SC.SID ,Student.Sname 
having count(CID)=1;
-- 方法3
;