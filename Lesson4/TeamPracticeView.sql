
LESSON_4


1.Создать на основе запросов, которые вы сделали в ДЗ к уроку 3, VIEW.

-------------request-----------------------

Executing:
USE `employees`;
CREATE  OR REPLACE VIEW `max_calary` AS
    SELECT 
        e.first_name, e.last_name, e.emp_no, MAX(s.salary)
    FROM
        employees.employees e
            LEFT JOIN
        employees.salaries s ON e.emp_no = s.emp_no
    ORDER BY s.salary DESC
    LIMIT 0 , 1;

-------------result------------------------

SQL script was successfully applied to the database.

CREATE 
    
	ALGORITHM = UNDEFINED
	DEFINER = `root`@`localhost` 
   
	SQL SECURITY DEFINER

VIEW `employees`.`max_calary` AS
    
	SELECT 
        
	`e`.`first_name` AS `first_name`,
        
	`e`.`last_name` AS `last_name`,
        
	`e`.`emp_no` AS `emp_no`,
        
	MAX(`s`.`salary`) AS `MAX(s.salary)`
    
  FROM
        
	(`employees`.`employees` `e`
        
	LEFT JOIN `employees`.`salaries` `s` ON ((`e`.`emp_no` = `s`.`emp_no`)))
    
  LIMIT 0 , 1

___________________________________________________________________________________________
2.
Создать функцию, которая найдет менеджера по имени и фамилии.

-------------request----------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `meneger_search`(name_param CHAR(30)) 
RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC

BEGIN

	declare result_meneger CHAR;

	SELECT 
		COUNT(*)
    
INTO result_meneger 
	FROM 
		employees.employees
    
	WHERE 
		(first_name,last_name) = name_param;
        

RETURN result_meneger;
END
-------------result------------------------
Executing:
USE `employees`;
DROP function IF EXISTS `meneger_search`;

DELIMITER $$
USE `employees`$$
CREATE FUNCTION `meneger_search` (name_param CHAR(30))
RETURNS CHAR DETERMINISTIC
BEGIN
declare result_meneger CHAR;
SELECT 
		COUNT(*)
    INTO result_meneger FROM 
		employees.employees
    WHERE 
		(first_name,last_name) = name_param;
        
RETURN result_meneger;
END$$
DELIMITER ;

SQL script was successfully applied to the database.
_____________________________________________________________________________________

3.Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус, 
занося запись в таблицу salary.

CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`employees_AFTER_INSERT_1` 

AFTER INSERT ON `employees` FOR EACH ROW 

BEGIN
INSERT INTO employees.salaries (emp_no, salary, from_date, to_date) 
VALUES
(NEW.emp_no, 100, NEW.from_date, NEW.to_date);
END

-------------result------------------------
DROP TRIGGER IF EXISTS `employees`.`dept_manager`;



DELIMITER $$
USE `employees`$$
CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`dept_manager` 

AFTER INSERT ON `employees` FOR EACH ROW

BEGIN

INSERT INTO employees.salaries (emp_no, salary, from_date, to_date) VALUES

(NEW.emp_no, 100, NEW.from_date, NEW.to_date);

END
$$
DELIMITER ;





















