  
  -- Pareto Analysis
  -- Is 20% of the products contributing to 80% of profit?
  WITH products_profit AS
  (
  SELECT 
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY
    Product_Name
  ORDER BY Total_Profit DESC
  )
  SELECT *,
    SUM (Total_Profit) OVER ( ORDER BY products_profit.Total_Profit DESC) * (100/ ( SELECT SUM(Profit) FROM superstoe.superstores_cleaned)) AS Cum_Profit_Percentage
  FROM products_profit
  
   -- Is 20% of the products contributing to 80% of Sales?
  WITH products_Sales AS
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
    SUM (Total_Sales) OVER ( ORDER BY products_Sales.Total_Sales DESC) * (100/ ( SELECT SUM(Sales) FROM superstoe.superstores_cleaned)) AS Cum_Sales_Percentage
  FROM products_Sales