-- Analyze the cumulative revenue generated over time.
select orders.date,
sum (orders_details.quantity * pizzas.price)as revenue 
from order_details.pizza_id=pizzas.pizza_id
 join orders 