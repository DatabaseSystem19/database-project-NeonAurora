-- PL/SQL

SET SERVEROUTPUT ON
DECLARE 
  my_variable VARCHAR2(100); 

BEGIN 
  my_variable := 'Hello, PL/SQL!'; 

  DBMS_OUTPUT.PUT_LINE(my_variable); 
END;
/

-- Insert and DELETE

DECLARE
  -- Declare variables
  v_station_id INT;
  v_station_name VARCHAR2(100);
  v_city VARCHAR2(100);
  v_operating_hours INT;
  v_contact VARCHAR2(50);
  v_email VARCHAR2(100);
  v_platform_info VARCHAR2(100);

BEGIN
  v_station_id := 7;
  v_station_name := 'Test Station';
  v_city := 'Test City';
  v_operating_hours := 24;
  v_contact := '987-654-3210';
  v_email := 'test@station.com';
  v_platform_info := 'Platform 99';

  INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
  VALUES (v_station_id, v_station_name, v_city, v_operating_hours, v_contact, v_email, v_platform_info);
  
  COMMIT;

  DELETE FROM station WHERE station_id = v_station_id;
  
  COMMIT;
  
END;
/

-- Display trains with their departure and arrival stations:

SET SERVEROUTPUT ON;
DECLARE 
  v_train_id INT;
  v_departure_station_name VARCHAR2(100);
  v_arrival_station_name VARCHAR2(100);
BEGIN
  FOR i IN (SELECT train_id, departure_station, arrival_station FROM schedule)
  LOOP
    v_train_id := i.train_id;
    SELECT station_name INTO v_departure_station_name FROM station WHERE station_id = i.departure_station;
    SELECT station_name INTO v_arrival_station_name FROM station WHERE station_id = i.arrival_station;
    DBMS_OUTPUT.PUT_LINE('Train ID: ' || v_train_id || ', Departure: ' || v_departure_station_name || ', Arrival: ' || v_arrival_station_name);
  END LOOP;
END;
/

-- Display the maintenance status of trains:

SET SERVEROUTPUT ON;
DECLARE 
  v_train_id INT;
  v_train_name VARCHAR2(100);
  v_maintenance_status VARCHAR2(50);
BEGIN
  FOR i IN (SELECT train_id, maintenance_status FROM maintenance)
  LOOP
    v_train_id := i.train_id;
    SELECT train_name INTO v_train_name FROM train WHERE train_id = v_train_id;
    v_maintenance_status := i.maintenance_status;
    DBMS_OUTPUT.PUT_LINE('Train: ' || v_train_name || ', Maintenance Status: ' || v_maintenance_status);
  END LOOP;
END;
/

-- Display the number of maintenance activities for each train:

SET SERVEROUTPUT ON;
DECLARE 
  v_train_id INT;
  v_train_name VARCHAR2(100);
  v_maintenance_count INT;
BEGIN
  FOR i IN (SELECT train_id FROM train)
  LOOP
    v_train_id := i.train_id;
    SELECT train_name INTO v_train_name FROM train WHERE train_id = v_train_id;
    SELECT COUNT(*) INTO v_maintenance_count FROM maintenance WHERE train_id = v_train_id;
    DBMS_OUTPUT.PUT_LINE('Train: ' || v_train_name || ', Number of Maintenance Activities: ' || v_maintenance_count);
  END LOOP;
END;
/

-- Display trains' routes (departure and arrival stations) and their operating days:

DECLARE 
  v_train_id INT;
  v_train_name VARCHAR2(100);
  v_departure_station_name VARCHAR2(100);
  v_arrival_station_name VARCHAR2(100);
  v_operating_days VARCHAR2(50);
BEGIN
  FOR i IN (SELECT train_id, departure_station, arrival_station FROM schedule)
  LOOP
    v_train_id := i.train_id;
    SELECT train_name, operating_days INTO v_train_name, v_operating_days FROM train WHERE train_id = v_train_id;
    SELECT station_name INTO v_departure_station_name FROM station WHERE station_id = i.departure_station;
    SELECT station_name INTO v_arrival_station_name FROM station WHERE station_id = i.arrival_station;
    DBMS_OUTPUT.PUT_LINE('Train: ' || v_train_name || ', Route: ' || v_departure_station_name || ' - ' || v_arrival_station_name || ', Operating Days: ' || v_operating_days);
  END LOOP;
END;
/

-- Display stations' platform information and the number of trains departing from them:

SET SERVEROUTPUT ON;
DECLARE 
  v_station_id INT;
  v_station_name VARCHAR2(100);
  v_platform_info VARCHAR2(100);
  v_departing_trains_count INT;
BEGIN
  FOR i IN (SELECT station_id FROM station)
  LOOP
    v_station_id := i.station_id;
    SELECT station_name, platform_info INTO v_station_name, v_platform_info FROM station WHERE station_id = v_station_id;
    SELECT COUNT(*) INTO v_departing_trains_count FROM schedule WHERE departure_station = v_station_id;
    DBMS_OUTPUT.PUT_LINE('Station: ' || v_station_name || ', Platform Information: ' || v_platform_info || ', Number of Departing Trains: ' || v_departing_trains_count);
  END LOOP;
END;
/

-- Determining train speed fast or slow

SET SERVEROUTPUT ON;
DECLARE
    v_train_id INT;
    v_train_name VARCHAR2(100);
    v_speed NUMBER(5,2);
    CURSOR train_cursor IS
        SELECT train_id, train_name, speed FROM train;
BEGIN
    OPEN train_cursor;
    LOOP
        FETCH train_cursor INTO v_train_id, v_train_name, v_speed;
        EXIT WHEN train_cursor%NOTFOUND;
        IF v_speed > 150 THEN
            DBMS_OUTPUT.PUT_LINE('Train ID: ' || v_train_id || ', Name: ' || v_train_name || ' is fast.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Train ID: ' || v_train_id || ', Name: ' || v_train_name || ' is slow.');
        END IF;
    END LOOP;
    CLOSE train_cursor;
END;
/

-- Procedure and Array With Extend FUNCTION

SET SERVEROUTPUT ON;
DECLARE 
  TYPE train_array_type IS VARRAY(10) OF VARCHAR2(100);
  train_array train_array_type := train_array_type();
  v_counter NUMBER := 1;
  
  PROCEDURE add_train(p_train_name IN VARCHAR2) IS
  BEGIN
    train_array.EXTEND;
    train_array(v_counter) := p_train_name;
    v_counter := v_counter + 1;
  END;
  
BEGIN
  add_train('Train 1');
  add_train('Train 2');
  add_train('Train 3');
  
  FOR i IN 1..train_array.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Train Name: ' || train_array(i));
  END LOOP;
END;
/
