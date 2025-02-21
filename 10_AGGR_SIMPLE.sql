CREATE TABLE sales
(
    id           INT PRIMARY KEY,
    product_name VARCHAR(50),
    category     VARCHAR(50),
    amount       DECIMAL(10, 2)
)
;

INSERT INTO sales
VALUES
    (
        1, 'Product A', 'Category 1', 100.00
    ),
    (
        2, 'Product B', 'Category 2', 150.00
    ),
    (
        3, 'Product C', 'Category 1', 200.00
    ),
    (
        4, 'Product D', 'Category 2', 120.00
    )
;

SELECT *
FROM sales
;

SELECT category, product_name, SUM(amount)
FROM sales
GROUP BY category, product_name;

SELECT @@GLOBAL.sql_mode;
SELECT @@sql_mode;

-- 환경변수 백업 및 복구 작업 패턴
SELECT @saved_sql_mode := @@sql_mode;
SELECT @saved_sql_mode;
SET sql_mode = '';
SELECT @@sql_mode;

SELECT category, product_name, SUM(amount)
FROM sales
GROUP BY category;

SET sql_mode = @saved_sql_mode;
SELECT @@sql_mode;

