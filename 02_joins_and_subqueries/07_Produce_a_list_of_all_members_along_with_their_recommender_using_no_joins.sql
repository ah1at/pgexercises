-- How can you output a list of all members, including the individual who
-- recommended them (if any), without using any joins? Ensure that there are 
-- no duplicates in the list, and that each firstname + surname pairing is
-- formatted as a column and ordered.

SELECT DISTINCT
	firstname || ' ' || surname AS member,
    (SELECT
		firstname || ' ' || surname AS recommender
    FROM
        cd.members recs
	WHERE
        mems.recommendedby = recs.memid)
FROM
    cd.members mems
ORDER BY member

--  In this case, we're simply using the subquery to emulate an outer join.
-- For every value of member, the subquery is run once to find the name of the
-- individual who recommended them (if any). A subquery that uses information
-- from the outer query in this way (and thus has to be run for each row in the
-- result set) is known as a correlated subquery.

