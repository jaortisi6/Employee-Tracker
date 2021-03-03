DROP DATABASE IF EXISTS employee_tracker_db;

CREATE DATABASE employee_tracker_db;

USE employee_tracker_db;

CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role_id INT NOT NULL,
    manager_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO
    employee (first_name, last_name, role_id, manager_id)
VALUES
    ("John", "Brown", "1", "2"),
    ("Jim", "Green", "2", "1"),
    ("Jason", "Roberts", "3", "1"),
    ("Ted", "Olsen", "4", "3"),
    ("Kevin", "Robins", "5", "1"),
    ("Jake", "State", "6", "1"),
    ("Jordan", "Miller", "1", "1");

SELECT
    e.id,
    e.first_name,
    e.last_name,
    d.name AS department,
    r.title,
    r.salary,
    CONCAT_WS(" ", m.first_name, m.last_name) AS manager
FROM
    employee e
    LEFT JOIN employee m ON m.id = e.manager_id
    INNER JOIN role r ON e.role_id = r.id
    INNER JOIN department d ON r.department_id = d.id
ORDER BY
    e.id ASC;

INSERT INTO
    role (title, salary, department_id)
VALUES
    ("Backend Developer", "95000", "2"),
    ("CPA", "60000", "5"),
    ("Sales Rep", "55000", "1"),
    ("Lead Trainer", "60000", "4"),
    ("Front End Developer", "85000", "2"),
    ("CEO", "100000", "7"),
    ("HR Specialist", "52000", "3");

INSERT INTO
    department (name)
VALUES
    ("Sales"),
    ("Engineering"),
    ("HR"),
    ("Training"),
    ("Accounting"),
    ("Design"),
    ("Management");

SELECT
    r.id,
    r.title,
    r.salary,
    d.name as Department_Name
FROM
    role AS r
    INNER JOIN department AS d ON r.department_id = d.id;

SELECT
    id,
    CONCAT_WS(' ', first_name, last_name) AS Employee_Name
FROM
    employee
UPDATE
    employee
SET
    role_id = 3
WHERE
    id = 8;

UPDATE
    employee
SET
    ?
WHERE
    ?;

DELETE FROM
    department
WHERE
    id = 13;