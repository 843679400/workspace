-- 12.查询至少学过学号为“001”同学所选课程中任意一门课的其他同学学号和姓名
SELECT DISTINCT  s.sid,s.sname
FROM sc s1 INNER JOIN sc s2
ON s1.cid = s2.cid
AND s1.sid = 001
AND s1.sid<> s2.sid
 LEFT JOIN student s
 ON s2.sid = s.sid
-- -----------------------
SELECT DISTINCT
	SC.SID,
	Sname
FROM
	Student,
	SC
WHERE
	Student.SID = SC.SID
AND CID IN (
	SELECT
		CID
	FROM
		SC s
	WHERE
		s.sid = '001'
)
AND sc.sid <> '001';

