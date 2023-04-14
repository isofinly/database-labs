CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE managers(
    id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE manager_orders (
  id SERIAL PRIMARY KEY,
  order_id INTEGER REFERENCES managers(id) ON DELETE RESTRICT,
  product_name VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL,
  price NUMERIC(10,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE bosses(
    id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  boss_payments INTEGER REFERENCES bosses(id) on delete set null,
  amount NUMERIC(10,2) NOT NULL DEFAULT 0.00,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE persons(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE thoughts (
  id SERIAL PRIMARY KEY,
  payment_id INTEGER REFERENCES persons(id) on delete set default,
  amount NUMERIC(10,2) NOT NULL DEFAULT 0.00,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE idks(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE order_items_refunds (
  order_item_id INTEGER REFERENCES idks(id) on delete no action,
  PRIMARY KEY (order_item_id)
);