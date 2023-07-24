## Q2 Create a chart showing booking volume by Travel Month and Channel. (Please disregard the year, when looking at month) ##

SELECT
  EXTRACT(MONTH FROM OrderDate) AS month,
  CASE WHEN ChannelID = 1949 THEN 'Ambiguous: Email/Other' ELSE ChannelName END AS channel_name,
  COUNT(DISTINCT(ItineraryItemID)) AS total_booking
FROM Bookings t1
INNER JOIN ChannelName t2
ON t1.ChannelID = t2.Channel_ID
GROUP BY month, channel_name
ORDER BY month, channel_name
