-- 44.统计每门课程的学生选修人数（超过10人的课程才统计）。要求输出课程号和选修人数，查询结果按人数降序排列，查询结果按人数降序排列，若人数相同，按课程号升序排列 
SELECT sc.cid as 课程号,COUNT(1) 人数
FROM sc
GROUP BY sc.cid   -- 每门课程的人数
HAVING COUNT(1)>3  -- 每门课程人数大于3的课程
ORDER BY COUNT(1) DESC,sc.cid;