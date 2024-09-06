ALTER TABLE Subscribers ADD COLUMN Age INT;

DELIMITER //

CREATE PROCEDURE UpdateAgeWithoutCursor()
BEGIN
    UPDATE Subscribers SET Age = FLOOR(DATEDIFF(CURDATE(), SubscriptionDate) / 365);
END //

DELIMITER ;

CALL UpdateAgeWithoutCursor();