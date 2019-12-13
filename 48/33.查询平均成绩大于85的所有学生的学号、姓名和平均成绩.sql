-- 33.查询平均成绩大于85的所有学生的学号、姓名和平均成绩 
SELECT student.sid,student.sname,AVG(sc.score)AS 平均成绩
FROM student,sc 
WHERE student.sid=sc.sid 
GROUP BY sc.sid    -- 按人分组，即查出每个人的情况
HAVING AVG(sc.score)>85;  -- 分组后，统计每个人的平均分，且平均分大于85分