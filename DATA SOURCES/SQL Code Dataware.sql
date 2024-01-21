-- Create Dim_guest table
CREATE TABLE Dim_guest (
    id_guest INT PRIMARY KEY,
    guest_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    adults INT,
    children INT,
    babies INT,
    nationality VARCHAR(50),
    is_reported_guest BIT,
    guest_type VARCHAR(50)
);

-- Create Dim_city table
CREATE TABLE Dim_city (
    id_city INT PRIMARY KEY,
    city VARCHAR(255),
    country VARCHAR(255)
);


-- Create Dim_date table
CREATE TABLE Dim_date (
    time_id INT PRIMARY KEY,
    time_date DATETIME,
    time_year INT,
    time_month INT,
    time_day INT,
    time_week INT
);

-- Create Dim_hotel table
CREATE TABLE Dim_hotel (
    id_hotel INT PRIMARY KEY,
    hotel_name VARCHAR(255)
);

-- Create Dim_agent table
CREATE TABLE Dim_agent (
    id_agent INT PRIMARY KEY,
    agent_name VARCHAR(255)
);

-- Create FACT_BOOKING table
CREATE TABLE FACT_BOOKING (
    id_booking INT PRIMARY KEY,
    id_hotel INT,
    id_agent INT,
    id_guest INT,
    id_city INT,
    is_canceled BIT,
    arrival_date DATETIME,
    stays_in_weekend_nights INT,
    stays_in_week_nights INT,
    distribution_channel VARCHAR(50),
    previous_cancellations INT,
    previous_bookings_not_canceled INT,
    reserved_room_type VARCHAR(10),
    booking_changes INT,
    deposit_type VARCHAR(50),
    adr DECIMAL(10, 2),
    reservation_status VARCHAR(50),
    reservation_status_date DATETIME,
    FOREIGN KEY (id_hotel) REFERENCES Dim_hotel(id_hotel),
    FOREIGN KEY (id_agent) REFERENCES Dim_agent(id_agent),
    FOREIGN KEY (id_guest) REFERENCES Dim_guest(id_guest),
    FOREIGN KEY (id_city) REFERENCES Dim_city(id_city)
);
