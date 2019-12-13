-- 09.查询所有课程成绩小于60分的同学的学号、姓名；

select sc.sid,s.sname
from sc INNER JOIN student s ON sc.sid = s.sid
GROUP BY sc.sid
HAVING count(if(sc.score>=60,1,null))=0
-- ---------------
SELECT s.sid,s.sname
FROM student s INNER JOIN sc s1 ON s.sid = s1.sid 
WHERE s1.score<60
GROUP BY s1.sid
HAVING COUNT(s1.cid) = (SELECT COUNT(s2.cid)
FROM sc s2
GROUP BY s2.sid
HAVING s1.sid = s2.sid
)
#########################
SELECT s.sid,s.sname
FROM student s,sc 
WHERE s.sid = sc.sid
AND sc.score <60
GROUP BY sc.sid
HAVING COUNT(1) = (SELECT COUNT(s2.cid)
FROM sc s2
GROUP BY s2.sid
HAVING s.sid = s2.sid)


