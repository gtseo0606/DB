-- 인라인 뷰(FROM절)
-- 테이블 A와 B를 JOIN -> 테이블 A와 B를 좀 작업한 B'을 JOIN 시키기 위해 사용
-- 전체 데이터가 아닌 필요한 부분의 데이터만 인라인뷰로 생성하면 비용 절감의 효과

-- EX1)
SELECT A.DEPARTMENT_NAME,
       B.AVG_SAL
  FROM DEPARTMENTS A,
        (SELECT /*+MERGE*/
                DEPARTMENT_ID,
                ROUND(AVVG(SALARY),2) AVG_SAL      
         FROM EMPLOYEES
        GROUP BY DEPARTMENT_ID) B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- EX2)
-- 변경 전
SELECT DECODE(TO_CHAR(HIRE_DATE, 'MM'), '01', COUNT(*), 0) "M1",     
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '02', COUNT(*), 0) "M2",
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '03', COUNT(*), 0) "M3",     
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '04', COUNT(*), 0) "M4",
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '05', COUNT(*), 0) "M5",     
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '06', COUNT(*), 0) "M6",
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '07', COUNT(*), 0) "M7",     
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '08', COUNT(*), 0) "M8",
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '09', COUNT(*), 0) "M9",     
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '10', COUNT(*), 0) "M10",
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '11', COUNT(*), 0) "M11",     
       DECODE(TO_CHAR(HIRE_DATE, 'MM'), '12', COUNT(*), 0) "M12",
  FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'MM')
ORDER BY TO_CHAR(HIRE_DATE, 'MM');

-- 변경 후
SELECT SUM(M1), SUM(M2), SUM(M3), SUM(M4), SUM(M5), SUM(M6), 
       SUM(M7), SUM(M8), SUM(M9), SUM(M10), SUM(M11), SUM(M12) 
FROM (
      SELECT DECODE(TO_CHAR(HIRE_DATE, 'MM'), '01', COUNT(*), 0) "M1",     
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '02', COUNT(*), 0) "M2",
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '03', COUNT(*), 0) "M3",     
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '04', COUNT(*), 0) "M4",
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '05', COUNT(*), 0) "M5",     
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '06', COUNT(*), 0) "M6",
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '07', COUNT(*), 0) "M7",     
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '08', COUNT(*), 0) "M8",
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '09', COUNT(*), 0) "M9",     
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '10', COUNT(*), 0) "M10",
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '11', COUNT(*), 0) "M11",     
             DECODE(TO_CHAR(HIRE_DATE, 'MM'), '12', COUNT(*), 0) "M12",
        FROM EMPLOYEES
        GROUP BY TO_CHAR(HIRE_DATE, 'MM')
);
