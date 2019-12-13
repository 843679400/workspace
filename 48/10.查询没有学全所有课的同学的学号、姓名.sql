-- 10.查询没有学全所有课的同学的学号、姓名
select  s.sid,s.sname
from student s left join sc ON
 s.sid = sc.sid
group by sc.sid
HAVING count(sc.cid)<>(select count(course.cid)from course )
ORDER BY s.sid;
#############
SELECT sc.`sid`,student.`sname`
FROM sc,student
WHERE sc.sid=student.`sid`
GROUP BY sc.`sid`  -- 分组查出每个人的情况
HAVING COUNT(sc.cid)<( -- 统计出每个人的选课数，且选课数小于总课数
        SELECT COUNT(*)
        FROM course);
