
#create table orders ( order_id int not null,
#date date not null, order_time time not null,
# primary key( order_id));
create table orders_details (  orderdrtails_id int not null, order_id int not null,
pizza_id text not null, quantity int  not null,
 primary key( orderdrtails_id ));
