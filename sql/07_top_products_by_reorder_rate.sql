-- Which specific products have the highest reorder rates (among products with a
-- meaningful sample size)? Useful for identifying "habit-forming" items to feature
-- in subscribe-and-save prompts or loyalty-focused marketing.
--
-- HAVING COUNT(*) >= 100 filters out rarely-ordered products that could show a
-- misleadingly high reorder rate just from a tiny sample size.

SELECT 
    p.product_name,
    COUNT(*) as total_orders,
    SUM(opp.reordered) as reorder_count,
    ROUND(SUM(opp.reordered) * 100.0 / COUNT(*), 2) as reorder_rate_pct
FROM order_products_prior opp
JOIN products p ON opp.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(*) >= 100
ORDER BY reorder_rate_pct DESC
LIMIT 20;