-- 查询各科成绩前三名
-- 方法1：
SELECT s1.*
FROM sc s1 LEFT JOIN sc s2 ON s1.cid = s2.cid
AND s1.score <= s2.score
GROUP BY s1.cid,s1.sid,s1.score
HAVING COUNT(s1.cid)<=3
ORDER BY s1.cid,s1.score DESC;
-- 方法2：
SELECT s2.cid,s2.sid,s2.score
FROM sc s2
WHERE
(SELECT COUNT(1)
FROM sc s1 WHERE s1.cid = s2.cid AND s2.score<s1.score

)<=3
ORDER BY s2.cid,s2.score DESC;


