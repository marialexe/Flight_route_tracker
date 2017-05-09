-- DROP TABLE IF EXISTS airline_routes;
-- DROP TABLE IF EXISTS route_deals;
DROP TABLE IF EXISTS airline_deals;
DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS flight_routes;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  customer_name VARCHAR(255),
  budget INT4,
  currency VARCHAR(255)
);

CREATE TABLE airlines (
  id SERIAL8 PRIMARY KEY,
  airline_name VARCHAR(255),
  logo TEXT
);

CREATE TABLE flight_routes (
  id SERIAL8 PRIMARY KEY,
  origin VARCHAR(255),
  destination VARCHAR(255),
  route VARCHAR(255),
  price INT4,
  currency VARCHAR(255)
);

CREATE TABLE deals (
  id SERIAL8 PRIMARY KEY,
  label VARCHAR(255),
  weekday VARCHAR(255),
  month VARCHAR(255),
  discount INT4,
  type VARCHAR(255),
  airline_id INT8 REFERENCES airlines(id) ON DELETE CASCADE,
  route_id INT8 REFERENCES flight_routes(id) ON DELETE CASCADE
);

-- CREATE TABLE airline_deals (
--   id SERIAL8 PRIMARY KEY,
--   airline_id INT8 REFERENCES airlines(id) ON DELETE CASCADE,
--   deal_id INT8 REFERENCES deals(id) ON DELETE CASCADE
-- );

-- CREATE TABLE route_deals (
--   id SERIAL8 PRIMARY KEY,
--   route_id INT8 REFERENCES flight_routes(id) ON DELETE CASCADE,
--   deal_id INT8 REFERENCES deals(id) ON DELETE CASCADE
-- );

CREATE TABLE airline_routes (
  id SERIAL8 PRIMARY KEY,
  airline_id INT8 REFERENCES airlines(id) ON DELETE CASCADE,
  route_id INT8 REFERENCES flight_routes(id) ON DELETE CASCADE
);










