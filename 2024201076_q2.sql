DELIMITER //

CREATE PROCEDURE RetreiveAllUsers()
BEGIN
    SELECT * FROM Subscribers;
END //

DELIMITER ;

CALL RetreiveAllUsers();