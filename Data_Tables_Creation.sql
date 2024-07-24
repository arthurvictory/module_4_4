-- Create Customer Table
create table Customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	address VARCHAR(100),
	phone_number VARCHAR(15)
);

-- Create Salesperson Table
create table Salesperson (
	salesperson_id SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	service_car_id INTEGER
);

-- Create Mechanic Table
create table Mechanic (
	mechanic SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	service_car_id INTEGER
);

--create Parts table
create table Parts (
	parts_id SERIAL primary key,
	parts_name VARCHAR(50),
	parts_number INTEGER,
	invoice_id INTEGER,
	service_car_id INTEGER
);

-- Create Service Table
create table Service (
	service_id SERIAL primary key,
	description VARCHAR(100),
	service_car_id INTEGER
);

-- Create Service Cars Table
create table ServiceCars (
	service_car_id SERIAL primary key,
	make VARCHAR(20),
	model VARCHAR(20),
	year INTEGER
);

-- Create New Cars Table
create table NewCars (
	car_id SERIAL primary key,
	make VARCHAR(20),
	model VARCHAR(20),
	year INTEGER,
	salesperson_id INTEGER not null,
	customer_id INTEGER not null,
	foreign key(salesperson_id) references Salesperson(salesperson_id),
	foreign key(customer_id) references Customer(customer_id)
);

-- Create Invoice table
create table Invoice (
	invoice_id SERIAL primary key,
	customer_id INTEGER not null,
	payments BOOLEAN,
	amount NUMERIC(10, 2),
	foreign key(customer_id) references customer(customer_id)
);