#Q5
SELECT
  EXTRACT(YEAR FROM OrderDate) AS year,
  EXTRACT(MONTH FROM OrderDate) AS month,
  FORMAT_DATE('%Y-%b', OrderDate) AS year_month,
  COUNT(ItineraryItemID) AS booking_count
FROM Bookings
GROUP BY year, month, year_month
ORDER BY year, month
