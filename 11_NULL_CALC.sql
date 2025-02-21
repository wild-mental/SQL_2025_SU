-- 예제 실행용 테이블
CREATE TABLE customer (
    customer_id   int PRIMARY KEY,
    customer_name varchar(20)
);
CREATE TABLE drink_order (
   id int PRIMARY KEY,
   customer_id int REFERENCES customer(customer_id) ON DELETE NO ACTION,
   ordered_at date,
   total_amount decimal(10,2)
);

SHOW CREATE TABLE drink_order;

-- 데이터 삽입
INSERT INTO drink_order (id, customer_id, ordered_at, total_amount) VALUES
(1, 101, '2024-02-26', 35000),
(2, 102, NULL, 9500),
(3, NULL, '2024-02-25', 21000);

SELECT * FROM drink_order;

-- IFNULL 함수를 사용하여 NULL 값 처리
SELECT id, IFNULL(customer_id, 'Unknown') AS customer_id, IFNULL(ordered_at, 'Not specified') AS ordered_at, total_amount
FROM drink_order;

-- NULLIF 함수를 사용하여 특정 값과 비교하여 NULL 처리
SELECT id, customer_id, NULLIF(ordered_at, '2024-02-26') AS ordered_at, total_amount
FROM drink_order;

-- COALESCE 함수를 사용하여 여러 열 중에서 첫 번째로 NULL이 아닌 값을 반환
SELECT id, COALESCE(NULL, NULL, customer_id, NULL, NULL, 'N/A') AS customer_id, COALESCE(NULL, NULL, ordered_at, NULL, NULL, 'N/A') AS ordered_at, total_amount
FROM drink_order;