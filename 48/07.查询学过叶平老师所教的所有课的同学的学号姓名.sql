-- 07.查询学过叶平老师所教的所有课的同学的学号姓名
 -- 查出学过叶平老师课的人,并且学的叶平老师课程的数等于叶平老师教的课程数
-- 方法1：
SELECT s.sid,s.sname
FROM sc s1 INNER JOIN course c1 ON s1.cid = c1.cid 
INNER JOIN teacher t1 ON t1.tid = c1.tid AND t1.tname = '叶平' LEFT JOIN student s ON s1.sid = s.sid
GROUP BY s1.sid
HAVING COUNT(s1.cid) = (SELECT COUNT(c2.cid)
	FROM course c2 INNER JOIN teacher t2 ON c2.tid = t2.tid and t2.tname = '叶平'
);

-- 方法2：
SELECT student.sid ,student.sname
FROM student,sc,teacher,course
WHERE sc.cid = course.cid and teacher.tid=course.tid and teacher.tname='叶平'
	and student.sid=sc.sid 
GROUP BY sc.sid  -- 学过叶平老师课程的每个人的情况
HAVING COUNT(1)=( -- 所选平老师课程数等于叶平老师所教的课程数
		SELECT COUNT(1) -- 叶平老师所教的课程数
		FROM teacher,course
 		WHERE teacher.tid=course.tid and teacher.tname='叶平'
);

