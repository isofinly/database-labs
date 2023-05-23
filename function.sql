-- Create the function
CREATE OR REPLACE FUNCTION assign_room_to_meeting()
  RETURNS TRIGGER AS $$
DECLARE
  free_room_id INTEGER;
  attendee_ids TEXT[];
BEGIN
  -- Find a free room for the meeting
  SELECT room_id
  INTO free_room_id
  FROM room
  WHERE room_id NOT IN (
    SELECT room_id
    FROM room_reservation
    JOIN meeting ON room_reservation.meeting_id = meeting.meeting_id
    WHERE (meeting.start_time, meeting.end_time) OVERLAPS (NEW.start_time, NEW.end_time)
  )
  LIMIT 1;

  -- If a free room is found, insert the reservation
  IF free_room_id IS NOT NULL THEN
    INSERT INTO room_reservation (room_id, meeting_id)
    VALUES (free_room_id, NEW.meeting_id);

    RAISE NOTICE 'Room assigned to meeting. Room ID: %, Meeting ID: %', free_room_id, NEW.meeting_id;

    -- Retrieve distinct attendee IDs within the past year in the same building
    SELECT ARRAY_AGG(DISTINCT person_id)
    INTO attendee_ids
    FROM attendance
    JOIN meeting ON attendance.meeting_id = meeting.meeting_id
    JOIN room_reservation ON meeting.meeting_id = room_reservation.meeting_id
    JOIN room ON room_reservation.room_id = room.room_id
    JOIN building ON room.building_id = building.building_id
    WHERE building.building_id = (SELECT building_id FROM room WHERE room_id = free_room_id)
      AND meeting.start_time >= (NEW.start_time - INTERVAL '1 year');

    -- Display the attendee IDs
    RAISE NOTICE 'Distinct Attendee IDs in the same building within the past year: %', attendee_ids;

  ELSE
    RAISE NOTICE 'No available rooms for the meeting. Meeting ID: %', NEW.meeting_id;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER meeting_insert_trigger
AFTER INSERT ON meeting
FOR EACH ROW
EXECUTE FUNCTION assign_room_to_meeting();
