5월 식품들의 총매출 조회하기
FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요. 이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.

-- MYSQL
SELECT P.PRODUCT_ID, P.PRODUCT_NAME, SUM(P.PRICE*O.AMOUNT) TOTAL_SALES
FROM FOOD_PRODUCT AS P
INNER JOIN FOOD_ORDER AS O
ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE DATE_FORMAT(O.PRODUCE_DATE, '%m') = '05'
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID ASC;

-- ORACLE
SELECT PRODUCT_ID, PRODUCT_NAME, SUM(PRICE*AMOUNT) TOTAL_SALES
FROM FOOD_PRODUCT 
INNER JOIN FOOD_ORDER 
USING (PRODUCT_ID)
WHERE TO_CHAR(PRODUCE_DATE, 'MM') = '05'
GROUP BY PRODUCT_ID, PRODUCT_NAME
ORDER BY TOTAL_SALES DESC, PRODUCT_ID ASC;
