-- 29.查询姓张的学生名单
SELECT *
FROM student
WHERE student.sname LIKE '张%';