## Q1

SELECT
  EXTRACT(MONTH FROM OrderDate) AS month,
  ROUND(SUM(IsCancelled) / COUNT(ItineraryItemID),4) AS cancellation_rate
FROM Bookings
GROUP BY month
ORDER BY cancellation_rate DESC LIMIT 1
