-- What day of week and hour of day have the highest order volume?
-- Used to identify peak activity windows for scheduling notifications.

SELECT 
    order_dow,
    order_hour_of_day,
    COUNT(*) as total_orders
FROM orders
GROUP BY order_dow, order_hour_of_day
ORDER BY order_dow, order_hour_of_day;