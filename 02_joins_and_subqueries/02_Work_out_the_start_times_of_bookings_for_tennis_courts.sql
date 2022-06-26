-- How can you produce a list of the start times for bookings for tennis
-- courts, for the date '2012-09-21'? Return a list of start time and facility
-- name pairings, ordered by the time.

select starttime, name
from cd.bookings bookings
inner join cd.facilities facilities
on bookings.facid = facilities.facid
where
    name ~ 'Tennis Court' AND
    starttime >= '2012-09-21' AND
    starttime < '2012-09-22'
ORDER BY starttime