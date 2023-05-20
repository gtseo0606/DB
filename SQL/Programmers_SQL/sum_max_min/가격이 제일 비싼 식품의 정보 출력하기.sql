가격이 제일 비싼 식품의 정보 출력하기
FOOD_PRODUCT 테이블에서 가격이 제일 비싼 식품의 식품 ID, 식품 이름, 식품 코드, 식품분류, 식품 가격을 조회하는 SQL문을 작성해주세요.

-- MYSQL
SELECT *
FROM FOOD_PRODUCT 
ORDER BY PRICE DESC
LIMIT 1;

-- ORACLE
SELECT *
FROM FOOD_PRODUCT 
ORDER BY PRICE DESC
FETCH FIRST 1 ROWS ONLY;
