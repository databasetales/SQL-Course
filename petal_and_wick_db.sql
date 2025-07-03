-- Remove petals_and_wicks database schema if it is already present
DROP DATABASE IF EXISTS petals_and_wicks;

-- create 'petals_and_wicks' database schema
CREATE DATABASE petals_and_wicks ;

USE petals_and_wicks; -- we are telling that, we will be working in this database schema.



-- Creating : PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    cost_price DECIMAL(10,2),
    sell_price DECIMAL(10,2),
    stock INT
);

--  Creating : CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    location VARCHAR(50),
    channel VARCHAR(20)
);

--  Creating : ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_mode VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--  Creating : ORDER_ITEMS TABLE
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--  Creating : FEEDBACK TABLE
CREATE TABLE feedback (
    customer_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    PRIMARY KEY (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--  Creating : SUPPLIERS TABLE
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    supply_type VARCHAR(50)
);


----------------------------------------------
-- Adding Data to the tables 
----------------------------------------------
insert into products(product_id,name,category,cost_price,sell_price,stock)
values
(1,'Rose','flower',11.39,14.92,27),
(2,'Tulip','flower',7.45,10.1,16),
(3,'Sunflower','flower',11.77,19.5,15),
(4,'Lily','flower',10.9,14.31,15),
(5,'Orchid','flower',7.19,10.8,11),
(6,'Lavender Candle','candle',10.61,16.83,44),
(7,'Vanilla Candle','candle',9.2,13.61,27),
(8,'Cinnamon Candle','candle',13.09,17.05,20),
(9,'Eucalyptus Candle','candle',11.98,17.2,19),
(10,'Rosewood Candle','candle',7.15,11.48,16);



insert into customers(customer_id,name,email,location,channel)
values
(1,'Customer1','customer1@example.com','Mumbai','store'),
(2,'Customer2','customer2@example.com','Mumbai','store'),
(3,'Customer3','customer3@example.com','Bangalore','store'),
(4,'Customer4','customer4@example.com','Mumbai','store'),
(5,'Customer5','customer5@example.com','Chennai','online'),
(6,'Customer6','customer6@example.com','Pune','online'),
(7,'Customer7','customer7@example.com','Chennai','store'),
(8,'Customer8','customer8@example.com','Chennai','store'),
(9,'Customer9','customer9@example.com','Chennai','online'),
(10,'Customer10','customer10@example.com','Mumbai','online'),
(11,'Customer11','customer11@example.com','Delhi','store'),
(12,'Customer12','customer12@example.com','Mumbai','online'),
(13,'Customer13','customer13@example.com','Mumbai','store'),
(14,'Customer14','customer14@example.com','Bangalore','store'),
(15,'Customer15','customer15@example.com','Bangalore','online'),
(16,'Customer16','customer16@example.com','Bangalore','store'),
(17,'Customer17','customer17@example.com','Delhi','store'),
(18,'Customer18','customer18@example.com','Mumbai','online'),
(19,'Customer19','customer19@example.com','Chennai','online'),
(20,'Customer20','customer20@example.com','Delhi','store');



insert into orders(order_id,customer_id,order_date,payment_mode)
values
(1,13,'2024-03-10','upi'),
(2,18,'2024-02-26','upi'),
(3,11,'2024-01-15','credit_card'),
(4,2,'2024-03-21','cash'),
(5,9,'2024-01-17','credit_card'),
(6,19,'2024-03-21','credit_card'),
(7,16,'2024-04-11','upi'),
(8,15,'2024-02-06','cash'),
(9,5,'2024-03-04','upi'),
(10,18,'2024-05-17','cash'),
(11,19,'2024-04-19','upi'),
(12,13,'2024-04-02','credit_card'),
(13,5,'2024-05-10','cash'),
(14,3,'2024-01-13','credit_card'),
(15,5,'2024-06-09','credit_card'),
(16,14,'2024-06-01','credit_card'),
(17,13,'2024-04-07','upi'),
(18,15,'2024-05-15','cash'),
(19,18,'2024-01-03','upi'),
(20,4,'2024-06-23','upi'),
(21,9,'2024-06-13','cash'),
(22,4,'2024-03-16','cash'),
(23,6,'2024-04-26','credit_card'),
(24,9,'2024-05-08','credit_card'),
(25,17,'2024-01-28','upi'),
(26,10,'2024-06-12','upi'),
(27,20,'2024-02-20','credit_card'),
(28,12,'2024-02-11','upi'),
(29,17,'2024-01-01','upi'),
(30,11,'2024-05-05','credit_card'),
(31,4,'2024-04-02','cash'),
(32,8,'2024-01-15','credit_card'),
(33,19,'2024-01-21','credit_card'),
(34,16,'2024-01-18','upi'),
(35,5,'2024-02-02','upi'),
(36,16,'2024-05-20','credit_card'),
(37,9,'2024-05-15','upi'),
(38,14,'2024-02-24','upi'),
(39,7,'2024-03-20','cash'),
(40,12,'2024-04-22','upi'),
(41,15,'2024-01-31','credit_card'),
(42,8,'2024-01-17','cash'),
(43,1,'2024-05-30','upi'),
(44,8,'2024-05-30','credit_card'),
(45,1,'2024-01-19','upi'),
(46,2,'2024-02-28','credit_card'),
(47,2,'2024-03-25','credit_card'),
(48,17,'2024-03-01','cash'),
(49,16,'2024-02-24','upi'),
(50,5,'2024-05-26','upi');


insert into order_items(order_id,product_id,quantity)
values
(1,4,4),
(1,7,2),
(2,2,4),
(3,7,4),
(3,8,1),
(4,7,3),
(4,2,2),
(5,4,5),
(6,3,4),
(7,4,1),
(7,8,5),
(8,1,5),
(9,2,2),
(10,7,4),
(11,4,4),
(11,1,2),
(12,1,4),
(12,5,4),
(13,7,5),
(13,8,2),
(14,5,2),
(15,10,5),
(16,6,1),
(17,10,4),
(18,9,2),
(18,1,5),
(18,2,2),
(19,10,1),
(20,2,5),
(20,4,5),
(21,1,5),
(21,2,4),
(21,10,5),
(22,6,3),
(22,4,3),
(23,3,3),
(23,8,3),
(24,1,4),
(25,10,1),
(25,2,5),
(25,4,5),
(26,3,3),
(26,2,2),
(27,5,2),
(27,8,5),
(28,5,5),
(28,9,3),
(29,5,1),
(29,2,5),
(30,5,3),
(31,4,3),
(31,9,4),
(32,1,1),
(32,7,3),
(33,1,3),
(34,5,2),
(35,8,5),
(35,7,5),
(35,1,1),
(36,3,5),
(37,6,5),
(38,3,4),
(38,5,3),
(39,6,2),
(40,4,1),
(40,6,5),
(40,7,5),
(41,3,2),
(41,7,1),
(42,6,4),
(43,4,3),
(43,3,1),
(43,7,1),
(44,4,2),
(44,8,3),
(45,4,2),
(45,1,2),
(46,6,3),
(46,2,3),
(47,9,4),
(48,2,3),
(49,10,3),
(50,2,5);

insert into feedback(customer_id,product_id,rating,comment)
values 
(20,9,1,'Not good'),
(19,4,3,'Great!'),
(14,1,5,'Amazing scent'),
(7,6,4,'Great!'),
(11,10,3,'Very fresh'),
(4,5,5,'Loved it'),
(14,6,4,'Very fresh'),
(10,9,2,'Okay'),
(14,7,2,'Amazing scent'),
(19,5,4,'Amazing scent'),
(1,5,3,'Okay'),
(14,10,5,'Very fresh'),
(11,8,4,'Not good'),
(7,9,4,'Very fresh'),
(6,2,3,'Amazing scent'),
(10,4,2,'Okay'),
(1,1,2,'Not good'),
(20,2,4,'Not good'),
(13,4,2,'Very fresh'),
(1,2,4,'Okay'),
(6,9,4,'Great!'),
(18,4,1,'Not good'),
(5,8,5,'Amazing scent'),
(20,6,4,'Amazing scent'),
(17,7,5,'Not good'),
(6,8,4,'Loved it'),
(8,5,4,'Great!'),
(11,9,1,'Okay'),
(5,4,4,'Very fresh'),
(13,10,1,'Amazing scent'),
(13,8,1,'Loved it'),
(10,7,4,'Amazing scent');


insert into suppliers(supplier_id,name,city,supply_type)
values
(1,'Supplier1','Kolkata','candles'),
(2,'Supplier2','Kolkata','candles'),
(3,'Supplier3','Chennai','candles'),
(4,'Supplier4','Delhi','candles'),
(5,'Supplier5','Ahmedabad','candles');

