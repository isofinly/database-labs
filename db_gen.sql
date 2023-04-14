-- Create PEOPLE table
CREATE TABLE people (
person_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
age INTEGER CHECK(age > 0),
occupation TEXT NOT NULL,
hometown TEXT NOT NULL,
height REAL CHECK(height > 0),
weight REAL CHECK(weight > 0)
);

-- Create MEETING table
CREATE TABLE meeting (
meeting_id SERIAL PRIMARY KEY,
date DATE NOT NULL,
info TEXT NOT NULL
);

-- Create ATTENDANCE table to represent many-to-many relationship between PEOPLE and MEETING entities
CREATE TABLE attendance (
attendance_id SERIAL PRIMARY KEY,
person_id INTEGER REFERENCES people(person_id) ON DELETE CASCADE,
meeting_id INTEGER REFERENCES meeting(meeting_id) ON DELETE CASCADE,
UNIQUE(person_id, meeting_id)
);

-- Create BUILDING table
CREATE TABLE building (
building_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
address TEXT NOT NULL,
capacity INTEGER CHECK(capacity > 0)
);

-- Create ROOM table to represent a room in a building
CREATE TABLE room (
    room_id SERIAL PRIMARY KEY,
    building_id INTEGER REFERENCES building(building_id) ON DELETE CASCADE,
    floor_id INTEGER NOT NULL,
    room_number INTEGER NOT NULL,
    capacity INTEGER CHECK(capacity > 0),
    UNIQUE(building_id, floor_id, room_number), -- Unique constraint on building, floor, and room number
    UNIQUE(floor_id, room_number)
);



-- Create ROOM_RESERVATION table to represent a reservation of a room for a meeting
CREATE TABLE room_reservation (
reservation_id SERIAL PRIMARY KEY,
room_id INTEGER REFERENCES room(room_id) ON DELETE CASCADE,
meeting_id INTEGER REFERENCES meeting(meeting_id) ON DELETE CASCADE,
start_time TIMESTAMP NOT NULL,
end_time TIMESTAMP NOT NULL,
UNIQUE(room_id, start_time),
UNIQUE(room_id, end_time)
);

-- Create RESIDENCE table to represent a person's residence in a room
CREATE TABLE residence (
    residence_id SERIAL PRIMARY KEY,
    person_id INTEGER REFERENCES people(person_id) ON DELETE CASCADE,
    room_id INTEGER REFERENCES room(room_id) ON DELETE CASCADE,
    UNIQUE(person_id, room_id)
);



CREATE TABLE thought (
thought_id SERIAL PRIMARY KEY,
person_id INTEGER REFERENCES people(person_id) ON DELETE CASCADE,
thought_text TEXT NOT NULL,
thought_timestamp TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Add foreign keys and constraints to ATTENDANCE table
ALTER TABLE attendance
ADD CONSTRAINT fk_attendance_person
FOREIGN KEY (person_id)
REFERENCES people(person_id)
ON DELETE CASCADE;

ALTER TABLE attendance
ADD CONSTRAINT fk_attendance_meeting
FOREIGN KEY (meeting_id)
REFERENCES meeting(meeting_id)
ON DELETE CASCADE;

-- Add foreign keys and constraints to ROOM_RESERVATION table
ALTER TABLE room_reservation
ADD CONSTRAINT fk_room_reservation_room
FOREIGN KEY (room_id)
REFERENCES room(room_id)
ON DELETE CASCADE;

ALTER TABLE room_reservation
ADD CONSTRAINT fk_room_reservation_meeting
FOREIGN KEY (meeting_id)
REFERENCES meeting(meeting_id)
ON DELETE CASCADE;

-- Add CHECK constraint to ROOM_RESERVATION table to ensure start_time is before end_time
ALTER TABLE room_reservation
ADD CONSTRAINT chk_start_time_before_end_time
CHECK (start_time < end_time);

-- Add a unique constraint to ROOM_RESERVATION table to ensure no overlapping reservations for the same room
ALTER TABLE room_reservation
ADD CONSTRAINT unique_room_reservation
UNIQUE (room_id, start_time, end_time);

ALTER TABLE thought
ADD CONSTRAINT chk_thought_text_not_empty
CHECK (thought_text <> '');

ALTER TABLE thought
ADD CONSTRAINT chk_thought_text_not_too_long
CHECK (length(thought_text) <= 1000);

ALTER TABLE room_reservation ADD CONSTRAINT check_start_time_before_end_time CHECK (start_time < end_time);
ALTER TABLE room_reservation ADD CONSTRAINT check_reservation_duration CHECK (end_time - start_time <= interval '8 hours');
