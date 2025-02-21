DELIMITER //

CREATE PROCEDURE GenerateTempEmployeeData()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE rand_fname VARCHAR(8);
    DECLARE rand_lname VARCHAR(8);
    DECLARE rand_email VARCHAR(100);
    DECLARE rand_phone VARCHAR(15);
    DECLARE rand_hire_date DATE;
    DECLARE rand_job_id VARCHAR(10);
    DECLARE rand_salary INT;
    DECLARE rand_commission DECIMAL(2,2);
    DECLARE rand_manager INT;
    DECLARE rand_dept INT;

    -- 250개 레코드 삽입
    WHILE i <= 250 DO
        -- 랜덤 first_name 선택
        SET rand_fname = ELT(FLOOR(1 + RAND() * 10),
            'John', 'Emma', 'Michael', 'Sarah', 'David',
            'Lisa', 'James', 'Emily', 'Robert', 'Olivia');

        -- 랜덤 last_name 선택
        SET rand_lname = ELT(FLOOR(1 + RAND() * 10),
            'Smith', 'Johnson', 'Brown', 'Davis', 'Wilson',
            'Taylor', 'Anderson', 'Martinez', 'Garcia', 'Lee');

        -- 고유한 이메일 생성 (first_name.last_name 형식에 id 추가로 고유성 보장)
        SET rand_email = CONCAT(LOWER(rand_fname), '.', LOWER(rand_lname), i, '@company.com');

        -- 랜덤 전화번호 (123-456-XXXX 형식)
        SET rand_phone = CONCAT('123-456-', LPAD(FLOOR(RAND() * 10000), 4, '0'));

        -- 랜덤 hire_date (2015-01-01 ~ 2025-02-20 사이)
        SET rand_hire_date = DATE_ADD('2015-01-01', INTERVAL FLOOR(RAND() * 3683) DAY);

        -- 랜덤 job_id 선택
        SET rand_job_id = ELT(FLOOR(1 + RAND() * 5), 'DEV', 'MGR', 'SALES', 'HR', 'IT');

        -- 랜덤 salary (30000 ~ 150000)
        SET rand_salary = FLOOR(30000 + RAND() * 120000);

        -- 랜덤 commission_pct (0.00 ~ 0.50, 50% 확률로 NULL)
        SET rand_commission = IF(RAND() > 0.5, NULL, ROUND(RAND() * 0.50, 2));

        -- 랜덤 manager_id (1 ~ 50, 20% 확률로 NULL)
        SET rand_manager = IF(RAND() > 0.2, FLOOR(1 + RAND() * 50), NULL);

        -- 랜덤 department_id (10, 20, 30, 40, 50)
        SET rand_dept = 10 * FLOOR(1 + RAND() * 5);

        -- 데이터 삽입
        INSERT INTO temporary_employee (id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
        VALUES (i, rand_fname, rand_lname, rand_email, rand_phone, rand_hire_date, rand_job_id, rand_salary, rand_commission, rand_manager, rand_dept);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

-- 프로시저 실행
TRUNCATE employee;
CALL GenerateEmployeeData();

-- 프로시저 삭제 (선택사항)
DROP PROCEDURE IF EXISTS GenerateEmployeeData;

CALL GenerateTempEmployeeData();
