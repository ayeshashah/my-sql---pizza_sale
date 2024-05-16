-- --Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT avg(quantity) from (select orders.date, sum(orders_details.quantity)as 
quantity from orders join orders_details
 on orders.order_id = orders_details.order_id
 group by orders.date ) as order_quantity;
-- Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name, sum(orders_details.quantity * pizzas.price) as revenue 
from pizza_types join pizzas
on pizzas.pizza_type_id= pizza_types.pizza_type_id
 join orders_details on orders_details.pizza_id=pizzas.pizza_id group by pizza_types.name order by revenue;
-- Calculate the percentage contribution of each pizza type to total revenue.
 select pizza_types.category ,(sum(orders_details.quantity * pizzas.price) / 
 (select round(sum (order_details.quantity *pizzas.price),2)
  As total_sales from orders_details join pizzas on pizzas.pizza_id)*100 as revenue
 from pizza_types 
  join pizzas
 on pizza_types.pizza_type_id=pizzas.pizza_type_id join orders_details
on orders_details.pizza_id =pizzas.pizza_id
group by pizza_types.category order by revenue desc;