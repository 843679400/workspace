-- 3. 查询所有同学的学号、姓名、选课数、总成绩
SELECT s.sid 学号,s.sname 姓名,COUNT(sc.score) 选课数,SUM(score) 总成绩
FROM student s LEFT JOIN sc
on s.sid=sc.sid 
GROUP BY s.sid;