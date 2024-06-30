
create database hotel_booking;
\c hotel_booking;

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
    booking_id INT NOT NULL REFERENCES bookings(booking_id) ON DELETE CASCADE,
    payment_method VARCHAR(50),
    payment_date DATE ,
    payment_status VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

--Hotel
INSERT INTO hotels (rating, name, address, city, country) VALUES
(4, 'Khach san Melia Ha Noi'                    , '44B Ly Thuong Kiet, Tran Hung Dao, Hoan Kiem'    , 'Ha Noi'      , 'Vietnam'),
(4, 'Khach san Lotte Ha Noi'                    , '54 Lieu Giai, Cong Vi, Ba Dinh'                  , 'Ha Noi'      , 'Vietnam'),
(4, 'Khach san Sofitel Legend Metropole'        , '15 Ngo Quyen, Hoan Kiem'                         , 'Ha Noi'      , 'Vietnam'),
(5, 'Khach san JW Marriott Ha Noi'              , '8 Do Duc Duc, Me Tri, Nam Tu Liem'               , 'Ha Noi'      , 'Vietnam'),
(5, 'Khach san Pan Pacific Ha Noi'              , '1 Thanh Nien, Truc Bach, Ba Dinh'                , 'Ha Noi'      , 'Vietnam'),
(3, 'Khach san Rex'                             , '141 Nguyen Hue, Ben Nghe, Quan 1'                , 'Ho Chi Minh' , 'Vietnam'),
(4, 'Khach san Pullman Sai Gon Centre'          , '148 Tran Hung Dao, Quan 1'                       , 'Ho Chi Minh' , 'Vietnam'),
(4, 'Khach san Queen Ann'                       , '90 Nguyen Thi Minh Khai, Quan 3'                 , 'Ho Chi Minh' , 'Vietnam'),
(5, 'Khach san Lavis 18 Residence'              , '3 Do Thanh, Quan 3'                              , 'Ho Chi Minh' , 'Vietnam'),
(3, 'Khach san Silerland & Spa'                 , '10A Le Thanh Ton, Ben Nghe, Quan 1'              , 'Ho Chi Minh' , 'Vietnam'),
(5, 'Khach san InterContinental Da Nang'        , 'Bai Bac, Son Tra'                                , 'Da Nang'     , 'Vietnam'),
(4, 'Khach san Sala Danang Beach'               , '36-38 Lam Hoanh, Phuoc My, Son Tra'              , 'Da Nang'     , 'Vietnam'),
(4, 'Khach san Cicilia & Spa'                   , 'Bai Bien T20, Phuong My An, Ngu Hanh Son'        , 'Da Nang'     , 'Vietnam'),
(3, 'Khach san Maximilan Danang'                , '222 Vo Nguyen Giap, Phuoc My, Son Tra'           , 'Da Nang'     , 'Vietnam'),
(3, 'Khach san Monarque'                        , '236 Vo Nguyen Giap, Phuoc My, Son Tra'           , 'Da Nang'     , 'Vietnam'),
(3, 'Khach san Vinpearl Nha Trang'              , 'Hon Tre Island'                                  , 'Nha Trang'   , 'Vietnam'),
(4, 'Khach san InterContinental Nha Trang'      , '32-34 Tran Phu'                                  , 'Nha Trang'   , 'Vietnam'),
(4, 'Khach san Evason Ana Mandara'              , 'Beachside Tran Phu Boulevard'                    , 'Nha Trang'   , 'Vietnam'),
(5, 'Khach san Sheraton Nha Trang'              , '26-28 Tran Phu'                                  , 'Nha Trang'   , 'Vietnam'),
(4, 'Khach san Mia Resort'                      , 'Bai Dong, Cam Hai Dong'                          , 'Nha Trang'   , 'Vietnam'),
(3, 'Khach san Imperial Hue'                    , '8 Hung Vuong'                                    , 'Hue'         , 'Vietnam'),
(4, 'Khach san Saigon Morin'                    , '30 Le Loi'                                       , 'Hue'         , 'Vietnam'),
(4, 'Khach san Pilgrimage Village'              , '130 Minh Mang'                                   , 'Hue'         , 'Vietnam'),
(4, 'Khach san Azerai La Residence'             , '5 Le Loi'                                        , 'Hue'         , 'Vietnam'),
(4, 'Khach san Indochine Palace'                , '105A Hung Vuong'                                 , 'Hue'         , 'Vietnam'),
(3, 'Khach san Victoria Can Tho'                , 'Cai Khe, Ninh Kieu'                              , 'Can Tho'     , 'Vietnam'),
(4, 'Khach san Vinpearl Hotel Can Tho'          , '209, 30/4 Street, Xuan Khanh'                    , 'Can Tho'     , 'Vietnam'),
(4, 'Khach san Azerai Can Tho'                  , 'Hung Phu'                                        , 'Can Tho'     , 'Vietnam'),
(3, 'Khach san West Hotel'                      , '88-90-92 Hai Ba Trung'                           , 'Can Tho'     , 'Vietnam'),
(3, 'Khach san Muong Thanh Luxury Can Tho'      , 'Area E1 Cai Khe River Islet'                     , 'Can Tho'     , 'Vietnam'),
(4, 'Khach san Somerset Central TD Hai Phong'   , 'Tower A, TD Plaza, Lot 20A, Le Hong Phong'       , 'Hai Phong'   , 'Vietnam'),
(4, 'Khach san Mercure Hai Phong'               , '12 Lach Tray Street'                             , 'Hai Phong'   , 'Vietnam'),
(4, 'Khach san Pearl River Hai Phong'           , 'Km 8, Pham Van Dong Street, Duong Kinh'          , 'Hai Phong'   , 'Vietnam'),
(3, 'Khach san Manoir Des Arts Hotel'           , '64 Dien Bien Phu, Hong Bang'                     , 'Hai Phong'   , 'Vietnam'),
(4, 'Khach san Avani Hai Phong Harbour View'    , '12 Tran Phu Street, Ngo Quyen'                   , 'Hai Phong'   , 'Vietnam');

INSERT INTO rooms (hotel_id, room_class, room_number, room_price, capacity) VALUES
(1, 'Standard', '101', 150.00, 2),
(1, 'Standard', '102', 150.00, 2),
(1, 'Standard', '201', 250.00, 4),
(1, 'Standard', '202', 250.00, 4),
(1, 'Luxury', '301', 500.00, 6),
(2, 'Classic', '101', 120.00, 2),
(2, 'Classic', '102', 120.00, 2),
(2, 'Standard', '201', 180.00, 3),
(2, 'Standard', '202', 180.00, 3),
(2, 'Standard', '301', 300.00, 4),
(3, 'Standard', '101', 200.00, 2),
(3, 'Standard', '102', 200.00, 2),
(3, 'Standard', '201', 350.00, 4),
(3, 'Standard', '202', 350.00, 4),
(3, 'Luxury', '301', 600.00, 6),
(4, 'Classic', '101', 100.00, 2),
(4, 'Classic', '102', 100.00, 2),
(4, 'Standard', '201', 150.00, 3),
(4, 'Standard', '202', 150.00, 3),
(4, 'Standard', '301', 250.00, 4),
(5, 'Standard', '101', 180.00, 2),
(5, 'Standard', '102', 180.00, 2),
(5, 'Standard', '201', 300.00, 4),
(5, 'Standard', '202', 300.00, 4),
(5, 'Luxury', '301', 500.00, 6),
(6, 'Classic', '101', 90.00, 2),
(6, 'Classic', '102', 90.00, 2),
(6, 'Standard', '201', 130.00, 3),
(6, 'Standard', '202', 130.00, 3),
(6, 'Standard', '301', 220.00, 4),
(7, 'Standard', '101', 160.00, 2),
(7, 'Standard', '102', 160.00, 2),
(7, 'Standard', '201', 280.00, 4),
(7, 'Standard', '202', 280.00, 4),
(7, 'Luxury', '301', 450.00, 6),
(8, 'Classic', '101', 110.00, 2),
(8, 'Classic', '102', 110.00, 2),
(8, 'Standard', '201', 170.00, 3),
(8, 'Standard', '202', 170.00, 3),
(8, 'Standard', '301', 250.00, 4),
(9, 'Standard', '101', 200.00, 2),
(9, 'Standard', '102', 200.00, 2),
(9, 'Standard', '201', 350.00, 4),
(9, 'Standard', '202', 350.00, 4),
(9, 'Luxury', '301', 600.00, 6),
(10, 'Classic', '101', 80.00, 2),
(10, 'Classic', '102', 80.00, 2),
(10, 'Standard', '201', 120.00, 3),
(10, 'Standard', '202', 120.00, 3),
(10, 'Standard', '301', 180.00, 4),
(11, 'Standard', '101', 250.00, 2),
(11, 'Standard', '102', 250.00, 2),
(11, 'Standard', '201', 400.00, 4),
(11, 'Standard', '202', 400.00, 4),
(11, 'Luxury', '301', 650.00, 6),
(12, 'Classic', '101', 150.00, 2),
(12, 'Classic', '102', 150.00, 2),
(12, 'Standard', '201', 220.00, 3),
(12, 'Standard', '202', 220.00, 3),
(12, 'Standard', '301', 350.00, 4),
(13, 'Standard', '101', 180.00, 2),
(13, 'Standard', '102', 180.00, 2),
(13, 'Standard', '201', 300.00, 4),
(13, 'Standard', '202', 300.00, 4),
(13, 'Luxury', '301', 500.00, 6),
(14, 'Classic', '101', 120.00, 2),
(14, 'Classic', '102', 120.00, 2),
(14, 'Standard', '201', 170.00, 3),
(14, 'Standard', '202', 170.00, 3),
(14, 'Standard', '301', 250.00, 4),
(15, 'Standard', '101', 160.00, 2),
(15, 'Standard', '102', 160.00, 2),
(15, 'Standard', '201', 280.00, 4),
(15, 'Standard', '202', 280.00, 4),
(15, 'Luxury', '301', 450.00, 6),
(16, 'Classic', '101', 100.00, 2),
(16, 'Classic', '102', 100.00, 2),
(16, 'Standard', '201', 150.00, 3),
(16, 'Standard', '202', 150.00, 3),
(16, 'Standard', '301', 230.00, 4),
(17, 'Standard', '101', 200.00, 2),
(17, 'Standard', '102', 200.00, 2),
(17, 'Standard', '201', 350.00, 4),
(17, 'Standard', '202', 350.00, 4),
(17, 'Luxury', '301', 600.00, 6),
(18, 'Classic', '101', 130.00, 2),
(18, 'Classic', '102', 130.00, 2),
(18, 'Standard', '201', 190.00, 3),
(18, 'Standard', '202', 190.00, 3),
(18, 'Standard', '301', 300.00, 4),
(19, 'Standard', '101', 220.00, 2),
(19, 'Standard', '102', 220.00, 2),
(19, 'Standard', '201', 380.00, 4),
(19, 'Standard', '202', 380.00, 4),
(19, 'Luxury', '301', 650.00, 6),
(20, 'Classic', '101', 110.00, 2),
(20, 'Classic', '102', 110.00, 2),
(20, 'Standard', '201', 160.00, 3),
(20, 'Standard', '202', 160.00, 3),
(20, 'Standard', '301', 240.00, 4),
(21, 'Standard', '101', 180.00, 2),
(21, 'Standard', '102', 180.00, 2),
(21, 'Standard', '201', 300.00, 4),
(21, 'Standard', '202', 300.00, 4),
(21, 'Luxury', '301', 500.00, 6),
(22, 'Classic', '101', 120.00, 2),
(22, 'Classic', '122', 120.00, 2),
(22, 'Standard', '201', 170.00, 3),
(22, 'Standard', '202', 170.00, 3),
(22, 'Standard', '301', 250.00, 4),
(23, 'Standard', '101', 190.00, 2),
(23, 'Standard', '102', 190.00, 2),
(23, 'Standard', '201', 320.00, 4),
(23, 'Standard', '202', 320.00, 4),
(23, 'Luxury', '301', 550.00, 6),
(24, 'Classic', '101', 130.00, 2),
(24, 'Classic', '102', 130.00, 2),
(24, 'Standard', '201', 180.00, 3),
(24, 'Standard', '202', 180.00, 3),
(24, 'Standard', '301', 280.00, 4),
(25, 'Standard', '101', 170.00, 2),
(25, 'Standard', '102', 170.00, 2),
(25, 'Standard', '201', 290.00, 4),
(25, 'Standard', '202', 290.00, 4),
(25, 'Luxury', '301', 480.00, 6),
(26, 'Classic', '101', 90.00, 2),
(26, 'Classic', '102', 90.00, 2),
(26, 'Standard', '201', 140.00, 3),
(26, 'Standard', '202', 140.00, 3),
(26, 'Standard', '301', 210.00, 4),
(27, 'Standard', '101', 210.00, 2),
(27, 'Standard', '102', 210.00, 2),
(27, 'Standard', '201', 360.00, 4),
(27, 'Standard', '202', 360.00, 4),
(27, 'Luxury', '301', 600.00, 6),
(28, 'Classic', '101', 140.00, 2),
(28, 'Classic', '102', 140.00, 2),
(28, 'Standard', '201', 200.00, 3),
(28, 'Standard', '202', 200.00, 3),
(28, 'Standard', '301', 320.00, 4),
(29, 'Standard', '101', 190.00, 2),
(29, 'Standard', '102', 190.00, 2),
(29, 'Standard', '201', 330.00, 4),
(29, 'Standard', '202', 330.00, 4),
(29, 'Luxury', '301', 580.00, 6),
(30, 'Classic', '101', 110.00, 2),
(30, 'Classic', '102', 110.00, 2),
(30, 'Standard', '201', 160.00, 3),
(30, 'Standard', '202', 160.00, 3),
(30, 'Standard', '301', 240.00, 4),
(31, 'Standard', '101', 230.00, 2),
(31, 'Standard', '102', 230.00, 2),
(31, 'Standard', '201', 380.00, 4),
(31, 'Standard', '202', 380.00, 4),
(31, 'Luxury', '301', 650.00, 6),
(32, 'Classic', '101', 120.00, 2),
(32, 'Classic', '102', 120.00, 2),
(32, 'Standard', '201', 180.00, 3),
(32, 'Standard', '202', 180.00, 3),
(32, 'Standard', '301', 270.00, 4),
(33, 'Standard', '101', 200.00, 2),
(33, 'Standard', '102', 200.00, 2),
(33, 'Standard', '201', 350.00, 4),
(33, 'Standard', '202', 350.00, 4),
(33, 'Luxury', '301', 600.00, 6),
(34, 'Classic', '101', 100.00, 2),
(34, 'Classic', '102', 100.00, 2),
(34, 'Standard', '201', 150.00, 3),
(34, 'Standard', '202', 150.00, 3),
(34, 'Standard', '301', 230.00, 4),
(35, 'Standard', '101', 180.00, 2),
(35, 'Standard', '102', 180.00, 2),
(35, 'Standard', '201', 300.00, 4),
(35, 'Standard', '202', 300.00, 4),
(35, 'Luxury', '301', 500.00, 6);

--Customers
INSERT INTO customers (first_name, last_name, email, phone, city) VALUES
('Nguyen', 'Van A', 'nguyenvana@example.com', '0901234567', 'Ha Noi'),
('Tran', 'Thi B', 'tranthib@example.com', '0901234568', 'Ho Chi Minh'),
('Le', 'Van C', 'levanc@example.com', '0901234569', 'Thai Nguyen'),
('Pham', 'Thi D', 'phamthid@example.com', '0901234570', 'Da Nang'),
('Hoang', 'Van E', 'hoangvane@example.com', '0901234571', 'Hai Phong'),
('Vu', 'Thi F', 'vuthif@example.com', '0901234572', 'Hai Duong'),
('Do', 'Van G', 'dovang@example.com', '0901234573', 'Hue'),
('Ngo', 'Thi H', 'ngothih@example.com', '0901234574', 'Lao Cai'),
('Duong', 'Van I', 'duongvani@example.com', '0901234575', 'Nam Dinh'),
('Nguyen', 'Thi J', 'nguyenthij@example.com', '0901234576', 'Thai Binh'),
('Pham', 'Van K', 'phamvank@example.com', '0901234577', 'Can Tho'),
('Bui', 'Thi L', 'buithil@example.com', '0901234578', 'Vinh'),
('Nguyen', 'Van M', 'nguyenvanm@example.com', '0901234579', 'Da Lat'),
('Le', 'Thi N', 'lethin@example.com', '0901234580', 'Nha Trang'),
('Tran', 'Van O', 'tranvano@example.com', '0901234581', 'Quang Ninh'),
('Dinh', 'Thi P', 'dinhthip@example.com', '0901234582', 'Bac Ninh'),
('Ngo', 'Van Q', 'ngovanq@example.com', '0901234583', 'Lang Son'),
('Pham', 'Thi R', 'phamthir@example.com', '0901234584', 'Quang Ngai'),
('Nguyen', 'Van S', 'nguyenvans@example.com', '0901234585', 'Quang Tri'),
('Do', 'Thi T', 'dothit@example.com', '0901234586', 'Phu Yen'),
('Nguyen', 'Van U', 'nguyenvanu@example.com', '0901234587', 'Tuyen Quang'),
('Tran', 'Thi V', 'tranthiv@example.com', '0901234588', 'Thai Nguyen'),
('Le', 'Van W', 'levanw@example.com', '0901234589', 'Ha Giang'),
('Pham', 'Thi X', 'phamthix@example.com', '0901234590', 'Lao Cai'),
('Hoang', 'Van Y', 'hoangvany@example.com', '0901234591', 'Son La'),
('Vu', 'Thi Z', 'vuthiz@example.com', '0901234592', 'Dien Bien'),
('Do', 'Van AA', 'dovanaa@example.com', '0901234593', 'Bac Giang'),
('Ngo', 'Thi BB', 'ngothibb@example.com', '0901234594', 'Ha Nam'),
('Duong', 'Van CC', 'duongvancc@example.com', '0901234595', 'Binh Dinh'),
('Nguyen', 'Thi DD', 'nguyenthidd@example.com', '0901234596', 'Phu Tho'),
('Pham', 'Van EE', 'phamvanee@example.com', '0901234597', 'Thua Thien Hue'),
('Bui', 'Thi FF', 'buithiff@example.com', '0901234598', 'Dak Lak'),
('Nguyen', 'Van GG', 'nguyenvangg@example.com', '0901234599', 'Binh Phuoc'),
('Le', 'Thi HH', 'lethihh@example.com', '0901234500', 'Gia Lai'),
('Tran', 'Van II', 'tranvanii@example.com', '0901234501', 'Kon Tum'),
('Dinh', 'Thi JJ', 'dinhthijj@example.com', '0901234502', 'Lam Dong'),
('Ngo', 'Van KK', 'ngovankk@example.com', '0901234503', 'An Giang'),
('Pham', 'Thi LL', 'phamthill@example.com', '0901234504', 'Ba Ria Vung Tau'),
('Nguyen', 'Van MM', 'nguyenvanmm@example.com', '0901234505', 'Bac Lieu'),
('Do', 'Thi NN', 'dothinn@example.com', '0901234506', 'Ben Tre'),
('Nguyen', 'Van OO', 'nguyenvanoo@example.com', '0901234507', 'Binh Duong'),
('Tran', 'Thi PP', 'tranthipp@example.com', '0901234508', 'Ca Mau'),
('Le', 'Van QQ', 'levanqq@example.com', '0901234509', 'Cao Bang'),
('Pham', 'Thi RR', 'phamthirr@example.com', '0901234510', 'Dak Nong'),
('Hoang', 'Van SS', 'hoangvanss@example.com', '0901234511', 'Dong Nai'),
('Vu', 'Thi TT', 'vuthitt@example.com', '0901234512', 'Dong Thap'),
('Do', 'Van UU', 'dovanuu@example.com', '0901234513', 'Hau Giang'),
('Ngo', 'Thi VV', 'ngothivv@example.com', '0901234514', 'Khanh Hoa'),
('Duong', 'Van WW', 'duongvanww@example.com', '0901234515', 'Kien Giang'),
('Nguyen', 'Thi XX', 'nguyenthixx@example.com', '0901234516', 'Lai Chau'),
('Pham', 'Van YY', 'phamvanyy@example.com', '0901234517', 'Long An'),
('Bui', 'Thi ZZ', 'buithizz@example.com', '0901234518', 'Soc Trang'),
('Nguyen', 'Van AAA', 'nguyenvanaaa@example.com', '0901234519', 'Tay Ninh'),
('Le', 'Thi BBB', 'lethibbb@example.com', '0901234520', 'Tra Vinh'),
('Tran', 'Van CCC', 'tranvanccc@example.com', '0901234521', 'Vinh Long'),
('Dinh', 'Thi DDD', 'dinhthiddd@example.com', '0901234522', 'Yen Bai'),
('Ngo', 'Van EEE', 'ngovaneee@example.com', '0901234523', 'Quang Binh'),
('Pham', 'Thi FFF', 'phamthifff@example.com', '0901234524', 'Binh Thuan'),
('Nguyen', 'Van GGG', 'nguyenvanggg@example.com', '0901234525', 'Hau Giang'),
('Do', 'Thi HHH', 'dothihhh@example.com', '0901234526', 'Tien Giang'),
('Nguyen', 'Van III', 'nguyenvaniii@example.com', '0901234527', 'Nghe An'),
('Tran', 'Thi JJJ', 'tranthijjj@example.com', '0901234528', 'Ha Tinh'),
('Le', 'Van KKK', 'levankkk@example.com', '0901234529', 'Thanh Hoa'),
('Pham', 'Thi LLL', 'phamthilll@example.com', '0901234530', 'Ninh Binh'),
('Hoang', 'Van MMM', 'hoangvanmmm@example.com', '0901234531', 'Quang Nam'),
('Vu', 'Thi NNN', 'vuthinnn@example.com', '0901234532', 'Ninh Thuan'),
('Do', 'Van OOO', 'dovanooo@example.com', '0901234533', 'Hung Yen'),
('Ngo', 'Thi PPP', 'ngothippp@example.com', '0901234534', 'Ha Noi'),
('Duong', 'Van QQQ', 'duongvanqqq@example.com', '0901234535', 'Thai Nguyen'),
('Nguyen', 'Thi RRR', 'nguyenthirrr@example.com', '0901234536', 'Lao Cai'),
('Pham', 'Van SSS', 'phamvansss@example.com', '0901234537', 'Nam Dinh'),
('Bui', 'Thi TTT', 'buithittt@example.com', '0901234538', 'Thai Binh'),
('Nguyen', 'Van UUU', 'nguyenvanuuu@example.com', '0901234539', 'Da Nang'),
('Le', 'Thi VVV', 'lethivvv@example.com', '0901234540', 'Hai Phong'),
('Tran', 'Van WWW', 'tranvanwww@example.com', '0901234541', 'Hai Duong'),
('Dinh', 'Thi XXX', 'dinhthixxx@example.com', '0901234542', 'Hue'),
('Ngo', 'Van YYY', 'ngovanyyy@example.com', '0901234543', 'Nha Trang'),
('Pham', 'Thi ZZZ', 'phamthizzz@example.com', '0901234544', 'Nghe An'),
('Nguyen', 'Van AAAA', 'nguyenvanaaaa@example.com', '0901234545', 'Da Lat'),
('Do', 'Thi BBBB', 'dothibbbb@example.com', '0901234546', 'Quang Ninh');



-- Insert bookings with varying lengths and dates between May 2024 and July 2024
INSERT INTO bookings (customer_id, hotel_id, room_id, check_in_date, check_out_date, total_price) VALUES
(1, 1, 1, '2024-05-01', '2024-05-03', 300.00),
(1, 1, 2, '2024-06-10', '2024-06-12', 300.00),
(2, 2, 6, '2024-05-02', '2024-05-04', 360.00),
(2, 2, 7, '2024-07-01', '2024-07-03', 360.00),
(3, 3, 11, '2024-05-03', '2024-05-05', 700.00),
(4, 4, 16, '2024-05-04', '2024-05-08', 625.00),
(5, 5, 21, '2024-05-05', '2024-05-07', 600.00),
(6, 6, 26, '2024-06-06', '2024-06-09', 330.00),
(7, 7, 31, '2024-06-07', '2024-06-10', 560.00),
(8, 8, 36, '2024-06-08', '2024-06-13', 425.00),
(9, 9, 41, '2024-06-09', '2024-06-11', 800.00),
(10, 10, 46, '2024-07-10', '2024-07-12', 240.00),
(11, 11, 51, '2024-05-11', '2024-05-14', 1200.00),
(12, 12, 56, '2024-05-12', '2024-05-13', 220.00),
(13, 13, 61, '2024-05-13', '2024-05-15', 600.00),
(14, 14, 66, '2024-05-14', '2024-05-18', 850.00),
(15, 15, 71, '2024-05-15', '2024-05-16', 160.00),
(16, 16, 76, '2024-06-16', '2024-06-20', 460.00),
(17, 17, 81, '2024-06-17', '2024-06-19', 400.00),
(18, 18, 86, '2024-06-18', '2024-06-22', 570.00),
(19, 19, 91, '2024-06-19', '2024-06-21', 800.00),
(20, 20, 96, '2024-07-20', '2024-07-23', 360.00),
(20, 20, 97, '2024-07-25', '2024-07-28', 360.00),
(21, 1, 1, '2024-05-21', '2024-05-23', 300.00),
(22, 2, 6, '2024-05-22', '2024-05-24', 360.00),
(23, 3, 11, '2024-05-23', '2024-05-25', 700.00),
(24, 4, 16, '2024-05-24', '2024-05-28', 625.00),
(25, 5, 21, '2024-05-25', '2024-05-27', 600.00),
(26, 6, 26, '2024-06-26', '2024-06-29', 330.00),
(27, 7, 31, '2024-06-27', '2024-06-30', 560.00),
(28, 8, 36, '2024-06-28', '2024-07-03', 850.00),
(29, 9, 41, '2024-06-29', '2024-07-01', 800.00),
(30, 10, 46, '2024-07-20', '2024-07-22', 240.00),
(31, 1, 3, '2024-06-01', '2024-06-04', 750.00),
(32, 2, 8, '2024-06-02', '2024-06-03', 180.00),
(33, 3, 13, '2024-06-03', '2024-06-05', 700.00),
(34, 4, 18, '2024-06-04', '2024-06-08', 625.00),
(35, 5, 23, '2024-06-05', '2024-06-06', 300.00),
(36, 6, 28, '2024-07-06', '2024-07-10', 460.00),
(37, 7, 33, '2024-07-07', '2024-07-09', 480.00),
(38, 8, 38, '2024-07-08', '2024-07-12', 570.00),
(39, 9, 43, '2024-07-09', '2024-07-11', 800.00),
(40, 10, 48, '2024-08-10', '2024-08-13', 360.00),
(41, 1, 2, '2024-06-01', '2024-06-03', 300.00),
(42, 2, 7, '2024-06-02', '2024-06-04', 360.00),
(43, 3, 12, '2024-06-03', '2024-06-05', 700.00),
(44, 4, 17, '2024-06-04', '2024-06-08', 625.00),
(45, 5, 22, '2024-06-05', '2024-06-07', 600.00),
(46, 6, 27, '2024-07-06', '2024-07-09', 330.00),
(47, 7, 32, '2024-07-07', '2024-07-10', 560.00),
(48, 8, 37, '2024-07-08', '2024-07-13', 850.00),
(49, 9, 42, '2024-07-09', '2024-07-11', 800.00),
(50, 10, 47, '2024-08-10', '2024-08-12', 240.00),
(51, 1, 4, '2024-06-11', '2024-06-14', 750.00),
(52, 2, 9, '2024-06-12', '2024-06-13', 180.00),
(53, 3, 14, '2024-06-13', '2024-06-15', 700.00),
(54, 4, 19, '2024-06-14', '2024-06-18', 625.00),
(55, 5, 24, '2024-06-15', '2024-06-16', 300.00),
(56, 6, 29, '2024-07-16', '2024-07-20', 460.00),
(57, 7, 34, '2024-07-17', '2024-07-19', 480.00),
(58, 8, 39, '2024-07-18', '2024-07-22', 570.00),
(59, 9, 44, '2024-07-19', '2024-07-21', 800.00),
(60, 10, 49, '2024-08-20', '2024-08-23', 360.00),
(61, 1, 1, '2024-06-21', '2024-06-23', 300.00),
(62, 2, 6, '2024-06-22', '2024-06-24', 360.00),
(63, 3, 11, '2024-06-23', '2024-06-25', 700.00),
(64, 4, 16, '2024-06-24', '2024-06-28', 625.00),
(65, 5, 21, '2024-06-25', '2024-06-27', 600.00),
(66, 6, 26, '2024-07-26', '2024-07-29', 330.00),
(67, 7, 31, '2024-07-27', '2024-07-30', 560.00),
(68, 8, 36, '2024-07-28', '2024-08-02', 850.00),
(69, 9, 41, '2024-07-29', '2024-08-01', 800.00),
(70, 10, 46, '2024-08-30', '2024-09-02', 240.00),
(71, 1, 5, '2024-07-11', '2024-07-14', 1000.00),
(72, 2, 10, '2024-07-12', '2024-07-13', 180.00),
(73, 3, 15, '2024-07-13', '2024-07-15', 700.00),
(74, 4, 20, '2024-07-14', '2024-07-18', 625.00),
(75, 5, 25, '2024-07-15', '2024-07-16', 300.00),
(76, 6, 30, '2024-08-16', '2024-08-20', 460.00),
(77, 7, 35, '2024-08-17', '2024-08-19', 480.00),
(78, 8, 40, '2024-08-18', '2024-08-22', 570.00),
(79, 9, 45, '2024-08-19', '2024-08-21', 800.00),
(80, 10, 50, '2024-09-20', '2024-09-23', 360.00);

-- Insert payments ensuring payment date is before checkout date when checkout date is in the past
INSERT INTO payments (booking_id, payment_method, payment_date, payment_status, amount) VALUES

INSERT INTO payments (booking_id, payment_method, payment_date, payment_status, amount) VALUES
(1, 'Internet Banking', '2024-05-02', 'Completed', 300),
(2, 'Internet Banking', '2024-06-11', 'Completed', 300),
(3, 'Card', '2024-05-03', 'Completed', 360),
(4, 'Momo', '2024-07-02', 'Completed', 360),
(5, 'QR Pay', '2024-05-04', 'Completed', 700),
(6, 'Internet Banking', '2024-05-07', 'Completed', 625),
(7, 'Card', '2024-05-06', 'Completed', 600),
(8, 'QR Pay', '2024-06-07', 'Completed', 330),
(9, 'Momo', '2024-06-09', 'Completed', 560),
(10, 'Internet Banking', '2024-06-12', 'Completed', 425),
(11, 'Card', '2024-06-10', 'Completed', 800),
(12, 'QR Pay', '2024-07-11', 'Completed', 240),
(13, 'Momo', '2024-05-13', 'Completed', 1200),
(14, 'Internet Banking', '2024-05-12', 'Completed', 220),
(15, 'Card', '2024-05-14', 'Completed', 600),
(16, 'Momo', '2024-05-17', 'Completed', 850),
(17, 'Internet Banking', '2024-05-15', 'Completed', 160),
(18, 'QR Pay', '2024-06-19', 'Completed', 460),
(19, 'Card', '2024-06-18', 'Completed', 400),
(20, 'Momo', '2024-06-21', 'Completed', 570),
(21, 'Internet Banking', '2024-06-20', 'Completed', 800),
(22, 'QR Pay', '2024-07-23', 'Completed', 360),
(23, 'Card', '2024-07-27', 'Completed', 360),
(24, 'Internet Banking', '2024-05-26', 'Completed', 300),
(25, 'Card', '2024-05-25', 'Completed', 360),
(26, 'QR Pay', '2024-06-28', 'Completed', 700),
(27, 'Momo', '2024-06-29', 'Completed', 625),
(28, 'Internet Banking', '2024-07-01', 'Completed', 600),
(29, 'Card', '2024-06-30', 'Completed', 330),
(30, 'QR Pay', '2024-07-21', 'Completed', 560),
(31, 'Momo', '2024-06-03', 'Completed', 850),
(32, 'Internet Banking', '2024-06-02', 'Completed', 800),
(33, 'Card', '2024-06-04', 'Completed', 240),
(34, 'QR Pay', '2024-06-07', 'Completed', 750),
(35, 'Momo', '2024-06-05', 'Completed', 180),
(36, 'Internet Banking', '2024-07-09', 'Completed', 700),
(37, 'Card', '2024-07-08', 'Completed', 625),
(38, 'QR Pay', '2024-07-11', 'Completed', 300),
(39, 'Momo', '2024-07-10', 'Completed', 460),
(40, 'Internet Banking', '2024-08-13', 'Completed', 480),
(41, 'Card', '2024-06-02', 'Completed', 570),
(42, 'QR Pay', '2024-06-03', 'Completed', 800),
(43, 'Momo', '2024-06-04', 'Completed', 360),
(44, 'Internet Banking', '2024-06-07', 'Completed', 300),
(45, 'Card', '2024-06-06', 'Completed', 360),
(46, 'QR Pay', '2024-07-08', 'Completed', 700),
(47, 'Momo', '2024-07-09', 'Completed', 625),
(48, 'Internet Banking', '2024-07-11', 'Completed', 600),
(49, 'Card', '2024-07-10', 'Completed', 330),
(50, 'QR Pay', '2024-08-11', 'Completed', 560),
(51, 'Internet Banking', '2024-06-13', 'Completed', 850),
(52, 'Card', '2024-06-12', 'Completed', 800),
(53, 'QR Pay', '2024-06-14', 'Completed', 240),
(54, 'Momo', '2024-06-17', 'Completed', 750),
(55, 'Internet Banking', '2024-06-15', 'Completed', 180),
(56, 'Card', '2024-07-19', 'Completed', 700),
(57, 'QR Pay', '2024-07-18', 'Completed', 625),
(58, 'Momo', '2024-07-21', 'Completed', 300),
(59, 'Internet Banking', '2024-07-20', 'Completed', 460),
(60, 'Card', '2024-08-23', 'Completed', 480),
(61, 'QR Pay', '2024-06-22', 'Completed', 570),
(62, 'Momo', '2024-06-23', 'Completed', 800),
(63, 'Internet Banking', '2024-06-24', 'Completed', 360),
(64, 'Card', '2024-06-27', 'Completed', 300),
(65, 'QR Pay', '2024-06-26', 'Completed', 360),
(66, 'Momo', '2024-07-28', 'Completed', 700),
(67, 'Internet Banking', '2024-07-29', 'Completed', 625),
(68, 'Card', '2024-08-01', 'Completed', 600),
(69, 'QR Pay', '2024-08-02', 'Completed', 330),
(70, 'Momo', '2024-09-01', 'Completed', 560),
(71, 'Internet Banking', '2024-07-13', 'Completed', 850),
(72, 'Card', '2024-07-12', 'Completed', 800),
(73, 'QR Pay', '2024-07-14', 'Completed', 240),
(74, 'Momo', '2024-07-17', 'Completed', 1000),
(75, 'Internet Banking', '2024-07-15', 'Completed', 180),
(76, 'Card', '2024-08-19', 'Completed', 700),
(77, 'QR Pay', '2024-08-18', 'Completed', 625),
(78, 'Momo', '2024-08-21', 'Completed', 300),
(79, 'Internet Banking', '2024-08-20', 'Completed', 460),
(80, 'Card', '2024-08-23', 'Completed', 480),
(81, 'QR Pay', '2024-06-22', 'Completed', 570),
(82, 'Momo', '2024-06-23', 'Completed', 800),
(83, 'Internet Banking', '2024-06-24', 'Completed', 360),
(84, NULL, NULL, 'In Progress', 600);


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


-- Create a custom type for the function's return type
CREATE TYPE get_booking_details_type AS (
    customer_full_name VARCHAR(255),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    booking_id INT,
    phone VARCHAR(20),
    email VARCHAR(100),
    check_in_date DATE,
    check_out_date DATE,
    hotel_name VARCHAR(100),
    hotel_id INT,
    room_number VARCHAR(10),
    room_id INT,
    room_class VARCHAR(50),
    room_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2)
);


--
CREATE OR REPLACE FUNCTION get_booking_details()
RETURNS SETOF get_booking_details_type
AS $$
DECLARE
    booking_details get_booking_details_type;
BEGIN
    FOR booking_details IN
        SELECT
            CAST(c.first_name||' '||c.last_name AS VARCHAR(255)) AS customer_full_name,
            c.first_name,
            c.last_name,
            b.booking_id,
            c.phone,
            c.email,
            b.check_in_date,
            b.check_out_date,
            h.name AS hotel_name,
            b.hotel_id,
            r.room_number,
            b.room_id,
            r.room_class,
            r.room_price,
            b.total_price
        FROM
            bookings b
        JOIN
            hotels h ON b.hotel_id = h.hotel_id
        JOIN
            rooms r ON b.room_id = r.room_id
        JOIN
            customers c ON c.customer_id = b.customer_id
    LOOP
        RETURN NEXT booking_details;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


-- FUNCTION TO AUTOMATICALLY UPDATE ROOM PRICE WHEN CHANGING DATE
CREATE OR REPLACE FUNCTION trg_update_prices()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE bookings
    SET total_price = (NEW.check_out_date - NEW.check_in_date) * rooms.room_price
    FROM rooms
    WHERE bookings.room_id = rooms.room_id
      AND bookings.booking_id = NEW.booking_id;
    UPDATE payments
    SET amount = bookings.total_price
    FROM bookings
    WHERE payments.booking_id = bookings.booking_id
      AND payments.booking_id = NEW.booking_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER update_prices
AFTER UPDATE OF check_in_date, check_out_date ON bookings
FOR EACH ROW
WHEN (OLD.check_in_date IS DISTINCT FROM NEW.check_in_date OR OLD.check_out_date IS DISTINCT FROM NEW.check_out_date)
EXECUTE FUNCTION trg_update_prices();