-- 41.查询各个课程及相应的选修人数 
SELECT sc.cid,COUNT(1)
FROM sc
GROUP BY sc.cid; -- 情况按组显示，每个组相当于一个表