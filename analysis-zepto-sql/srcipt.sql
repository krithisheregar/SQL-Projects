============================================================
 DROP AND CREATE TABLE
============================================================

IF OBJECT_ID('dbo.zepto', 'U') IS NOT NULL
    DROP TABLE dbo.zepto;


CREATE TABLE dbo.zepto (
    sku_id INT IDENTITY(1,1) PRIMARY KEY,
    catery NVARCHAR(120),
    name NVARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BIT,
    quantity INT
);


============================================================
DATA EXPLORATION
============================================================

 1. Count of rows
SELECT COUNT(*) AS total_rows
FROM dbo.zepto;


 2. Sample data
SELECT TOP 10 *
FROM dbo.zepto;


 3. Check for NULL values
SELECT *
FROM dbo.zepto
WHERE name IS NULL
   OR catery IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;


 4. Different product cateries
SELECT DISTINCT catery
FROM dbo.zepto
ORDER BY catery;


 5. Products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id) AS count_of_products
FROM dbo.zepto
GROUP BY outOfStock;


 6. Product names appearing multiple times
SELECT name, COUNT(sku_id) AS [Number of SKUs]
FROM dbo.zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY [Number of SKUs] DESC;


============================================================
 DATA CLEANING
============================================================

 1. Products with price = 0
SELECT *
FROM dbo.zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;


 2. Delete products with MRP = 0
DELETE FROM dbo.zepto
WHERE mrp = 0;


 3. Convert paise to rupees
UPDATE dbo.zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;


 4. Check updated price columns
SELECT mrp, discountedSellingPrice
FROM dbo.zepto;


============================================================
 DATA ANALYSIS
============================================================

 Q1. Top 10 bestvalue products based on discount percentage
SELECT DISTINCT TOP 10 name, mrp, discountPercent
FROM dbo.zepto
ORDER BY discountPercent DESC;


 Q2. Products with high MRP but out of stock
SELECT DISTINCT name, mrp
FROM dbo.zepto
WHERE outOfStock = 1 AND mrp > 300
ORDER BY mrp DESC;


 Q3. Estimated revenue per catery
SELECT catery,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM dbo.zepto
GROUP BY catery
ORDER BY total_revenue DESC;


 Q4. Products where MRP > ₹500 and discount < 10%
SELECT DISTINCT name, mrp, discountPercent
FROM dbo.zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;


 Q5. Top 5 cateries with highest average discount percentage
SELECT TOP 5 catery,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM dbo.zepto
GROUP BY catery
ORDER BY avg_discount DESC;


 Q6. Price per gram for products above 100g (best value first)
SELECT DISTINCT name,
       weightInGms,
       discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM dbo.zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;


 Q7. Group products by weight catery
SELECT DISTINCT name,
       weightInGms,
       CASE 
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_catery
FROM dbo.zepto;


 Q8. Total inventory weight per catery
SELECT catery,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM dbo.zepto
GROUP BY catery
ORDER BY total_weight DESC;

