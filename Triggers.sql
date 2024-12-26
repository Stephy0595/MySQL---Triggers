CREATE DATABASE Assignment10;

USE Assignment10;

CREATE TABLE teachers (
Id INT PRIMARY KEY, 
Name VARCHAR(140), 
Subject VARCHAR(150),
    Experience INT, 
    Salary DECIMAL(10, 2)
);

INSERT INTO teachers (Id, 
Name, 
Subject, 
Experience, 
Salary) VALUES
(1, 'Fredrick Louis', 'English', 3, 30000.00),
(2, 'Noah Murphy', 'chemistry', 10, 55000.00),
(3, 'Robert Jones', 'Botany', 5, 40000.00),
(4, 'Margaret Lawrence', 'Geography', 2, 30000.00),
(5, 'Isha Sharma', 'Physical Education', 8, 45000.00),
(6, 'Rose Byrne', 'Zoology', 1, 25000.00),
(7, 'Emma Thompson', 'Physics', 9, 50000.00),
(8, 'Christopher Johnson', 'Mathematics', 4, 42000.00);

SELECT * FROM teachers;


DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
  IF NEW.Salary < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Salary cannot be negative';
  END IF;
END$$

DELIMITER ;

SHOW TRIGGERS;

INSERT INTO teachers VALUES (9, 'Richard Ford', 'Moral Science',4,-25000);

SELECT * FROM teachers;


DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
  INSERT INTO teacher_log (
  teacher_id, action)
  VALUES (NEW.Id, 'INSERT');
END$$

DELIMITER ;

CREATE TABLE Teacher_log (Teacher_id INT, 
action VARCHAR(80),
action_timestamp TIMESTAMP);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, action_timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (10, 'Robert Walser', 'History', 6, 41000.00);

SELECT * FROM teacher_log;

UPDATE teachers
SET experience = 12
WHERE id = 5;

DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Cannot delete teacher with experience greater than 10 years';
    END IF;
END $$

DELIMITER ;

DELETE FROM teachers WHERE id = 5;

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, action_timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;


INSERT INTO teachers (Id, Name, Subject, Experience, Salary)
VALUES (11, 'Thomas Alex', 'Political Science', 8, 44000.00);

DELETE FROM teachers WHERE id = 11;