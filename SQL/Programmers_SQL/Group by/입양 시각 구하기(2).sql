입양 시각 구하기(2)
0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.

WITH RECURSIVE NUM(HOUR) AS (SELECT 

-- MYSQL
WITH RECURSIVE num(HOUR) AS (
    SELECT 0
    UNION ALL 
    SELECT HOUR+1 FROM num WHERE HOUR<23
)

SELECT A.HOUR, 
       CASE WHEN B.CNT IS NULL 
       THEN 0 ELSE B.CNT END AS COUNT 
FROM num A
LEFT JOIN (SELECT HOUR(DATETIME) AS H, COUNT(ANIMAL_ID) AS CNT
           FROM ANIMAL_OUTS 
           GROUP BY 1) AS B 
ON A.HOUR = B.H

-- ORACLE
SELECT A.HOUR, COUNT(B.TIME) AS COUNT
FROM (SELECT LEVEL-1 AS HOUR FROM DUAL CONNECT BY level <25) A
LEFT OUTER JOIN (SELECT TO_CHAR(DATETIME, 'hh24') as TIME FROM ANIMAL_OUTS) B 
ON A.HOUR = B.TIME
GROUP BY A.HOUR
ORDER BY A.HOUR;
