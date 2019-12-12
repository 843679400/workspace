 -- 32.查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列
SELECT sc.cid,AVG(sc.score)
FROM sc
GROUP BY sc.cid   -- 按课程分组，查出每门课程的情况
ORDER BY AVG(sc.score) ASC,sc.cid DESC;