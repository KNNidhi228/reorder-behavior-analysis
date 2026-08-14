-- What % of all product-order line items in the dataset are reorders vs first-time purchases?
-- This is our baseline reorder rate — every later segment gets compared against this number.

SELECT 
    reordered,
    COUNT(*) as num_orders,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM order_products_prior), 2) as pct
FROM order_products_prior
GROUP BY reordered;