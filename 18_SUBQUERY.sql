-- 값으로 핸들링 : 단일값으로 사용
SELECT COUNT(*) FROM employee;
-- 배열로 핸들링 : 연속값, 범위 집합 등으로 사용
SELECT salary FROM employee limit 5;
-- 테이블로 핸들링 : FROM 절 또는 2차 데이터 참조 구문 작성 필요
SELECT employee.first_name, salary FROM employee limit 5;

-- 스칼라 서브쿼리를 활용해서 집계된 값(스칼라)과 기본 컬럼 값을 연산하는 예제
SELECT id, first_name, salary,
      (SELECT AVG(salary)
       FROM employee e_avg_sal
       where e.department_id = e_avg_sal.department_id
       GROUP BY department_id) AS dept_average_salary,
      (SELECT e.salary - AVG(salary)
       FROM employee e_gap_sal
       where e.department_id = e_gap_sal.department_id
       GROUP BY department_id) AS salary_gap_avg_personal
FROM employee e;

-- FROM 절에서 테이블형 결과를 서브쿼리 아웃풋으로 활용
-- 서브쿼리 단독
SELECT department_id, AVG(salary) AS average_salary
      FROM employee GROUP BY department_id;
-- 쿼리 결합 방법
SELECT e.id, e.salary,
       avg_salaries.average_salary,
       e.salary - avg_salaries.average_salary as gap_salary
FROM employee e,
     (SELECT department_id, AVG(salary) AS average_salary
      FROM employee GROUP BY department_id) AS avg_salaries
WHERE e.department_id = avg_salaries.department_id;
SELECT AVG(salary) FROM employee;
SELECT id, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)
ORDER BY salary;