## Q1 Which month by order date has the highest cancellation rate (by booking volume)? And what is the rate? (Please disregard the year, when looking at month) ##

SELECT
  EXTRACT(MONTH FROM OrderDate) AS month,
  ROUND(SUM(IsCancelled) / COUNT(ItineraryItemID),4) AS cancellation_rate
FROM Bookings
GROUP BY month
ORDER BY cancellation_rate DESC LIMIT 1
