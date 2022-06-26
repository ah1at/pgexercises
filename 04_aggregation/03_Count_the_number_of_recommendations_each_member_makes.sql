-- Produce a count of the number of recommendations each member has made.
-- Order by member ID.

SELECT recommendedby, COUNT(recommendedby)
FROM cd.members
GROUP BY recommendedby
HAVING COUNT(recommendedby) != 0
ORDER BY recommendedby
;

-- Their answer:

select recommendedby, count(*) 
	from cd.members
	where recommendedby is not null
	group by recommendedby
order by recommendedby;   