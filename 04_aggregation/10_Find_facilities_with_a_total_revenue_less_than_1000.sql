-- Produce a list of facilities with a total revenue less than 1000.
-- Produce an output table consisting of facility name and revenue,
-- sorted by revenue. Remember that there's a different cost for guests
-- and members!

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
  HAVING sum(revenue) < 1000
  ORDER BY sum(revenue)
;

-- Official answer: 

select name, revenue from (
	select facs.name, sum(case 
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) as revenue
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as agg where revenue < 1000
order by revenue;

-- Notes: My answer from 09 was very easy to extend with a having statement