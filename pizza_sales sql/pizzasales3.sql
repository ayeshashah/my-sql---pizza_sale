-- Determine the distribution of orders by hour of the day.
 SELECT 
         hour(order_time), count(order_id) from orders
 group by hour(order_time)   ;
 #Join relevant tables to find the category-wise distribution of pizzas.
select  category , count(name) from pizza_types  group by category;
 #Group the orders by date and calculate the average number of pizzas ordered per day.
 select orders.date ,sum(orders_details.quantity) from orders join orders_details on orders.order_id
 group by orders.date;
