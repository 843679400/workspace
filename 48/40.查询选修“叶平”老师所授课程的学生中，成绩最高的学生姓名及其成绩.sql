-- 40.查询选修“叶平”老师所授课程的学生中，成绩最高的学生姓名及其成绩
SELECT sc.score,sc.cid, student.sname
FROM sc,course,teacher,student
WHERE teacher.tid = course.tid and student.sid=sc.sid
 and course.cid=sc.cid and teacher.tname='叶平'  -- 选修叶平老师课程的同学
	and sc.score=(                             -- 并且分数等于最高分
		SELECT MAX(score)                 -- 父查询的课程ID 与子查询的课程ID相同时的最高分，
		FROM sc s
		WHERE s.cid=sc.cid
);
#方法二
select s.sname,s1.score,s1.cid 
from sc s1,student s
where s1.score=
(select MAX(sc.score)
from sc,teacher t,course c
where s1.cid=sc.cid and sc.cid=c.cid and c.tid=t.tid and t.tname='叶平'
group by sc.cid)
and s1.sid = s.sid
