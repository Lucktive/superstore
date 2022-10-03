
  -- Business Analysis
  -- The Two most profitable products in each region
  WITH region_products AS
  (
  SELECT 
    Region,
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY
    Region,
    Product_Name
  ORDER BY Total_Profit DESC
  ),
  rank_products AS
  (
  SELECT *,
    RANK () OVER (PARTITION BY Region ORDER BY region_products.Total_Profit DESC) AS Rank
  FROM region_products
  )
  SELECT
      *
  FROM rank_products
  WHERE rank_products.Rank <= 2

  --The most Profitable Segment
  SELECT
       Segment,
       ROUND( SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Segment
  ORDER BY Total_Profit DESC
  LIMIT 1

  -- The most profitable Region
  SELECT
       Region,
       ROUND( SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY Region
  ORDER BY Total_Profit DESC
  LIMIT 1

  -- The Two most profitable Sub_Category in each region
  WITH region_sub AS
  (
  SELECT 
    Region,
    Sub_Category,
    ROUND(SUM(Profit),2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY
    Region,
    Sub_Category
  ORDER BY Total_Profit DESC
  ),
  rank_sub AS
  (
  SELECT *,
    RANK () OVER (PARTITION BY Region ORDER BY region_sub.Total_Profit DESC) AS Rank
  FROM region_sub
  )
  SELECT
      *
  FROM rank_sub
  WHERE rank_sub.Rank <= 2
  
  -- The top 5 most profitable Cities
  SELECT
       City,
       ROUND( SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY City
  ORDER BY Total_Profit DESC
  LIMIT 5

    
  -- The 3 Cities Responsible the highest losses
  SELECT
       City,
       ROUND( SUM(Profit), 2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY City
  ORDER BY Total_Profit
  LIMIT 3

    -- The Two highest loss making products in each region
  WITH region_products AS
  (
  SELECT 
    Region,
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
  FROM superstoe.superstores_cleaned
  GROUP BY
    Region,
    Product_Name
  ORDER BY Total_Profit
  ),
  rank_products AS
  (
  SELECT *,
    RANK () OVER (PARTITION BY Region ORDER BY region_products.Total_Profit ASC) AS Rank
  FROM region_products
  )
  SELECT
      *
  FROM rank_products
  WHERE rank_products.Rank <= 2