--  How can you output a list of all members, including the individual who
-- recommended them (if any)? Ensure that results are ordered by 
-- (surname, firstname).

SELECT mem.firstname, mem.surname, ref.firstname, ref.surname
FROM cd.members mem
LEFT OUTER JOIN cd.members ref
ON ref.memid = mem.recommendedby
ORDER BY mem.surname, mem.firstname