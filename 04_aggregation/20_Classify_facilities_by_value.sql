-- Classify facilities into equally sized groups of high, average, and low
-- based on their revenue. Order by classification and facility name.

WITH x AS (
SELECT
	  name,
  	  NTILE(3) OVER (
        ORDER BY SUM(slots * CASE WHEN memid = 0 THEN guestcost ELSE membercost END) desc
    )
	FROM
  		cd.bookings
			JOIN cd.facilities
				ON bookings.facid = facilities.facid
	GROUP BY name
)

SELECT
	name,
	CASE
		WHEN ntile = 1 THEN 'high'
		WHEN ntile = 2 THEN 'average'
		ELSE 'low'
		END revenue
FROM x
ORDER BY ntile, name