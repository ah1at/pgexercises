-- How can you produce a list of all members who have used a tennis court?
-- Include in your output the name of the court, and the name of the member
-- formatted as a single column. Ensure no duplicate data, and order by the 
-- member name followed by the facility name.

SELECT DISTINCT
	firstname || ' ' || surname AS member,
	name as facility
FROM cd.members
JOIN cd.bookings
ON members.memid = bookings.memid
JOIN cd.facilities
ON bookings.facid = facilities.facid
WHERE name LIKE '%Tennis Court%'
ORDER BY member, name