그룹별 조건에 맞는 식당 목록 출력하기
MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.

-- MYSQL
SELECT B.MEMBER_NAME,
       A.REVIEW_TEXT,
       DATE_FORMAT(A.REVIEW_DATE, '%Y-%m-%d') REVIEW_DATE
FROM REST_REVIEW A
LEFT JOIN MEMBER_PROFILE B 
USING (MEMBER_ID)
WHERE MEMBER_ID = ( SELECT MEMBER_ID
                    FROM REST_REVIEW
                    GROUP BY MEMBER_ID
                    ORDER BY COUNT(REVIEW_ID) DESC
                    LIMIT 1 )         
ORDER BY A.REVIEW_DATE, A.REVIEW_TEXT;

-- ORACLE
SELECT MEMBER_NAME, 
       REVIEW_TEXT, 
       TO_CHAR(REVIEW_DATE, 'YYYY-MM-DD')
FROM MEMBER_PROFILE
NATURAL JOIN (
    SELECT MEMBER_ID,
           DENSE_RANK() over (ORDER BY COUNT(MEMBER_ID) DESC) as RANK
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
) A
WHERE A.RANK = 1
ORDER BY REVIEW_DATE, REVIEW_TEXT ASC;
