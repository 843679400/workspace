-- 1.查询001课程比002课程成绩高的学生

-- 方法1：
SELECT s.sid,s.sname
FROM sc s1 INNER JOIN sc s2 ON s1.sid = s2.sid
and s1.cid = 1 and s2.cid = 2 AND s1.score > s2.score
 LEFT JOIN student s ON s.sid = s1.sid;
-- 方法2：
SELECT student.sid,student.sname
FROM student,sc s1,sc s2
WHERE s1.cid='001' 
AND s2.cid='002'
and s1.sid=s2.sid
AND s1.score > s2.score
AND student.sid=s1.sid;


-- 方法3
SELECT sc.sid
FROM sc
WHERE sc.cid = '001'    -- 查找这样一个人，条件是 001课程，并且001课程分数大于002课程的分数
	AND sc.score > (     -- where子查询，用子查询查出同一个学生的002课程的成绩
	SELECT s.score
	FROM sc s
	WHERE s.cid = '002'
	AND sc.sid = s.sid
);
-- 方法4
SELECT a.sid
FROM
	(
		SELECT sc.score,sc.sid
		FROM sc
		WHERE sc.cid = '001'
	) a, -- 001课程的学生ID和成绩做成一个中间表a
	(
		SELECT sc.score,sc.sid
		FROM sc
		WHERE sc.cid = '002'
	) b  -- 002课程的学生ID和成绩做了另一个中间表b
WHERE b.sid = a.sid  -- a,b两表联查，两表中的同一个人的分数比较
	AND a.score > b.score;