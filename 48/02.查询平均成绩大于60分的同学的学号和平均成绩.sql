-- 2.查询平均成绩大于60分的同学的学号和平均成绩
SELECT
	sc.sid AS 学号,
	AVG(sc.score) AS '平均成绩'
FROM
	sc
GROUP BY      -- 先按学生分组查询出每个学生的学号和平均成绩
	sc.sid
HAVING				-- 再增加分组后的查询条件，即分组后，平均分大于60分的人
	AVG(sc.score) > 60;