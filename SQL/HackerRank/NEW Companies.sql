NEW Companies

-- MYSQL
SELECT 
    e.company_code,
    c.founder,
    count( DISTINCT e.lead_manager_code ),
    count( DISTINCT e.senior_manager_code ), 
    count( DISTINCT e.manager_code ), 
    count( DISTINCT e.employee_code )
FROM 
    Employee e, 
    Company c
WHERE e.company_code = c.company_code
GROUP BY company_code, founder;

-- oracle, db2
SELECT c.company_code, 
       c.founder, 
       count(distinct e.lead_manager_code),
       count(distinct e.senior_manager_code),
       count(distinct e.manager_code),
       count(distinct e.employee_code)
from employee e
join company c on e.company_code = c.company_code
group by c.company_code, c.founder
order by c.company_code;

-- MS SQL Server
SELECT C.company_code
        , C.founder
        , COUNT(DISTINCT(E.lead_manager_code))
        , COUNT(DISTINCT(E.senior_manager_code))
        , COUNT(DISTINCT(E.manager_code))
        , COUNT(DISTINCT(E.employee_code))
FROM Company C
     LEFT JOIN Employee E ON E.company_code = C.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code ASC;
