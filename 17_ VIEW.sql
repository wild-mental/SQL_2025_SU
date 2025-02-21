CREATE VIEW temp_employee_dev_salary AS
SELECT
   te.id, te.first_name, te.job_id,
   te_d.department_name, salary
FROM temporary_employee AS te
LEFT JOIN department AS te_d
ON te.department_id = te_d.department_id
WHERE job_id = 'DEV';

CREATE VIEW reg_employee_dev_salary AS
SELECT
   e.id, e.first_name, e.job_id,
   e_d.department_name, salary
FROM employee AS e
LEFT JOIN department AS e_d
ON e.department_id = e_d.department_id
WHERE job_id = 'DEV';

SELECT * FROM temp_employee_dev_salary
UNION
SELECT * FROM reg_employee_dev_salary
ORDER BY salary DESC LIMIT 5;