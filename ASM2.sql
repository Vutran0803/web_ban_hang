CREATE DATABASE ASM_QLBH;
USE ASM_QLBH;
--Drop database ASM_QLBH;
CREATE TABLE Accounts (
  Email NVARCHAR(50) PRIMARY KEY,
  Password VARCHAR(20) NOT NULL,
  Role BIT
);

-- Tạo bảng Customers
CREATE TABLE Customers (
  CustomerID VARCHAR(50) PRIMARY KEY,
  CustomerName NVARCHAR(50) NOT NULL,
  PhoneNumber INT NOT NULL,
  Address NVARCHAR(50) NOT NULL,
  Email NVARCHAR(50) NOT NULL,
  Age INT
  FOREIGN KEY (Email) REFERENCES Accounts(Email)
);


-- Tạo bảng Category
CREATE TABLE Categories (
  CategoryID NVARCHAR(20) PRIMARY KEY,
  CategoryName NVARCHAR(20) NOT NULL,
  Condition BIT 
);

-- Tạo bảng Products với khóa ngoại từ Category
CREATE TABLE Products (
  ProductID NVARCHAR(20) PRIMARY KEY,
  ProductName NVARCHAR(50) NOT NULL,
  Content NVARCHAR(100) NOT NULL,
  Price FLOAT NOT NULL,
  CreateDate DATE,
  CategoryID NVARCHAR(20) NOT NULL,
  Image VARCHAR(255),
  Image1 VARCHAR(255),
  Image2 VARCHAR(255),
  Image3 VARCHAR(255),
  PercentageDiscount INT NOT NULL,
  Likes INT,
  Sold INT,
  Quantity INT,
  Condition BIT
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Tạo bảng Bills với khóa ngoại từ Customers
CREATE TABLE Bills (
  BillID VARCHAR(20) PRIMARY KEY,
  CustomerID VARCHAR(50) NOT NULL,
  CreateDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Tạo bảng BillDetails với khóa ngoại từ Bills và Products
CREATE TABLE BillDetails (
  BillDetailID VARCHAR(20) PRIMARY KEY,
  BillID VARCHAR(20),
  ProductID NVARCHAR(20) NOT NULL,
  CustomerName NVARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(10) NOT NULL,
  Address NVARCHAR(50) NOT NULL,
  CategoryName NVARCHAR(20) NOT NULL,
  TotalPrice FLOAT,
  QuantityBuy INT,
  FOREIGN KEY (BillID) REFERENCES Bills(BillID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Lấy tất cả dữ liệu từ bảng BillDetails
SELECT * FROM BillDetails;

--Tính tiền sản phẩm đã giảm giá
CREATE FUNCTION dbo.DiscountProduct (
    @Price FLOAT,
    @PercentageDiscount INT
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @DiscountedPrice FLOAT;
    SET @DiscountedPrice = @Price - (@Price * @PercentageDiscount / 100);
    RETURN @DiscountedPrice;
END;
GO

-- Ví dụ sử dụng hàm để tính giá sau khi giảm giá
SELECT ProductID, ProductName, Price, PercentageDiscount, 
       dbo.DiscountProduct(Price, PercentageDiscount) AS DiscountedPrice
FROM Products;


-- Lấy dữ liệu từ bảng BillDetails và tính giá sau khi giảm giá
SELECT bd.BillDetailID, bd.BillID, bd.ProductID, bd.CustomerName, bd.PhoneNumber, 
       bd.Address, bd.CategoryName, bd.TotalPrice, bd.QuantityBuy, 
       dbo.DiscountProduct(p.Price, p.PercentageDiscount) AS DiscountedPrice
FROM BillDetails bd
JOIN Products p ON bd.ProductID = p.ProductID;




--Data Categories
INSERT INTO Categories (CategoryID, CategoryName,Condition)
VALUES  ('A01', N'Áo',1),
		('Q01', N'Quần',1);
--Data Product 
-- Data Product 
INSERT INTO Products (ProductID, ProductName, Content, Price, CreateDate, CategoryID, Image, Image1, Image2, Image3, Likes, Sold, Quantity, PercentageDiscount, Condition)
VALUES 
('ao1', N'Áo thun', N'Mặc vào thành trùm cua gái', 95000.0, '2024-05-01', 'A01', 'aothun.jpg', 'aothun-1.jpg', 'aothun-2.jpg', 'aothun-3.jpg', 71, 63, 100, 5, 1),
('ao2', N'Áo Polo', N'Mặc vào thành trùm lịch lãm', 200000.0, '2024-05-01', 'A01', 'aopolo.jpg', 'aopolo-1.jpg', 'aopolo-2.jpg', 'aopolo-3.jpg', 26, 48, 43, 13, 1);

INSERT INTO Accounts (Email, Password, Role) VALUES
('than123@gmail.com', '123', 0),
('hieu123@gmail.com', '123', 1);
go
-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber, Address, Email) VALUES
('C001', 'T Sion', '1234567890', 'An Suong', 'than123@gmail.com'),
('C002', 'Hieu Da Den', '0987654321', 'Q12 Ho Chi Minh', 'hieu123@gmail.com');
go
-- Insert data into Categories
INSERT INTO Categories (CategoryID, CategoryName, Condition) VALUES
('CAT001', 'Non', 1),
('CAT002', 'Ao', 1),
('CAT003', 'Giay', 1),
('CAT004', 'Non', 1);
go
-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, Content, Price, CreateDate, CategoryID, Image, Image1, Image2, Image3, PercentageDiscount, Likes, Sold, Quantity, Condition) VALUES
('P001', N'Mũ Bánh Tiêu', N'Mũ Bánh Tiêu', 99.99, '2024-01-01', 'CAT001', 'Mubanhtieu.jpg', 'Mubanhtieu1.jpg', 'Mubanhtieu2.jpg', 'Mubanhtieu3.jpg', 10, 100, 50, 200, 1),
('P002', N'Mũ Nam Thời thượng', N'Mũ Báo', 99.99, '2024-02-01', 'CAT001', 'Mubao.jpg', 'Mubao1.jpg', 'Mubao2.jpg', 'Mubao3.jpg', 15, 150, 75, 100, 1),
('P003', N'Mũ Cừu Thời Trang cho Nữ', N'Mũ Cừu', 19.99, '2024-03-01', 'CAT001', 'Mucuu.jpg', 'Mucuu1.jpg', 'Mucuu2.jpg', 'Mucuu3.jpg', 5, 200, 100, 300, 1),
('P004', N'Mũ Lưỡi Trai Phong Cách', N'Mũ Lưỡi Trai', 19.99, '2024-01-15', 'CAT001', 'Muluoitrai.jpg', 'Muluoitrai1.jpg', 'Muluoitrai2.jpg', 'Muluoitrai3.jpg', 10, 80, 40, 150, 1),
('P005', N'Mũ Nồi Thời Trang Hàn Quốc', N'Mũ Nồi', 14.99, '2024-02-10', 'CAT001', 'Munoi.jpg', 'Munoi1.jpg', 'Munoi2.jpg', 'Munoi3.jpg', 20, 120, 60, 200, 1),
('P006', N'Mũ Phi Công Cho báo thủ', N'Mũ Phi Công', 25.99, '2024-03-05', 'CAT001', 'MuPhicong.jpg', 'Muphicong1.jpg', 'Muphicong2.jpg', 'Muphicong3.jpg', 15, 110, 55, 175, 1),
('P007', N'Mũ Vành Phối Ren Cho Girl', N'Mũ Vành Phối Ren', 29.99, '2024-04-01', 'CAT001', 'Muvanhphoiren.jpg', 'Muvanhphoiren1.jpg', 'Muvanhphoiren2.jpg', 'Muvanhphoiren3.jpg', 5, 90, 45, 250, 1),
('P008', N'Mũ Vành Basic Cho Nam Và Nữ', N'Mũ Vành Basic', 22.99, '2024-04-15', 'CAT001', 'Muvanhbasic.jpg', 'Muvanhbasic1.jpg', 'Muvanhbasic2.jpg', 'Muvanhbasic3.jpg', 25, 130, 65, 300, 1),
('P009', N'Nón Y2k từ Brand', N'Nón Y2k', 39.99, '2024-05-01', 'CAT001', 'Nony2k.jpg', 'Nony2k1.jpg', 'Nony2k2.jpg', 'Nony2k3.jpg', 10, 140, 70, 100, 1);
go 

-- Insert data into Bills
INSERT INTO Bills (BillID, CustomerID, CreateDate) VALUES
('B001', 'C001', '2024-05-01'),
('B002', 'C002', '2024-05-02');
go
-- Insert data into BillDetails
INSERT INTO BillDetails (BillDetailID, BillID, ProductID, CustomerName, PhoneNumber, Address, CategoryName, TotalPrice, QuantityBuy) VALUES
('BD001', 'B001', 'P001', 'T Sion', '1234567890', 'An Suong', 'Non', 629.99, 1),
('BD002', 'B001', 'P003', 'T Sion', '1234567890', 'An Suong', 'Non', 18.99, 1),
('BD003', 'B002', 'P002', 'Hieu Da Den', '0987654321', 'Q12 Ho Chi Minh', 'Non', 849.99, 1);