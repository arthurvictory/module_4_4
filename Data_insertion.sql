-- Insert data into Customer Table
insert into customer (
	customer_id,
	first_name,
	last_name,
	address,
	phone_number
) values (
	1,
	'Joe',
	'Schmoe',
	'555 Turnabout Ln Victoria, TX 77904',
	'361-555-1234'
);

-- Insert data into Salesperson Table
insert into salesperson (
	salesperson_id,
	first_name,
	last_name,
	service_car_id
) values (
	1,
	'Daryl',
	'Salesalot',
	1
);

--Insert data into Mechanic Table
insert into mechanic (
	mechanic,
	first_name,
	last_name,
	service_car_id
) values (
	1,
	'Lance',
	'Fixalot',
	1
);

--Insert data into Parts Table
insert into parts (
	parts_id,
	parts_name,
	parts_number,
	invoice_id,
	service_car_id 
) values (
	1,
	'Alternator',
	1,
	1,
	1
);

-- Insert Data into Service Table
insert into service (
	service_id,
	description,
	service_car_id
) values (
	1,
	'Car will not start',
	1
);

-- Insert data into Service Cars Table
insert into servicecars (
	service_car_id,
	make,
	model,
	year 
) values (
	1,
	'Toyota',
	'Rav4',
	2004
);

--Insert data into New Cars Table
insert into newcars (
	car_id,
	make,
	model,
	year,
	salesperson_id,
	customer_id
) values (
	1,
	'GMC',
	'Acadia',
	2024,
	1,
	1
);

-- Insert data into invoice table
insert into invoice (
	invoice_id,
	customer_id,
	payments,
	amount
) values (
	1,
	1,
	true,
	250.50
);

-- Stored Functions insert into datatables
-- Make a stored function to insert data into invoice table
create or replace function add_invoice(_invoice_id INTEGER, _customer_id INTEGER, _payments BOOLEAN, _amount DECIMAL)
returns void
as $MAIN$
begin
	insert into invoice(invoice_id, customer_id, payments, amount)
	values (_invoice_id, _customer_id, _payments, _amount);
end;
$MAIN$
language plpgsql;

-- function call to add data
select add_invoice(2, 1, false, 3000.00)

--verify inserted data
select * from invoice

-- Stored Functions insert into datatables
-- Make a stored function to insert data into customer table
create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _phone_number VARCHAR )
returns void
as $MAIN$
begin
	insert into customer(customer_id, first_name, last_name, address, phone_number)
	values (_customer_id, _first_name, _last_name, _address, _phone_number);
end;
$MAIN$
language plpgsql;

-- function call to add data
select add_customer(2, 'Emily', 'Martin', '333 Enchanted Gardens Dr Victoria, TX 77901', '361-555-3467')

--verify inserted data
select * from customer
