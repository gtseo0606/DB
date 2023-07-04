과일로 만든 아이스크림 고르기
상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.



-- MYSQL. ORACLE
SELECT A.FLAVOR
FROM FIRST_HALF A
JOIN ICECREAM_INFO B
ON A.FLAVOR = B.FLAVOR
WHERE A.TOTAL_ORDER > 3000
AND B.INGREDIENT_TYPE = 'fruit_based'
ORDER BY A.TOTAL_ORDER DESC;

