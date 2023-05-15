-- 스칼라 서브쿼리(SELECT절)
-- 세부적인 집계함수를 제작하기 위해 사용

-- EX1)
SELECT FIRST_NAME,
       LAST_NAME,
       SALARY,
       (SELECT B.DEPARTMENT_NAME
          FROM DEPARTMENT B
         WHERE B.DEPARTMENT_ID = A.DEPARTMENT_ID
           AND ROWNUM = 1) AS DEPT_NM
-- DEPARTMENT_ID가 primary key라서 에러는 안나지만 만약에 DEPARTMENT_ID가가 아니면 에러가 날 수 도있으니 'AND ROWNUM = 1'을 넣어준다.
           
  FROM EMPLOYEES A
 WHERE SALARY > 5000;
