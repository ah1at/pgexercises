-- Produce a CTE that can return the upward recommendation chain for any member.
-- You should be able to select recommender from recommenders where member=x.
-- Demonstrate it by getting the chains for members 12 and 22. Results table
-- should have member and recommender, ordered by member ascending, recommender
-- descending.

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
    memid,
	x.recommender,
	firstname,
	surname
FROM x
    JOIN cd.members
        ON x.recommender = memid
WHERE memid IN (12, 22)
ORDER BY memid DESC