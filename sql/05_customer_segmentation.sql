-- Segment customers by order frequency to enable behavior comparison across segments.
-- Frequent = 20+ orders, Regular = 5-19 orders, Infrequent = 1-4 orders
-- Note: segment labels were assigned in Python (see notebook), this query provides
-- the underlying per-user order counts used to build those segments.

SELECT 
    user_id,
    COUNT(*) as total_orders,
    AVG(days_since_prior_order) as avg_days_between_orders
FROM orders
GROUP BY user_id;