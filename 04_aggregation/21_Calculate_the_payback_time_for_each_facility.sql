-- Based on the 3 complete months of data so far, calculate the amount of time
-- each facility will take to repay its cost of ownership. Remember to take into
-- account ongoing monthly maintenance. Output facility name and payback time in
-- months, order by facility name. Don't worry about differences in month
-- lengths, we're only looking for a rough value here!

-- My answer:

WITH monthlyrevenue AS (
    SELECT
        facs.name,
        SUM(slots * CASE
            WHEN memid = 0 THEN facs.guestcost
            ELSE facs.membercost
            END)/3 AS revenue
    FROM cd.bookings bks
    JOIN
        cd.facilities facs
            ON bks.facid = facs.facid
    GROUP BY facs.name
)

SELECT
	facilities.name,
	initialoutlay / (revenue - monthlymaintenance)
FROM
	cd.facilities
		JOIN monthlyrevenue
			ON monthlyrevenue.name = facilities.name
ORDER BY facilities.name;