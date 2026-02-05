-- ============================================
-- GLOBAL SALES PORTFOLIO PROJECT (SQL ANALYSIS)
-- Dataset: Clean_Data_Sales.csv
-- Tool: SQLite / PostgreSQL Compatible
-- Author: James Ogaja
-- ============================================


-- ============================================
-- 1. Preview Dataset
-- ============================================

SELECT *
FROM sales
LIMIT 10;

-- ============================================
-- 2. Key Business Metrics (KPIs)
-- ============================================

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales),3) AS Profit_Margin
FROM sales;

-- =============================================
-- 3. Total Sales by Year
-- =============================================

SELECT
    SUBSTR(Order_Date, 1, 8) AS Year,
    SUM(Sales) AS Yearly_Sales
FROM sales
GROUP BY Year
ORDER BY Year;

-- =============================================
-- 4. Profit Performance by Region
-- =============================================

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- =============================================
-- 5. Profit by Category
-- =============================================

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- ===========================================
-- 6. Top 10 Products by Sales
-- ===========================================

SELECT 
    Product_Names,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Product_Name
ORDER BY Total_Sales
LIMIT 10;

-- ===========================================
-- 7. Discount vs Profit Analysis
-- ===========================================

SELECT
    Discount,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM sales
GROUP BY Discount
ORDER BY Discount;

-- ===========================================
-- 8. Orders With Negative Profit
-- ===========================================

SELECT
    Order_ID,
    Product_Name,
    Sales,
    Profit,
    Discount
FROM sales
WHERE Profit < 0 
ORDER BY Profit ASC
LIMIT 20;

-- ===========================================
-- 9. Summary Insights
-- ===========================================

-- 1. Central and north regions demonstrate the highest profitability
-- 2. Technology and furniture categories lead in revenue generation and profit margins
-- 3. Discounts exceeding 0.3 negatively impact profitability
-- 4. Cisco Telepresence System EX90, Cubify CubeX 3D Printer Triple Head Print, and Apple Smart Phone incurred losses despite high sales volumes