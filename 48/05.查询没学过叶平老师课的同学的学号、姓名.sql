-- 05.查询没学过叶平老师课的同学的学号、姓名
-- 方法1
SELECT s.sid,s.sname
FROM sc INNER JOIN course c ON  c.cid = sc.cid 
				INNER JOIN teacher t ON t.tid = c.tid 
				and t.tname = '叶平' RIGHT JOIN student s
on sc.sid = s.sid where sc.score is null; 
-- 方法2
SELECT s.sid,s.sname
FROM student s
where not EXISTS
(SELECT sc.sid
FROM sc,teacher t,course c 
where t.tname = '叶平' and t.tid = c.tid
and c.cid = sc.cid and s.sid = sc.sid);

-- 方法3
SELECT student.sid ,student.sname
FROM student
WHERE student.sid NOT in ( 
	SELECT sc.sid    -- 找到学过叶平老师课的人
	FROM teacher,sc,course
	WHERE teacher.tid=course.tid and course.cid=sc.cid 
		and teacher.tname='叶平'
);