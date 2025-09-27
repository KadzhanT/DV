-- 1. INNER JOIN: Number of orders per customer (only customers who placed orders)
SELECT c.customer_id, COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- 2. LEFT JOIN: Products with their English translation (include products without translation)
SELECT p.product_id, p.product_category_name, t.product_category_name_english
FROM products p
LEFT JOIN product_category_translation t 
       ON p.product_category_name = t.product_category_name
ORDER BY p.product_id
LIMIT 10;

-- 3. RIGHT JOIN: Orders with payment info (include orders without payments)
SELECT o.order_id, o.order_status, op.payment_value
FROM order_payments op
RIGHT JOIN orders o ON op.order_id = o.order_id
WHERE o.order_status = 'delivered'
ORDER BY op.payment_value DESC NULLS LAST
LIMIT 10;

-- 4. FULL OUTER JOIN: Count all orders and customers (even unmatched ones)
SELECT COUNT(o.order_id) AS total_orders, COUNT(c.customer_id) AS total_customers
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

-- 5. CROSS JOIN: Count total combinations between sellers and products
SELECT COUNT(*) AS total_combinations
FROM sellers s
CROSS JOIN products p;

-- 6. Basic check: first 10 rows of customers
SELECT * 
FROM customers 
LIMIT 10;

-- 7. Orders with filtering and sorting
SELECT order_id, customer_id, order_status, order_purchase_timestamp
FROM orders
WHERE order_status = 'delivered'
ORDER BY order_purchase_timestamp DESC
LIMIT 10;

-- 8. Count orders by status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC
LIMIT 10;

-- 9. Average, min, max order payment value
SELECT 
    AVG(payment_value) AS avg_payment,
    MIN(payment_value) AS min_payment,
    MAX(payment_value) AS max_payment
FROM order_payments;

-- 10. Number of customers per state
SELECT customer_state, COUNT(customer_id) AS num_customers
FROM customers
GROUP BY customer_state
ORDER BY num_customers DESC
LIMIT 10;
