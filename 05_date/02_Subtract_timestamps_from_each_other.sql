-- Find the result of subtracting the timestamp '2012-07-30 01:00:00' from the
-- timestamp '2012-08-31 01:00:00'

select '2012-08-31 01:00:00'::timestamp - '2012-07-30 01:00:00'::timestamp

-- Good note:

-- Intervals stand in contrast to SQL's treatment of DATE types. Dates don't
-- use intervals - instead, subtracting two dates will return an integer
-- representing the number of days between the two dates. You can also add
-- integer values to dates. This is sometimes more convenient, depending on how
-- much intelligence you require in the handling of your dates!