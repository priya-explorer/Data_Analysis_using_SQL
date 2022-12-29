REM   Script: SALES_ANALYSIS
REM   EDA on 'Sales' table


-- The first 10 rows of the data. (NOTE: LIMIT does not work here to see the 1st few rows)
SELECT * FROM SH.SALES
FETCH  FIRST 10 ROWS ONLY;

-- To check the number of rows/records
SELECT COUNT(*) FROM SH.SALES;

-- To find the number of quantities sold
SELECT SUM(QUANTITY_SOLD)  AS TOTAL_QUANTITY FROM SH.SALES;

-- The total number of customers
SELECT COUNT(DISTINCT CUST_ID) AS TOTAL_CUST FROM SH.SALES;

-- The different years in which sales happended
SELECT DISTINCT EXTRACT(YEAR FROM TIME_ID) AS YEAR FROM SH.SALES;

-- To know total amount sold(i.e the invoiced price to customers) for each year, starting from the highest amount sold to least.
SELECT
      EXTRACT(YEAR FROM TIME_ID)AS YEAR, SUM(AMOUNT_SOLD) AS TOTAL_AMOUNT 
FROM SH.SALES 
GROUP BY EXTRACT(YEAR FROM TIME_ID) 
ORDER BY TOTAL_AMOUNT DESC;

-- The max and minimum amount sold
SELECT MAX(AMOUNT_SOLD) AS MAX_AMOUNT FROM SH.SALES;
SELECT MIN(AMOUNT_SOLD) AS MIN_AMOUNT FROM SH.SALES;

-- The top 5 customers who made the maximum purchase
SELECT 
      CUST_ID, SUM(AMOUNT_SOLD) AS TOTAL_AMOUNT
FROM SH.SALES
GROUP BY CUST_ID
ORDER BY TOTAL_AMOUNT DESC
fetch  first 5 rows only;