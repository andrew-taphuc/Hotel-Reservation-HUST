
-- Select customer's booking info
SELECT 
    c.first_name|| ' '|| c.last_name as full_name,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    h.name AS hotel_name,
    r.room_type,
    r.room_number,
    p.payment_method,
    p.payment_date,
    p.amount
FROM 
    customers c
JOIN 
    bookings b ON c.customer_id = b.customer_id
JOIN 
    hotels h ON b.hotel_id = h.hotel_id
JOIN 
    rooms r ON b.room_id = r.room_id
LEFT JOIN 
    payments p ON b.booking_id = p.booking_id
WHERE 
    c.customer_id = 12;


-- Các câu truy vấn cho việc đặt phòng

-- Show thông tin tất cả các phòng 
SELECT
  h.name AS hotel_name,
  h.city,
  h.country,
  r.room_type,
  r.room_price
FROM
  rooms r
  JOIN hotels h ON r.hotel_id = h.hotel_id
  LEFT JOIN bookings b ON r.room_id = b.room_id;

-- Show thông tin phòng theo loại phòng
CREATE OR REPLACE FUNCTION room_by_type(room_type_param VARCHAR(50))
RETURNS TABLE (
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    room_type VARCHAR(50),
    room_price DECIMAL(10, 2)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        h.name AS hotel_name,
        h.city,
        h.country,
        r.room_type,
        r.room_price
    FROM
        rooms r
        JOIN hotels h ON r.hotel_id = h.hotel_id
        LEFT JOIN bookings b ON r.room_id = b.room_id
    WHERE
        r.room_type = room_type_param;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM room_by_type('Standard'); -- Thay Standard bằng loại phòng

DECLARE
    room_type_var VARCHAR(50) := 'Deluxe';
BEGIN
    SELECT * FROM room_by_type(room_type_var);
END; -- Thay Delux bằng loại phòng

-- Show thông tin phòng theo giá tiền

CREATE OR REPLACE FUNCTION room_by_price(
    price1 DECIMAL(10, 2),
    price2 DECIMAL(10, 2),
    order_direction VARCHAR(4)
)
RETURNS TABLE (
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    room_type VARCHAR(50),
    room_number VARCHAR(10),
    room_price DECIMAL(10, 2)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        h.name AS hotel_name,
        h.city,
        h.country,
        r.room_type,
        r.room_number,
        r.room_price
    FROM
        rooms r
        JOIN hotels h ON r.hotel_id = h.hotel_id
    WHERE
        r.room_price BETWEEN price1 AND price2
    ORDER BY
        CASE UPPER(order_direction)
            WHEN 'ASC' THEN r.room_price ASC
            WHEN 'DESC' THEN r.room_price DESC
            ELSE r.room_price ASC
        END;
END;
$$ LANGUAGE plpgsql;

--bản fix
CREATE OR REPLACE FUNCTION room_by_price(
    price1 DECIMAL(10, 2),
    price2 DECIMAL(10, 2),
    order_direction VARCHAR(4)
)
RETURNS TABLE (
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    room_type VARCHAR(50),
    room_number VARCHAR(10),
    room_price DECIMAL(10, 2)
)
AS $$
BEGIN
    RETURN QUERY EXECUTE
    'SELECT
        h.name AS hotel_name,
        h.city,
        h.country,
        r.room_type,
        r.room_number,
        r.room_price
    FROM
        rooms r
        JOIN hotels h ON r.hotel_id = h.hotel_id
    WHERE
        r.room_price BETWEEN $1 AND $2
    ORDER BY
        r.room_price ' || CASE UPPER(order_direction)
            WHEN 'ASC' THEN 'ASC'
            WHEN 'DESC' THEN 'DESC'
            ELSE 'ASC'
        END
    USING price1, price2;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM room_by_price(100, 200, 'DESC');

-- Show tất cả khách sạn theo thành phố, quốc gia

CREATE OR REPLACE FUNCTION hotel_by_city_country(
    c_city VARCHAR,
    c_country VARCHAR
)
RETURNS TABLE (
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
)
AS $$
BEGIN
    IF c_city = 'all' THEN
        RETURN QUERY
        SELECT
            h.name AS hotel_name,
            h.city,
            h.country
        FROM
            hotels h
        WHERE
            h.country = hotel_by_city_country.c_country;
    ELSE
        RETURN QUERY
        SELECT
            h.name AS hotel_name,
            h.city,
            h.country
        FROM
            hotels h
        WHERE
            h.city = hotel_by_city_country.c_city
            AND h.country = hotel_by_city_country.c_country;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM hotel_by_city_country('Hà Nội', 'Vietnam');

--Show số lượng phòng trống theo từng hạng phòng của một khách sạn cụ thể

CREATE OR REPLACE FUNCTION total_available_room(hotel_name VARCHAR)
RETURNS TABLE (
    room_class VARCHAR(50),
    available_rooms INT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.room_type,
        (
            SELECT COUNT(*)
            FROM rooms r
            WHERE hotel_id = (SELECT hotel_id FROM hotels WHERE name = total_available_room.hotel_name)
            AND room_id NOT IN (
                SELECT room_id
                FROM bookings
                WHERE check_in_date <= CURRENT_DATE AND check_out_date >= CURRENT_DATE
            )
        ) AS available_rooms
    FROM
        (
            SELECT DISTINCT room_type
            FROM rooms 
            WHERE hotel_id = (SELECT hotel_id FROM hotels WHERE name = total_available_room.hotel_name)
        ) r;
END;
$$ LANGUAGE plpgsql;

-- Trigger khi thêm số phòng cho khách sạn

CREATE OR REPLACE FUNCTION get_unique_room_number(
    p_hotel_id INT,
    p_room_number VARCHAR(10)
)
RETURNS VARCHAR(10)
AS $$
DECLARE
    unique_room_number VARCHAR(10);
    counter INT := 1;
BEGIN
    LOOP
        SELECT p_room_number || LPAD(counter::TEXT, 3, '0') INTO unique_room_number;
        EXIT WHEN NOT EXISTS (
            SELECT 1
            FROM rooms
            WHERE hotel_id = p_hotel_id
            AND room_number = unique_room_number
        );
        counter := counter + 1;
    END LOOP;
    RETURN unique_room_number;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ensure_unique_room_number()
RETURNS TRIGGER
AS $$
DECLARE
    new_room_number VARCHAR(10);
    max_room_number INT;
BEGIN
    -- Check if there are any existing rows with the same hotel_id
    IF EXISTS (
        SELECT 1
        FROM rooms
        WHERE hotel_id = NEW.hotel_id
    ) THEN
        -- Get the maximum room number for the given hotel_id
        SELECT COALESCE(MAX(room_number::INT), 0) INTO max_room_number
        FROM rooms
        WHERE hotel_id = NEW.hotel_id;

        -- Check if the new room number is already taken
        IF EXISTS (
            SELECT 1
            FROM rooms
            WHERE hotel_id = NEW.hotel_id
            AND room_number = NEW.room_number
        ) THEN
            -- Increment the room number by 1 until we find an available one
            LOOP
                max_room_number := max_room_number + 1;
                EXIT WHEN NOT EXISTS (
                    SELECT 1
                    FROM rooms
                    WHERE hotel_id = NEW.hotel_id
                    AND room_number = max_room_number::VARCHAR(10)
                );
            END LOOP;
            new_room_number := max_room_number::VARCHAR(10);
        ELSE
            new_room_number := NEW.room_number;
        END IF;

        NEW.room_number := new_room_number;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ensure_unique_room_number
BEFORE INSERT OR UPDATE ON rooms
FOR EACH ROW
EXECUTE FUNCTION ensure_unique_room_number();
