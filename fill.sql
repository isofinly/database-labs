-- Insert sample data into PEOPLE table
INSERT INTO people (name, age, occupation, hometown, height, weight)
VALUES ('John Doe', 30, 'Software Engineer', 'New York City', 1.80, 75),
('Jane Smith', 25, 'Data Analyst', 'Los Angeles', 1.65, 60),
('Bob Johnson', 40, 'Marketing Manager', 'Chicago', 1.75, 80),
('Sarah Lee', 28, 'Graphic Designer', 'San Francisco', 1.70, 65),
('Alex Kim', 35, 'Product Manager', 'Seattle', 1.85, 90);

-- Insert sample data into MEETING table
INSERT INTO meeting (date, info, start_time, end_time)
VALUES ('2023-05-24', 'Project Planning', '2023-05-24 09:00:00', '2023-05-24 10:30:00');
-- Insert sample data into the people table
INSERT INTO people (name, age, occupation, hometown)
VALUES ('John Doe', 30, 'Engineer', 'New York'),
       ('Jane Smith', 28, 'Manager', 'Los Angeles');

-- Insert sample data into the meeting table
INSERT INTO meeting (date, info, start_time, end_time)
VALUES ('2023-05-22', 'Team Meeting', '2023-05-22 10:00:00', '2023-05-22 11:00:00'),
       ('2023-05-23', 'Project Review', '2023-05-23 14:00:00', '2023-05-23 15:30:00');

-- Insert sample data into the attendance table
INSERT INTO attendance (person_id, meeting_id)
VALUES (1, 1),
       (2, 1),
       (1, 2);

-- Insert sample data into the building table
INSERT INTO building (name, address)
VALUES ('Office Building', '123 Main St');

-- Insert sample data into the room table
INSERT INTO room (building_id, floor_id, room_number, capacity)
VALUES (1, 1, 101, 10),
       (1, 1, 102, 15),
       (1, 2, 201, 8),
       (1, 2, 202, 12);

-- Insert sample data into the room_reservation table
INSERT INTO room_reservation (room_id, meeting_id)
VALUES (1, 1),
       (2, 2);
