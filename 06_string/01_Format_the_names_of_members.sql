-- Output the names of all members, formatted as 'Surname, Firstname'

SELECT
	surname || ', ' || firstname
FROM
	cd.members