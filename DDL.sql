CREATE TABLE train
(
    train_id INT PRIMARY KEY,
    train_name VARCHAR(100),
    capacity INT,
    speed NUMBER(5,2),
    train_type VARCHAR(50),
    class VARCHAR(50),
    fare NUMBER(8,2),
    operating_days VARCHAR(100),
    duration INT
);

CREATE TABLE station
(
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    city VARCHAR(100),
    operating_hours INT,
    contact VARCHAR(50),
    email VARCHAR(100),
    platform_info VARCHAR(100)
);

CREATE TABLE schedule
(
    schedule_id INT PRIMARY KEY,
    train_id INT,
    route_id INT,
    departure_station INT,
    departure_time TIMESTAMP,
    arrival_station INT,
    arrival_time TIMESTAMP,
    travel_time INT,
    FOREIGN KEY (train_id) REFERENCES train(train_id),
    FOREIGN KEY (departure_station) REFERENCES station(station_id),
    FOREIGN KEY (arrival_station) REFERENCES station(station_id)
);

CREATE TABLE maintenance
(
    maintenance_id INT PRIMARY KEY,
    train_id INT,
    station_id INT,
    maintenance_type VARCHAR(100),
    duration INT,
    maintenance_status VARCHAR(50),
    FOREIGN KEY (train_id) REFERENCES train(train_id),
    FOREIGN KEY (station_id) REFERENCES station(station_id)
);

CREATE TABLE destination
(
    train_id INT,
    station_id INT,
    PRIMARY KEY (train_id, station_id),
    FOREIGN KEY (train_id) REFERENCES train(train_id),
    FOREIGN KEY (station_id) REFERENCES station(station_id)
);

CREATE TABLE source_station
(
    train_id INT,
    station_id INT,
    PRIMARY KEY (train_id, station_id),
    FOREIGN KEY (train_id) REFERENCES train(train_id),
    FOREIGN KEY (station_id) REFERENCES station(station_id)
);



ALTER TABLE train 
ADD (additional_info VARCHAR2(100));

ALTER TABLE train
RENAME COLUMN additional_info TO extra_info;

ALTER TABLE train
DROP COLUMN extra_info;
