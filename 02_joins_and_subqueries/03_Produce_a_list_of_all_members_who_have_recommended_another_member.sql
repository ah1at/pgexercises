-- How can you output a list of all members who have recommended another 
-- member? Ensure that there are no duplicates in the list, and that results 
-- are ordered by (surname, firstname).

SELECT distinct
	members1.firstname, members1.surname
FROM
	cd.members members1
	JOIN cd.members members2
		ON members2.recommendedby = members1.memid
order by members1.surname, members1.firstname;