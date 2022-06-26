-- Work out the utilisation percentage for each facility by month, sorted by
-- name and month, rounded to 1 decimal place. Opening time is 8am, closing time
-- is 8.30pm. You can treat every month as a full month, regardless of if there
-- were some dates the club was not open.

-- My answer:

WITH simp AS (
    SELECT
        name,
        DATE_TRUNC('month', starttime) AS month,
        SUM(slots) as total
    FROM cd.bookings
    JOIN cd.facilities
    	ON bookings.facid = facilities.facid
    GROUP BY
        name, month
)

SELECT
	name,
	month,
	ROUND(
        100 * CAST(total / (25 * EXTRACT(days FROM ((month + INTERVAL '1 month') - month))) AS numeric),
        1) AS utilization
FROM simp
ORDER BY
	name ASC, month ASC

-- Official:

select name, month, 
	round((100*slots)/
		cast(
			25*(cast((month + interval '1 month') as date)
			- cast (month as date)) as numeric),1) as utilisation
	from  (
		select facs.name as name, date_trunc('month', starttime) as month, sum(slots) as slots
			from cd.bookings bks
			inner join cd.facilities facs
				on bks.facid = facs.facid
			group by facs.facid, month
	) as inn
order by name, month