-- 45.检索至少选修两门课程的学生学号

SELECT sc.sid
FROM sc
GROUP BY sid
HAVING COUNT(1)>=2;