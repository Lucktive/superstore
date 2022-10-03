
  -- Time Series Analysis
  -- Lagging Sales
  WITH stores AS
  (
  SELECT 
    Order_Date,
    ROUND(SUM(Sales),2) AS Total_Sales
  FROM superstoe.superstores_cleaned
  GROUP BY
    Order_Date
  ORDER BY Order_Date
  )
  SELECT *,
    LAG(Total_Sales, 1) OVER (ORDER BY Order_Date ASC) AS Lagging_Sales
  FROM stores
  ORDER BY Order_Date

  
  -- Leading Sales
   WITH stores AS
  (
  SELECT 
    Order_Date,
    ROUND(SUM(Sales),2) AS Total_Sales
  FROM superstoe.superstores_cleaned
  GROUP BY
    Order_Date
  ORDER BY Order_Date
  )
  SELECT *,
     LEAD(Total_Sales, 1) OVER (ORDER BY Order_Date ASC) AS Leading_Sales
  FROM stores
  ORDER BY Order_Date
 
  -- Ranking Order_Date by Sales
   WITH stores AS
  (
  SELECT 
    Order_Date,
    ROUND(SUM(Sales),2) AS Total_Sales
  FROM superstoe.superstores_cleaned
  GROUP BY
    Order_Date
  ORDER BY Total_Sales DESC
  )
  SELECT *,
     RANK() OVER (ORDER BY Total_Sales DESC) AS Rank
  FROM stores
  ORDER BY Rank

   
  -- Ranking Product_Name by Sales
   WITH stores AS
  (
  SELECT 
    Product_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
  FROM superstoe.superstores_cleaned
  GROUP BY
    Product_Name
  ORDER BY Total_Sales DESC
  )
  SELECT *,
     RANK() OVER (ORDER BY Total_Sales DESC) AS Rank
  FROM stores
  ORDER BY Rank
 
   -- Ranking City by Profit
   WITH stores AS
  (
  SELECT 
    City,
    ROUND(SUM(Profit),2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY
    City
  ORDER BY Total_Profit DESC
  )
  SELECT *,
     RANK() OVER (ORDER BY Total_Profit DESC) AS Rank
  FROM stores
  ORDER BY Rank

    -- Sales Running Total
   WITH stores AS
  (
  SELECT 
    Order_Date,
    ROUND(SUM(Sales),2) AS Total_Sales
  FROM superstoe.superstores_cleaned
  GROUP BY
    Order_Date
  ORDER BY Order_Date
  )
  SELECT *,
     ROUND(SUM(Total_Sales) OVER (ORDER BY Order_Date ASC), 2) AS Sales_Running_Total
  FROM stores

     -- Profit Running Total
   WITH stores AS
  (
  SELECT 
    Order_Date,
    ROUND(SUM(Profit),2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY
    Order_Date
  ORDER BY Order_Date
  )
  SELECT *,
     ROUND(SUM(Total_Profit) OVER (ORDER BY Order_Date ASC), 2) AS Profit_Running_Total
  FROM stores