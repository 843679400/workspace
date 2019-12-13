-- 42.查询不同课程成绩相同的学生的学号、课程号、学生成绩
-- 即课程中分数相同的有哪些课和哪同学，哪些分数。

SELECT s1.sid,s1.cid,s1.score
from sc s1,sc s2 -- 分为两个表，两个表的分数相等，cid相等,sid不相等
where s1.score=s2.score
and s1.cid=s2.cid
and s1.sid<>s2.sid
order by s1.cid,s1.sid ;
###############
SELECT s1.cid,s1.sid,s1.score
FROM sc s1 INNER JOIN sc s2 
ON s1.cid = s2.cid
AND s1.score = s2.score
AND s1.sid != s2.sid
ORDER BY s1.cid;
