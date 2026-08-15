-- Does reorder rate differ by customer order-frequency segment?
-- Segments defined in Python (Frequent 20+, Regular 5-19, Infrequent 1-4 orders),
-- then written to a `user_segments` table in SQLite for this join.
--
-- Finding: Strong relationship - Frequent shoppers reorder 68.48% of items vs 
-- 43.86% for Regular and 20.44% for Infrequent - more than 3x gap between the 
-- extremes. Suggests frequency and habit-driven purchasing are closely linked.

SELECT 
    us.segment,
    COUNT(*) as total_line_items,
    SUM(opp.reordered) as reorder_count,
    ROUND(SUM(opp.reordered) * 100.0 / COUNT(*), 2) as reorder_rate_pct
FROM order_products_prior opp
JOIN orders o ON opp.order_id = o.order_id
JOIN user_segments us ON o.user_id = us.user_id
GROUP BY us.segment;