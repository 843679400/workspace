-- 47.查询没学过“叶平”老师讲授的任一门课程的学生姓名
-- 方法1：
SELECT  s.sname
FROM teacher t INNER JOIN course c
ON  t.tid = c.tid
AND t.tname = '叶平'
LEFT JOIN sc 
ON c.cid = sc.cid 
RIGHT JOIN student s
ON sc.sid = s.sid
WHERE sc.score IS NULL;
-- 方法2：---------------------------------
SELECT student.sname
FROM student
WHERE student.sid not in (  -- 2.不在这些人中的同学即为没学过叶平老师课的同学   （where not in 子查询）
	SELECT sc.sid         -- 1.查询出学过叶平老师课的人，
	FROM sc,teacher,course
	WHERE sc.cid=course.cid and course.tid=teacher.tid
		and teacher.tname='叶平'
);
