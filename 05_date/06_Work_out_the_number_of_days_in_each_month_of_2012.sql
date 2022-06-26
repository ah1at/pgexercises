-- For each month of the year in 2012, output the number of days in that month.
-- Format the output as an integer column containing the month of the year, and
-- a second column containing an interval data type.

WITH firsts AS (
SELECT
	GENERATE_SERIES('2012-01-01'::timestamp, '2012-12-01'::timestamp,'1 month') as month
)

SELECT
	EXTRACT(MONTH FROM month) as month,
	month + INTERVAL '1 month' - month
FROM
	firsts
