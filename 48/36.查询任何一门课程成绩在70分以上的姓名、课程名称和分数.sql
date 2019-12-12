 -- 36.查询任何一门课程成绩在70分以上的姓名、课程名称和分数
-- 即为每门课程成绩都在70分以上的人
SELECT sc.sid,s.sname,c.cname,sc.score
FROM sc,student s,course c
WHERE sc.sid = s.sid AND sc.cid = c.cid
GROUP BY sc.sid,sc.cid
HAVING COUNT(IF(sc.score<70,1,null))=0;

-- 方法2
SELECT sc.sid,sc.cid,sc.score
FROM sc
where sc.sid not in (select s1.sid from sc s1 where s1.score<70)
-- ---------------每门课程中，只要成绩在70以上的就查询
SELECT student.sid,student.sname,course.cname,sc.score
FROM student,course,sc
WHERE student.sid=sc.sid and course.cid= sc.cid
and sc.score>70;

