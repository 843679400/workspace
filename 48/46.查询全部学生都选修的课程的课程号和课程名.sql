-- 46.查询全部学生都选修的课程的课程号和课程名 
select course.cid,course.cname
FROM course,sc
WHERE course.cid = sc.cid
GROUP BY sc.cid -- 把sc表根据课程ID进行分组
HAVING COUNT(1)= (SELECT COUNT(*) FROM student) -- sc表分组后课程人数=学生总数
-- --		
select sc.cid,sc.score,sc.sid,count(1) num
from sc,student s
GROUP BY sc.cid,sc.score,sc.sid
-- ---
SELECT temp.cid,count(1),num
from (
	select sc.cid,sc.score,sc.sid,count(1) num
	from sc,student s
	GROUP BY sc.cid,sc.score,sc.sid
)temp
GROUP BY temp.cid

