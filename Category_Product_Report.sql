-- =====================================================
-- FARM2FARM DATABASE
-- CATEGORY AND PRODUCT REPORT
-- =====================================================

-- =========================
-- CATEGORY TABLE
-- =========================

CREATE TABLE Category (
    Category_ID NUMBER(5) PRIMARY KEY,
    Category_Name VARCHAR2(50) NOT NULL,
    Category_Description VARCHAR2(200)
);

-- INSERT CATEGORY DATA

INSERT INTO Category VALUES
(1, 'Vegetables', 'Fresh farm vegetables');

INSERT INTO Category VALUES
(2, 'Fruits', 'Fresh farm fruits');

INSERT INTO Category VALUES
(3, 'Grains', 'Fresh farm grains');

INSERT INTO Category VALUES
(4, 'Pulses', 'Healthy farm pulses');

INSERT INTO Category VALUES
(5, 'Leafy Greens', 'Fresh leafy vegetables');

INSERT INTO Category VALUES
(6, 'Spices', 'Natural farm spices');

INSERT INTO Category VALUES
(7, 'Dairy', 'Fresh dairy products');

INSERT INTO Category VALUES
(8, 'Millets', 'Healthy millet products');

INSERT INTO Category VALUES
(9, 'Herbs', 'Fresh farm herbs');

INSERT INTO Category VALUES
(10, 'Organic', 'Organic farm products');

COMMIT;

-- DISPLAY CATEGORY

SELECT * FROM Category;


-- =========================
-- PRODUCT TABLE
-- =========================

CREATE TABLE Product (
    Product_ID NUMBER(5) PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Description VARCHAR2(200),
    Price NUMBER(10,2) NOT NULL,
    Stock NUMBER(5) NOT NULL,
    Farmer_ID NUMBER(5),
    Category_ID NUMBER(5),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

-- INSERT PRODUCT DATA

INSERT INTO Product VALUES
(101, 'Tomato', 'Fresh farm tomatoes', 40.00, 50, 201, 1);

INSERT INTO Product VALUES
(102, 'Potato', 'Fresh farm potatoes', 35.00, 60, 202, 1);

INSERT INTO Product VALUES
(103, 'Mango', 'Fresh naturally grown mangoes', 100.00, 30, 201, 2);

INSERT INTO Product VALUES
(104, 'Banana', 'Fresh farm bananas', 50.00, 45, 203, 2);

INSERT INTO Product VALUES
(105, 'Rice', 'Quality farm rice', 70.00, 80, 204, 3);

INSERT INTO Product VALUES
(106, 'Green Gram', 'Fresh green gram', 90.00, 40, 205, 4);

INSERT INTO Product VALUES
(107, 'Spinach', 'Fresh leafy spinach', 30.00, 35, 206, 5);

INSERT INTO Product VALUES
(108, 'Turmeric', 'Natural farm turmeric', 120.00, 25, 207, 6);

INSERT INTO Product VALUES
(109, 'Ragi', 'Healthy farm ragi', 80.00, 55, 208, 8);

INSERT INTO Product VALUES
(110, 'Mint Leaves', 'Fresh farm mint leaves', 25.00, 40, 209, 9);

COMMIT;


-- =========================
-- DISPLAY PRODUCT
-- =========================

SELECT * FROM Product;


-- =========================
-- UPDATE
-- =========================

UPDATE Product
SET Price = 45.00
WHERE Product_ID = 101;

COMMIT;


-- =========================
-- DELETE
-- =========================

DELETE FROM Product
WHERE Product_ID = 110;

COMMIT;


-- =========================
-- CATEGORY + PRODUCT REPORT
-- =========================

SELECT
    C.Category_ID,
    C.Category_Name,
    P.Product_ID,
    P.Product_Name,
    P.Price,
    P.Stock
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID;


-- =========================
-- PRODUCTS BY CATEGORY
-- =========================

SELECT
    C.Category_Name,
    P.Product_Name,
    P.Price
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID
ORDER BY C.Category_Name;


-- =========================
-- PRODUCT COUNT BY CATEGORY
-- =========================

SELECT
    C.Category_Name,
    COUNT(P.Product_ID) AS Product_Count
FROM Category C
LEFT JOIN Product P
ON C.Category_ID = P.Category_ID
GROUP BY C.Category_Name
ORDER BY C.Category_Name;
