-- Find the downward recommendation chain for member ID 1: that is,
-- the members they recommended, the members those members recommended,
-- and so on. Return member ID and name, and order by ascending member id.

WITH RECURSIVE x(memid) AS (
	SELECT memid
    FROM cd.members
    WHERE recommendedby = 1

	UNION ALL

	SELECT members1.memid
		FROM x
            JOIN cd.members members1
			    ON members1.recommendedby = x.memid
)

SELECT
	members.memid,
	firstname,
	surname
FROM x
    JOIN cd.members
        ON x.memid = members.memid
ORDER BY memid ASC