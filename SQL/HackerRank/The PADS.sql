The PADS

-- DB2
SELECT (name || '(' || SUBSTR(occupation,1,1) || ')') 
FROM occupations 
ORDER BY name; 

SELECT ('There are a total of ' || COUNT(occupation) || ' ' || LOWER(occupation) || 's' || '.') 
FROM occupations 
GROUP BY occupation 
ORDER BY COUNT(occupation), occupation ASC;

-- MYSQL
SELECT CONCAT(Name, '(', (SUBSTRING(Occupation, 1, 1)), ')')
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT('There are a total of ', COUNT(OCCUPATION), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION) ASC;

-- ORACLE
SELECT NAME || '(' || SUBSTR(OCCUPATION, 1,1) || ')' 
FROM OCCUPATIONS  
ORDER BY NAME ASC;

SELECT 'There are a total of ' || COUNT(OCCUPATION) || ' ' || LOWER(occupation) || 's.' FROM OCCUPATIONS 
GROUP BY OCCUPATION 
ORDER BY COUNT(NAME), OCCUPATION ASC;

-- MSSQL SERVER
SELECT CONCAT(Name, '(', (SUBSTRING(Occupation, 1, 1)), ')')
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT('There are a total of ', COUNT(OCCUPATION), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION) ASC;
