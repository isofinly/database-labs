
drop table if exists attendance cascade;
drop table if exists building cascade;
drop table if exists meeting cascade;
drop table if exists people cascade;
drop table if exists residence cascade;
drop table if exists room cascade;
drop table if exists room_reservation cascade;
drop table if exists thought cascade;

-- Create PEOPLE table
CREATE TABLE people (
person_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
age INTEGER CHECK(age > 0),
occupation TEXT NOT NULL,
hometown TEXT NOT NULL,
                    height real,
                    weight real
);

-- Create MEETING table
CREATE TABLE meeting (
meeting_id SERIAL PRIMARY KEY,
date DATE NOT NULL,
info TEXT NOT NULL,
start_time TIMESTAMP NOT NULL,
end_time TIMESTAMP NOT NULL
);

-- Create ATTENDANCE table to represent many-to-many relationship between PEOPLE and MEETING entities
CREATE TABLE attendance (
person_id INTEGER,
meeting_id INTEGER,
PRIMARY KEY (person_id, meeting_id),
FOREIGN KEY (person_id) REFERENCES people(person_id) ON DELETE CASCADE,
FOREIGN KEY (meeting_id) REFERENCES meeting(meeting_id) ON DELETE CASCADE
);

-- Create BUILDING table
CREATE TABLE building (
building_id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
address TEXT NOT NULL
);

-- Create ROOM table to represent a room in a building
CREATE TABLE room (
room_id SERIAL PRIMARY KEY,
building_id INTEGER,
floor_id INTEGER NOT NULL,
room_number INTEGER NOT NULL,
capacity INTEGER CHECK(capacity > 0),
UNIQUE (building_id, floor_id, room_number), -- Unique constraint on building, floor, and room number
FOREIGN KEY (building_id) REFERENCES building(building_id) ON DELETE CASCADE
);

-- Create ROOM_RESERVATION table to represent a reservation of a room for a meeting
CREATE TABLE room_reservation (
    reservation_id SERIAL PRIMARY KEY,
    room_id INTEGER,
    meeting_id INTEGER,
    FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE CASCADE,
    FOREIGN KEY (meeting_id) REFERENCES meeting(meeting_id) ON DELETE CASCADE,
    UNIQUE (meeting_id) -- Add a unique constraint on the meeting_id column
);

-- Create RESIDENCE table to represent a persons residence in a room
CREATE TABLE residence (
residence_id SERIAL PRIMARY KEY,
person_id INTEGER,
room_id INTEGER,
FOREIGN KEY (person_id) REFERENCES people(person_id) ON DELETE CASCADE,
FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE CASCADE
);

-- Create THOUGHT table
CREATE TABLE thought (
thought_id SERIAL PRIMARY KEY,
person_id INTEGER,
thought_text TEXT NOT NULL,
thought_timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
FOREIGN KEY (person_id) REFERENCES people(person_id) ON DELETE CASCADE
);
