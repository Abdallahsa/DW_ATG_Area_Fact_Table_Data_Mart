create table STG_Customer(
    customer_ID int identity(1,1) primary key,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
)

CREATE TABLE STG_Stores (
	store_id INT IDENTITY (1, 1) PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (10),
	zip_code VARCHAR (5),

);

CREATE TABLE STG_Orders (
	order_id INT PRIMARY KEY,

	customer_id INT references STG_Customer(customer_id),
	staff_id int references STG_Staffs(staff_id),
	store_id int references STG_Stores(store_id),

	order_status tinyint NOT NULL,
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
);

drop TABLE STG_Order_items
CREATE TABLE STG_Order_items (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, item_id),
);

CREATE TABLE STG_Products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_name varchar(255) NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
);

CREATE TABLE STG_Staffs (
	staff_id INT PRIMARY KEY,
	store_id INT,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
);


CREATE TABLE STG_Date (
    DateID INT PRIMARY KEY,
    DateValue DATE,
    Year INT,
    Quarter INT,
    Month varchar(255),
    Day INT,
);

