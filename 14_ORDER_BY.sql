SELECT DISTINCT CONCAT(first_name, last_name), first_name AS fn, last_name ln
FROM employee
ORDER BY 2 DESC , 3 ASC;

SELECT department_id, COUNT(*) AS num_employees
FROM employee
GROUP BY department_id
ORDER BY COUNT(*) DESC;

SELECT first_name, last_name, salary, job_id
FROM employee;

SELECT first_name, last_name, salary, job_id
FROM employee
ORDER BY
    CASE
        WHEN 1 THEN job_id
    END DESC,
    CASE job_id
        WHEN 'SALES' THEN salary
        ELSE NULL
    END DESC,
    CASE job_id
        WHEN 'HR' THEN first_name
        ELSE NULL
    END ASC
;