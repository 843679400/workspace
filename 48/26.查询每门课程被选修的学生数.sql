-- 26.查询每门课程被选修的学生数
SELECT
	sc.cid,
	COUNT(1)
FROM
	sc
GROUP BY    -- 每门课程，即按课程进行分组，每个组相当于一个表，然后统计有多少行
	sc.`cid`