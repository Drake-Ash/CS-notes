-- Last updated: 29/04/2026, 23:11:58
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
        SELECT DISTINCT T.salary FROM 
        (
            SELECT E.salary, 
                DENSE_RANK() OVER (ORDER BY E.salary DESC) r
            FROM Employee E
        ) T
        WHERE N = r
  );
END;
$$ LANGUAGE plpgsql;