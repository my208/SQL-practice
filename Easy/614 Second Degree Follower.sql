SELECT f.followee follower, COUNT(*) num
FROM Follow f
WHERE f.followee IN (SELECT follower FROM Follow)
GROUP BY f.followee ORDER BY f.followee;