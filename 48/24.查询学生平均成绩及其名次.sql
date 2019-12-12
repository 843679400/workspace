-- 24.查询学生平均成绩及其名次 
SELECT b.sid 学生, b.`平均分`,1+(
	SELECT COUNT(1)
	FROM (SELECT AVG(s.score) 平均,s.sid sid  FROM sc s GROUP BY s.sid )a
	WHERE  a.`平均`> b.`平均分`  -- 从b表中取一个平均分，与a表中所有的平均分进行比较，看有多少平均分比b表中的平均分大。如果没有大于的则返回0，则说明这个数最大，排第一名。
	) 名次
FROM (SELECT AVG(s.score) 平均分,s.sid sid  FROM sc s GROUP BY s.sid  )b 
ORDER BY b.`平均分` DESC;

-- a表和b表一样才能进行比较。
-- 方法二
set @num = 0;
select (@num:=@num+1) as num,b.sid,b.平均分
from
(SELECT sc.sid,AVG(score) 平均分
FROM sc
GROUP BY sc.sid
ORDER BY AVG(score) DESC) b;
-- 方法3：

SELECT
	1 + (
		SELECT COUNT(平均成绩)
		FROM
			(
				SELECT sid,AVG(score) AS '平均成绩'
				FROM sc
				GROUP BY sc.sid
			) AS a
		WHERE a.`平均成绩` > b.平均成绩         -- 统计a表中每个人的平均成绩大于b表平均成绩（先拿出b表中的一个平均成绩与a表的所有人的平均成绩逐个比较）的有多少个，如果有0个（即没有比这个数更大的），是第一名，如果有1个，就是第2名。ab两个表必须完全一样。
	) AS 名次,
	b.sid AS 学号,
	平均成绩
FROM
	(
		SELECT sid,AVG(score) 平均成绩
		FROM sc
		GROUP BY sc.sid
	) b
ORDER BY 平均成绩 DESC;