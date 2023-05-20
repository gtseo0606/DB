고양이와 개는 몇 마리 있을까
동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요. 이때 고양이를 개보다 먼저 조회해주세요.

-- MYSQL, ORACLE
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE)
FROM ANIMAL_INS 
WHERE REGEXP_LIKE(ANIMAL_TYPE, 'Cat|Dog')
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE;
