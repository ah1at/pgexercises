-- The zip codes in our example dataset have had leading zeroes removed from them
-- by virtue of being stored as a numeric type. Retrieve all zip codes from the
-- members table, padding any zip codes less than 5 characters long with leading
-- zeroes. Order by the new zip code.

SELECT LPAD(CAST(zipcode AS varchar), 5, '0') as zip
FROM cd.members
ORDER BY zip