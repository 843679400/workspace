-- 37.查询不及格的课程，并按课程号从大到小排列
SELECT DISTINCT(sc.cid) -- DISTINCT cid
FROM sc
WHERE sc.score<60
ORDER BY sc.cid desc;