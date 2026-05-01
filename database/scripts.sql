USE Module4_Inventory;
GO

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(150),
    address VARCHAR(200)
);

CREATE TABLE Parts (
    part_id INT IDENTITY(1,1) PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    category VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(100),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_cost DECIMAL(12,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    part_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (part_id) REFERENCES Parts(part_id)
);
