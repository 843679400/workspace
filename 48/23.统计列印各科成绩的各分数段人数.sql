-- 统计列印各科成绩,各分数段人数:课程ID,课程名称,[100-85],[85-70],[70-60],[ <60]
SELECT 
	course.cid AS '课程ID',
	course.cname as '课程名称',
	SUM(CASE WHEN sc.score BETWEEN 85 AND 100 THEN 1 ELSE 0 END)AS'[100-85]',
	SUM(case WHEN sc.score BETWEEN 70 AND 85 THEN 1 ELSE 0 END)AS'[85-70]',
	SUM(CASE WHEN sc.score BETWEEN 60 AND 70 THEN 1 ELSE 0 END)AS'[70-60]',
	SUM(CASE WHEN sc.score <60 THEN 1 ELSE 0 END)AS'[ <60]'
FROM course,sc
WHERE course.cid = sc.cid
GROUP BY course.cid;

