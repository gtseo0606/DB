Top Competitors

-- ORACLE, MYSQL, MS SQL SERVER
SELECT s.hacker_id, h.name
from Hackers as h
JOIN Submissions as s  on s.hacker_id = h.hacker_id
JOIN Challenges as c on s.challenge_id = c.challenge_id
JOIN Difficulty as d on d.difficulty_level = c.difficulty_level

WHERE d.score = s.score
GROUP BY hacker_id, h.name
HAVING count(s.challenge_id) > 1

ORDER BY count(s.challenge_id) desc, s.hacker_id;
