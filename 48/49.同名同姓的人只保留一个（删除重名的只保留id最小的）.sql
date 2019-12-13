-- 49.同名同姓的人只保留一个（删除重名的只保留学号最小的）
DELETE 
FROM
	student 
WHERE
	student.sid NOT IN ( SELECT t.sid FROM ( SELECT min( student.sid ) sid FROM student GROUP BY student.sname ) t );