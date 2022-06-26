-- Produce a list of member names, with each row containing the total member
-- count. Order by join date, and include guest members.

-- My answer

SELECT
    (SELECT count(memid) FROM cd.members),
    firstname,
    surname
FROM cd.members
ORDER BY joindate

-- Using window functions:

select count(*) over(), firstname, surname
	from cd.members
order by joindate

--  Window functions operate on the result set of your (sub-)query,
-- after the WHERE clause and all standard aggregation. They operate on a
-- window of data. By default this is unrestricted: the entire result set, but
-- it can be restricted to provide more useful results.

