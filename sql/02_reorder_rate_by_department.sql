-- Which product departments have the highest/lowest reorder rates?
   -- High reorder rate = habitual purchases (good for subscription features)
   -- Low reorder rate = exploratory purchases (good for discovery/recommendation features)
   
   SELECT 
       d.department,
       COUNT(*) as total_orders,
       SUM(opp.reordered) as reorder_count,
       ROUND(SUM(opp.reordered) * 100.0 / COUNT(*), 2) as reorder_rate_pct
   FROM order_products_prior opp
   JOIN products p ON opp.product_id = p.product_id
   JOIN departments d ON p.department_id = d.department_id
   GROUP BY d.department
   ORDER BY reorder_rate_pct DESC;