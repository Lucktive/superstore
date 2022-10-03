  
  -- Descriptive Statistics
  -- Statistics on Sales, Quantity and Profit
  SELECT
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  
  -- Statistics on Sales, Quantity and Profit by year
  SELECT
  Year,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Year
  ORDER BY Year
  
  -- Statistics on Sales, Quantity and Profit by Month
  SELECT
  Month,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Month
  ORDER BY Month
  
  -- Statistics on Sales, Quantity and Profit by Segment
  SELECT
  Segment,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Segment
  
  -- Statistics on Sales, Quantity and Profit by City
  SELECT
  City,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY City
  ORDER BY Total_Sales DESC
  
  -- Statistics on Sales, Quantity and Profit by Category
  SELECT
  Category,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Category
  ORDER BY Total_Sales DESC

  -- Statistics on Sales, Quantity and Profit by Sub_Category
  SELECT
  Sub_Category,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Sub_Category
  ORDER BY Total_Sales DESC

  -- Statistics on Sales, Quantity and Profit by Ship_Mode
  SELECT
  Ship_Mode,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Ship_Mode
  ORDER BY Total_Sales DESC

  -- Statistics on Sales, Quantity and Profit by Product_Name
  SELECT
  Product_Name,
  ROUND(SUM(Sales),2) AS Total_Sales,
  ROUND(SUM(Quantity), 2) AS Total_Quantity,
  ROUND(SUM(Profit), 2) AS Total_Profit,
  ROUND(AVG(Sales),2) AS Average_Sales,
  ROUND(AVG(Quantity), 2) AS Average_Quantity,
  ROUND(AVG(Profit), 2) AS Average_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Product_Name
  ORDER BY Total_Sales DESC