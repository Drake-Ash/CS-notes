-- Last updated: 29/04/2026, 23:03:34
CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
    select distinct user_id
    from purchases
    where time_stamp between startDate and   endDate
    and amount >= minAmount
    order by user_id;
END