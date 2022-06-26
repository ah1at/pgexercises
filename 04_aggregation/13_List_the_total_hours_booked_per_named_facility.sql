-- Produce a list of the total number of hours booked per facility, remembering
-- that a slot lasts half an hour. The output table should consist of the
-- facility id, name, and hours booked, sorted by facility id. Try formatting
-- the hours to two decimal places.

SELECT
    bookings.facid,
	name,
	TRIM(TO_CHAR(SUM(slots) * 0.5, '999999D99')) as "Total Hours"
FROM cd.bookings
    JOIN cd.facilities
        ON bookings.facid = facilities.facid
GROUP BY bookings.facid, facilities.name
ORDER BY bookings.facid ASC