  
  -- Discount Analysis using Profit
  WITH products_discount AS
  (
  SELECT 
    Discount,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Discount
  ORDER BY Discount
  )
  SELECT *,
    Rank() OVER ( ORDER BY products_discount.Total_Profit DESC) AS Rank
  FROM products_discount
  ORDER BY Discount
  
  -- Discount Analysis using Sales
  WITH products_discount AS
  (
  SELECT 
    Discount,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Discount
  ORDER BY Discount
  )
  SELECT *,
    Rank() OVER ( ORDER BY products_discount.Total_Sales DESC) AS Rank
  FROM products_discount
  ORDER BY Discount

    -- Discount Analysis using Profit and Sales
  WITH products_discount AS
  (
  SELECT 
    Discount,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Discount
  ORDER BY Discount
  )
  SELECT *,
    Rank() OVER ( ORDER BY products_discount.Total_Sales DESC) AS Sales_Ranking,  
    Rank() OVER ( ORDER BY products_discount.Total_Profit DESC) AS Profit_Ranking
  FROM products_discount
  ORDER BY Discount