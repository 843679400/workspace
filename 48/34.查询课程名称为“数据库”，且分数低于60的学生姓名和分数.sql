-- 34.查询课程名称为“数据库”，且分数低于60的学生姓名和分数 
SELECT student.sname,sc.score
FROM student,sc,course
WHERE sc.cid=course.cid and course.cname='英语' and student.sid=sc.sid
and sc.score<60;