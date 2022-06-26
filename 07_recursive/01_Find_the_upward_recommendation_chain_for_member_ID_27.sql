-- Find the upward recommendation chain for member ID 27: that is, 
-- the member who recommended them, and the member who recommended that member,
-- and so ON. Return member ID, first name, and surname. Order by descending
-- member id.

WITH RECURSIVE x(recommender) AS (
	SELECT recommendedby
    FROM cd.members
    WHERE memid = 27

	UNION ALL

	SELECT members1.recommendedby
		FROM x
            JOIN cd.members members1
			    ON members1.memid = x.recommender
)

SELECT
	x.recommender,
	firstname,
	surname
FROM x
    JOIN cd.members
        ON x.recommender = memid
ORDER BY memid DESC