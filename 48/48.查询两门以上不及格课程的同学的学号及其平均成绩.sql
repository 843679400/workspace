-- 48.查询两门以上不及格课程的同学的学号及其平均成绩
SELECT sid 学号,(SELECT AVG(score) FROM sc s  GROUP BY s.sid HAVING  s.sid= sc.sid) 平均成绩  -- 根据2科小于60分同学的ID，查出这个人的平均成绩
FROM sc
where score<60 -- 查询出小于60分的人
GROUP BY sid 
HAVING COUNT(1)>1;  -- 小于60 分的人中，有2科小于60 分的人

-- 方法2
SELECT SID,avg(score)
FROM SC
WHERE SID IN (
		SELECT s1.SID
		FROM SC s1
		WHERE s1.score < 60
		GROUP BY s1.SID
		HAVING count(*) > 1
	)
GROUP BY SID;
