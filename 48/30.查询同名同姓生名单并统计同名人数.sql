-- 30、查询同名同姓生名单，并统计同名人数
SELECT student.sname,COUNT(1)
FROM student
GROUP BY student.sname  -- 每个人的ID不同，如果名字相同的话，那按名字分组后，统计每组的行数肯定大于1，即有重名的人。
HAVING COUNT(1)>1;