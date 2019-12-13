-- 16.向SC表中插入一些记录，这些记录要求符合以下条件：没有上过编号“003”课程的同学学号、002号课的平均成绩
-- 因主键重复问题，将导致插入失败，但语句正确。

INSERT  sc 
SELECT sid,2,(
							SELECT AVG(`score`) 
							FROM sc 
							WHERE cid=2) 
FROM sc 
WHERE `sid` NOT IN(SELECT sid FROM sc WHERE cid=3);
ROLLBACK;
