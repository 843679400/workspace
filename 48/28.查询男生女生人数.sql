-- 28.查询男生、女生人数
select student.ssex 性别,count(1) 人数
from student 
group by ssex;
-- 方法1
SELECT 
	SUM(CASE WHEN student.ssex='男' THEN 1 ELSE 0 END) AS '男生人数'  -- 聚合函数与条件判断的应用
	,SUM(CASE WHEN student.ssex='女' THEN 1 ELSE 0 END) AS '女生人数'
FROM student;

-- 方法2
 SELECT DISTINCT 
       (SELECT COUNT(1) FROM student GROUP BY ssex HAVING ssex='男') '男生人数'    -- 分组统计
     
      ,(SELECT COUNT(1) FROM student GROUP BY ssex HAVING ssex='女') '女生人数'
        FROM student;
#方法3
select COUNT(1) '男',(select COUNT(1) 
from student s
where s.ssex='女')女
from student s
where s.ssex='男' 