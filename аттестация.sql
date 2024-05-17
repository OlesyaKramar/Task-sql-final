-- Промежуточная аттестация по курсу GeekBrains "Базы данных и SQL".
-- Code by 0lessyA
-- На заметку: прочитала в документации, что в sql целочисленное деление указывается не //, а DIV: 5/2 = 2.5, 5 DIV 2 = 2 

-- Задача 1
DELIMITER $$
CREATE FUNCTION format_seconds (seconds_count INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(255) DEFAULT "";
    DECLARE seconds_not_divided INT DEFAULT 0;
    SET result = CONCAT(seconds_count DIV 86400, " days "); -- 86400 - количество секунд в сутках
    SET seconds_not_divided = seconds_count % 86400;
    SET result = CONCAT(result, seconds_not_divided DIV 3600, " hours "); -- 3600 - количество секунд в часе
    SET seconds_not_divided = seconds_not_divided % 3600;
    SET result = CONCAT(result, seconds_not_divided DIV 60, " minutes "); -- 60 - количество секунд в минуте
    SET seconds_not_divided = seconds_not_divided % 60;
    SET result = CONCAT(result, seconds_not_divided, " seconds"); -- Теперь просто добавляем к секундам все, что осталось после деления
    RETURN result;
END $$
DELIMITER ;
SELECT format_seconds(123456); -- Для примера взяла число из задания
-- Продолжение следует


-- Задача 2
DELIMITER $$
CREATE PROCEDURE even_numbers (max_number INT)
BEGIN
	DECLARE result VARCHAR(255) DEFAULT "";
    DECLARE n INT DEFAULT 2;
    WHILE n <= max_number DO
		SET result = CONCAT(result, n, " ");
        SET n = n+2;
	END WHILE;
    SELECT result;
END $$
DELIMITER ;
CALL even_numbers(10);

-- Это всё на сегодня, спасибо за внимание! Хорошего вам времени суток!

