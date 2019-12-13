-- 08.查询课程编号“002”的成绩比课程编号“001”课程低的所有同学的学号、姓名
-- 方法1
SELECT s.sid,s.sname
FROM sc s1 INNER JOIN sc s2 
ON s1.sid = s2.sid
AND s1.cid = 1
AND s2.cid = 2
AND s1.score > s2.score
LEFT JOIN student s ON s1.sid = s.sid;
###################################333


SELECT sc.`sid`,`student`.`sname`
    FROM sc ,`student`
    WHERE sc.cid='001' AND sc.`score`>  -- 课程001的分数大于课程002的分数  
    (
     SELECT sc2.score
     FROM sc sc2
     WHERE sc2.`cid`='002' AND sc2.sid=sc.`sid`  -- 父表的学生ID 等于子表的学生ID ，即同一个人。（相关子查询，父表与子表有关联）
    ) AND `student`.`sid`=sc.`sid`;
#方法二
select s1.sid
from sc s1,sc s2
where s1.cid='001' and s2.cid='002' and s1.score>s2.score
and s1.sid = s2.sid;
#方法3
select DISTINCT s.sid,s.sname
from student s left join sc s1 on s.sid=s1.sid left join sc s2 on s.sid=s2.sid 
where s1.cid='001'
and s2.cid='002'
and s2.score<s1.score