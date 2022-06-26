-- For each day in August 2012, calculate a rolling average of total revenue
-- over the previous 15 days. Output should contain date and revenue columns,
-- sorted by the date. Remember to account for the possibility of a day having
-- zero revenue. This one's a bit tough, so don't be afraid to check out the
-- hint!

-- My answer:

WITH dailyrevenue as
(SELECT date, sum(revenue) as money FROM (
  SELECT DATE(starttime),
		CASE
			WHEN memid = 0 THEN guestcost * slots
			WHEN memid != 0 THEN membercost * slots
		END as revenue
	FROM cd.bookings
	JOIN cd.facilities
	  ON bookings.facid = facilities.facid
  ) x
  GROUP BY date
 ORDER BY date ASC
)

SELECT date, revenue
FROM
    (SELECT
        date,
        AVG(money) OVER(ORDER BY date ROWS BETWEEN 14 PRECEDING AND CURRENT ROW) AS revenue
    FROM dailyrevenue) x
WHERE
	date >= '2012-08-01' AND
	date <= '2012-08-31'

-- Official answer:

select 	dategen.date,
	(
		-- correlated subquery that, for each day fed into it,
		-- finds the average revenue for the last 15 days
		select sum(case
			when memid = 0 then slots * facs.guestcost
			else slots * membercost
		end) as rev

		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		where bks.starttime > dategen.date - interval '14 days'
			and bks.starttime < dategen.date + interval '1 day'
	)/15 as revenue
	from
	(
		-- generates a list of days in august
		select 	cast(generate_series(timestamp '2012-08-01',
			'2012-08-31','1 day') as date) as date
	)  as dategen
order by dategen.date;  