DELIMITER //

CREATE PROCEDURE GetAllUsersWithCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_id INT;
    DECLARE user_name VARCHAR(100);
    DECLARE user_sub_date DATE;
    DECLARE cur CURSOR FOR SELECT s.SubscriberID, s.SubscriberName, s.SubscriptionDate FROM Subscribers s;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO user_id, user_name, user_sub_date;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT user_id, user_name, user_sub_date;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL GetAllUsersWithCursor();