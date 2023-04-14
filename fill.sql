-- Insert sample data into PEOPLE table
INSERT INTO people (name, age, occupation, hometown, height, weight)
VALUES ('John Doe', 30, 'Software Engineer', 'New York City', 1.80, 75),
('Jane Smith', 25, 'Data Analyst', 'Los Angeles', 1.65, 60),
('Bob Johnson', 40, 'Marketing Manager', 'Chicago', 1.75, 80),
('Sarah Lee', 28, 'Graphic Designer', 'San Francisco', 1.70, 65),
('Alex Kim', 35, 'Product Manager', 'Seattle', 1.85, 90);

-- Insert sample data into MEETING table
INSERT INTO meeting (date, info)
VALUES ('2022-04-10', 'Team Meeting'),
('2022-05-15', 'Client Presentation'),
('2022-06-20', 'Budget Planning'),
('2022-07-25', 'Quarterly Review'),
('2022-08-30', 'Product Launch');

-- Insert sample data into BUILDING table
INSERT INTO building (name, address, capacity)
VALUES ('Office Tower A', '123 Main St, New York City', 100),
('Office Tower B', '456 2nd Ave, Chicago', 150),
('Tech Hub', '789 Market St, San Francisco', 200);

-- Insert sample data into ROOM table
INSERT INTO room (building_id, floor_id, room_number, capacity)
VALUES (1, 10, 101, 10),
(1, 10, 102, 10),
(1, 11, 201, 20),
(1, 11, 202, 20);

INSERT INTO room_reservation (room_id, meeting_id, start_time, end_time)
VALUES
(1, 1, '2022-01-01 10:00:00', '2022-01-01 11:00:00'),
(2, 2, '2022-02-14 14:00:00', '2022-02-14 16:00:00'),
(3, 3, '2022-04-15 09:00:00', '2022-04-15 10:00:00'),
(4, 4, '2022-07-04 12:00:00', '2022-07-04 14:00:00');

-- Insert sample data into ATTENDANCE table
INSERT INTO attendance (person_id, meeting_id)
VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 2),
(4, 4);

-- Insert sample data into RESIDENCE table
INSERT INTO residence (person_id, room_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO thought (person_id, thought_text, thought_timestamp) VALUES
(1, 'I really enjoyed that meeting today', '2022-01-01 10:30:00'),
(2, 'I need to remember to follow up with that client', '2022-01-01 11:45:00'),
(3, 'I wish we could have more meetings like that one', '2022-01-01 13:00:00'),
(1, 'I need to make a grocery list for this week', '2022-01-02 09:00:00'),
(2, 'I should schedule some time to review my goals for the year', '2022-01-02 10:30:00'),
(3, 'I feel like I''m making progress on this project', '2022-01-02 12:00:00');