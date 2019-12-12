-- 20、查询如下课程平均成绩和及格率的百分数(用"1行"显示): 企业管理（001），马克思（002），OO&UML （003），数据库（004）
-- 
SELECT AVG(IF(sc.cid = 1,sc.score,NULL)) 企业管理平均分
,CONCAT(CEIL(sum(IF(sc.score>60 AND sc.cid = 1,1,NULL))/sum(IF(sc.cid =1,1,NULL))*100),"%") 企业管理百分率
, AVG(IF(sc.cid = 2,sc.score,NULL)) 马克思平均分
,CONCAT(CEIL(sum(IF(sc.score>60 AND sc.cid = 2,1,NULL))/sum(IF(sc.cid =2,1,NULL))*100),"%") 马克思百分率
, AVG(IF(sc.cid = 3,sc.score,NULL)) 数据库平均分
,CONCAT(CEIL(sum(IF(sc.score>60 AND sc.cid = 3,1,NULL))/sum(IF(sc.cid =3,1,NULL))*100),"%") 数据库百分率
FROM sc
-- 方法2
 SELECT SUM(CASE WHEN CID ='001' THEN score ELSE 0 END)/SUM(CASE CID WHEN '001' THEN 1 ELSE 0 END) AS 企业管理平均分 
        ,100 * SUM(CASE WHEN CID = '001' AND score >= 60 THEN 1 ELSE 0 END)/SUM(CASE WHEN CID = '001' THEN 1 ELSE 0 END) AS 企业管理及格百分数 
        ,SUM(CASE WHEN CID = '002' THEN score ELSE 0 END)/SUM(CASE CID WHEN '002' THEN 1 ELSE 0 END) AS 马克思平均分 
        ,100 * SUM(CASE WHEN CID = '002' AND score >= 60 THEN 1 ELSE 0 END)/SUM(CASE WHEN CID = '002' THEN 1 ELSE 0 END) AS 马克思及格百分数 
        ,SUM(CASE WHEN CID = '003' THEN score ELSE 0 END)/SUM(CASE CID WHEN '003' THEN 1 ELSE 0 END) AS UML平均分 
        ,100 * SUM(CASE WHEN CID = '003' AND score >= 60 THEN 1 ELSE 0 END)/SUM(CASE WHEN CID = '003' THEN 1 ELSE 0 END) AS UML及格百分数 
        ,SUM(CASE WHEN CID = '004' THEN score ELSE 0 END)/SUM(CASE CID WHEN '004' THEN 1 ELSE 0 END) AS 数据库平均分 
        ,100 * SUM(CASE WHEN CID = '004' AND score >= 60 THEN 1 ELSE 0 END)/SUM(CASE WHEN CID = '004' THEN 1 ELSE 0 END) AS 数据库及格百分数 
	FROM SC