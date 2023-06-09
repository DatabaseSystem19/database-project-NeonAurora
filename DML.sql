-- INSERTION

-- Inserting into Train TABLE

INSERT INTO train (train_id, train_name, capacity, speed, train_type, class, fare, operating_days, duration) 
VALUES (1, 'Express 101', 200, 100.25, 'Express', 'First Class', 100.50, 'Mon,Tue,Wed,Thu,Fri', 120);

INSERT INTO train (train_id, train_name, capacity, speed, train_type, class, fare, operating_days, duration) 
VALUES (2, 'Rapid 202', 300, 150.75, 'Rapid', 'Business', 150.75, 'Mon,Wed,Fri', 90);

INSERT INTO train (train_id, train_name, capacity, speed, train_type, class, fare, operating_days, duration) 
VALUES (3, 'Fast 303', 250, 130.50, 'Fast', 'Economy', 75.25, 'Tue,Thu,Sat', 110);

INSERT INTO train (train_id, train_name, capacity, speed, train_type, class, fare, operating_days, duration) 
VALUES (4, 'Superfast 404', 350, 200.50, 'Superfast', 'Premium', 200.00, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun', 150);

INSERT INTO train (train_id, train_name, capacity, speed, train_type, class, fare, operating_days, duration) 
VALUES (5, 'Bullet 505', 400, 250.75, 'Bullet', 'Business', 250.00, 'Mon,Wed,Fri,Sun', 80);

INSERT INTO train (train_id, train_name, capacity, speed, train_type, class, fare, operating_days, duration) 
VALUES (6, 'Metro 606', 500, 180.25, 'Metro', 'Economy', 50.00, 'Mon,Tue,Wed,Thu,Fri', 60);

-- Inserting into Station TABLE

INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
VALUES (1, 'Central Station', 'New York', 24, '123-456-7890', 'central@station.com', 'Platforms 1-10');

INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
VALUES (2, 'West End Station', 'Los Angeles', 24, '234-567-8901', 'westend@station.com', 'Platforms 11-20');

INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
VALUES (3, 'North Pole Station', 'Chicago', 24, '345-678-9012', 'northpole@station.com', 'Platforms 21-30');

INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
VALUES (4, 'South Park Station', 'Houston', 24, '456-789-0123', 'southpark@station.com', 'Platforms 31-40');

INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
VALUES (5, 'East Side Station', 'Philadelphia', 24, '567-890-1234', 'eastside@station.com', 'Platforms 41-50');

INSERT INTO station (station_id, station_name, city, operating_hours, contact, email, platform_info)
VALUES (6, 'Downtown Station', 'Phoenix', 24, '678-901-2345', 'downtown@station.com', 'Platforms 51-60');

-- Insert into Schedule TABLE

INSERT INTO schedule (schedule_id, train_id, route_id, departure_station, departure_time, arrival_station, arrival_time, travel_time) 
VALUES (1, 1, 101, 1, TO_TIMESTAMP('2023-05-24 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, TO_TIMESTAMP('2023-05-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 120);

INSERT INTO schedule (schedule_id, train_id, route_id, departure_station, departure_time, arrival_station, arrival_time, travel_time) 
VALUES (2, 2, 202, 2, TO_TIMESTAMP('2023-05-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, TO_TIMESTAMP('2023-05-24 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 150);

INSERT INTO schedule (schedule_id, train_id, route_id, departure_station, departure_time, arrival_station, arrival_time, travel_time) 
VALUES (3, 3, 303, 3, TO_TIMESTAMP('2023-05-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, TO_TIMESTAMP('2023-05-24 14:10:00', 'YYYY-MM-DD HH24:MI:SS'), 190);

INSERT INTO schedule (schedule_id, train_id, route_id, departure_station, departure_time, arrival_station, arrival_time, travel_time) 
VALUES (4, 4, 404, 4, TO_TIMESTAMP('2023-05-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, TO_TIMESTAMP('2023-05-24 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 210);

INSERT INTO schedule (schedule_id, train_id, route_id, departure_station, departure_time, arrival_station, arrival_time, travel_time) 
VALUES (5, 5, 505, 5, TO_TIMESTAMP('2023-05-24 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, TO_TIMESTAMP('2023-05-24 16:20:00', 'YYYY-MM-DD HH24:MI:SS'), 200);

INSERT INTO schedule (schedule_id, train_id, route_id, departure_station, departure_time, arrival_station, arrival_time, travel_time) 
VALUES (6, 6, 606, 6, TO_TIMESTAMP('2023-05-24 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, TO_TIMESTAMP('2023-05-24 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 120);

-- Insert into Maintenance TABLE

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (1, 1, 1, 'Engine Overhaul', 120, 'Scheduled');

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (2, 2, 2, 'Wheel Alignment', 90, 'Completed');

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (3, 3, 3, 'Brake Check', 60, 'Pending');

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (4, 4, 4, 'General Inspection', 180, 'In Progress');

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (5, 5, 5, 'Electrical Systems', 240, 'Scheduled');

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (6, 6, 6, 'Air Conditioning', 120, 'Completed');

-- Insert into Destination Table:

INSERT INTO destination (train_id, station_id)
VALUES (1, 2);

INSERT INTO destination (train_id, station_id)
VALUES (2, 3);

INSERT INTO destination (train_id, station_id)
VALUES (3, 4);

INSERT INTO destination (train_id, station_id)
VALUES (4, 5);

INSERT INTO destination (train_id, station_id)
VALUES (5, 6);

INSERT INTO destination (train_id, station_id)
VALUES (6, 1);

-- Insert into Source Table:

INSERT INTO source_station (train_id, station_id)
VALUES (1, 1);

INSERT INTO source_station (train_id, station_id)
VALUES (2, 2);

INSERT INTO source_station (train_id, station_id)
VALUES (3, 3);

INSERT INTO source_station (train_id, station_id)
VALUES (4, 4);

INSERT INTO source_station (train_id, station_id)
VALUES (5, 5);

INSERT INTO source_station (train_id, station_id)
VALUES (6, 6);


-- QUERIES

-- update data into train

update train set speed = 125.75 where train_id = 2;

-- delete data into maintenance

INSERT INTO maintenance (maintenance_id, train_id, station_id, maintenance_type, duration, maintenance_status)
VALUES (7, 1, 1, 'Testing', 30, 'Completed');

delete from maintenance where maintenance_id = 7;

-- Union, Intersection, Exception

-- UNION

SELECT station_id FROM source_station
UNION
SELECT station_id FROM destination;

-- Intersection

SELECT station_id FROM source_station
INTERSECT
SELECT station_id FROM destination;

-- Exception

SELECT station_id FROM source_station
MINUS
SELECT station_id FROM destination;

-- CLAUSE

SELECT * 
FROM train 
WHERE operating_days = 'Mon,Tue,Wed,Thu,Fri' AND capacity > 200;

-- Aggregate

select count(*) from train;
select count(train_name) as number_of_train from train;
select count(distinct train_name) as number_of_train from train;
select avg(fare) from train;
select sum(fare) from train;
select max(fare) from train;
select min(fare) from train;

-- Group by and HAVING

select class,avg(speed) from train group by class;
select class,avg(speed) from train group by class having avg(speed) > 150;

-- Nested SUBQUERY

SELECT train_id, train_name, capacity 
FROM train
WHERE capacity = (
    SELECT MAX(capacity) FROM train
);

-- Set Membership

-- AND

SELECT train_id, train_name, capacity 
FROM train
WHERE capacity = (
    SELECT MAX(capacity) 
    FROM train
    WHERE operating_days = 'Mon,Tue,Wed,Thu,Fri'
) AND operating_days = 'Mon,Tue,Wed,Thu,Fri';

-- OR

SELECT train_id, train_name, capacity 
FROM train
WHERE capacity = (
    SELECT MAX(capacity) 
    FROM train
    WHERE operating_days = 'Mon,Tue,Wed,Thu,Fri'
) OR operating_days = 'Mon,Tue,Wed,Thu,Fri';

-- NOT

SELECT train_id, train_name, operating_days 
FROM train
WHERE operating_days NOT LIKE 'Mon,Tue,Wed,Thu,Fri';

-- SOME

SELECT station_id, station_name, operating_hours
FROM station s1
WHERE operating_hours > SOME (
    SELECT operating_hours
    FROM station s2
    WHERE s2.city = 'New York'
);

-- ALL

SELECT station_id, station_name, operating_hours
FROM station s1
WHERE operating_hours > ALL (
    SELECT operating_hours
    FROM station s2
    WHERE s2.city = 'New York'
);

-- Exists

SELECT station_id, station_name, city
FROM station s
WHERE EXISTS (
    SELECT 1
    FROM schedule sch
    WHERE sch.departure_station = s.station_id
);

-- UNIQUE

-- Nowadays it is recommended to use distince instead of using unique

-- String Operations

SELECT station_name, city
FROM station
WHERE station_name LIKE '_entral%';

-- Join OPERATIONS

-- Natural JOIN

SELECT *
FROM train
NATURAL JOIN schedule;

-- Inner JOIN

SELECT train.train_id, train.train_name, schedule.departure_time, schedule.arrival_time
FROM train
INNER JOIN schedule ON train.train_id = schedule.train_id;

-- Left outer JOIN

SELECT train.train_id, train.train_name, schedule.departure_time, schedule.arrival_time
FROM train
LEFT JOIN schedule ON train.train_id = schedule.train_id;

-- Right Outer JOIN

SELECT train.train_id, train.train_name, schedule.departure_time, schedule.arrival_time
FROM train
RIGHT JOIN schedule ON train.train_id = schedule.train_id;

-- Full Outer JOIN

SELECT train.train_id, train.train_name, schedule.departure_time, schedule.arrival_time
FROM train
FULL JOIN schedule ON train.train_id = schedule.train_id;

-- VIEWS
CREATE VIEW station_view AS
SELECT station_id, station_name, city
FROM station;

SELECT * 
FROM station_view;

-- Constraints

ALTER TABLE station
ADD CONSTRAINT UNQ_Email
UNIQUE (email);



-- THE END




