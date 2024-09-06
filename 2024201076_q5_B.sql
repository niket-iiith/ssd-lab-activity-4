DELIMITER //

CREATE PROCEDURE UpdateAgeWithCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE sub_date DATE;
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriptionDate FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id, sub_date;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE Subscribers
        SET Age = FLOOR(DATEDIFF(CURDATE(), sub_date) / 365)
        WHERE SubscriberID = sub_id;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL UpdateAgeWithCursor();