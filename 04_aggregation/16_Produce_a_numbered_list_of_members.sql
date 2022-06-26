-- Produce a monotonically increasing numbered list of members
-- (including guests), ordered by their date of joining. Remember that member
-- IDs are not guaranteed to be sequential.

-- My answer:

SELECT ROW_NUMBER(*) over(), firstname, surname
FROM cd.members
ORDER BY joindate

-- Official answer:

select row_number() over(order by joindate), firstname, surname
	from cd.members
order by joindate

-- QUESTION: what does the order by in the over() statement accomplish?