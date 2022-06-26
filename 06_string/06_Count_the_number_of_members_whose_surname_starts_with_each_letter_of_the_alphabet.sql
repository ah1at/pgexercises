-- You'd like to produce a count of how many members you have whose surname
-- starts with each letter of the alphabet. Sort by the letter, and don't
-- worry about printing out a letter if the count is 0.

SELECT LEFT(surname, 1) as letter, count(surname)
FROM cd.members
GROUP BY letter
ORDER BY letter

-- official:

select substr (mems.surname,1,1) as letter, count(*) as count 
    from cd.members mems
    group by letter
    order by letter    