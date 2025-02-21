CREATE TABLE temporary_employee
(
    id             int           NOT NULL
        PRIMARY KEY,
    first_name     varchar(20)   NULL,
    last_name      varchar(25)   NOT NULL,
    email          varchar(100)  NOT NULL,
    phone_number   varchar(15)   NULL,
    hire_date      date          NOT NULL,
    job_id         varchar(10)   NOT NULL,
    salary         int           NULL,
    commission_pct decimal(2, 2) NULL,
    manager_id     int           NULL,
    department_id  int           NULL,
    CONSTRAINT tem_email
        UNIQUE (email),
    CONSTRAINT fk_tem_department
        FOREIGN KEY (department_id) REFERENCES department (department_id)
)
;

SELECT COUNT(*) FROM temporary_employee;

SELECT
   te.id, te.first_name, te.job_id,
   te_d.department_name, salary
FROM temporary_employee AS te
LEFT JOIN department AS te_d
ON te.department_id = te_d.department_id
WHERE job_id = 'EMP001'
UNION ALL
SELECT
   e.id, e.first_name, e.job_id,
   e_d.department_name, salary
FROM employee AS e
LEFT JOIN department AS e_d
ON e.department_id = e_d.department_id
WHERE job_id = 'EMP001'
ORDER BY id;

INSERT INTO employee VALUES
(251, 'John', 'Doe', 'john@example.com', '123-4567',
 '2023-01-01', 'EMP001', 50000, 0.05, NULL, 10);
INSERT INTO temporary_employee VALUES
(251, 'John', 'Doe', 'john@example.com', '123-4567',
 '2023-01-01', 'EMP001', 50000, 0.05, NULL, 10);