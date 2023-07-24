## Q3

SELECT
  yearmonth,
  num_of_bookings,
  num_of_bookings - LAG(num_of_bookings) OVER(ORDER BY yearmonth) as YoY_change_num,
  ROUND((num_of_bookings - LAG(num_of_bookings) OVER(ORDER BY yearmonth))/num_of_bookings,4) AS YoY_change_pct
FROM
  (
  SELECT
    (EXTRACT(YEAR FROM OrderDate) || '-' || EXTRACT(MONTH FROM OrderDate)) AS yearmonth,
    COUNT(ItineraryItemID) AS num_of_bookings
  FROM Bookings t1
  INNER JOIN DeviceType t2
  ON t1.DeviceID = t2.DeviceID
  WHERE 
    t2.DeviceType = 'DESKTOP' AND
    (
      OrderDate BETWEEN '2018-09-01' AND '2018-09-30' OR
      OrderDate BETWEEN '2017-09-01' AND '2017-09-30'
    )
  GROUP BY yearmonth
  )
ORDER BY yearmonth
