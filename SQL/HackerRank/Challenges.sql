Challenges

-- ORACLE
WITH DATASET1 AS (SELECT hacker_id, COUNT(challenge_id) tot_challenges  
                  FROM Challenges C  
                  GROUP BY hacker_id),
RANKED_DATASET1 AS (SELECT DS1.*, dense_rank() OVER(ORDER by tot_challenges desc ) rnk 
                    FROM DATASET1 DS1),
DATASET2 AS (SELECT tot_challenges, COUNT(hacker_id) tot_hackers 
             FROM RANKED_DATASET1 RDS1  
             GROUP BY tot_challenges)
SELECT RDS1.hacker_id, h.name, RDS1.tot_challenges 
FROM RANKED_DATASET1 RDS1 
INNER JOIN Hackers H 
ON RDS1.hacker_id = H.hacker_id 
INNER JOIN DATASET2 DS2 
ON DS2.tot_challenges = RDS1.tot_challenges
WHERE (RDS1.rnk=1 AND  DS2.tot_hackers >1) OR DS2.tot_hackers =1
ORDER BY RDS1.tot_challenges DESC, RDS1.hacker_id;
