
-- RFM Analysis
 WITH calc_field AS
 (
   SELECT
      Customer_Name,
      MAX(Order_Date) AS Recent,
      COUNT(*) AS Frequent,
      ROUND(AVG(Sales),2) AS Amount
   FROM `oceanic-will-353512.superstoe.superstores_cleaned` 
   GROUP BY Customer_Name
   ORDER BY Frequent DESC
 )
   SELECT
       Customer_Name,
       NTILE(10) OVER ( ORDER BY calc_field.Recent) AS RFM_Recency,
       NTILE(10) OVER ( ORDER BY calc_field.Frequent) AS RFM_Frequency,
       NTILE(10) OVER ( ORDER BY calc_field.Amount) AS RFM_Monetary
   FROM calc_field
   GROUP BY Customer_Name,
            Recent,
            Frequent,
            calc_field.Amount



  -- The top Customers
  WITH calc_field AS
 (
   SELECT
      Customer_Name,
      MAX(Order_Date) AS Recent,
      COUNT(*) AS Frequent,
      ROUND(AVG(Sales),2) AS Amount
   FROM `oceanic-will-353512.superstoe.superstores_cleaned` 
   GROUP BY Customer_Name
   ORDER BY Frequent DESC
 ),
 ranking AS
 (
   SELECT
       Customer_Name,
       NTILE(10) OVER ( ORDER BY calc_field.Recent) AS RFM_Recency,
       NTILE(10) OVER ( ORDER BY calc_field.Frequent) AS RFM_Frequency,
       NTILE(10) OVER ( ORDER BY calc_field.Amount) AS RFM_Monetary
   FROM calc_field
   GROUP BY Customer_Name,
            Recent,
            Frequent,
            calc_field.Amount
 )
 SELECT 
    *
 FROM ranking
 WHERE ranking.RFM_Recency > 8 AND ranking.RFM_Frequency > 8 AND RFM_Monetary > 8
