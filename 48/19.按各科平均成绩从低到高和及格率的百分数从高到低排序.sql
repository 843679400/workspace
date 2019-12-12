-- 19.按各科平均成绩从低到高和及格率的百分数从高到低排序 
SELECT t.CID AS 课程号 , max(course.Cname)AS 课程名 , AVG(score) AS 平均成绩 
        , 100 * SUM(CASE WHEN score>=60 THEN 1 ELSE 0 END)/COUNT(*) AS 及格百分数 
    FROM SC T,Course 
    where t.CID=course.CID 
    GROUP BY t.CID 
    ORDER BY 及格百分数 DESC 