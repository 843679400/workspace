-- 22.查询如下课程成绩第 3 名到第 6 名的学生成绩单：企业管理（001），马克思（002），UML （003），数据库（004） 
 --   [学生ID],[学生姓名],企业管理,马克思,UML,数据库,总成绩 
SELECT DISTINCT sc.sid 学生ID
								,student.sname 学生姓名
								,t1.score 企业管理
								,t2.score 马克思
								,t3.score UML
								,t4.score 数据库
								,IFNULL(t1.score,0)+IFNULL(t2.score,0)+IFNULL(t3.score,0)+IFNULL(t4.score,0) 总分
FROM student,sc LEFT JOIN sc t1 ON sc.sid=t1.sid and t1.cid='001'
								LEFT JOIN sc t2 ON sc.sid=t2.sid and t2.cid='002'
								LEFT JOIN sc t3 ON sc.sid=t3.sid and t3.cid='003'
								LEFT JOIN sc t4 ON sc.sid=t4.sid and t4.cid='004'
WHERE student.sid=sc.sid
ORDER BY 总分 DESC
LIMIT 2,4;
-- 方法2
SELECT sc.sid
,sum(IF(sc.cid = 1,sc.score,NULL)) '企业管理'
,SUM(IF(sc.cid = 2,sc.score,NULL)) '数据库'
,SUM(IF(sc.cid = 3,sc.score,NULL)) 'HTML'
,SUM(IF(sc.cid = 4,sc.score,NULL)) 'java'
,SUM(IF(sc.cid in (1,2,3,4),sc.score,NULL)) 总成绩
FROM sc
GROUP BY sc.sid
ORDER BY 总成绩 DESC
LIMIT 2,4;