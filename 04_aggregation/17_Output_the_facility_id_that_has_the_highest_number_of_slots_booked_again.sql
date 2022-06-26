-- Output the facility id that has the highest number of slots booked.
-- Ensure that in the event of a tie, all tieing results get output.

-- My initial answer. Doesn't ensure:

SELECT facid, sum(slots) as total
FROM cd.bookings
GROUP BY facid
ORDER BY total DESC
LIMIT 1

-- Using rank:

WITH x AS (
    SELECT
	  facid,
	  sum(slots) total,
	  rank() OVER (ORDER BY sum(slots) DESC) rank
    FROM cd.bookings
	GROUP BY facid
)

SELECT facid, total
FROM x
WHERE rank = 1
