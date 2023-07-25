Weather Observation Station 18

-- MYSQL
WITH POINTS as (
    SELECT
        MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
    FROM STATION
)
SELECT ROUND(ABS((a-c)+(b-d)),4)
FROM POINTS


-- MS SQL SERVER
SELECT CAST(ABS((MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W))) AS decimal(10,4)) 
FROM station

-- ORACLE
select round(MAX(LAT_N)-MIN(LAT_N)+max(LONG_W)-MIN(LONG_W),4) from STATION;

-- DB2
SELECT
    CAST(
        ROUND(
            ABS(MIN(LAT_N) - MAX(LAT_N)) +
            ABS(MIN(LONG_W) - MAX(LONG_W)),
            4
        ) AS DECIMAL(20,4) 
    )
FROM STATION;
