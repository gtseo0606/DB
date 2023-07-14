Binary Tree Nodes
-- DB2, ORACLE
SELECT N, 
      (CASE WHEN P IS NULL THEN 'Root' 
       WHEN N NOT IN (SELECT NVL(P,0) FROM BST) THEN 'Leaf' 
       ELSE 'Inner' 
       END) 
FROM BST 
ORDER BY N;

-- MYSQL, MS SQL SERVER
SELECT N , 
     CASE 
       WHEN p IS NULL THEN "Root"
       WHEN N IN (SELECT DISTINCT P FROM BST) THEN "Inner"
       ELSE "Leaf"
       END
FROM BST ORDER BY N;
