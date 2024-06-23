create database hotel_booking;

\c hotel_booking;

-- Create the hotels table
CREATE TABLE hotels (
    hotel_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Create the rooms table
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    hotel_id INT NOT NULL REFERENCES hotels(hotel_id),
    room_type VARCHAR(50) NOT NULL,
    room_class VARCHAR(50) NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    room_price DECIMAL(10, 2) NOT NULL,
    capacity INT NOT NULL,
    UNIQUE (hotel_id, room_number)
);

-- Create the customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20)NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Create the bookings table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    hotel_id INT NOT NULL REFERENCES hotels(hotel_id),
    room_id INT NOT NULL REFERENCES rooms(room_id),
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL
);

-- Create the payments table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES bookings(booking_id),
    payment_method VARCHAR(50) NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

-- Insert data into hotels table
INSERT INTO hotels (name, address, city, country)
VALUES
    ('Hilton Hanoi Opera', '1 Le Thanh Tong St, Hoan Kiem Dist', 'Hanoi', 'Vietnam'),
    ('Intercontinental Saigon', '3 Lam Son Square, Ben Nghe Ward, Dist 1', 'Ho Chi Minh City', 'Vietnam'),
    ('Vinpearl Resort & Spa Nha Trang', 'Hon Tre Island', 'Nha Trang', 'Vietnam'),
    ('JW Marriott Phu Quoc Emerald Bay', 'Khu nghĩ dưỡng Vinpearl Bai Dai', 'Phu Quoc', 'Vietnam'),
    ('Sofitel Legend Metropole Hanoi', '15 Ngo Quyen St, Hoan Kiem Dist', 'Hanoi', 'Vietnam'),

    ('The Plaza New York', '768 5th Ave', 'New York City', 'United States'),
    ('The Ritz-Carlton Chicago', '160 E Pearson St', 'Chicago', 'United States'),
    ('The Beverly Hills Hotel', '9641 Sunset Blvd', 'Beverly Hills', 'United States'),
    ('The Breakers Palm Beach', '1 S County Rd', 'Palm Beach', 'United States'),
    ('The St. Regis San Francisco', '125 3rd St', 'San Francisco', 'United States'),

    ('The Ritz London', '150 Piccadilly', 'London', 'United Kingdom'),
    ('The Savoy', 'Strand', 'London', 'United Kingdom'),
    ('The Dorchester', '53 Park Ln', 'London', 'United Kingdom'),
    ('The Balmoral', '1 Princes St', 'Edinburgh', 'United Kingdom'),
    ('The Stafford London', '16-18 St James's Pl', 'London', 'United Kingdom'),

    ('Hotel de Paris Monte-Carlo', 'Place du Casino', 'Monte Carlo', 'Monaco'),
    ('Hotel Metropole Monte-Carlo', '4 Av de la Madone', 'Monte Carlo', 'Monaco'),
    ('Fairmont Monte Carlo', '12 Av des Spélugues', 'Monte Carlo', 'Monaco'),
    ('Hotel Hermitage Monte-Carlo', 'Square Beaumarchais', 'Monte Carlo', 'Monaco'),
    ('Monte-Carlo Bay Hotel & Resort', '40 Av Princesse Grace', 'Monte Carlo', 'Monaco'),

    ('Burj Al Arab Jumeirah', 'Jumeirah St', 'Dubai', 'United Arab Emirates'),
    ('Atlantis The Palm', 'Crescent Rd', 'Dubai', 'United Arab Emirates'),
    ('Jumeirah Beach Hotel', 'Jumeirah Beach Rd', 'Dubai', 'United Arab Emirates'),
    ('Palazzo Versace Dubai', 'Al Jaddaf', 'Dubai', 'United Arab Emirates'),
    ('Armani Hotel Dubai', 'Burj Khalifa', 'Dubai', 'United Arab Emirates'),

    ('Four Seasons Hotel George V Paris', '31 Av George V', 'Paris', 'France'),
    ('Le Bristol Paris', '112 Rue du Faubourg Saint-Honoré', 'Paris', 'France'),
    ('Hôtel Plaza Athénée', '25 Av Montaigne', 'Paris', 'France'),
    ('Le Meurice', '228 Rue de Rivoli', 'Paris', 'France'),
    ('Park Hyatt Paris-Vendome', '5 Rue de la Paix', 'Paris', 'France'),

    ('Mandarin Oriental Milan', 'Via Andegari 9', 'Milan', 'Italy'),
    ('Hotel Danieli Venice', 'Riva degli Schiavoni 4196', 'Venice', 'Italy'),
    ('Hotel Hassler Roma', 'Piazza della Trinità dei Monti 6', 'Rome', 'Italy'),
    ('Hotel Cala di Volpe', 'Costa Smeralda', 'Porto Cervo', 'Italy'),
    ('Belmond Hotel Splendido', 'Salita Borgo 16', 'Portofino', 'Italy'),

    ('Atlantis Paradise Island', 'Paradise Beach Dr', 'Paradise Island', 'Bahamas'),
    ('The Ocean Club', 'Paradise Island Drive', 'Paradise Island', 'Bahamas'),
    ('Grand Hyatt Baha Mar', 'Baha Mar Blvd', 'Nassau', 'Bahamas'),
    ('Rosewood Baha Mar', 'Baha Mar Blvd', 'Nassau', 'Bahamas'),
    ('The Cove Atlantis', 'Paradise Beach Dr', 'Paradise Island', 'Bahamas'),

    ('The Peninsula Hong Kong', 'Salisbury Rd', 'Hong Kong', 'Hong Kong'),
    ('The Upper House', 'Pacific Pl', 'Hong Kong', 'Hong Kong'),
    ('The Landmark Mandarin Oriental', '15 Queen's Rd Central', 'Hong Kong', 'Hong Kong'),
    ('Rosewood Hong Kong', 'Victoria Dockside', 'Hong Kong', 'Hong Kong'),
    ('The St. Regis Hong Kong', '1 Harbour Dr', 'Hong Kong', 'Hong Kong'),

    ('Oberoi Udaivilas', '1 Haridasji Ki Magri', 'Udaipur', 'India'),
    ('The Leela Palace Udaipur', 'Lake Pichola', 'Udaipur', 'India'),
    ('The Oberoi Amarvilas', 'Taj East Gate Rd', 'Agra', 'India'),
    ('Umaid Bhawan Palace', 'Circuit House Rd', 'Jodhpur', 'India'),
    ('The Oberoi Rajvilas', 'Goner Rd', 'Jaipur', 'India'),

    ('The Peninsula Tokyo', '1-8-1 Yurakucho', 'Tokyo', 'Japan'),
    ('The Ritz-Carlton Tokyo', '9-7-1 Akasaka', 'Tokyo', 'Japan'),
    ('Palace Hotel Tokyo', '1-1-1 Marunouchi', 'Tokyo', 'Japan'),
    ('Aman Tokyo', '1-5-6 Otemachi', 'Tokyo', 'Japan'),
    ('Mandarin Oriental Tokyo', '2-1-1 Muromachi', 'Tokyo', 'Japan'),

    ('Four Seasons Resort Bora Bora', 'Motu Teheru', 'Bora Bora', 'French Polynesia'),
    ('The St. Regis Bora Bora Resort', 'Motu Ome'e', 'Bora Bora', 'French Polynesia'),
    ('The Brando', 'Tetiaroa Atoll', 'Tetiaroa', 'French Polynesia'),
    ('InterContinental Bora Bora Resort & Thalasso Spa', 'Motu Piti Aau', 'Bora Bora', 'French Polynesia'),
    ('Conrad Bora Bora Nui', 'Motu To'opua', 'Bora Bora', 'French Polynesia');

-- Insert data into rooms table
-- Create a sequence for generating room numbers
CREATE SEQUENCE room_number_seq
    START WITH 101
    INCREMENT BY 1;

-- Create an array of room types and their capacities
CREATE TEMPORARY TABLE room_types (
    room_type VARCHAR(50),
    capacity INT
);

INSERT INTO room_types (room_type, capacity)
VALUES
    ('Single', 2),
    ('Single', 2),
    ('Single', 2),
    ('Double', 4),
    ('Double', 4),
    ('Double', 4),
    ('Double', 4),
    ('Double', 4),
    ('King', 4),
    ('King', 4);

-- Insert rooms for each hotel
DO $$
DECLARE
    hotel_id INT;
    room_type VARCHAR(50);
    room_class VARCHAR(50);
    room_number VARCHAR(10);
    room_price DECIMAL(10, 2);
    capacity INT;
BEGIN
    FOR hotel_id IN (SELECT hotel_id FROM hotels ORDER BY hotel_id)
    LOOP
        -- Standard rooms
        FOR i IN 1..5 LOOP
            room_type := (SELECT room_type FROM room_types ORDER BY RANDOM() LIMIT 1);
            capacity := (SELECT capacity FROM room_types WHERE room_types.room_type = room_type);
            room_number := LPAD(NEXTVAL('room_number_seq')::TEXT, 3, '0');
            room_price := (CASE WHEN i = 1 THEN 100 WHEN i = 2 THEN 110 WHEN i = 3 THEN 120 WHEN i = 4 THEN 130 ELSE 140 END);
            INSERT INTO rooms (hotel_id, room_type, room_class, room_number, room_price, capacity)
            VALUES (hotel_id, room_type, 'Standard', room_number, room_price, capacity);
        END LOOP;

        -- Deluxe rooms
        FOR i IN 1..3 LOOP
            room_type := (SELECT room_type FROM room_types ORDER BY RANDOM() LIMIT 1);
            capacity := (SELECT capacity FROM room_types WHERE room_types.room_type = room_type);
            room_number := LPAD(NEXTVAL('room_number_seq')::TEXT, 3, '0');
            room_price := (CASE WHEN i = 1 THEN 200 WHEN i = 2 THEN 220 ELSE 240 END);
            INSERT INTO rooms (hotel_id, room_type, room_class, room_number, room_price, capacity)
            VALUES (hotel_id, room_type, 'Deluxe', room_number, room_price, capacity);
        END LOOP;

        -- Suite rooms
        FOR i IN 1..2 LOOP
            room_type := (SELECT room_type FROM room_types ORDER BY RANDOM() LIMIT 1);
            capacity := (SELECT capacity FROM room_types WHERE room_types.room_type = room_type);
            room_number := LPAD(NEXTVAL('room_number_seq')::TEXT, 3, '0');
            room_price := (CASE WHEN i = 1 THEN 300 ELSE 320 END);
            INSERT INTO rooms (hotel_id, room_type, room_class, room_number, room_price, capacity)
            VALUES (hotel_id, room_type, 'Suite', room_number, room_price, capacity);
        END LOOP;
    END LOOP;
END $$;

-- Drop the temporary table and sequence
DROP TABLE room_types;
DROP SEQUENCE room_number_seq;

-- Insert data into customers table
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
('Bob', 'Johnson', 'bob.johnson@example.com', '1112223333'),
('Alice', 'Williams', 'alice.williams@example.com', '4445556666'),
('Charlie', 'Brown', 'charlie.brown@example.com', '7778889999'),
('Dave', 'Wilson', 'dave.wilson@example.com', '1231231234'),
('Eve', 'Davis', 'eve.davis@example.com', '3213214321'),
('Frank', 'Miller', 'frank.miller@example.com', '5556667777'),
('Grace', 'Taylor', 'grace.taylor@example.com', '8889990000'),
('Hank', 'Anderson', 'hank.anderson@example.com', '0001112222');

-- Insert data into bookings table
INSERT INTO bookings (customer_id, hotel_id, room_id, check_in_date, check_out_date, total_price) VALUES
(1, 1, 2, '2023-06-01', '2023-06-05', 800.00),
(2, 1, 2, '2023-06-10', '2023-06-15', 1750.00),
(3, 2, 3, '2023-07-01', '2023-07-05', 600.00),
(4, 2, 4, '2023-07-10', '2023-07-15', 2000.00),
(5, 3, 5, '2023-08-01', '2023-08-05', 720.00),
(6, 3, 6, '2023-08-10', '2023-08-15', 1500.00),
(7, 4, 7, '2023-09-01', '2023-09-05', 1800.00),
(8, 4, 8, '2023-09-10', '2023-09-15', 1000.00),
(9, 5, 9, '2023-10-01', '2023-10-05', 960.00),
(10, 5, 10, '2023-10-10', '2023-10-15', 2500.00),
(4, 2, 4, '2024-06-05', '2024-06-15', 2000.00);


-- Insert data into payments table
INSERT INTO payments (booking_id, payment_method, payment_date, amount) VALUES
(1, 'Credit Card', '2023-05-30', 800.00),
(2, 'Credit Card', '2023-06-08', 1750.00),
(3, 'PayPal', '2023-06-28', 600.00),
(4, 'Credit Card', '2023-07-08', 2000.00),
(5, 'Credit Card', '2023-07-28', 720.00),
(6, 'Debit Card', '2023-08-08', 1500.00),
(7, 'Credit Card', '2023-08-28', 1800.00),
(8, 'PayPal', '2023-09-08', 1000.00),
(9, 'Credit Card', '2023-09-28', 960.00),
(10, 'Debit Card', '2023-10-08', 2500.00);