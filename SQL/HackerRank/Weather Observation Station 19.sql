Weather Observation Station 19

-- DB2, ORACLE, MYSQL, MS SQL SERVER
SELECT
    CAST(
        ROUND(
            SQRT(POWER((MAX(long_w)-MIN(long_W)),2)+POWER((MAX(lat_n)-MIN(lat_n)),2)),4
        ) AS DECIMAL(20,4) 
    )
FROM STATION;
