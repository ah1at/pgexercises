-- How can you produce a list of bookings on the day of 2012-09-14 which will
-- cost the member (or guest) more than $30? Remember that guests have different
-- costs to members (the listed costs are per half-hour 'slot'), and the guest
-- user is always ID 0. Include in your output the name of the facility, the
-- name of the member formatted as a single column, and the cost. Order by
-- descending cost, and do not use any subqueries.

SELECT
	firstname || ' ' || surname AS member,
	name as facility,
	CASE
		WHEN members.memid = 0 THEN slots * guestcost
		ELSE slots * membercost
		END AS cost
FROM cd.members
JOIN cd.bookings
ON members.memid = bookings.memid
JOIN cd.facilities
ON bookings.facid = facilities.facid
WHERE
    starttime >= '2012-09-14' AND
    starttime < '2012-09-15' AND
    CASE
		WHEN members.memid = 0 THEN slots * guestcost > 30
		ELSE slots * membercost > 30
		END
ORDER BY cost DESC