-- 18.查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分 
#方法一
select sc.cid, MAX(sc.score),MIN(sc.score)
from sc
group by sc.cid ;
#方法二
SELECT L.CID As 课程ID,L.score AS 最高分,R.score AS 最低分 
    FROM SC L ,SC AS R 
    WHERE L.CID = R.CID and 
        L.score = (SELECT MAX(IL.score)  -- 最高分
                      FROM SC AS IL,Student AS IM 
                      WHERE L.CID = IL.CID and IM.SID=IL.SID 
                      GROUP BY IL.CID) 
        AND 
        R.Score = (SELECT MIN(IR.score)  -- 最低分
                      FROM SC AS IR 
                      WHERE R.CID = IR.CID 
                  GROUP BY IR.CID 
                    ); 