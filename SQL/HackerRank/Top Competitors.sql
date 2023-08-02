Top Competitors

-- ORACLE, MYSQL, MS SQL SERVER
select s.hacker_id, h.name
from Hackers as h
join Submissions as s  on s.hacker_id = h.hacker_id
join Challenges as c on s.challenge_id = c.challenge_id
join Difficulty as d on d.difficulty_level = c.difficulty_level

where d.score = s.score
group by hacker_id, h.name
having count(s.challenge_id) > 1

order by count(s.challenge_id) desc, s.hacker_id;