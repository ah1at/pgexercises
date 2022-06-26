-- We want to alter the price of the second tennis court so that it costs 10%
-- more than the first one. Try to do this without using constant values for the
-- prices, so that we can reuse the statement if we want to.


UPDATE cd.facilities
SET
    membercost = ( SELECT membercost FROM cd.facilities WHERE name = 'Tennis Court 1' ) * 1.1,
    guestcost = ( SELECT guestcost FROM cd.facilities WHERE name = 'Tennis Court 1' ) * 1.1
WHERE name = 'Tennis Court 2'
;

-- Better:

update cd.facilities
    set
        membercost = facs2.membercost * 1.1,
        guestcost = facs2.guestcost * 1.1
    from (select * from cd.facilities where name = 'Tennis Court 1') facs2
    where facilities.name = 'Tennis Court 2';
