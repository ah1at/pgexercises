-- You'd like to get the signup date of your last member.
-- How can you retrieve this information?

-- My answer
SELECT joindate as latest
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

-- Better answer actually using agg functions
select max(joindate) as latest
	from cd.members;          
