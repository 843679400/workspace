-- 35.查询所有学生的选课情况
-- 即每个学生都选了什么课
SELECT sc.sid,sc.cid,student.sname,course.cname
FROM sc right join student ON sc.sid=student.sid
left join course
on sc.cid=course.cid
ORDER BY sc.sid;
-- 
SELECT sc.sid,sc.cid,student.sname,course.cname
FROM sc,student,course
WHERE sc.sid=student.sid and sc.cid=course.cid
ORDER BY sc.sid;