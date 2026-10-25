-- How does completed revenue vary by region and month?
-- INNER JOIN retains customers with matching orders. COUNT(DISTINCT o.customer_id)
-- is needed because one customer may place multiple orders in the same region-month.
SELECT
    c.region AS region,
    o.order_month AS order_month,
    COUNT(*) AS number_of_orders,
    COUNT(DISTINCT o.customer_id) AS number_of_customers,
    SUM(o.amount) AS total_revenue,
    AVG(o.amount) AS average_revenue
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region ASC, o.order_month ASC;
