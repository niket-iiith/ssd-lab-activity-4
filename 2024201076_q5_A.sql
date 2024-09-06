ALTER TABLE Subscribers ADD COLUMN Age INT;

DELIMITER //
CREATE PROCEDURE UpdateAgeWithoutCursor(IN _age INT)
BEGIN
    UPDATE Subscribers SET Age = _age;
END //

DELIMITER ;

CALL UpdateAgeWithoutCursor(76);