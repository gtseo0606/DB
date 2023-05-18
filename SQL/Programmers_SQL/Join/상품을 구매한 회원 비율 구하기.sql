상품을 구매한 회원 비율 구하기
USER_INFO 테이블과 ONLINE_SALE 테이블에서 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 년, 월 별로 출력하는 SQL문을 작성해주세요. 상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요.

--mysql
SELECT YEAR(SALES_DATE) as YEAR, 
	 MONTH(SALES_DATE) as MONTH,
       COUNT(DISTINCT(I.USER_ID)) as PUCHASED_USERS,
       ROUND(COUNT(DISTINCT(I.USER_ID)) / 
             (SELECT COUNT(DISTINCT(USER_ID)) 
              FROM USER_INFO 
              WHERE JOINED LIKE '2021%')
             ,1) as PUCHASED_RATIO
FROM USER_INFO I RIGHT JOIN ONLINE_SALE S ON I.USER_ID = S.USER_ID
AND JOINED LIKE '2021%'
GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE)
ORDER BY YEAR, MONTH ASC;

-- oracle
SELECT TO_CHAR(SALES_DATE, 'YYYY') as YEAR,
       TO_NUMBER(TO_CHAR(SALES_DATE, 'MM')) as MONTH,
       COUNT(DISTINCT(I.USER_ID)) as PUCHASED_USERS,
       ROUND(COUNT(DISTINCT(I.USER_ID)) / 
             (SELECT COUNT(DISTINCT(USER_ID)) 
              FROM USER_INFO
              WHERE TO_CHAR(JOINED, 'YYYY') = '2021')
             ,1) as PUCHASED_RATIO       
FROM USER_INFO I RIGHT JOIN ONLINE_SALE S ON I.USER_ID = S.USER_ID
WHERE TO_CHAR(JOINED, 'YYYY') = '2021'
GROUP BY TO_CHAR(SALES_DATE, 'YYYY'), TO_CHAR(SALES_DATE, 'MM')
ORDER BY 1, 2;
