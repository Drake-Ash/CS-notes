-- Last updated: 29/04/2026, 23:05:53
SELECT
    Country.name AS country
FROM Country
INNER JOIN Person
    ON SUBSTRING(Person.phone_number, 1, 3) = Country.country_code
INNER JOIN Calls
    ON Calls.caller_id = Person.id
    OR Calls.callee_id = Person.id
GROUP BY Country.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls)