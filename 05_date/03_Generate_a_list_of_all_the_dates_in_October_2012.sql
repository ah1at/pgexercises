-- Produce a list of all the dates in October 2012. They can be output as a
-- timestamp (with time set to midnight) or a date.


SELECT
	GENERATE_SERIES('2012-10-01'::timestamp, '2012-10-31'::timestamp,'1 day')

-- Note:

-- One of the best features of Postgres over other DBs is a simple function
-- called GENERATE_SERIES. This function allows you to generate a list of dates
-- or numbers, specifying a start, an end, and an increment value. It's
-- extremely useful for situations where you want to output, say, sales per day
-- over the course of a month. **A typical way to do that on a table containing a
-- list of sales might be to use a SUM aggregation, grouping by the date and
-- product type. Unfortunately, this approach has a flaw: if there are no sales
-- for a given day, it won't show up! To make it work properly, you need to
-- left join from a sequential list of timestamps to the aggregated data to
-- fill in the blank spaces.**

-- (This is why generate_series was important in the rolling averages question
-- in the previous section)