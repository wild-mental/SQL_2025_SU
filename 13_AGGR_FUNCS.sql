-- ORACLE DB 샘플 데이터
DROP TABLE employee;
CREATE TABLE employee (
    id INT(6) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary INT(8),
    commission_pct DECIMAL(2, 2),
    manager_id INT(6),
    department_id INT(4)
);

SELECT * FROM employee;
DESC employee;

-- 환경변수 백업 및 복구 작업 패턴
SELECT @saved_sql_mode := @@sql_mode;
SELECT @saved_sql_mode;
SET sql_mode = '';
SELECT @@sql_mode;

SET sql_mode = @saved_sql_mode;
SELECT @@sql_mode;

SELECT
    department_id,
    COUNT(id) AS employee_count,
    COUNT(commission_pct) AS commisioning_employee,
    AVG(commission_pct) AS avg_commision,
    AVG(IFNULL(commission_pct, 0.2)) AS avg_commision_with_default,
    AVG(salary) AS average_salary
FROM
    employee;
GROUP BY
    department_id
HAVING  -- 집계 결과에 대한 필터링 (WHERE 조건의 집계함수 버전)
    COUNT(id) >= 47;