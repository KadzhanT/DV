SELECT * 
FROM customers 
LIMIT 10;

SELECT order_id, customer_id, order_status, order_purchase_timestamp
FROM orders
WHERE order_status = 'delivered'
ORDER BY order_purchase_timestamp DESC
LIMIT 20;

SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

SELECT customer_state, COUNT(customer_id) AS num_customers
FROM customers
GROUP BY customer_state
ORDER BY num_customers DESC;

SELECT p.product_category_name, COUNT(oi.product_id) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sold DESC
LIMIT 10;

SELECT o.order_status, AVG(r.review_score) AS avg_score
FROM orders o
JOIN olist_order_reviews r ON o.order_id = r.order_id
GROUP BY o.order_status
ORDER BY avg_score DESC;


