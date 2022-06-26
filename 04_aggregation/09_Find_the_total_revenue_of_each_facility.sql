-- Produce a list of facilities along with their total revenue.
-- The output table should consist of facility name and revenue, sorted by
-- revenue. Remember that there's a different cost for guests and members!

-- My answer:

SELECT name, sum(revenue) FROM
  (SELECT facilities.name,
	  CASE
		  WHEN memid = 0 THEN guestcost * slots
		  WHEN memid != 0 THEN membercost * slots
	  END as revenue
  FROM cd.bookings
  JOIN cd.facilities
    ON bookings.facid = facilities.facid) x
  GROUP BY x.name
  ORDER BY sum(revenue)
;

-- Official answer:

select facs.name, sum(slots * case
			when memid = 0 then facs.guestcost
			else facs.membercost
		end) as revenue
	from cd.bookings bks
	inner join cd.facilities facs
		on bks.facid = facs.facid
	group by facs.name
order by revenue;

-- Difference:
-- * my second WHEN is unnecessary. Can just use else
-- * remember that groupby will aggregate the other column