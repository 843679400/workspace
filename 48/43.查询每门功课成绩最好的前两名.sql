-- 43.查询每门功课成绩最好的前两名
SELECT s1.*
FROM sc s1, sc s2
WHERE s1.cid = s2.cid AND s1.score<=s2.score
GROUP BY s1.cid,s1.sid
HAVING COUNT(s1.score)<=2
ORDER BY s1.cid;
-- ---
SELECT *
FROM sc
WHERE (
				SELECT COUNT(1)
				FROM sc s
				WHERE sc.cid = s.cid and sc.score<s.score
			)<2
ORDER BY sc.cid,sc.score DESC;
