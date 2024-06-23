create database hotel_booking_2;
\c hotel_booking_2;
drop database hotel_booking;
create database hotel_booking;
\c hotel_booking;
drop database hotel_booking_2;


-- Create the hotels table
CREATE TABLE hotels (
    hotel_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5)
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

--Hotel
INSERT INTO hotels (rating, name, address, city, country) VALUES
( 4, 'Khách sạn Melia Hà Nội'               , '44B Lý Thường Kiệt, Trần Hưng Đạo, Hoàn Kiếm'    , 'Hà Nội'      , 'Vietnam'),
( 4, 'Khách sạn Lotte Hà Nội'               , '54 Liễu Giai, Cống Vị, Ba Đình'                  , 'Hà Nội'      , 'Vietnam'),
( 4, 'Khách sạn Sofitel Legend Metropole'   , '15 Ngô Quyền, Hoàn Kiếm'                         , 'Hà Nội'      , 'Vietnam'),
( 5, 'Khách sạn JW Marriott Hà Nội'         , '8 Đỗ Đức Dục, Mễ Trì, Nam Từ Liêm'               , 'Hà Nội'      , 'Vietnam'),
( 5, 'Khách sạn Pan Pacific Hà Nội'         , '1 Thanh Niên, Trúc Bạch, Ba Đình'                , 'Hà Nội'      , 'Vietnam'),
( 3, 'Khách sạn Rex'                        , '141 Nguyễn Huệ, Bến Nghé, Quận 1'                , 'Hồ Chí Minh' , 'Vietnam'),
( 5, 'Khách sạn InterContinental Đà Nẵng'   , 'Bãi Bắc, Sơn Trà'                                , 'Đà Nẵng'     , 'Vietnam'),
( 3, 'Khách sạn Vinpearl Nha Trang'         , 'Hon Tre Island'                                  , 'Nha Trang'   , 'Vietnam'),
( 3, 'Khách sạn Imperial Huế'               , '8 Hùng Vương'                                    , 'Huế'         , 'Vietnam'),
( 3, 'Khách sạn Victoria Cần Thơ'           , 'Cái Khế, Ninh Kiều'                              , 'Cần Thơ'     , 'Vietnam');

DO $$
DECLARE
    hotel_id INT;
    room_class TEXT[] := ARRAY['Standard', 'Deluxe', 'Suite'];
    room_type TEXT[] := ARRAY['Single', 'Double', 'King'];
    room_price DECIMAL(10,2);
    capacity INT[] := ARRAY[2, 4, 4];
BEGIN
    FOR hotel_id IN 1..10 LOOP
        FOR i IN 1..3 LOOP -- Room class
            FOR j IN 1..3 LOOP -- Room type
                room_price := 50.00 + (i - 1) * 50 + (j - 1) * 25;
                INSERT INTO rooms (hotel_id, room_type, room_class, room_number, room_price, capacity) VALUES
                (hotel_id, room_type[j], room_class[i], hotel_id || '' || i-1 || j-1, room_price, capacity[j]);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

--Customers
INSERT INTO customers (first_name, last_name, email, phone, city) VALUES
('Nguyễn', 'Văn A', 'nguyenvana@example.com', '0901234567', 'Hà Nội'),
('Trần', 'Thị B', 'tranthib@example.com', '0901234568', 'Hà Nội'),
('Lê', 'Văn C', 'levanc@example.com', '0901234569', 'Hà Nội'),
('Phạm', 'Thị D', 'phamthid@example.com', '0901234570', 'Hà Nội'),
('Hoàng', 'Văn E', 'hoangvane@example.com', '0901234571', 'Hà Nội'),
('Vũ', 'Thị F', 'vuthif@example.com', '0901234572', 'Hà Nội'),
('Đỗ', 'Văn G', 'dovang@example.com', '0901234573', 'Hà Nội'),
('Ngô', 'Thị H', 'ngothih@example.com', '0901234574', 'Hà Nội'),
('Dương', 'Văn I', 'duongvani@example.com', '0901234575', 'Hà Nội'),
('Nguyễn', 'Thị J', 'nguyenthij@example.com', '0901234576', 'Hà Nội'),
('Phạm', 'Văn K', 'phamvank@example.com', '0901234577', 'Hà Nội'),
('Bùi', 'Thị L', 'buithil@example.com', '0901234578', 'Hà Nội'),
('Nguyễn', 'Văn M', 'nguyenvanm@example.com', '0901234579', 'Hà Nội'),
('Lê', 'Thị N', 'lethin@example.com', '0901234580', 'Hà Nội'),
('Trần', 'Văn O', 'tranvano@example.com', '0901234581', 'Hà Nội'),
('Đinh', 'Thị P', 'dinhthip@example.com', '0901234582', 'Hà Nội'),
('Ngô', 'Văn Q', 'ngovanq@example.com', '0901234583', 'Hà Nội'),
('Phạm', 'Thị R', 'phamthir@example.com', '0901234584', 'Hà Nội'),
('Nguyễn', 'Văn S', 'nguyenvans@example.com', '0901234585', 'Hà Nội'),
('Đỗ', 'Thị T', 'dothit@example.com', '0901234586', 'Hà Nội');


-- Insert bookings with varying lengths and dates between May 2024 and July 2024
INSERT INTO bookings (customer_id, hotel_id, room_id, check_in_date, check_out_date, total_price) VALUES
    (1, 1, 17, '2024-05-01', '2024-05-03', 200.00),
    (1, 1, 42, '2024-06-10', '2024-06-12', 200.00),
    (2, 2, 88, '2024-05-02', '2024-05-04', 300.00),
    (2, 2, 26, '2024-07-01', '2024-07-03', 200.00),
    (3, 3, 63, '2024-05-03', '2024-05-05', 300.00),
    (4, 4, 5, '2024-05-04', '2024-05-08', 500.00),
    (5, 5, 39, '2024-05-05', '2024-05-07', 200.00),
    (6, 6, 71, '2024-06-06', '2024-06-09', 300.00),
    (7, 7, 14, '2024-06-07', '2024-06-10', 300.00),
    (8, 8, 59, '2024-06-08', '2024-06-13', 500.00),
    (9, 9, 86, '2024-06-09', '2024-06-11', 200.00),
    (10, 10, 30, '2024-07-10', '2024-07-12', 200.00),
    (11, 1, 67, '2024-05-11', '2024-05-14', 300.00),
    (12, 2, 24, '2024-05-12', '2024-05-13', 100.00),
    (13, 3, 77, '2024-05-13', '2024-05-15', 300.00),
    (14, 4, 10, '2024-05-14', '2024-05-18', 500.00),
    (15, 5, 52, '2024-05-15', '2024-05-16', 100.00),
    (16, 6, 45, '2024-06-16', '2024-06-20', 400.00),
    (17, 7, 33, '2024-06-17', '2024-06-19', 200.00),
    (18, 8, 79, '2024-06-18', '2024-06-22', 400.00),
    (19, 9, 6, '2024-06-19', '2024-06-21', 200.00),
    (20, 10, 22, '2024-07-20', '2024-07-23', 300.00),
    (20, 10, 68, '2024-07-25', '2024-07-28', 300.00);

-- Insert payments ensuring payment date is before checkout date when checkout date is in the past
INSERT INTO payments (booking_id, payment_method, payment_date, amount) VALUES
(1, 'Internet Banking', '2024-05-02', 200.00),
(2, 'Internet Banking', '2024-06-11', 200.00),
(3, 'Card', '2024-05-03', 300.00),
(4, 'Momo', '2024-07-02', 200.00),
(5, 'QR Pay', '2024-05-04', 300.00),
(6, 'Internet Banking', '2024-05-07', 500.00),
(7, 'Card', '2024-05-06', 200.00),
(8, 'QR Pay', '2024-06-07', 300.00),
(9, 'Momo', '2024-06-09', 300.00),
(10, 'Internet Banking', '2024-06-12', 500.00),
(11, 'Card', '2024-06-10', 200.00),
(12, 'QR Pay', '2024-07-11', 200.00),
(13, 'Momo', '2024-05-13', 300.00),
(14, 'Internet Banking', '2024-05-12', 100.00),
(15, 'Card', '2024-05-14', 300.00),
(16, 'Momo', '2024-05-17', 500.00),
(17, 'Internet Banking', '2024-05-15', 100.00),
(18, 'QR Pay', '2024-06-19', 400.00),
(19, 'Card', '2024-06-18', 200.00),
(20, 'Momo', '2024-06-21', 400.00);



psql -U your_username -d hotel_booking -f CREATE_DB.sql


-- Tính tiền phòng
CREATE OR REPLACE FUNCTION calculate_total_price()
RETURNS TRIGGER AS $$
DECLARE
    num_nights INTEGER;
BEGIN
    num_nights := (SELECT check_out_date - check_in_date FROM bookings WHERE booking_id = NEW.booking_id);
    NEW.total_price := (SELECT room_price * num_nights FROM rooms WHERE room_id = NEW.room_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER total_price_trigger
BEFORE INSERT OR UPDATE ON bookings
FOR EACH ROW
EXECUTE FUNCTION calculate_total_price();


--lấy thông tin phòng

CREATE OR REPLACE FUNCTION get_hotels_with_rooms()
RETURNS TABLE (
    hotel_name VARCHAR(100),
    hotel_address VARCHAR(200),
    hotel_city VARCHAR(50),
    hotel_country VARCHAR(50),
    hotel_rating INT,
    room_class VARCHAR(50),
    room_capacity INT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        h.name AS hotel_name,
        h.address AS hotel_address,
        h.city AS hotel_city,
        h.country AS hotel_country,
        h.rating AS hotel_rating,
        r.room_class,
        r.capacity
    FROM
        hotels h
        JOIN rooms r ON h.hotel_id = r.hotel_id;
END;
$$ LANGUAGE plpgsql;

            room_price DECIMAL(10, 2),

        r.room_price,



CREATE OR REPLACE FUNCTION get_distinct_hotels_and_rooms()
RETURNS TABLE (
    hotel_id INT,
    hotel_name VARCHAR(100),
    hotel_address VARCHAR(200),
    hotel_city VARCHAR(50),
    hotel_country VARCHAR(50),
    hotel_rating INT,
    room_class VARCHAR(50),
    room_price DECIMAL(10, 2),
    room_capacity INT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT ON (h.hotel_id, r.room_class)
        h.hotel_id,
        h.name AS hotel_name,
        h.address AS hotel_address,
        h.city AS hotel_city,
        h.country AS hotel_country,
        h.rating AS hotel_rating,
        r.room_class,
        r.room_price,
        r.capacity
    FROM
        hotels h
        JOIN rooms r ON h.hotel_id = r.hotel_id
    ORDER BY
        h.hotel_id, r.room_class;
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION get_available_room(
    input_hotel_id INT,
    input_room_class VARCHAR,
    input_check_in_date DATE,
    input_check_out_date DATE
)
RETURNS INT AS $$
DECLARE
    available_room_id INT;
BEGIN
    SELECT r.room_id
    INTO available_room_id
    FROM rooms r
    LEFT JOIN bookings b ON r.room_id = b.room_id
        AND b.check_in_date < input_check_out_date
        AND b.check_out_date > input_check_in_date
    WHERE r.hotel_id = input_hotel_id
        AND r.room_class = input_room_class
        AND b.booking_id IS NULL
    LIMIT 1;

    RETURN available_room_id;
END;
$$ LANGUAGE plpgsql;

Select * from get_available_room(1, 'Deluxe', '2024-06-10', '2024-06-12');












CREATE OR REPLACE FUNCTION get_available_room(
    p_hotel_id INT,
    p_room_class VARCHAR(50),
    p_check_in_date DATE,
    p_check_out_date DATE
)
RETURNS TABLE (
    room_id INT,
    room_number VARCHAR(10),
    room_class VARCHAR(50),
    room_price DECIMAL(10, 2),
    hotel_id INT,
    capacity INT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.room_id,
        r.room_number,
        r.room_class,
        r.room_price,
        r.hotel_id,
        r.capacity
    FROM
        rooms r
    WHERE
        r.hotel_id = p_hotel_id
        AND r.room_class = p_room_class
        AND r.room_id NOT IN (
            SELECT
                b.room_id
            FROM
                bookings b
            WHERE
                (b.check_in_date >= p_check_in_date AND b.check_in_date < p_check_out_date)
                OR (b.check_out_date > p_check_in_date AND b.check_out_date <= p_check_out_date)
                OR (b.check_in_date < p_check_in_date AND b.check_out_date > p_check_out_date)
        );
END;
$$ LANGUAGE plpgsql;