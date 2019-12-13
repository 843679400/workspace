-- 38.查询课程编号为003且课程成绩在80分以上的学生的学号和姓名
SELECT student.sid,student.sname,sc.score
FROM student,sc  -- 联表查询
WHERE student.sid=sc.sid and sc.cid='003' and sc.score>70;
 