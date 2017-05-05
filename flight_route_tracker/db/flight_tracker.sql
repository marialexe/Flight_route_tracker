DROP TABLE IF EXISTS airline_route;
DROP TABLE IF EXISTS flight_route_deals;
DROP TABLE IF EXISTS airline_deals;
DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS flight_routes;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  customer_name VARCHAR(255),
  budget INT4
);

CREATE TABLE airlines (
  id SERIAL8 PRIMARY KEY,
  airline_name VARCHAR(255),
  logo TEXT
);

CREATE TABLE flight_routes (
  id SERIAL8 PRIMARY KEY,
  route VARCHAR(255),
  price INT4
);

CREATE TABLE deals (
  id SERIAL8 PRIMARY KEY,
  label VARCHAR(255),
  weekday VARCHAR(255),
  savings_percentage INT4
);

CREATE TABLE airline_deals (
  id SERIAL8 PRIMARY KEY,
  airline_id INT8 REFERENCES airlines(id) ON DELETE CASCADE,
  deal_id INT8 REFERENCES deals(id) ON DELETE CASCADE
);

CREATE TABLE flight_route_deals (
  id SERIAL8 PRIMARY KEY,
  flight_route_id INT8 REFERENCES flight_routes(id) ON DELETE CASCADE,
  deals_id INT8 REFERENCES deals(id) ON DELETE CASCADE
);

CREATE TABLE airline_route (
  id SERIAL8 PRIMARY KEY,
  airline_id INT8 REFERENCES airlines(id) ON DELETE CASCADE,
  flight_route_id INT8 REFERENCES flight_routes(id) ON DELETE CASCADE
);










