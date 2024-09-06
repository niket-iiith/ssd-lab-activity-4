DELIMITER //

CREATE PROCEDURE GetAllUsersWithCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO user_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT user_name;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL GetAllUsersWithCursor();