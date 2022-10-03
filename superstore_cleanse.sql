   -- table created for train, test and result table in Big Query
   -- Cleaning the Superstore Datasets
   -- Joining the test and result table
    -- create a view with the new view
  create view `oceanic-will-353512.superstoe.superstores_cleaned`  as
   WITH test_result AS
   (
   SELECT
       e.*,
       r.Profit
   FROM oceanic-will-353512.superstoe.test AS e
   JOIN oceanic-will-353512.superstoe.result AS r
   ON e.Row_ID = r.Row_ID
   ORDER BY Row_ID
   ),
   train_ordered AS -- Ordering the train table
   (
   SELECT *
   FROM `oceanic-will-353512.superstoe.train` 
   ORDER BY Row_ID  DESC
   ),
   store AS -- Joining the combined test and result table with the train table
   (
   SELECT * 
   FROM train_ordered
   UNION DISTINCT
   SELECT  *
   FROM test_result
   ),
   stores AS -- Extracting Date elements from the Order_Date Column
   (
   SELECT * ,
   EXTRACT( YEAR FROM Order_DATE) AS Year,
   EXTRACT( MONTH FROM Order_DATE) AS Month,
   EXTRACT( DAY FROM Order_DATE) AS Day,
   EXTRACT( DAYOFWEEK FROM Order_DATE) AS WeekDay
   FROM store
   ORDER BY Row_ID 
   ),
   superstores AS -- Labelling the days of the week
   (
   SELECT *,
   CASE 
        WHEN WeekDay = 1 THEN "Sunday"
        WHEN WeekDay = 2 THEN "Monday"
        WHEN WeekDay = 3 THEN "Tuesday"
        WHEN WeekDay = 4 THEN "Wednesday"
        WHEN WeekDay = 5 THEN "Thursday"
        WHEN WeekDay = 6 THEN "Friday"
        ELSE "Satrurday" 
        END AS Days_OF_Week
   FROM stores
   )
   SELECT -- formatting the Sales, Discount and Profit columns
    Row_ID,
    Order_ID ,
    Order_Date ,
    Ship_Date,
    Ship_Mode ,
    Customer_ID ,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region ,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    ROUND(Sales,2) AS Sales,
    Quantity,
    ROUND(Discount,2) AS Discount,
    ROUND(Profit, 2) AS Profit,
    Year,
    Month,
    Day,
    Days_Of_Week
    FROM superstores

