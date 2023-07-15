
-- MYSQL
WITH temp AS (
    SELECT 
        CASE WHEN Occupation='Doctor' THEN Name END AS doctor, 
        CASE WHEN Occupation='Actor' THEN Name END AS actor, 
        CASE WHEN Occupation='Singer' THEN Name END AS singer, 
        CASE WHEN Occupation='Professor' THEN Name END AS professor,       
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) as rn 
    FROM OCCUPATIONS
)
SELECT MAX(doctor),MAX(professor),MAX(singer),MAX(actor)
FROM temp
GROUP BY rn;

-- ORACLE
SELECT
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor,
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor,
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer,
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor
FROM (
    SELECT
        NAME,
        OCCUPATION,
        ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS rn
    FROM
        OCCUPATIONS
)
GROUP BY rn
ORDER BY rn;

-- MS SQL
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT Occupation, 
    Name, 
    ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS row_num
    FROM OCCUPATIONS
) t
GROUP BY row_num
ORDER BY row_num;
