INSERT INTO users (name) VALUES ('John'), ('Jane'), ('Bob');

INSERT INTO managers (name) VALUES ('Manager A'), ('Manager B'), ('Manager C');

INSERT INTO bosses (name) VALUES ('Boss A'), ('Boss B'), ('Boss C');

INSERT INTO persons (name) VALUES ('Person A'), ('Person B'), ('Person C');

INSERT INTO idks (name) VALUES ('Item A'), ('Item B'), ('Item C');

INSERT INTO orders (user_id, created_at) VALUES (1, NOW()), (2, NOW()), (3, NOW());

INSERT INTO manager_orders (order_id, product_name, quantity, price) VALUES (1, 'Product A', 2, 10.00), (2, 'Product B', 1, 20.00), (3, 'Product C', 3, 30.00);

INSERT INTO payments (boss_payments, amount, created_at) VALUES (1, 50.00, NOW()), (2, 100.00, NOW()), (3, 150.00, NOW());

INSERT INTO thoughts (payment_id, amount, created_at) VALUES (1, 10.00, NOW()), (2, 20.00, NOW()), (3, 30.00, NOW());

INSERT INTO order_items_refunds (order_item_id) VALUES (1), (2), (3);