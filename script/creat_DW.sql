

create table DIM_Customer(
    customer_ID int identity(1,1) primary key,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	start_data datetime not null,
	end_date datetime not null,
	active_flag  tinyint not null
)

CREATE TABLE DIM_Stores (
	store_id INT IDENTITY (1, 1) PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (10),
	zip_code VARCHAR (5),

);

CREATE TABLE DIM_Orders (
	order_id INT PRIMARY KEY,

	customer_id INT references DIM_Customer(customer_id),
	staff_id int references DIM_Staffs(staff_id),
	store_id int references DIM_Stores(store_id),

	order_status tinyint NOT NULL,
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
	start_data datetime not null,
	end_date datetime not null,
	active_flag  tinyint not null
);

CREATE TABLE DIM_Products (
	product_id INT IDENTITY (1, 1) PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_name varchar(255) ,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	start_data datetime not null,
	end_date datetime not null,
	active_flag  tinyint not null
);

CREATE TABLE DIM_Order_Item (
	order_id INT,
    item_id INT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES DIM_Orders (order_id) ,
    FOREIGN KEY (product_id) REFERENCES DIM_Products (product_id)
);

CREATE TABLE DIM_Staffs (
	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
	store_id INT references Dim_Stores(store_id),
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
);
-- create a new table for the date dimension
CREATE TABLE Dim_Date (
    DateID INT PRIMARY KEY,
    DateValue DATE,
    Year INT,
    Quarter INT,
    Month varchar(255),
    Day INT,
);

--factTables
create table Fact_Orders(
  fact_order_id int identity(1,1)  primary key,
  customer_id int references DIM_Customer(customer_id),
  store_id int references DIM_Stores(store_id),
  staff_id int references DIM_Staffs(staff_id),
  year int ,
  Quarter INT,
  orders_number int
)

create table Fact_Staff_product(
  staff_order_id int identity(1,1)  primary key,
  staff_id int references DIM_Staffs(staff_id),
  store_id int references DIM_Stores(store_id),
  product_id int references DIM_Products(product_id),
  quantity INT NOT NULL,
  year int
)

create table Fact_Customer_brans(
  brand_id int identity(1,1)  primary key,
  brand_name varchar(255),
  customers_num int,
  year int ,
)


select * from Fact_Orders
select * from Fact_Staff_product
select * from Fact_Customer_brans

drop table Fact_Orders
drop table Fact_Staff_product
drop table Fact_Customer_brans

drop table DIM_Customer
drop TABLE DIM_Stores 
drop TABLE DIM_Orders
drop TABLE DIM_Products 
drop TABLE DIM_Order_Item
drop TABLE DIM_Staffs
drop TABLE Dim_Date 
