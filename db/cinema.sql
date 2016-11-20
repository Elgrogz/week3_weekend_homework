DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL,
  funds INT4 NOT NULL 
);

CREATE TABLE films (
  id SERIAL8 primary key,
  title VARCHAR(255) NOT NULL,
  price INT4 NOT NULL
);

CREATE TABLE tickets (
  id SERIAL8 primary key,
  customer_id INT8 references customers(id) ON DELETE CASCADE,
  film_id INT8 references films(id) ON DELETE CASCADE,
  film_time INT4
);
