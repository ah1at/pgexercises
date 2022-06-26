-- Produce a list of the top three revenue generating facilities (including
-- ties). Output facility name and rank, sorted by rank and facility name.

-- Answer:

WITH x AS (
SELECT
	  name,
	  rank() over (ORDER BY (SUM(slots * CASE
			  WHEN memid = 0 THEN guestcost
			  ELSE membercost
		  END)) DESC) as rank
	FROM
  		cd.bookings
			JOIN cd.facilities
				ON bookings.facid = facilities.facid
	GROUP BY name
)

SELECT * FROM x
WHERE rank <= 3