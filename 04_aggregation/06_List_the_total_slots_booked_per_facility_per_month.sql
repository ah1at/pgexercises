-- Produce a list of the total number of slots booked per facility per month in
-- the year of 2012. Produce an output table consisting of facility id and
-- slots, sorted by the id and month.

SELECT facid, extract(month from starttime), sum(slots)
FROM cd.bookings
WHERE extract(year from starttime) = 2012
GROUP BY facid
ORDER BY sum(slots)