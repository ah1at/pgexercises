-- In our previous exercises, we deleted a specific member who had never made
-- a booking. How can we make that more general, to delete all members who
-- have never made a booking?

DELETE FROM cd.members
WHERE memid not in (SELECT DISTINCT memid FROM cd.bookings);

-- Alternative:

delete from cd.members mems where not exists (select 1 from cd.bookings where memid = mems.memid);