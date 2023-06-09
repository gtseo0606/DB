SELECT * FROM RUNNING_MAN rm; 
-- 7ROWS

SELECT * FROM INFINITE_CHALLENGE ic; 
-- 6ROWS

-- 실행계획 보기
EXPLAIN PLAN FOR SELECT * FROM RUNNING_MAN rm NATURAL JOIN INFINITE_CHALLENGE ic;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

UPDATE RUNNING_MAN SET JOB = 'MC' WHERE CAST = '유재석';

SELECT * FROM RUNNING_MAN rm JOIN INFINITE_CHALLENGE ic USING (CAST, GENDER);
