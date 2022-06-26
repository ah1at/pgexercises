-- Produce a list of members (including guests), along with the number of hours
-- they've booked in facilities, rounded to the nearest ten hours. Rank them by
-- this rounded figure, producing output of first name, surname, rounded hours,
-- rank. Sort by rank, surname, and first name.

-- My answer:

SELECT
	firstname,
	surname,
	ROUND(sum(slots) * 0.5, -1) AS hours,
	rank() OVER (ORDER BY ROUND(sum(slots) * 0.5, -1) DESC) rank
FROM cd.members
	JOIN cd.bookings
		ON bookings.memid = members.memid
GROUP BY firstname, surname
ORDER BY rank, surname, firstname

-- Official answer: (Different method of slots -> rounded hours)

select firstname, surname,
	((sum(bks.slots)+10)/20)*10 as hours,
	rank() over (order by ((sum(bks.slots)+10)/20)*10 desc) as rank

	from cd.bookings bks
	inner join cd.members mems
		on bks.memid = mems.memid
	group by mems.memid
order by rank, surname, firstname;       