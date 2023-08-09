#Q6
# Testing
SELECT
  ab_test_group,
  yearmonth,
  DeviceType,
  channel_name,
  SUM(IsCancelled) AS cancellation,
  COUNT(DISTINCT(ItineraryItemID)) AS total_booking,
  SUM(BookingValue) AS booking_value
FROM
  (
  SELECT
    ItineraryItemID,
    FORMAT_DATE('%Y-%b', OrderDate) AS yearmonth,
    DeviceType,
    CASE 
      WHEN ChannelID = 1949 THEN 'Ambiguous: Email/Other' 
      ELSE ChannelName 
    END AS channel_name,
    CASE 
      WHEN MOD(ItineraryItemID,2) = 0 THEN 'test' 
      ELSE 'control' 
    END AS ab_test_group,
    IsCancelled,
    BookingValue
  FROM Bookings t1
  INNER JOIN DeviceType t2
    ON t1.DeviceID = t2.DeviceID
  INNER JOIN ChannelName t3
    ON t1.ChannelID = t3.Channel_ID
  WHERE 
    EXTRACT(MONTH FROM OrderDate) = 1 AND
    EXTRACT(YEAR FROM OrderDate) = 2018
  )
GROUP BY ab_test_group, yearmonth, DeviceType, channel_name
ORDER BY yearmonth, ab_test_group, DeviceType, channel_name
