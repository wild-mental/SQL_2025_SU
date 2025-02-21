-- 1. 부서 테이블 생성
DROP TABLE department;
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

SHOW CREATE TABLE employee;
SELECT * FROM employee;

SELECT DISTINCT employee.department_id
FROM employee;

-- 1-2. 부서 테이블 더미 데이터 생성
INSERT INTO department VALUES
(10, 'IT_DEV'),
(20, 'HR'),
(30, 'SALES'),
(40, 'ADV'),
(50, 'MANAGEMENT');

INSERT INTO department VALUES
(60, 'DATA'),
(70, 'MARKETING'),
(80, 'SECRETARY');

DELETE FROM department WHERE department.department_id IN (60, 70, 80);

-- 2. 외래 키(FK) 제약 조건 추가
ALTER TABLE employee
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES department(department_id);

ALTER TABLE department RENAME COLUMN id TO department_id;
SHOW CREATE TABLE department;

SELECT * FROM department;

SELECT
  -- JOIN 테이블 간 컬럼명이 겹치는 경우 테이블명 생략 불가
  first_name, last_name,
  employee.department_id, department.department_id, department.department_name
FROM
  employee
NATURAL JOIN
  department;

SELECT
  -- JOIN 테이블 간 컬럼명이 겹치는 경우 테이블명 생략 불가
  first_name, last_name,
  employee.department_id, department.department_id, department.department_name
FROM
  employee -- 250 행
JOIN
  department  -- 5 행
USING
  (department_id);

-- Cartesian Product 발생하는 Cross Join
SELECT
  COUNT(*)
FROM
  employee -- 250 행
CROSS JOIN
  department  -- 5 행
;

SELECT
  COUNT(*)
FROM
  employee, department
;

SELECT
  e.first_name AS employee_name, e.manager_id, m.id, m.first_name AS manager_name
FROM
  employee AS e
INNER JOIN
  employee AS m
ON
  e.manager_id = m.id;