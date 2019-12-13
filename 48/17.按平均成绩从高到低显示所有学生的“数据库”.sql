-- 17.按平均成绩从高到低显示所有学生的“数据库”、“企业管理”、“英语”三门的课程成绩，按如下形式显示：学生ID,,数据库,企业管理,英语,有效课程数,有效平均分 
 SELECT SID as 学生ID 
        ,(SELECT score FROM SC WHERE SC.SID=t.SID AND CID='004') AS 数据库 
        ,(SELECT score FROM SC WHERE SC.SID=t.SID AND CID='001') AS 企业管理 
        ,(SELECT score FROM SC WHERE SC.SID=t.SID AND CID='003') AS 英语 
        ,COUNT(*) AS 有效课程数, AVG(t.score) AS 平均成绩 
    FROM SC AS t 
    GROUP BY SID 
    ORDER BY avg(t.score) ; 