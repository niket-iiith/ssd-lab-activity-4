DELIMITER //

CREATE PROCEDURE AddNewShow ( IN _showID INT, IN _showTitle VARCHAR(100), IN _showGenre VARCHAR(50), IN _showReleaseYear INT )
BEGIN
    INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear)
    VALUES (_showID, _showTitle, _showGenre, _showReleaseYear);
END //

DELIMITER ;

CALL AddNewShow(76, 'Niket-SSD', 'Mtech-CSE', 2024);