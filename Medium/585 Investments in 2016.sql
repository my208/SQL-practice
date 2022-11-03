SELECT ROUND(SUM(tiv_2016), 2) tiv_2016 
FROM (SELECT *, 
      COUNT(1) OVER (PARTITION BY tiv_2015) cnt_15, 
      COUNT(1) OVER (PARTITION BY lat, lon) cnt_loc
FROM Insurance
) sub
WHERE cnt_loc = 1 AND cnt_15 > 1;

SELECT ROUND(SUM(tiv_2016), 2) tiv_2016
FROM Insurance i1
WHERE 1 = (SELECT COUNT(pid) FROM Insurance i2 WHERE i1.lat = i2.lat AND i1.lon = i2.lon)
AND 1 < (SELECT COUNT(pid) FROM Insurance i3 WHERE i1.tiv_2015 = i3.tiv_2015);