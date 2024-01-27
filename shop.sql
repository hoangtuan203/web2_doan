-- Create Roles Table
CREATE TABLE `roles` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `role_name` varchar(255) NOT NULL
);

-- Create Status_Order Table
CREATE TABLE `status_order` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `status` varchar(255) NOT NULL
);

-- Create Users Table
CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `role_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`)
);

-- Create Categories Table
CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
);

-- Create Groups Table
CREATE TABLE `groups` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
);

-- Create Products Table
CREATE TABLE `products` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `group_id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  FOREIGN KEY (`group_id`) REFERENCES `groups`(`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
);

-- Create Comments Table
CREATE TABLE `comments` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
);

-- Create Orders Table
CREATE TABLE `orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `status_id` int NOT NULL,
  `user_id` int NOT NULL,
  `total` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  FOREIGN KEY (`status_id`) REFERENCES `status_order`(`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

-- Create Order_Detail Table
CREATE TABLE `order_detail` (
  `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `into_money` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`)
);

-- Insert data into Roles Table
INSERT INTO roles (role_name) VALUES
('admin'),
('user');

-- Insert data into Users Table
INSERT INTO users (role_id, name, username, password, email, phone, gender, address, avatar, create_at, updated_at) VALUES
(1, 'Nguyễn Hoàng Tuấn', 'nguyenhoangtuan123', 'nguyenhoangtuan', 'nguyenhoangtuan@example.com', '0123456789', 'Male', '119/30, Nguyễn Văn Cừ, phường 2, quận 5', 'nguyenhoangtuan.jpg', NULL, NULL),
(2, 'Trần Thị Hương', 'thihuong99', 'thihuongpassword', 'thihuong@example.com', '0987654321', 'Female', '42/15, Lê Lai, phường Bến Thành, quận 1', 'thihuong.jpg', NULL, NULL),
(2, 'Lê Văn Nam', 'namle', 'namlepass', 'namle@example.com', '0368749521', 'Male', '27/3, Phạm Ngọc Thạch, phường 6, quận 3', 'namle.jpg', NULL, NULL),
(2, 'Nguyễn Thị Mai', 'mainguyen', 'maipassword', 'mainguyen@example.com', '0123456780', 'Female', '55/12, Lê Hồng Phong, phường 7, quận 4', 'mainguyen.jpg', NULL, NULL),
(2, 'Võ Văn Hùng', 'hungvo', 'hungvopass', 'hungvo@example.com', '0987654322', 'Male', '20/5, Cách Mạng Tháng Tám, phường 3, quận 10', 'hungvo.jpg', NULL, NULL),
(2, 'Phạm Thị Thùy Dung', 'thuydung', 'thuydungpass', 'thuydung@example.com', '0368749522', 'Female', '123/45, Nguyễn Văn Linh, phường 9, quận 7', 'thuydung.jpg', NULL, NULL),
(2, 'Trần Minh Hải', 'minhhai', 'minhhaipass', 'minhhai@example.com', '0123456781', 'Male', '89/10, Lê Duẩn, phường Bến Thành, quận 1', 'minhhai.jpg', NULL, NULL),
(2, 'Lê Thị Thanh Nga', 'thannga', 'thanngapass', 'thannga@example.com', '0987654323', 'Female', '37/8, Điện Biên Phủ, phường 10, quận 3', 'thannga.jpg', NULL, NULL),
(2, 'Nguyễn Văn Bình', 'binhnguyen', 'binhnguyenpass', 'binhnguyen@example.com', '0368749523', 'Male', '65/22, Trần Hưng Đạo, phường 5, quận 11', 'binhnguyen.jpg', NULL, NULL),
(2, 'Lê Thị Kim Ngân', 'kimngan', 'kimnganpass', 'kimngan@example.com', '0123456782', 'Female', '92/15, Hai Bà Trưng, phường 6, quận 3', 'kimngan.jpg', NULL, NULL),
(2, 'Phan Văn Tuấn', 'tuanphan', 'tuanphanpass', 'tuanphan@example.com', '0987654324', 'Male', '43/18, Lý Tự Trọng, phường Bến Thành, quận 1', 'tuanphan.jpg', NULL, NULL),
(2, 'Lê Thị Ánh Ngọc', 'anhngoc', 'anhngocpass', 'anhngoc@example.com', '0368749524', 'Female', '78/14, Cao Thắng, phường 4, quận 3', 'anhngoc.jpg', NULL, NULL),
(2, 'Nguyễn Minh Hiếu', 'minhhieu', 'minhhieupass', 'minhhieu@example.com', '0123456783', 'Male', '50/3, Phan Đăng Lưu, phường 7, quận Bình Thạnh', 'minhhieu.jpg', NULL, NULL);
-- Insert data into Groups Table
INSERT INTO categories (name, description, image, url, status, create_at, updated_at) VALUES
('Thời trang nam', 'Description for category 1', 'thoi-trang-nam.jpg', 'thoi-trang-nam', 1, NULL, NULL),
('Thời trang nữ', 'Description for category 2', 'thoi-trang-nu.jpg', 'thoi-trang-nu', 1, NULL, NULL),
('Phụ kiện thời trang', 'Description for category 3', 'phu-kien-thoi-trang.jpg', 'phu-kien-thoi-trang', 1, NULL, NULL),
('Giày dép', 'Description for category 4', 'giay-dep.jpg', 'giay-dep', 1, NULL, NULL);
-- Insert data into Categories Table
INSERT INTO groups (category_id, name, url, status, description, image, create_at, updated_at) VALUES
(1, 'Áo thun', 'ao-thun-nam', 1, 'Description for Áo thun Group', 'ao-thun-nam.jpg', NULL, NULL),
(1, 'Áo sơ mi', 'ao-so-mi-nam', 1, 'Description for Áo sơ mi Group', 'ao-so-mi-nam.jpg', NULL, NULL),
(1, 'Quần jeans', 'quan-jeans-nam', 1, 'Description for Quần jeans Group', 'quan-jeans-nam.jpg', NULL, NULL),
(1, 'Áo polo', 'ao-polo', 1, 'Description for Áo polo Group', 'ao-polo.jpg', NULL, NULL),
(1, 'Áo khoác', 'ao-khoac-nam', 1, 'Description for Áo khoác Group', 'ao-khoac-nam.jpg', NULL, NULL),
(2, 'Áo thun', 'ao-thun-nu', 1, 'Description for Áo thun Group', 'ao-thun-nu.jpg', NULL, NULL),
(2, 'Áo sơ mi', 'ao-so-mi-nu', 1, 'Description for Áo sơ mi Group', 'ao-so-mi-nu.jpg', NULL, NULL),
(2, 'Quần jeans', 'quan-jeans-nu', 1, 'Description for Quần jeans Group', 'quan-jeans-nu.jpg', NULL, NULL),
(2, 'Váy', 'vay', 1, 'Description for váy Group', 'vay.jpg', NULL, NULL),
(2, 'Áo khoác', 'ao-khoac-nu', 1, 'Description for Áo khoác Group', 'ao-khoac-nu.jpg', NULL, NULL),
(3, 'Nón', 'non', 1, 'Description for Nón Group', 'non.jpg', NULL, NULL),
(3, 'Thắt lưng', 'that-lung', 1, 'Description for Thắt lưng Group', 'that-lung.jpg', NULL, NULL),
(3, 'Mắt kính', 'mat-kinh', 1, 'Description for Mắt kính Group', 'mat-kinh.jpg', NULL, NULL),
(3, 'Nón', 'non', 1, 'Description for Nón Group', 'non.jpg', NULL, NULL),
(4, 'Giày Sneaker', 'giay-sneaker', 1, 'Description for Giày Group', 'giay-sneaker.jpg', NULL, NULL),
(4, 'Giày da', 'giay-da', 1, 'Description for Giày Da Group', 'giay-gia.jpg', NULL, NULL),
(4, 'Giày thể thao', 'giay-the-thao', 1, 'Description for Giày thể thao Group', 'giay-the-thao.jpg', NULL, NULL),
(4, 'Giày Sandal', 'giay-sandal', 1, 'Description for Giày Sandal Group', 'Giay-sandal.jpg', NULL, NULL);

-- Insert data into Products Table
INSERT INTO products (category_id, group_id, name, price, url, image, description, create_at, updated_at) VALUES
(1, 1, 'Áo Thun Cổ Tròn Tay Ngắn', '200000', 'ao-thun-co-tron-tay-ngan', 'ao-thun-co-tron-tay-ngan.jpg', 'Với nhiều cách phối linh hoạt, áo phù hợp được mọi vóc dáng từ cao đến thấp, từ gầy đến mập. Áo mang lại cái nhìn phong cách, thời trang và giúp bạn trông trẻ trung năng động hơn.', NULL, NULL),
(1, 2, 'Áo Sơ Mi Trắng Cổ Đứng', '350000', 'ao-so-mi-trang-co-dung', 'ao-so-mi-trang-co-dung.jpg', 'Áo sơ mi trắng với kiểu dáng cổ đứng là một lựa chọn thời trang lịch lãm cho các dịp quan trọng. Thiết kế tinh tế, chất liệu thoáng khí, phong cách sang trọng.', NULL, NULL),
(1, 3, 'Quần Jeans Nam Xanh Đậm', '450000', 'quan-jeans-nam-xanh-dam', 'quan-jeans-nam-xanh-dam.jpg', 'Quần jeans nam màu xanh đậm, kiểu dáng thoải mái, phối hợp linh hoạt với nhiều loại trang phục khác nhau. Chất liệu denim bền đẹp, phù hợp cho mọi hoạt động.', NULL, NULL),
(1, 4, 'Áo Polo Nam Trơn', '300000', 'ao-polo-nam-tron', 'ao-polo-nam-tron.jpg', 'Áo polo nam trơn màu sắc trẻ trung, thoáng khí, phù hợp cho các hoạt động ngoại ô. Thiết kế cổ trụ và tay ngắn mang lại sự thoải mái.', NULL, NULL),
(1, 5, 'Áo Khoác Nam Nỉ', '600000', 'ao-khoac-nam-ni', 'ao-khoac-nam-ni.jpg', 'Áo khoác nam nỉ với kiểu dáng thời trang, giữ ấm cho cơ thể trong những ngày lạnh. Chất liệu nỉ cao cấp, bền bỉ và thoải mái khi mặc.', NULL, NULL),

(2, 6, 'Áo Thun Nữ Form Rộng', '180000', 'ao-thun-nu-form-rong', 'ao-thun-nu-form-rong.jpg', 'Áo thun nữ form rộng với kiểu dáng trẻ trung, phù hợp cho mọi dáng vóc. Chất liệu thoáng khí, thấm hút mồ hôi, giúp bạn cảm thấy thoải mái.', NULL, NULL),
(2, 7, 'Áo Sơ Mi Nữ Họa Tiết', '280000', 'ao-so-mi-nu-hoa-tiet', 'ao-so-mi-nu-hoa-tiet.jpg', 'Áo sơ mi nữ với họa tiết trẻ trung, phong cách. Kiểu dáng thoải mái, chất liệu cao cấp, phù hợp cho cả công việc và các dịp vui chơi.', NULL, NULL),
(2, 8, 'Quần Jeans Nữ Rách Gối', '380000', 'quan-jeans-nu-rach-goi', 'quan-jeans-nu-rach-goi.jpg', 'Quần jeans nữ có thiết kế rách gối tạo điểm nhấn thời trang. Chất liệu denim co giãn, mang lại sự thoải mái khi mặc.', NULL, NULL),
(2, 9, 'Váy Đen Dáng Chữ A', '250000', 'vay-den-dang-chu-a', 'vay-den-dang-chu-a.jpg', 'Váy đen dáng chữ A, phong cách thanh lịch và trẻ trung. Chất liệu mềm mại, thoáng khí, phù hợp cho mọi dịp.', NULL, NULL),
(2, 10, 'Áo Khoác Nữ Dạ Cổ Lông', '550000', 'ao-khoac-nu-da-co-long', 'ao-khoac-nu-da-co-long.jpg', 'Áo khoác nữ dạ cổ lông mềm mại, giữ ấm hiệu quả trong những ngày lạnh. Thiết kế thời trang, phù hợp cho mùa đông.', NULL, NULL),

(3, 11, 'Nón Snapback Thể Thao', '120000', 'non-snapback-the-thao', 'non-snapback-the-thao.jpg', 'Nón snapback thể thao với thiết kế hiện đại, phong cách. Chất liệu nhẹ, thoáng khí, phù hợp cho các hoạt động ngoại ô và thể thao.', NULL, NULL),
(3, 12, 'Thắt Lưng Da Nam Cao Cấp', '180000', 'that-lung-da-nam-cao-cap', 'that-lung-da-nam-cao-cap.jpg', 'Thắt lưng da nam cao cấp với chất liệu da bền đẹp, phong cách thanh lịch. Dây đeo có thể điều chỉnh giúp bạn dễ dàng phối hợp với trang phục.', NULL, NULL),
(3, 13, 'Mắt Kính Mát Nữ Phong Cách', '150000', 'mat-kinh-mat-nu-phong-cach', 'mat-kinh-mat-nu-phong-cach.jpg', 'Mắt kính mát nữ phong cách với thiết kế trẻ trung. Kính chống UV, bảo vệ mắt hiệu quả và là phụ kiện thời trang không thể thiếu.', NULL, NULL),
(3, 14, 'Nón Snapback Nam Trơn', '120000', 'non-snapback-nam-tron', 'non-snapback-nam-tron.jpg', 'Nón snapback nam trơn với kiểu dáng đơn giản, dễ phối hợp. Chất liệu nhẹ, thoáng khí, phù hợp cho các hoạt động ngoại ô.', NULL, NULL),

(4, 15, 'Giày Sneaker Nam Đen Trắng', '500000', 'giay-sneaker-nam-den-trang', 'giay-sneaker-nam-den-trang.jpg', 'Giày sneaker nam màu đen trắng, kiểu dáng thể thao và trẻ trung. Chất liệu cao cấp, đế giày êm ái, phù hợp cho mọi hoạt động.', NULL, NULL),
(4, 16, 'Giày Da Nam Cao Cấp', '800000', 'giay-da-nam-cao-cap', 'giay-da-nam-cao-cap.jpg', 'Giày da nam cao cấp với chất liệu da mềm mại và bền đẹp. Kiểu dáng lịch lãm, phù hợp cho các dịp quan trọng.', NULL, NULL),
(4, 17, 'Giày Thể Thao Nữ Hồng', '450000', 'giay-the-thao-nu-hong', 'giay-the-thao-nu-hong.jpg', 'Giày thể thao nữ màu hồng, phong cách trẻ trung. Đế giày êm ái, chất liệu thoáng khí, phù hợp cho các hoạt động thể thao.', NULL, NULL),
(4, 18, 'Giày Sandal Nữ Đen', '350000', 'giay-sandal-nu-den', 'giay-sandal-nu-den.jpg', 'Giày sandal nữ màu đen, kiểu dáng thoải mái và dễ điều chỉnh. Chất liệu nhẹ, phù hợp cho mùa hè và các dịp nghỉ ngơi.', NULL, NULL);

-- Insert data into Status_Order Table
INSERT INTO status_order (status) VALUES
('Chờ xử lý'),
('Đã xử lý'),
('Đã huỷ');

-- Insert data into Orders Table
INSERT INTO orders (status_id, user_id, total, notes, create_at, updated_at) VALUES
(1, 2, '1000.000', 'Order notes', NULL, NULL),
(1, 3, '1400.000', 'Order notes', NULL, NULL);

-- Insert data into Order_Detail Table
INSERT INTO order_detail (product_id, order_id, quantity, into_money, create_at, updated_at) VALUES
(1, 1, 2, '100.000', NULL, NULL),
(2, 1, 2, '200.000', NULL, NULL),
(1, 2, 2, '100.000', NULL, NULL),
(2, 2, 2, '200.000', NULL, NULL);


