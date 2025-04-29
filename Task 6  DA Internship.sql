--• Average revenue per order :
SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month,
SUM(amount) AS monthly_revenue,
COUNT(DISTINCT order_id) AS order_volume FROM online_sales GROUP BY year, month ORDER BY year, month;

--• Highest and Lowest Revenue Months:
SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month,
SUM(amount) AS monthly_revenue
FROM
online_sales
GROUP BY
year, month
ORDER BY
monthly_revenue DESC
LIMIT 1; -- Highest revenue month
SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month,
SUM(amount) AS monthly_revenue
FROM
online_sales
GROUP BY
year, month
ORDER BY
monthly_revenue ASC
LIMIT 1;

--• Cumulative sales:
SELECT
year,
month,
SUM(monthly_revenue) OVER (ORDER BY year, month) AS cumulative_revenue
FROM (
SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(MONTH FROM order_date) AS month,
SUM(amount) AS monthly_revenue
FROM
online_sales
GROUP BY
year, month
) subquery;