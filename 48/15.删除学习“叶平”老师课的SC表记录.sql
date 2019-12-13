-- 15.删除学习“叶平”老师课的SC表记录
DELETE FROM sc WHERE sc.cid in (
SELECT course.cid
FROM course,teacher
WHERE course.tid=teacher.tid and teacher.tname='洪七公'
);
