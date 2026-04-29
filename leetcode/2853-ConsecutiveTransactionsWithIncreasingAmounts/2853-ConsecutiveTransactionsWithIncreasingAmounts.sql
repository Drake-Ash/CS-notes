-- Last updated: 29/04/2026, 23:02:45
/* Write your T-SQL query statement below */

-- sub table CTE: find next day, next amount
	
WITH CTE AS(
	SELECT 
		customer_id, transaction_date, amount, 
		LEAD(amount) OVER(PARTITION BY customer_id ORDER BY transaction_date) lead_amount,
		LEAD(transaction_date) OVER(PARTITION BY customer_id ORDER BY transaction_date) lead_transaction_date
	FROM 
		Transactions	
)
-- sub table CTE2: check valid "day" and "amount": if "lead_day" substract "curr_day" = 1 AND "lead_amount" > "curr_amount" then 1 Else null.
,CTE2 AS(
	SELECT 
		customer_id, transaction_date, amount, lead_amount,
		CASE WHEN lead_amount > amount AND (lead_transaction_date -  transaction_date) = 1 THEN 1 ELSE NULL END check_valid_amount
	FROM 
		CTE
) 
-- sub table CTE3: mark row_number() for all rows.
-- transaction_date - key_gb => distinct value for each group
,CTE3 AS(
SELECT
	customer_id, transaction_date, amount, lead_amount,
	transaction_date - (key_gb || ' DAYS')::INTERVAL diff
FROM
	(SELECT 
		customer_id, transaction_date, amount, lead_amount,
		ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) key_gb
	FROM
		CTE2
	WHERE 
		check_valid_amount IS NOT NULL) sub
	
)
-- sub table CTE4: get minimum date for each group
-- count the total number of elements for each group
,CTE4 AS(
	SELECT DISTINCT
		customer_id,
		MIN(transaction_date) OVER(PARTITION BY customer_id, diff) min_transaction_date,
		COUNT(1) OVER(PARTITION BY customer_id, diff) total_conse
	FROM
		CTE3
) 
-- final: Take only total_conse greater than 1
	SELECT 
		customer_id,
		min_transaction_date::DATE consecutive_start,
		(min_transaction_date  + ( total_conse || ' DAYS')::INTERVAL)::DATE  consecutive_end
	FROM
		CTE4
	WHERE
		total_conse > 1
	ORDER BY customer_id, consecutive_start