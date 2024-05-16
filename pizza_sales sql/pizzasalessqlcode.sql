-- Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
 #Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(orders_details.orderdrtails_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;
# List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name, sum(orders_details.quantity) as quant
FROM
    pizza_types
      JOIN
  pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
      JOIN
  orders_details ON orders_details.pizza_id = pizzas.pizza_id group by pizza_types.name  order by quant  desc limit 10;


-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizza_types.category, sum(orders_details.quantity) as quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id group by pizza_types.category  order by quantity  desc ;

