   --  22. 查询如下课程成绩第 3 名到第 6 名的学生成绩单：企业管理（001），马克思（002），UML （003），数据库（004）
SELECT a.score '企业管理' ,b.score '马克思' ,c.score 'UML',d.score '数据库'
       FROM student LEFT JOIN 
          (
            SELECT sc.`sid`,sc.`score`
            FROM sc
            WHERE sc.`cid`=1
          
          ) a ON student.`sid`=a.sid
          LEFT JOIN 
          (
            SELECT sc.`sid`,sc.`score`
            FROM sc
            WHERE sc.`cid`=2   
           
          ) b ON  student.`sid`=b.sid
           LEFT JOIN
           (
            SELECT sc.`sid`,sc.`score`
            FROM sc
            WHERE sc.`cid`=3  
           
          ) c ON  student.sid=c.sid
          LEFT JOIN
           (
            SELECT sc.`sid`,sc.`score`
            FROM sc
            WHERE sc.`cid`=4  
           
          ) d ON  student.sid=d.sid
 
      -- LIMIT 2,4