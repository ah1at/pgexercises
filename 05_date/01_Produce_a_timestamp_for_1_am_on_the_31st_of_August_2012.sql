-- Produce a timestamp for 1 a.m. on the 31st of August 2012.

SELECT timestamp '2012-08-31 01:00:00' as timestamp

-- Alternatives:

select '2012-08-31 01:00:00'::timestamp; -- postgres extension
select cast('2012-08-31 01:00:00' as timestamp); -- sql standard