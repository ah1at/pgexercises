-- Produce a list of each member name, id, and their first booking after
-- September 1st 2012. Order by member ID.

SELECT
	surname,
	firstname,
	bookings.memid,
	min(starttime)
FROM
	cd.bookings
		JOIN cd.members
			ON bookings.memid = members.memid
WHERE starttime > '2012-09-01'
GROUP BY surname, firstname, bookings.memid
ORDER BY memid