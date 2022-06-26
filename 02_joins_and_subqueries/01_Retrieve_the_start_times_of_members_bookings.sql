-- How can you produce a list of the start times for bookings by members named 
-- 'David Farrell'?

select starttime
from cd.bookings bookings
inner join cd.members members
on bookings.memid = members.memid
where members.surname = 'Farrell' and members.firstname = 'David';