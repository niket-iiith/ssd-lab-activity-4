DELIMITER //
CREATE PROCEDURE showCummulativeWatchTimeOfEachUser()
BEGIN
    SELECT s.SubscriberName, SUM(w.WatchTime) AS TotalWatchTime
    FROM WatchHistory w
    JOIN Subscribers s ON w.SubscriberID = s.SubscriberID
    GROUP BY w.SubscriberID;
END //
DELIMITER ;

CALL showCummulativeWatchTimeOfEachUser();