-- 21.查询不同老师所教不同课程平均分从高到低显示

select teacher.tname, sc.cid,AVG(sc.score)'平均分'
from sc,teacher,course
where teacher.tid=course.tid
and course.cid = sc.cid
group by sc.cid
order by 平均分 DESC;
-- 
SELECT max( Z.TID) AS 教师ID
			,MAX(Z.Tname) AS 教师姓名
			,C.CID AS 课程ＩＤ
			,MAX(C.Cname) AS 课程名称
			,AVG(Score) AS 平均成绩 
FROM SC AS T,Course AS C ,Teacher AS Z 
WHERE T.CID=C.CID and C.TID=Z.TID 
GROUP BY C.CID 
ORDER BY AVG(Score) DESC ;