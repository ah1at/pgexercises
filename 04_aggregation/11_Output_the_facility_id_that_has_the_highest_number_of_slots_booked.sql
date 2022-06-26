-- Output the facility id that has the highest number of slots booked.
-- For bonus points, try a version without a LIMIT clause. This version
-- will probably look messy!

-- My version with LIMIT

SELECT facid, sum(slots)
FROM cd.bookings
GROUP BY facid
ORDER BY sum(slots) DESC
LIMIT 1;

-- Without LIMIT, using CTE

WITH x AS (
    SELECT facid, sum(slots)
	FROM cd.bookings
	GROUP BY facid
)

SELECT facid, sum 
FROM x
WHERE sum = (SELECT max(sum) FROM x);