-- The telephone numbers in the database are very inconsistently formatted.
-- You'd like to print a list of member ids and numbers that have had
-- '-','(',')', and ' ' characters removed. Order by member id.

SELECT
	memid,
	TRANSLATE(telephone, ' ()-', '')
FROM cd.members
ORDER BY memid

-- Official regexp version

select memid, regexp_replace(telephone, '[^0-9]', '', 'g') as telephone
    from cd.members
    order by memid;

-- First parm: pattern: ^ caret indicates you want everything that's NOT 0-9
-- second: thing to replace with. 'g' flag says replace all
-- occurrences of the pattern