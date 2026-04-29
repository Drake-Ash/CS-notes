-- Last updated: 29/04/2026, 23:11:52
SELECT email from Person
group by email
having count(email) > 1