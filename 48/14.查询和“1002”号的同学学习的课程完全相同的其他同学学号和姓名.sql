-- 14.查询和“002”号的同学学习的课程完全相同的其他同学学号和姓名

1,找出和2号课程数一样的人 虚表1

2，从这些人中找出学过相同课程的人 虚表2

3，从虚表2中分组统计，课程数相同的人都是谁  结果

SELECT sc.sid
FROM sc
WHERE sc.sid in (与2号课程数相同的人)   -- 虚表1
and sc.cid in (2号所学的课程)           -- 虚表2
GROUP BY sc.sid 
HAVING count(distinct sc.cid) = (2号课程数) 



-- 与2号课程数相同的人
SELECT s2.sid
FROM sc s2
WHERE s2.sid <> 2
GROUP BY s2.sid
HAVING count(distinct s2.cid) = (SELECT count(distinct s1.cid)
from sc s1
where s1.sid = 2);

-- 2号课程数
SELECT count(distinct s1.cid)
from sc s1
where s1.sid = 2
-- 2号所学课程
SELECT distinct s1.cid
from sc s1
where s1.sid = 2
##########################################################################333333333333333333




SELECT student.sid,student.sname
from student ,(
	select sid
	from sc
	where sc.cid in(
		select sc.cid 
		from sc 
		where sc.sid='1') 
	group by sc.sid 
	having count(1)=(
		select count(1) 
		from sc 
		where sc.sid = '1')) a
WHERE student.sid=a.sid

