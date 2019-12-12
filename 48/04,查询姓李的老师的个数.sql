-- 4.查询姓李的老师的个数
SELECT COUNT(1)
FROM teacher
WHERE teacher.tname LIKE '李%';