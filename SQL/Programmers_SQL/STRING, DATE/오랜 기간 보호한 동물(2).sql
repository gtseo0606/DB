오랜 기간 보호한 동물(2)
입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.

-- TOP(10)
-- TOP(20) PERCENT


--MYSQL
SELECT A.ANIMAL_ID, A.NAME
FROM ANIMAL_INS A
JOIN ANIMAL_OUTS B
ON A.ANIMAL_ID = B.ANIMAL_ID
ORDER BY DATEDIFF(B.DATETIME, A.DATETIME) DESC
LIMIT 2;

--ORACLE
SELECT A.ANIMAL_ID, A.NAME
FROM ANIMAL_INS A
JOIN ANIMAL_OUTS B
ON A.ANIMAL_ID = B.ANIMAL_ID
ORDER BY B.DATETIME-A.DATETIME DESC
FETCH FIRST 2 ROW ONLY;
