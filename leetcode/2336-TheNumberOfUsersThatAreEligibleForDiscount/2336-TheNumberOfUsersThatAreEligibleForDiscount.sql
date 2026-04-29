-- Last updated: 29/04/2026, 23:03:37
CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
      select count(distinct(user_id)) as user_cnt
      from Purchases
      where amount >= minAmount and (time_stamp between startDate and endDate)
  );
END