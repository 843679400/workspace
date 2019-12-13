-- 11.查询与学号为“004”的同学所学相同的同学的学号和姓名

SELECT
	sc.sid,
	sname 
FROM
	sc
	LEFT JOIN student ON sc.sid = student.sid
WHERE
	sc.sid IN (
	SELECT
		s1.sid
	FROM
		sc s1
	WHERE
		s1.sid != 4 
	GROUP BY
		s1.sid
	HAVING
		count(1) = ( SELECT count(1) FROM sc s2 WHERE s2.sid = 4) 
	) 
	AND sc.cid IN (SELECT s3. cid FROM sc s3 WHERE s3.sid = 4) 
GROUP By
	sc.sid 
HAVING
	count(1) = (SELECT count(1) FROM sc s4 WHERE s4.sid = 4)

-- -------------------------

SELECT s.sid 学号,s.sname 姓名
FROM student s,sc
WHERE sc.cid IN (SELECT s1.cid
FROM sc s1
WHERE s1.sid = 001)
AND s.sid = sc.sid
GROUP BY sc.sid
HAVING COUNT(1) = (SELECT COUNT(1)
FROM sc s2
WHERE  s2.sid = 001)
AND sc.sid <> 001;