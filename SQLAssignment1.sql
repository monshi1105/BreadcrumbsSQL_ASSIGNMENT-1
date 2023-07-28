 -- Creating a Database
 
 create database sales;
 
 -- Using Database sales 
 
 use sales;
 
 -- creating products table
 
 create table Product (
 Product_id int primary key ,
 Product_name varchar(20),
 Prod_description varchar(200),
 Prod_category varchar(20),
 Price varchar(10)
 );

-- creating customers table 
  
create table Customer (
 Customer_id int primary key ,
 Customer_name varchar(20),
 Customer_address varchar(200),
 age int,
 Price int,
 loyalty_status varchar(10)
 );
 
 -- creating regions table
 
 create table Region (
 Region_id int primary key,
 region_name varchar(20),
 country varchar(200),
 active_customers varchar(20)
 );
 
 -- creating Purchase table 
 
 create table Purchase (
 Purchase_id int primary key ,
 Customer_id int ,
 time_period_id varchar(20),
 Total_purchase_amount int 
 );
 
 -- creating Timeperiod table
 
 create table Time_period (
 Time_period_id int primary key ,
 name varchar(20)
 );
 
 -- creating purchase product table 
 
 CREATE TABLE Purchase_Product (
    Purchase_id INT,
    Product_id INT,
    PRIMARY KEY (Purchase_id, Product_id),
    FOREIGN KEY (Purchase_id) REFERENCES Purchase(Purchase_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

-- creating Product region table 

create table Product_region (
Product_id int ,
Region_id int ,
primary key ( Product_id, Region_id),
foreign key (Product_id) references Product(Product_id),
foreign key ( Region_id) references Region(Region_id)
);

-- creating inventory table 

create table inventory (
inventory_id int ,
Product_id int ,
stock_level int 
);

-- viewing all the tables that are created 

 select table_name 
 from information_schema.tables 
 where table_schema = "sales";
 
 -- dropping the unwanted entities in a schema 
 
 alter table region drop column country ;
 
 -- Modifying the datatype of a entity in a table 

alter table purchase modify column time_period_id INTEGER ;

-- setting foreign key constraint for purchase entity 
 
alter table purchase
add constraint foreign key(time_period_id) 
references time_period(Time_period_id);

-- setting foreign key constraint for inventory entity 

alter table inventory 
add constraint foreign key(Product_id) 
references product(Product_id);

-- setting foreign key constraint for purchase entity 

alter table purchase 
add constraint foreign key(Customer_id)
references Customer(Customer_id);
