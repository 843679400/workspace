 -- 31.1981年出生的学生名单(注：Student表中Sage列的类型是datetime) 
SELECT *
   FROM  student WHERE YEAR(student.sage)=1981;  -- 日期函数