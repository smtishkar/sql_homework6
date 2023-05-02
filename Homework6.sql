use homework6;

DELIMITER //
CREATE PROCEDURE sec2 (n int)
BEGIN 
	DECLARE days DECIMAL (5,2) DEFAULT 0;
    DECLARE Hours DECIMAL (5,2) DEFAULT 0;
    DECLARE Minutes DECIMAL (5,2) DEFAULT 0;
    DECLARE Seconds DECIMAL (5,2) DEFAULT 0;
		SET days = n / 86400;
		SET n = n % 86400;
		SET Hours = n / 3600;
        SET n = n % 3600;
        SET Minutes = n / 60;
        SET n = n % 60;
        SET Seconds = n; 
	SELECT floor(days), floor(hours), floor(minutes), floor(seconds);
END // 
DELIMITER ;

CALL sec2 (123456);

DELIMITER //
CREATE FUNCTION sec (n INT)
RETURNS VARCHAR (100)
deterministic 
BEGIN 
	DECLARE days DECIMAL (5,0)DEFAULT 0;
    DECLARE Hours DECIMAL (5,0) DEFAULT 0;
    DECLARE Minutes DECIMAL (5,0) DEFAULT 0;
    DECLARE Seconds DECIMAL (5,0) DEFAULT 0;
    DECLARE Res VARCHAR (100) Default ' ';
		SET days = n / (86400);
		SET n = n % (86400);
		SET Hours = n / 3600;
        SET n = n % 3600;
        SET Minutes = n / 60;
        SET n = n % 60;
        SET Seconds = n; 
	    RETURN CONCAT (floor(days), ' days, ', floor(Hours), ' hours, ', floor(Minutes), ' minutes, ', floor(Seconds), ' seconds'); 
END // 
DELIMITER ;

SELECT sec (123456);

DELIMITER //
CREATE FUNCTION even (n INT)
RETURNS VARCHAR (100)
deterministic 
BEGIN 
	DECLARE Res VARCHAR (100) Default ' ';
    DECLARE i INT DEFAULT 0;
    
    While i < n do
		SET i = i + 2;
        SET res = CONCAT (res, ' ', i);
	     
    end while;  
    RETURN res;
END // 
DELIMITER ;

SELECT even (10);


