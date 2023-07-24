## Q4

SELECT
  traveler_check,
  ROUND(booking_value/total_booking_value,4) AS five_or_more_travelers_booking_value_pct
FROM
  (
  SELECT
    CASE WHEN TravelerCount >= 5 THEN 'five_or_more_travelers' END AS traveler_check,
    SUM(BookingValue) AS booking_value,
    (SELECT SUM(BookingValue) FROM Bookings WHERE IsCancelled = 0) AS total_booking_value
  FROM Bookings
  WHERE IsCancelled = 0 -- assumption: total booking value is more meaningfully analysed when cancellations are removed
  GROUP BY traveler_check
  )
WHERE traveler_check = 'five_or_more_travelers'
