use flipkart;
-- Q1. Top 10 Customers by Spending
SELECT Customer_Name, SUM(Order_Value) AS Total_Spent
FROM flipkart_sales_data
GROUP BY Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;

-- Q2. Sales by Category and Sub-Category

SELECT Category, Sub_Category, SUM(Order_Value) AS Sales
FROM flipkart_sales_data
GROUP BY Category, Sub_Category
ORDER BY Sales DESC;

-- Q3. Delivery Performance

SELECT Delivery_Status, COUNT(*) AS Orders, 
AVG(Delivery_Days) AS Avg_Delivery_Days
FROM flipkart_sales_data
GROUP BY Delivery_Status;


-- Q4. Revenue by Payment Method

SELECT Payment_Method, SUM(Net_Revenue) AS Revenue
FROM flipkart_sales_data
GROUP BY Payment_Method
ORDER BY Revenue DESC;

-- Q5. Seller Performance Ranking

SELECT Seller_Name, SUM(Net_Revenue) AS Total_Revenue,
RANK() OVER (ORDER BY SUM(Net_Revenue) DESC) AS Rank_Position
FROM flipkart_sales_data
GROUP BY Seller_Name;

-- Q6. Return Analysis

SELECT Return_Flag, COUNT(*) AS Orders, 
       SUM(Order_Value) AS Returned_Value
FROM flipkart_sales_data
GROUP BY Return_Flag;

-- Q7. Campaign Effectiveness

SELECT Campaign_ID, COUNT(Order_ID) AS Orders,
       SUM(Net_Revenue) AS Revenue, 
       AVG(Customer_Rating) AS Avg_Rating
FROM flipkart_sales_data
GROUP BY Campaign_ID
ORDER BY Revenue DESC;
 