-- Does reorder rate (vs new purchases) change by day/hour, separate from total volume?
-- Finding: early morning hours (5-9 AM) show the highest reorder rates, even though 
-- midday/afternoon has higher total volume - suggesting early shoppers are more 
-- habit-driven, while midday traffic is more exploratory.

SELECT 
    o.order_dow,
    o.order_hour_of_day,
    COUNT(*) as total_line_items,
    SUM(opp.reordered) as reorder_count,
    ROUND(SUM(opp.reordered) * 100.0 / COUNT(*), 2) as reorder_rate_pct
FROM order_products_prior opp
JOIN orders o ON opp.order_id = o.order_id
GROUP BY o.order_dow, o.order_hour_of_day
ORDER BY o.order_dow, o.order_hour_of_day;