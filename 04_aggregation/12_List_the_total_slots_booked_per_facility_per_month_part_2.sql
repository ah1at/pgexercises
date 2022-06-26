--  Produce a list of the total number of slots booked per facility per month
-- in the year of 2012. In this version, include output rows containing totals
-- for all months per facility, and a total for all months for all facilities.
-- The output table should consist of facility id, month and slots, sorted by
-- the id and month. When calculating the aggregated values for all months and
-- all facids, return null values in the month and facid columns.

SELECT
    facid,
    EXTRACT(MONTH FROM starttime) as month,
    sum(slots) as slots
FROM cd.bookings
WHERE EXTRACT(YEAR FROM starttime) = 2012
GROUP BY
    ROLLUP (facid, EXTRACT(MONTH FROM starttime))
ORDER BY facid ASC, month ASC