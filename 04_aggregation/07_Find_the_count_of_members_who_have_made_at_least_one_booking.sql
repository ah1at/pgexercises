-- Find the total number of members (including guests) who have made at least
-- one booking.

SELECT count(distinct memid)
FROM cd.bookings;